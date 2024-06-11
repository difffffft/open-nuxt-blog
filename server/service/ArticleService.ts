import fs from "fs";
import path from "path";
import archiver, { ArchiverError } from "archiver";
import AdmZip from "adm-zip";
import Article from "@/server/models/Article";
import BaseService from "@/server/base/BaseService";
import { CreationAttributes, FindAndCountOptions, Op, literal } from "sequelize";
import { ArticleStatus } from "../enum";
import sequelize from "../db";
import ArticleTagService from "./ArticleTagService";
import FavoriteService from "./FavoriteService";
import CommentService from "./CommentService";
import LikeService from "./LikeService";
import { nanoid } from "nanoid";
import ArticleTag from "../models/ArticleTag";
import Category from "../models/Category";
import Comment from "../models/Comment";
import Tag from "../models/Tag";
import ArticleRoleService from "./ArticleRoleService";
import User from "../models/User";

export default class ArticleService extends BaseService<Article> {
  private articleTagService = new ArticleTagService();
  private articleRoleService = new ArticleRoleService();
  private favoriteService = new FavoriteService();
  private commentService = new CommentService();
  private likeService = new LikeService();
  // 备份时需要导出的表
  private exportModels = [Article, ArticleTag, Category, Tag];

  constructor() {
    super(Article);
  }

  async selectPage(query: ArticleQuery): Promise<BasePageResponse<Article>> {
    let { page, limit, order, asc, tagId, title, isSuperAdmin, userId, ...items } = query;

    page = Number(page);
    limit = Number(limit);
    tagId = Number(tagId);

    const offset = (page - 1) * limit;

    let filteredItems = Object.fromEntries(
      Object.entries(items).filter(([key, value]) => {
        if (
          value === null ||
          value === "" ||
          value === undefined ||
          value === "0"
        ) {
          return false;
        }
        return true;
      })
    );

    // 构建查询条件
    const whereConditions: any[] = [filteredItems];

    if (title) {
      whereConditions.push(
        sequelize.literal(
          "MATCH(title, content) AGAINST(:title IN BOOLEAN MODE)"
        )
      );
    }

    if (tagId) {
      whereConditions.push(
        sequelize.literal(
          `EXISTS (SELECT 1 FROM t_article_tag at WHERE at.article_id = Article.id AND at.tag_id = :tagId)`
        )
      );
    }

    // 如果是超级管理员，不需要添加额外的条件
    if (userId) {
      if (!isSuperAdmin) {
        whereConditions.push(
          sequelize.literal(
              `EXISTS (
                SELECT
                  1
                FROM
                  t_article_role ar2
                  INNER JOIN t_user_role ur ON ar2.role_id = ur.role_id
                WHERE
                  ar2.article_id = Article.id
                  AND ur.user_id = :userId
              )
              OR NOT EXISTS (
                SELECT
                  1
                FROM
                  t_article_role ar3
                WHERE
                  ar3.article_id = Article.id
              )`
          )
        );
      }
    } else {
      // web
      whereConditions.push(
        sequelize.literal(
          `NOT EXISTS (
            SELECT 1
            FROM t_article_role ar2
            WHERE ar2.article_id = Article.id
          )`
        )
      );
    }

    // 构建查询条件
    const options: FindAndCountOptions = {
      offset,
      limit,
      order: [["published_at", asc ? "ASC" : "DESC"]],
      where: {
        [Op.and]: whereConditions,
      },
      replacements: { title, tagId, userId },
      attributes: [
        "id",
        "title",
        "cover",
        "content",
        "html",
        [
          sequelize.literal(
            "(SELECT t1.title FROM t_category t1 left join t_article t2 on t1.id = t2.category_id LIMIT 1)"
          ),
          "categoryTitle",
        ],
        [
          sequelize.literal(
            "(SELECT t1.username FROM t_user t1 left join t_article t2 on t1.id = t2.author_id LIMIT 1)"
          ),
          "author",
        ],
        [
          sequelize.literal(
            "(SELECT GROUP_CONCAT(t1.title) FROM t_tag t1 LEFT JOIN t_article_tag t2 ON t1.id = t2.tag_id WHERE t2.article_id = Article.id)"
          ),
          "tagList",
        ],
        [
          sequelize.literal(
            "(SELECT GROUP_CONCAT(ar.role_id) FROM t_article_role ar WHERE ar.article_id = Article.id)"
          ),
          "roleIdList",
        ],
        "authorId",
        "categoryId",
        "publishedAt",
        "viewsCount",
        "favoritesCount",
        "likesCount",
        "commentsCount",
        "sort",
        "status",
        "createdAt",
        "updatedAt",
      ],
    };

    const { rows, count } = await Article.findAndCountAll(options);

    const totalPages = Math.ceil(count / limit);

    return {
      data: rows,
      meta: {
        totalPages,
        currentPage: page,
        pageSize: limit,
        totalItems: count,
      },
    };
  }

  async createArticle(
    articleData: CreationAttributes<Article>
  ): Promise<BaseCreateResponse> {
    const createdArticleId = await defineTransactionWrapper(
      async (transaction) => {
        if (articleData.status === ArticleStatus.values[1]) {
          articleData.publishedAt = new Date();
        }
        const createdArticle = await this.create(articleData, { transaction });

        if (articleData.roleIdList) {
          await this.articleRoleService.saveOrUpdate(
            createdArticle.id as number,
            articleData.roleIdList
          );
        }

        if (articleData.tagIdList) {
          await this.articleTagService.saveOrUpdate(
            createdArticle.id as number,
            articleData.tagIdList
          );
        }
        return createdArticle.id as number;
      }
    );
    return createdArticleId;
  }

  async updateArticle(
    articleId: number,
    articleData: Partial<CreationAttributes<Article>>
  ): Promise<void> {
    await defineTransactionWrapper(async (transaction) => {
      if (articleData.status === ArticleStatus.values[1]) {
        articleData.publishedAt = new Date();
      }
      await this.update(articleData, { where: { id: articleId }, transaction });

      if (articleData.roleIdList) {
        await this.articleRoleService.saveOrUpdate(
          articleId,
          articleData.roleIdList
        );
      }

      if (articleData.tagIdList) {
        await this.articleTagService.saveOrUpdate(
          articleId,
          articleData.tagIdList
        );
      }
    });
  }

  async updateViewsCount(articleId: number): Promise<void> {
    await Article.increment("viewsCount", { where: { id: articleId } });
  }

  async updateFavoritesCount(articleId: number): Promise<void> {
    // 计算收藏数量
    const favoritesCount = await this.favoriteService.countFavorites(articleId);
    // 更新收藏数量字段
    await Article.update({ favoritesCount }, { where: { id: articleId } });
  }

  async updateLikesCount(articleId: number): Promise<void> {
    // 计算点赞数量
    const likesCount = await this.likeService.countLikes(articleId);
    // 更新点赞数量字段
    await Article.update({ likesCount }, { where: { id: articleId } });
  }

  async updateCommentsCount(articleId: number): Promise<void> {
    // 计算评论数量
    const commentsCount = await this.commentService.countCommentsByArticle(
      articleId
    );
    // 更新评论数量字段
    await Article.update({ commentsCount }, { where: { id: articleId } });
  }

  async deleteArticles(articleIds: number[]): Promise<void> {
    await defineTransactionWrapper(async (transaction) => {
      // 删除文章
      await this.delete({ where: { id: articleIds }, transaction });
    });
  }

  async getArticleById(
    articleId: number,
    user: User | null,
    isCount: boolean
  ): Promise<Article | null> {
    // 构建基本查询
    let query = `
      SELECT a.*, 
        u.username AS author,
        c.title AS categoryTitle,
        GROUP_CONCAT(DISTINCT t.title) AS tagList,
        GROUP_CONCAT(DISTINCT at.tag_id) as tagIdList,
        GROUP_CONCAT(DISTINCT ar.role_id) as roleIdList,
        COUNT(DISTINCT f.id) AS favoritesCount,
        COUNT(DISTINCT l.id) AS likesCount,
        COUNT(DISTINCT cmt.id) AS commentsCount
        FROM t_article a
        JOIN t_user u ON a.author_id = u.id
        LEFT JOIN t_favorite f ON a.id = f.article_id
        LEFT JOIN t_like l ON a.id = l.article_id
        LEFT JOIN t_comment cmt ON a.id = cmt.article_id
        LEFT JOIN t_category c ON a.category_id = c.id
        LEFT JOIN t_article_role ar ON a.id = ar.article_id
        LEFT JOIN t_article_tag at ON a.id = at.article_id
        LEFT JOIN t_tag t ON at.tag_id = t.id
        WHERE a.id = :articleId
    `;

    // 添加用户权限条件
    if (user) {
      if (!user.superAdmin) {
        query += `
          AND (
            EXISTS (
              SELECT 1 
              FROM t_article_role ar2 
              INNER JOIN t_user_role ur ON ar2.role_id = ur.role_id 
              WHERE ar2.article_id = a.id AND ur.user_id = :userId
            )
          )
        `;
      }
    } else {
      query += `
        AND NOT EXISTS (
          SELECT 1
          FROM t_article_role ar4
          WHERE ar4.article_id = a.id
        )
      `;
    }


    const options = user ? { userId: user.id } : {}

    // 完成查询
    const result = await sequelize.query(query, {
      replacements: { articleId, ...options },
      model: Article,
      mapToModel: true,
    });

    // 更新浏览次数
    if (isCount) {
      this.updateViewsCount(articleId);
    }

    // 返回结果
    return result.length ? result[0] : null;
  }


  async getPreviousAndNextArticles(
    articleId: number,
    user: User,
    categoryId: number
  ): Promise<PreviouAndNextArticleResponse> {
    // 获取当前文章
    const currentArticle = await Article.findOne({
      where: { id: articleId, categoryId },
      attributes: ["id", "title", "publishedAt"],
    });

    if (!currentArticle) {
      return { previouArticle: null, nextArticle: null };
    }

    const { publishedAt } = currentArticle;

    // 构建公共条件
    const baseConditions: any = { categoryId };
    const whereConditions: any[] = []; // 添加额外的条件数组

    // 添加用户权限条件
    if (user) {
      if (!user.superAdmin) {
        whereConditions.push(
          sequelize.literal(
            `EXISTS (
                SELECT 1 
                FROM t_article_role ar 
                INNER JOIN t_user_role ur ON ar.role_id = ur.role_id 
                WHERE ar.article_id = Article.id AND ur.user_id = :userId
              )`
          )
        );
      }
    } else {
      whereConditions.push(
        sequelize.literal(
          `NOT EXISTS (
              SELECT 1
              FROM t_article_role ar2
              WHERE ar2.article_id = Article.id
            )`
        )
      );
    }

    // 获取前一篇文章
    const previouArticle = await Article.findOne({
      where: {
        ...baseConditions,
        ...whereConditions, // 添加用户权限条件
        [Op.or]: [
          { publishedAt: { [Op.lt]: publishedAt } },
          { publishedAt: publishedAt, id: { [Op.lt]: articleId } } // 在publishedAt相同时，确保ID也小于当前文章的ID
        ],
        id: { [Op.ne]: articleId },
      },
      order: [
        ["publishedAt", "DESC"],
        ["id", "DESC"] // 添加 ID 的倒序排序
      ],
      attributes: ["id", "title"],
      limit: 1,
    }) as Article;

    // 获取下一篇文章
    const nextArticle = await Article.findOne({
      where: {
        ...baseConditions,
        ...whereConditions, // 添加用户权限条件
        [Op.or]: [
          { publishedAt: { [Op.gt]: publishedAt } },
          { publishedAt: publishedAt, id: { [Op.gt]: articleId } } // 在publishedAt相同时，确保ID也大于当前文章的ID
        ],
        id: { [Op.ne]: articleId },
      },
      order: [
        ["publishedAt", "ASC"],
        ["id", "ASC"] // 添加 ID 的正序排序
      ],
      attributes: ["id", "title"],
      limit: 1,
    }) as Article;

    return { previouArticle, nextArticle };
  }


  async getAllArticles(title: string, user: User, articleStatus?: string): Promise<Article[]> {
    // 构建全文搜索查询条件
    const condition = literal(
      "MATCH(title,content) AGAINST(:title IN BOOLEAN MODE)"
    );

    // 构建查询条件数组
    const whereConditions: any[] = [condition];

    // 如果传递了文章状态参数，拼接到查询条件中
    if (articleStatus) {
      whereConditions.push({ status: articleStatus });
    }

    if (user) {
      // 如果是超级管理员，不需要添加额外的条件
      if (!user.superAdmin) {
        // 处理用户权限条件
        whereConditions.push(
          sequelize.literal(
            `EXISTS (
                SELECT 1 
                FROM t_article_role ar 
                INNER JOIN t_user_role ur ON ar.role_id = ur.role_id 
                WHERE ar.article_id = Article.id AND ur.user_id = :userId
              )`
          )
        );
      }
    } else {
      whereConditions.push(
        sequelize.literal(
          `NOT EXISTS (
              SELECT 1
              FROM t_article_role ar2
              WHERE ar2.article_id = Article.id
            )`
        )
      );
    }


    // 执行 findAll 方法并传递查询条件
    const articles = await Article.findAll({
      where: whereConditions,
      replacements: { title, userId: user ? user.id : null },
    });

    return articles;
  }

  /**
   * 导入
   */
  async importArticle(formData: FormData) {
    const { NUXT_TEMP_FOLDER, NUXT_PUBLIC_FOLDER } = useRuntimeConfig().public;
    // 解压压缩文件
    const file = formData.getAll("files")[0] as File;
    // 保存zip到磁盘
    const { filePath } = await defineUploadFile(file, NUXT_TEMP_FOLDER + "/");
    // 解压文件到附件
    const zip = new AdmZip(path.resolve(filePath));
    zip.extractAllToAsync(path.resolve(NUXT_PUBLIC_FOLDER as string), true);

    this.exportModels.forEach(async (model: any) => {
      // 清除表
      await model.destroy({
        where: {},
      });

      // 读取数据
      const data = fs.readFileSync(
        path.resolve(NUXT_PUBLIC_FOLDER + "/" + model.tableName + ".json")
      );
      const modelDatas = JSON.parse(data.toString());

      // JSON导入到数据库
      //@ts-ignore
      await model.bulkCreate(modelDatas);
    });
  }

  async exportArticle() {
    const { NUXT_TEMP_FOLDER, NUXT_PUBLIC_FOLDER } = useRuntimeConfig().public;
    // zip
    const zipPath = path.resolve(NUXT_TEMP_FOLDER + "/" + nanoid() + ".zip");
    defineCreateFolder(path.resolve(NUXT_TEMP_FOLDER));
    fs.writeFileSync(zipPath, "");

    const promises = this.exportModels.map(async (model: any) => {
      const list = (await model.findAll()).map((item: any) => item.toJSON());
      const modelJsonPath = path.resolve(NUXT_PUBLIC_FOLDER + "/" + model.tableName + ".json");
      return fs.promises.writeFile(modelJsonPath, JSON.stringify(list));
    });

    await Promise.all(promises)

    const output = fs.createWriteStream(zipPath);
    const archive = archiver("zip", { zlib: { level: 9 } });
    archive.pipe(output);
    archive.directory(path.resolve(NUXT_PUBLIC_FOLDER) as string, false);
    archive.finalize();

    function wait() {
      return new Promise((resolve, reject) => {
        archive.on("close", () => {
          setTimeout(() => {
            resolve(true);
          }, 2000);
        });
        archive.on("error", (e: ArchiverError) => {
          setTimeout(() => {
            console.error(e);
            reject(false);
          }, 2000);
        });
      });
    }
    await wait();
    return fs.readFileSync(zipPath);
  }
}

export interface PreviouAndNextArticleResponse {
  previouArticle: Article | null;
  nextArticle: Article | null;
}


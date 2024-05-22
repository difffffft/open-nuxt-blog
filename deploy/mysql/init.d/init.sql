/*
 Navicat Premium Data Transfer

 Source Server         : 32
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : open_nuxt_blog

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 20/05/2024 13:52:17
*/
CREATE DATABASE IF NOT EXISTS open_nuxt_blog CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE open_nuxt_blog;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` bigint(0) NULL NOT NULL COMMENT '文章分类',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章HTML',
  `author_id` bigint(0) NOT NULL COMMENT '文章作者ID',
  `published_at` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `status` enum('draft','published','archived') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'draft' COMMENT '文章状态',
  `views_count` int(0) NULL DEFAULT 0 COMMENT '浏览量',
  `favorites_count` int(0) NULL DEFAULT 0 COMMENT '收藏量',
  `likes_count` int(0) NULL DEFAULT 0 COMMENT '点赞量',
  `comments_count` int(0) NULL DEFAULT 0 COMMENT '评论量',
  `sort` int(0) NULL DEFAULT 1 COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='文章表';

create fulltext index idx_title_content on t_article(title,content) WITH PARSER ngram;

-- ----------------------------
-- Records of t_article
-- ----------------------------
BEGIN;
INSERT INTO `t_article`(`id`, `category_id`, `title`, `cover`, `content`, `html`, `author_id`, `published_at`, `status`, `views_count`, `favorites_count`, `likes_count`, `comments_count`, `sort`, `created_at`, `updated_at`) VALUES (1, 1, '美商务部发布有关人工智能安全的战略愿景，组建与盟友的合作网络', 'https://alexgurghis.com/wp-content/uploads/2023/06/jobs_demo-1020x540.webp', '美國財政部長耶倫週二表示，美國和歐洲在抵制中國工業產能過剩上需要攜手合作，並警告說，中國大量出口廉價商品對全球經濟構成嚴重威脅。耶倫是在德國的一次演講中發表這番言論的，突出了七國集團財長本週在義大利舉行會議時預計將討論的中心議題。「中國的產業政策對坐在這個房間裡的我們來說或許看起來很遙遠，但如果我們不戰略性地、團結一致地做出反應，我們兩國和世界各地的企業都會面臨生存風險，」耶倫在法蘭克福金融與管理學院接受榮譽博士學位時說。近幾個月來，中國過度生產綠色能源技術已成為大西洋兩岸面臨的一個緊迫問題。拜登政府的官員越來越擔心，他為美國國內的清潔能源和其他下一代技術製造提供資金的努力將受到中國廉價出口的削弱，中國正在生產大量的鋼鐵、電動汽車和太陽能電池板。', NULL, 1, '2024-05-21 11:14:51', 'published', 0, 0, 0, 0, 1, '2024-05-21 11:14:43', '2024-05-21 11:14:51');
INSERT INTO `t_article`(`id`, `category_id`, `title`, `cover`, `content`, `html`, `author_id`, `published_at`, `status`, `views_count`, `favorites_count`, `likes_count`, `comments_count`, `sort`, `created_at`, `updated_at`) VALUES (2, 1, '美商务部发布有关人工智能安全的战略愿景，组建与盟友的合作网络', 'https://alexgurghis.com/wp-content/uploads/2023/06/jobs_demo-1020x540.webp', '美國財政部長耶倫週二表示，美國和歐洲在抵制中國工業產能過剩上需要攜手合作，並警告說，中國大量出口廉價商品對全球經濟構成嚴重威脅。耶倫是在德國的一次演講中發表這番言論的，突出了七國集團財長本週在義大利舉行會議時預計將討論的中心議題。「中國的產業政策對坐在這個房間裡的我們來說或許看起來很遙遠，但如果我們不戰略性地、團結一致地做出反應，我們兩國和世界各地的企業都會面臨生存風險，」耶倫在法蘭克福金融與管理學院接受榮譽博士學位時說。近幾個月來，中國過度生產綠色能源技術已成為大西洋兩岸面臨的一個緊迫問題。拜登政府的官員越來越擔心，他為美國國內的清潔能源和其他下一代技術製造提供資金的努力將受到中國廉價出口的削弱，中國正在生產大量的鋼鐵、電動汽車和太陽能電池板。', NULL, 2, '2024-05-21 11:14:51', 'published', 0, 0, 0, 0, 1, '2024-05-21 11:14:43', '2024-05-21 11:14:51');
INSERT INTO `t_article`(`id`, `category_id`, `title`, `cover`, `content`, `html`, `author_id`, `published_at`, `status`, `views_count`, `favorites_count`, `likes_count`, `comments_count`, `sort`, `created_at`, `updated_at`) VALUES (3, 1, '美商务部发布有关人工智能安全的战略愿景，组建与盟友的合作网络', 'https://alexgurghis.com/wp-content/uploads/2023/06/jobs_demo-1020x540.webp', '美國財政部長耶倫週二表示，美國和歐洲在抵制中國工業產能過剩上需要攜手合作，並警告說，中國大量出口廉價商品對全球經濟構成嚴重威脅。耶倫是在德國的一次演講中發表這番言論的，突出了七國集團財長本週在義大利舉行會議時預計將討論的中心議題。「中國的產業政策對坐在這個房間裡的我們來說或許看起來很遙遠，但如果我們不戰略性地、團結一致地做出反應，我們兩國和世界各地的企業都會面臨生存風險，」耶倫在法蘭克福金融與管理學院接受榮譽博士學位時說。近幾個月來，中國過度生產綠色能源技術已成為大西洋兩岸面臨的一個緊迫問題。拜登政府的官員越來越擔心，他為美國國內的清潔能源和其他下一代技術製造提供資金的努力將受到中國廉價出口的削弱，中國正在生產大量的鋼鐵、電動汽車和太陽能電池板。', NULL, 3, '2024-05-21 11:14:51', 'published', 0, 0, 0, 0, 1, '2024-05-21 11:14:43', '2024-05-21 11:14:51');
COMMIT;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章分类标题',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类描述',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='文章分类表';

-- ----------------------------
-- Records of t_category
-- ----------------------------
BEGIN;
INSERT INTO `t_category`(`id`, `title`, `desc`, `created_at`, `updated_at`) VALUES (1, '随笔', '生活随笔', '2024-05-20 11:16:27', '2024-05-20 11:16:27');
COMMIT;

-- ----------------------------
-- Table structure for t_ip
-- ----------------------------
DROP TABLE IF EXISTS `t_ip`;
CREATE TABLE `t_ip`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `article_id` bigint(0) NOT NULL COMMENT '文章ID',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip地址',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='文章ip表';

-- ----------------------------
-- Records of t_ip
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标签标题',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签描述',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='文章标签表';


-- ----------------------------
-- Records of t_tag
-- ----------------------------
BEGIN;
INSERT INTO `t_tag`(`id`, `title`, `desc`, `created_at`, `updated_at`) VALUES (1, 'JAVA', 'JAVA', '2024-05-22 11:26:36', '2024-05-22 11:26:36');
INSERT INTO `t_tag`(`id`, `title`, `desc`, `created_at`, `updated_at`) VALUES (2, 'PYTHON', 'PYTHON', '2024-05-22 11:27:05', '2024-05-22 11:27:05');
INSERT INTO `t_tag`(`id`, `title`, `desc`, `created_at`, `updated_at`) VALUES (3, 'VUE', 'VUE', '2024-05-22 11:27:35', '2024-05-22 11:27:35');
COMMIT;

-- ----------------------------
-- Table structure for t_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag`;
CREATE TABLE `t_article_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `article_id` bigint(0) NOT NULL COMMENT '文章id',
  `tag_id` bigint(0) NOT NULL COMMENT '标签id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='文章标签关联表';

-- ----------------------------
-- Records of t_article_tag
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
CREATE TABLE `t_comment` (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `article_id` bigint(0) NOT NULL COMMENT '文章id',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父评论id，允许为空，用于支持评论的回复',
  `user_id` bigint(0) NOT NULL COMMENT '评论用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `likes_count` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论表';


-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for t_favorite
-- ----------------------------
CREATE TABLE `t_favorite` (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `article_id` bigint(0) NOT NULL COMMENT '文章id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户文章收藏表';


-- ----------------------------
-- Records of t_favorite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
CREATE TABLE `t_like` (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `article_id` bigint(0) NOT NULL COMMENT '文章id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户文章点赞表';


-- ----------------------------
-- Records of t_like
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `original_title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件原始标题',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件链接',
  `ext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件分类/扩展名',
  `size` int(0) NOT NULL COMMENT '附件大小',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='附件表';

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type_id` bigint(0) NOT NULL COMMENT '字典类型ID',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值',
  `label_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签样式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_data`(`id`, `type_id`, `label`, `value`, `label_class`, `remark`, `sort`, `created_at`, `updated_at`) VALUES (1, 1, '默认', 'Default', 'primary', '默认主题', 0, '2024-05-21 17:04:19', '2024-05-21 17:04:19');
COMMIT;

-- ----------------------------
-- Table structure for t_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_type`;
CREATE TABLE `t_dict_type`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of t_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_type`(`id`, `dict_type`, `dict_name`, `remark`, `sort`, `created_at`, `updated_at`) VALUES (1, 'theme', '主题', '主题', 0, '2024-05-21 17:03:07', '2024-05-21 17:03:07');
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` bigint(0) NOT NULL COMMENT '父级ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单路径',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单标题',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `type` enum('menu','button','interface') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单类型',
  `authority` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权标识',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (1, 0, '/admin/home', '首页', 'home', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (2, 0, '', '博文管理', '', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (3, 2, '/admin/category', '分类管理', 'catalog', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (4, 2, '/admin/tag', '标签管理', 'tag', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (5, 2, '/admin/article', '文章管理', 'assignment', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (6, 0, '', '权限管理', '', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (7, 6, '/admin/menu', '菜单管理', 'menu', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (8, 7, '', '分页', 'search', 'button', 'menu:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (9, 7, '', '列表', 'list', 'button', 'menu:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (10, 7, 'add', '新增', 'add', 'button', 'menu:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (11, 7, '', '修改', 'edit', 'button', 'menu:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (12, 7, '', '删除', 'delete', 'button', 'menu:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (13, 7, '', '详情', 'info-circle', 'button', 'menu:info', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (14, 6, '/admin/role', '角色管理', 'list', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (15, 14, '', '分页', 'search', 'button', 'role:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (16, 14, '', '列表', 'list', 'button', 'role:list', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (17, 14, '', '新增', 'add', 'button', 'role:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (18, 14, '', '修改', 'edit', 'button', 'role:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (19, 14, '', '删除', 'delete', 'button', 'role:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (20, 14, '', '详情', 'info-circle', 'button', 'role:info', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (21, 6, '/admin/user', '用户管理', 'user-list', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (22, 21, '', '分页', 'search', 'button', 'user:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (23, 21, '', '列表', 'list', 'button', 'user:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (24, 21, '', '新增', 'user-add', 'button', 'user:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (25, 21, '', '修改', 'edit', 'button', 'user:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (26, 21, '', '删除', 'delete', 'button', 'user:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (27, 21, '', '详情', 'info-circle', 'button', 'user:info', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (28, 5, '', '分页', 'search', 'button', 'article:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (29, 5, '', '列表', 'list', 'button', 'article:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (30, 5, '', '新增', 'add', 'button', 'article:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (31, 5, '', '修改', 'edit', 'button', 'article:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (32, 5, '', '删除', 'delete', 'button', 'article:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (33, 5, '', '详情', 'info-circle', 'button', 'article:info', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (34, 0, '', '系统设置', '', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (35, 34, '/admin/attachment', '附件管理', 'file-attachment', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (36, 35, '', '分页', 'search', 'button', 'attachment:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (37, 35, '', '列表', 'list', 'button', 'attachment:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (38, 35, '', '新增', 'upload', 'button', 'attachment:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (39, 35, '', '删除', 'delete', 'button', 'attachment:delete', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (40, 34, '/admin/site/config', '站点配置', 'adjustment', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (41, 40, '', '分页', 'search', 'button', 'site:config:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (42, 40, '', '列表', 'list', 'button', 'site:config:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (43, 40, '', '新增', 'add', 'button', 'site:config:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (44, 40, '', '修改', 'edit', 'button', 'site:config:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (45, 40, '', '删除', 'delete', 'button', 'site:config:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (46, 34, '/admin/dict', '数据字典', 'data', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (47, 46, '', '分页', 'search', 'button', 'dict:page', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (48, 46, '', '列表', 'list', 'button', 'dict:list', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (49, 46, '', '新增', 'add', 'button', 'dict:save', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (50, 46, '', '修改', 'edit', 'button', 'dict:update', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (51, 46, '', '删除', 'delete', 'button', 'dict:delete', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (52, 46, '', '详情', 'info-circle', 'button', 'dict:info', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (53, 0, '', '更多', '', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (54, 53, '/admin/user/info', '个人页', 'user', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_menu` (`id`, `pid`, `path`, `title`, `icon`, `type`, `authority`, `sort`, `created_at`, `updated_at`) VALUES (55, 53, '/admin/login', '登录页', 'login', 'menu', '', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `role_name`, `role_desc`, `created_at`, `updated_at`) VALUES (1, 'blog_admin', '博文管理员', '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_role` (`id`, `role_name`, `role_desc`, `created_at`, `updated_at`) VALUES (2, 'visitor', '访客', '2024-05-20 13:38:48', '2024-05-20 13:38:48');
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(0) NOT NULL COMMENT '角色id',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (2, 1, 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (3, 1, 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (4, 1, 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (5, 1, 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
COMMIT;

-- ----------------------------
-- Table structure for t_site_config
-- ----------------------------
DROP TABLE IF EXISTS `t_site_config`;
CREATE TABLE `t_site_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `type` enum('string','boolean','number','textarea','dict') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='站点配置表';

-- ----------------------------
-- Records of t_site_config
-- ----------------------------
BEGIN;
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (1, 'theme', 'Default', 'dict', 'theme','主题', 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (2, 'login', 'false', 'boolean','', '登录', 2, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (3, 'leave', 'false', 'boolean','', '评论', 3, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (4, 'chatgpt', 'false', 'boolean','', '大模型', 4, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (5, 'title', 'logo', 'string', '','站点名称', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (6, 'desc', 'Here I will share insights, tips, and tutorials on website development and also thoughts on the latest trends and technologies in the field.v', 'textarea','' ,'网站描述', 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_site_config` (`id`, `key`, `value`, `type`, `dict_type`, `desc`, `sort`, `created_at`, `updated_at`) VALUES (7, 'footer', 'false', 'boolean', '', '页脚', 5, '2024-05-20 13:38:48', '2024-05-20 13:38:48');

COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名/昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` enum('men','women','secret') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `super_admin` int(0) NOT NULL DEFAULT 0 COMMENT '是否是超级管理员(0:否 1:是)',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '是否正常(0:正常 1:停用)',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `username`, `password`, `avatar`, `gender`, `email`, `introduction`, `super_admin`, `status`, `created_at`, `updated_at`) VALUES (1, 'LEYEN', '$2b$10$jgLIbHq678SS8Mo4caG.NOJn03kS6ku8B2rXjjdS1hoIEY.GqNWtq', NULL, 'men', NULL, NULL, 1, 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_user` (`id`, `username`, `password`, `avatar`, `gender`, `email`, `introduction`, `super_admin`, `status`, `created_at`, `updated_at`) VALUES (2, 'Alice', '$2b$10$jgLIbHq678SS8Mo4caG.NOJn03kS6ku8B2rXjjdS1hoIEY.GqNWtq', NULL, 'women', NULL, NULL, 1, 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
INSERT INTO `t_user` (`id`, `username`, `password`, `avatar`, `gender`, `email`, `introduction`, `super_admin`, `status`, `created_at`, `updated_at`) VALUES (3, 'Facker', '$2b$10$jgLIbHq678SS8Mo4caG.NOJn03kS6ku8B2rXjjdS1hoIEY.GqNWtq', NULL, 'secret', NULL, NULL, 0, 0, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
COMMIT;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `role_id` bigint(0) NOT NULL COMMENT '角色id',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES (1, 3, 1, '2024-05-20 13:38:48', '2024-05-20 13:38:48');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

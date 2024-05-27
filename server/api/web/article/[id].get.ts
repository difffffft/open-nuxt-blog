import ArticleService from '@/server/service/ArticleService';
const articleService = new ArticleService();

export default defineWrappedResponseHandler(async (event) => {
    const { id } = getRouterParams(event);

    const result = await articleService.getArticleById(Number(id), true);
    return defineOk({ data: result });
});
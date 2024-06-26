import CategoryService from '@/server/service/CategoryService';

const categoryService = new CategoryService();

export default defineWrappedResponseHandler(async (event) => {
    defineHasAuthority(event, "category:list")

    const result = await categoryService.getAllCategories();
    return defineOk({ data: result });
});

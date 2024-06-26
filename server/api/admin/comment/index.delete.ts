import CommentService from '@/server/service/CommentService';

const commentService = new CommentService();

export default defineWrappedResponseHandler(async (event) => {
    defineHasAuthority(event, "comment:delete")
    const {id} = await readBody(event);
    await commentService.deleteComment(id);
    return defineOk({});
});
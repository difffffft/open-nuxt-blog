import RoleService from '@/server/service/RoleService';
const roleService = new RoleService();

export default defineWrappedResponseHandler(async (event) => {
    hasAuthority(event, "role:info")

    const { id } = getRouterParams(event);
    const result = await roleService.getRoleById(id);
    return defineOk({ data: result });
});
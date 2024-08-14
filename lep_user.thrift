include "base.thrift"
namespace go lep_user
// 权限相关
struct Permission {
    1: optional i64 id
    2: string permission_key
    3: string permission_name
    4: string permission_desc
    5: string extra
    6: string created_time
    7: string updated_time
}
struct PermissionListRequest {
     1: optional i64 offset
     2: optional i64 limit
     3: optional string permission_key
     4: optional string permission_name
     5: optional string role_key
}
struct PermissionListResp{
    1: i64 total
    2: list<Permission> permission_list
    255: base.BaseResp BaseResp
}
struct UpsertPermissionRequest {
     1: required Permission permission
     2: i32 op_type // 1-新增，2-更新，3-删除
}
struct UpsertPermissionResp{
    1: i64 permission_id
    255: base.BaseResp BaseResp
}
// 角色相关
struct Role {
    1: optional i64 id
    2: string role_name
    3: string role_key
    4: string role_desc
    5: string extra
    6: optional string created_time
    7: optional string updated_time
    8: list<Permission> permission_list
}
struct RoleListRequest {
     1: optional i64 offset
     2: optional i64 limit
     3: optional string role_key
     4: optional string role_name
}
struct RoleListResp{
     1: i64 total
     2: list<Role> role_list
     255: base.BaseResp BaseResp
}
struct UpsertRoleRequest {
     1: required Role role
     2: i32 op_type // 1-新增，2-更新，3-删除
}
struct UpsertRoleResp{
    1: i64 role_id
    255: base.BaseResp BaseResp
}
// 用户相关
struct User {
    1: optional i64 id
    2: string user_name
    3: string user_avatar
    4: string role_key
    5: string extra
    6: optional string created_time
    7: optional string updated_time
    8: list<Permission> permission_list
    9: string phone
    10: string role_name
}
struct UserListRequest {
    1: optional i64 offset
    2: optional i64 limit
    3: optional string user_id
    4: optional string role_key
    5: optional string phone
}
struct UserListResp{
    1: i64 total
    2: list<User> user_list
    255: base.BaseResp BaseResp
}
struct UpsertUserRequest {
     1: required User user
     2: i32 op_type // 1-新增，2-更新，3-删除
}
struct UpsertUserResp {
    1: i64 user_id
    255: base.BaseResp BaseResp
}
// 物料
struct Material{
    1: i64 id
    2: i64 user_id
    3: i64 material_type // 1-文字，2-图片，3-视频，4-文件
    4: string material_key // 物料key
    5: string material_value // 物料值
    6: i64 is_deleted // 0-未删除; 1-已删除
    7: optional string created_time
    8: optional string updated_time
}
struct MaterialListRequest {
    1: optional i64 offset
    2: optional i64 limit
    3: optional i64 material_type
    4: optional string material_key
    6: optional i64 user_id
}
struct MaterialListResp {
    1: i64 total
    2: list<Material> material_list
    255: base.BaseResp BaseResp
}
struct UpsertMaterialRequest {
     1: required list<Material> material
     2: i32 op_type // 1-新增，2-更新，3-删除
}
struct UpsertMaterialResp {
    1: i64 material_id
    255: base.BaseResp BaseResp
}

service LepUser{
    // 权限相关
    PermissionListResp PermissionList(1:PermissionListRequest req)
    UpsertPermissionResp UpsertPermission(1: UpsertMaterialRequest req)
    // 角色相关
    RoleListResp RoleList(1: RoleListRequest req)
    UpsertRoleResp UpsertRole(1: UpsertRoleRequest req)
    // 用户相关
    UserListResp UserList(1: UserListRequest req)
    UpsertUserResp UpsertUser(1: UpsertUserRequest req)
    // 物料相关
    MaterialListResp MaterialList(1: MaterialListRequest req)
    UpsertMaterialResp UpsertMaterial(1: UpsertMaterialRequest req)
}
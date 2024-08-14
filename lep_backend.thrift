namespace go lep_backend

struct HelloReq {
    1: string name
}
struct HelloResp {
    1: string resp_body;
}
struct GetVerifyCodeData{
    1: string verify_code // 验证码
}
struct GetVerifyCodeResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
    4: GetVerifyCodeData data
}
struct GetVerifyCodeReq {
    1: required string mobile // 手机号
}
struct LoginReq {
    1: required string phone // 手机号
    2: optional string password // 密码
    3: optional string verify_code // 验证码
}
struct LoginData {
    1: required string user_id // 用户user_id
    2: required string user_name // 用户token
    3: required string user_avatar // 头像
    4: required string role_name // 用户token
    5: required list<string> permission_key_list // 权限key列表
}
struct LoginResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
    4: LoginData data
}
struct UpdateUserResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
}
struct UpdateUserReq {
    1: optional string user_name // 用户token
    2: optional string user_avatar // 头像
    3: optional string phone //
}
struct GetMaterialReq {

}
struct Material{
    1: i64 id
    2: i64 material_type // 物料类型
    3: i64 material_key // 物料key
    4: string material_value // 物料value
}
struct GetMaterialData{
    1: list<Material> material_list // 物料列表
    2: i64 audit_status // 审核状态
    3: string failed_reason // 审核失败原因

}
struct GetMaterialResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
    4: GetMaterialData data
}
struct UpsertMaterialResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
}
struct UpsertMaterialReq {
    1: list<Material> material_list // 物料列表
}
struct AuditResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
}
struct AuditReq {
    1: required i64 id // 审核id
    2: required i64 op_type // 1-通过，2驳回
    3: optional string failed_reason // 审核失败原因
}
struct AuditListReq{
    1: required i64 offset
    2: required i64 limit
    3: optional i64 audit_status // 审核状态
    4: optional i64 audit_type // 审核类型
    5: optional i64 apply_user_id // 提交人user_id
}
struct AuditInfo{
    1: i64 id // 审核id
    2: i64 audit_status // 审核状态
    3: i64 audit_type // 审核类型
    4: i64 apply_user_id // 提交人user_id
    5: string apply_user_name // 提交人user_name
    6: string audit_time // 审核时间
    7: string apply_time // 提交时间
    8: string audit_user_name // 审核人user_name
    9: string audit_user_id // 审核人user_id
    10: string failed_reason // 审核失败原因
    11: string target_id
    12: string target_type
    13: optional string target_info
    14: optional string apply_info
}
struct AuditListData{
    1: required list<AuditInfo> audit_list // 物料列表
    2: required i64 total
}
struct AuditListResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
    4: AuditListData data
}
struct AuditDetailReq {
    1: required i64 id // 审核id
}
struct AuditDetailResp {
    1: required string message // 提示
    2: required string prompts // 具体提示
    3: required i32 status
    4: AuditInfo data
}
service LepBackend {
    // ---------------demo------------------
    HelloResp HelloMethod(1: HelloReq request) (api.get="/lep_backend/dem0/hello");
    // ---------------User------------------
    // 获取验证吗
    GetVerifyCodeResp GetVerifyCode(1: GetVerifyCodeReq request) (api.get="/lep_backend/user/verify_code");
    // 登陆-没有注册则自动注册
    LoginResp Login(1: LoginReq request) (api.post="/lep_backend/user/login");
    // 修改用户信息
    UpdateUserResp UpdateUser(1: UpdateUserReq request) (api.post="/lep_backend/user/update");
    // 获取物料列表
    GetMaterialResp GetMaterial(1: GetMaterialReq request) (api.get="/lep_backend/user/material/list");
    // 上传物料
    UpsertMaterialResp UpsertMaterial(1: UpsertMaterialReq request) (api.post="/lep_backend/user/material/upsert");

    // ---------------Product------------------
    // ---------------Audit--------------------
    AuditResp Audit(1: AuditReq request) (api.post="/lep_backend/audit/audit");
    AuditListResp AuditList(1: AuditListReq request) (api.get="/lep_backend/audit/list");
    AuditDetailResp AuditDetail(1: AuditDetailReq request) (api.post="/lep_backend/audit/detail");
}





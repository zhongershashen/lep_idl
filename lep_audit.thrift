include "../../base.thrift"
namespace go lep_audit
struct AuditInfo {
    1: i64 id
    2: i64 audit_type // 1-物料审核，2-需求审核
    3: i64 target_id // 审核目标id
    4: i64 target_type // 审核目标类型 // 1-文字，2-图片，3-视频，4-文件
    5: string target_info // 审核目标信息
    6: string apply_info // 附加申请信息
    7: i64 audit_status // 审核状态：1-待审核，2-审核通过，3-审核驳回
    8: i64 apply_user_id // 申请人user_id
    9: string auditor_user_id // 审核人
    10: string fail_reason // 驳回原因
    11: i64 apply_time // 申请时间
    12: i64 audit_time // 审核时间
    13: string apply_user_name // 申请人姓名
    14: string auditor_user_name // 审核人姓名
}
struct AuditListReq{
    1: optional i64 offset
    2: optional i64 limit
    3: optional i64 audit_type
    4: optional i64 user_id
    5: optional i64 audit_status
}
struct AuditListResp{
    1: list<AuditInfo> audit_list
    2: i64 total
    3: base.BaseResp BaseResp
}
struct CreateAudit {
    1: required i64 audit_type // 1-物料审核，2-需求审核
    2: required i64 target_id // 审核目标id
    3: required i64 target_type // 审核目标类型 // 1-文字，2-图片，3-视频，4-文件
    4: required i64 apply_user_id // 申请人user_id
    5: required string target_info // 审核目标信息
    6: optional string apply_info // 附加申请信息
    7: required string apply_user_name // 申请人
}
struct CreateAuditResp{
    1: i64 audit_id
    2: base.BaseResp BaseResp
}
struct Audit{
    1: i64 audit_id
    2: i64 operation // 1-通过，2-驳回
    3: optional string fail_reason // 驳回原因
}
struct AuditResp{
    1: base.BaseResp BaseResp
}

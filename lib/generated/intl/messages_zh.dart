// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(clientName) => "用${clientName}登录";

  static String m1(contact) => "安全验证码已经被发送至 ${contact} 的电子邮箱";

  static String m3(contact) => "安全验证码已经被发送至 ${contact} 的手机";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_err_location_permission_denied":
            MessageLookupByLibrary.simpleMessage("获取当前位置权限被拒绝"),
        "action_err_location_permission_denied2":
            MessageLookupByLibrary.simpleMessage("获取当前位置权限被永久拒绝，我们无法获取权限"),
        "action_err_location_service_disabled":
            MessageLookupByLibrary.simpleMessage("定位服务被禁用"),
        "action_err_phone_missing":
            MessageLookupByLibrary.simpleMessage("电话号码缺失或非法！"),
        "action_err_pic_mimetype_unknown":
            MessageLookupByLibrary.simpleMessage("未知的图片MIME类型"),
        "action_err_position_args_missing":
            MessageLookupByLibrary.simpleMessage("目标经纬度参数丢失！"),
        "action_err_type_not_provided":
            MessageLookupByLibrary.simpleMessage("动作类型未提供"),
        "action_err_type_unknown":
            MessageLookupByLibrary.simpleMessage("未知动作类型: "),
        "alarm_ack_info": MessageLookupByLibrary.simpleMessage("您确定要确认告警吗?"),
        "alarm_ack_title": MessageLookupByLibrary.simpleMessage("确认告警"),
        "alarm_clear_info": MessageLookupByLibrary.simpleMessage("您确定要清除告警吗?"),
        "alarm_clear_title": MessageLookupByLibrary.simpleMessage("清除告警"),
        "alarm_info":
            MessageLookupByLibrary.simpleMessage("移动仪表板应在设备配置的告警规则中设置！"),
        "alarm_severity_critical": MessageLookupByLibrary.simpleMessage("危险"),
        "alarm_severity_indeterminate":
            MessageLookupByLibrary.simpleMessage("不确定"),
        "alarm_severity_major": MessageLookupByLibrary.simpleMessage("重要"),
        "alarm_severity_minor": MessageLookupByLibrary.simpleMessage("次要"),
        "alarm_severity_warning": MessageLookupByLibrary.simpleMessage("警告"),
        "alarm_status_active_ack":
            MessageLookupByLibrary.simpleMessage("已激活已确认"),
        "alarm_status_active_unack":
            MessageLookupByLibrary.simpleMessage("已激活未确认"),
        "alarm_status_cleared_ack":
            MessageLookupByLibrary.simpleMessage("已清除已确认"),
        "alarm_status_cleared_unack":
            MessageLookupByLibrary.simpleMessage("已清除未确认"),
        "alarms": MessageLookupByLibrary.simpleMessage("告警"),
        "alarms_not_found": MessageLookupByLibrary.simpleMessage("找不到告警"),
        "alarms_title": MessageLookupByLibrary.simpleMessage("告警"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Thingsboard"),
        "asset_assigned_to": MessageLookupByLibrary.simpleMessage("分配给"),
        "asset_label": MessageLookupByLibrary.simpleMessage("标签"),
        "asset_name": MessageLookupByLibrary.simpleMessage("名称"),
        "asset_subtitle": MessageLookupByLibrary.simpleMessage("资产详情"),
        "asset_title": MessageLookupByLibrary.simpleMessage("资产"),
        "asset_type": MessageLookupByLibrary.simpleMessage("类型"),
        "assets": MessageLookupByLibrary.simpleMessage("资产"),
        "assets_not_found": MessageLookupByLibrary.simpleMessage("找不到资产"),
        "assets_title": MessageLookupByLibrary.simpleMessage("资产"),
        "audit_log_action_data": MessageLookupByLibrary.simpleMessage("动作数据"),
        "audit_log_action_type": MessageLookupByLibrary.simpleMessage("动作类型"),
        "audit_log_entity_type": MessageLookupByLibrary.simpleMessage("实体类型"),
        "audit_log_failure_details":
            MessageLookupByLibrary.simpleMessage("失败详情"),
        "audit_log_status_failure": MessageLookupByLibrary.simpleMessage("失败"),
        "audit_log_status_success": MessageLookupByLibrary.simpleMessage("成功"),
        "audit_log_subtitle": MessageLookupByLibrary.simpleMessage("审计日志详情"),
        "audit_log_type_activated": MessageLookupByLibrary.simpleMessage("激活"),
        "audit_log_type_added": MessageLookupByLibrary.simpleMessage("添加"),
        "audit_log_type_alarm_ack": MessageLookupByLibrary.simpleMessage("已确认"),
        "audit_log_type_alarm_clear":
            MessageLookupByLibrary.simpleMessage("已清除"),
        "audit_log_type_assigned_from_tenant":
            MessageLookupByLibrary.simpleMessage("从租户分配"),
        "audit_log_type_assigned_to_customer":
            MessageLookupByLibrary.simpleMessage("分配给客户"),
        "audit_log_type_assigned_to_edge":
            MessageLookupByLibrary.simpleMessage("分配给边缘"),
        "audit_log_type_assigned_to_tenant":
            MessageLookupByLibrary.simpleMessage("分配给租户"),
        "audit_log_type_attributes_deleted":
            MessageLookupByLibrary.simpleMessage("删除属性"),
        "audit_log_type_attributes_read":
            MessageLookupByLibrary.simpleMessage("读取属性"),
        "audit_log_type_attributes_updated":
            MessageLookupByLibrary.simpleMessage("更新属性"),
        "audit_log_type_credentials_read":
            MessageLookupByLibrary.simpleMessage("读取凭证"),
        "audit_log_type_credentials_updated":
            MessageLookupByLibrary.simpleMessage("凭证已更新"),
        "audit_log_type_deleted": MessageLookupByLibrary.simpleMessage("删除"),
        "audit_log_type_lockout": MessageLookupByLibrary.simpleMessage("锁定"),
        "audit_log_type_login": MessageLookupByLibrary.simpleMessage("登录"),
        "audit_log_type_logout": MessageLookupByLibrary.simpleMessage("注销"),
        "audit_log_type_provision_failure":
            MessageLookupByLibrary.simpleMessage("设备预配置失败"),
        "audit_log_type_provision_success":
            MessageLookupByLibrary.simpleMessage("设备已预配置"),
        "audit_log_type_relation_add_or_update":
            MessageLookupByLibrary.simpleMessage("关联已更新"),
        "audit_log_type_relation_deleted":
            MessageLookupByLibrary.simpleMessage("关联已删除"),
        "audit_log_type_relations_deleted":
            MessageLookupByLibrary.simpleMessage("全部关联已删除"),
        "audit_log_type_rpc_call":
            MessageLookupByLibrary.simpleMessage("RPC调用"),
        "audit_log_type_suspended": MessageLookupByLibrary.simpleMessage("暂停"),
        "audit_log_type_timeseries_deleted":
            MessageLookupByLibrary.simpleMessage("遥测数据已删除"),
        "audit_log_type_timeseries_updated":
            MessageLookupByLibrary.simpleMessage("遥测数据已更新"),
        "audit_log_type_unassigned_from_customer":
            MessageLookupByLibrary.simpleMessage("取消分配至客户"),
        "audit_log_type_unassigned_from_edge":
            MessageLookupByLibrary.simpleMessage("取消分配至边缘"),
        "audit_log_type_updated": MessageLookupByLibrary.simpleMessage("更新"),
        "audit_logs": MessageLookupByLibrary.simpleMessage("审计日志"),
        "audit_logs_not_found": MessageLookupByLibrary.simpleMessage("找不到审计日志"),
        "audit_logs_title": MessageLookupByLibrary.simpleMessage("审计日志"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "change_pwd_btn_txt": MessageLookupByLibrary.simpleMessage("更改密码"),
        "change_pwd_info": MessageLookupByLibrary.simpleMessage("两次录入的密码必须一致！"),
        "change_pwd_new_pwd": MessageLookupByLibrary.simpleMessage("新的密码 *"),
        "change_pwd_new_pwd2":
            MessageLookupByLibrary.simpleMessage("再次输入新密码 *"),
        "change_pwd_new_pwd2_required":
            MessageLookupByLibrary.simpleMessage("再次输入新密码是必须的"),
        "change_pwd_new_pwd_required":
            MessageLookupByLibrary.simpleMessage("新的密码是必填项"),
        "change_pwd_old_pwd": MessageLookupByLibrary.simpleMessage("当前密码 *"),
        "change_pwd_old_pwd_required":
            MessageLookupByLibrary.simpleMessage("当前密码是必填项"),
        "change_pwd_title": MessageLookupByLibrary.simpleMessage("更改密码"),
        "close": MessageLookupByLibrary.simpleMessage("关闭"),
        "context_conn_err_info":
            MessageLookupByLibrary.simpleMessage("连接服务器失败"),
        "context_conn_err_title": MessageLookupByLibrary.simpleMessage("连接错误"),
        "customer_subtitle": MessageLookupByLibrary.simpleMessage("客户详情"),
        "customer_title": MessageLookupByLibrary.simpleMessage("客户"),
        "customers": MessageLookupByLibrary.simpleMessage("客户"),
        "customers_not_found": MessageLookupByLibrary.simpleMessage("找不到客户"),
        "customers_title": MessageLookupByLibrary.simpleMessage("客户"),
        "dashboard_deprecated": MessageLookupByLibrary.simpleMessage("过时了"),
        "dashboard_not_implemented":
            MessageLookupByLibrary.simpleMessage("暂未实现!"),
        "dashboard_public": MessageLookupByLibrary.simpleMessage("公开"),
        "dashboard_title": MessageLookupByLibrary.simpleMessage("仪表板"),
        "dashboards_not_found": MessageLookupByLibrary.simpleMessage("找不到仪表板"),
        "dashboards_title": MessageLookupByLibrary.simpleMessage("仪表板"),
        "device_active": MessageLookupByLibrary.simpleMessage("活动"),
        "device_all": MessageLookupByLibrary.simpleMessage("全部设备"),
        "device_inactive": MessageLookupByLibrary.simpleMessage("非活动"),
        "device_info":
            MessageLookupByLibrary.simpleMessage("移动端仪表板应该在设备配置中设置！"),
        "device_title": MessageLookupByLibrary.simpleMessage("设备"),
        "devices": MessageLookupByLibrary.simpleMessage("设备"),
        "devices_not_found": MessageLookupByLibrary.simpleMessage("找不到设备"),
        "devices_title": MessageLookupByLibrary.simpleMessage("设备"),
        "entities_list_empty": MessageLookupByLibrary.simpleMessage("列表当前为空"),
        "entities_not_exists": MessageLookupByLibrary.simpleMessage("请求的实体不存在"),
        "entities_not_implemented":
            MessageLookupByLibrary.simpleMessage("暂未实现!"),
        "entities_search_results": MessageLookupByLibrary.simpleMessage("查询结果"),
        "entities_try_again": MessageLookupByLibrary.simpleMessage("再试一次"),
        "entities_view_all": MessageLookupByLibrary.simpleMessage("查看全部"),
        "entity_address": MessageLookupByLibrary.simpleMessage("地址"),
        "entity_address2": MessageLookupByLibrary.simpleMessage("地址二"),
        "entity_city": MessageLookupByLibrary.simpleMessage("城市"),
        "entity_country": MessageLookupByLibrary.simpleMessage("国家"),
        "entity_email": MessageLookupByLibrary.simpleMessage("电子邮箱"),
        "entity_name": MessageLookupByLibrary.simpleMessage("名称"),
        "entity_phone": MessageLookupByLibrary.simpleMessage("电话号码"),
        "entity_province": MessageLookupByLibrary.simpleMessage("省份"),
        "entity_type_alarm": MessageLookupByLibrary.simpleMessage("告警"),
        "entity_type_api_usage_state":
            MessageLookupByLibrary.simpleMessage("Api使用状态"),
        "entity_type_asset": MessageLookupByLibrary.simpleMessage("资产"),
        "entity_type_customer": MessageLookupByLibrary.simpleMessage("客户"),
        "entity_type_dashboard": MessageLookupByLibrary.simpleMessage("仪表板"),
        "entity_type_device": MessageLookupByLibrary.simpleMessage("设备"),
        "entity_type_device_profile":
            MessageLookupByLibrary.simpleMessage("设备配置"),
        "entity_type_edge": MessageLookupByLibrary.simpleMessage("边缘"),
        "entity_type_entity_view": MessageLookupByLibrary.simpleMessage("实体视图"),
        "entity_type_ota_package":
            MessageLookupByLibrary.simpleMessage("OTA 包"),
        "entity_type_resource": MessageLookupByLibrary.simpleMessage("资源"),
        "entity_type_rule_chain": MessageLookupByLibrary.simpleMessage("规则链"),
        "entity_type_rule_node": MessageLookupByLibrary.simpleMessage("规则节点"),
        "entity_type_tenant": MessageLookupByLibrary.simpleMessage("租户"),
        "entity_type_tenant_profile":
            MessageLookupByLibrary.simpleMessage("租户配置"),
        "entity_type_user": MessageLookupByLibrary.simpleMessage("用户"),
        "entity_type_widgets_bundle":
            MessageLookupByLibrary.simpleMessage("部件包"),
        "entity_type_widgets_type":
            MessageLookupByLibrary.simpleMessage("部件类型"),
        "entity_zip": MessageLookupByLibrary.simpleMessage("邮政编码"),
        "home": MessageLookupByLibrary.simpleMessage("首页"),
        "login_btn_txt": MessageLookupByLibrary.simpleMessage("登录"),
        "login_email": MessageLookupByLibrary.simpleMessage("电子邮箱"),
        "login_email_invalid": MessageLookupByLibrary.simpleMessage("电子邮箱格式错误"),
        "login_email_required":
            MessageLookupByLibrary.simpleMessage("电子邮箱是必填项"),
        "login_or": MessageLookupByLibrary.simpleMessage("或"),
        "login_pwd": MessageLookupByLibrary.simpleMessage("密码"),
        "login_pwd_forgot": MessageLookupByLibrary.simpleMessage("忘记密码"),
        "login_pwd_required": MessageLookupByLibrary.simpleMessage("密码是必填项"),
        "login_welcome": MessageLookupByLibrary.simpleMessage("登录您的账户"),
        "login_with": m0,
        "login_with2": MessageLookupByLibrary.simpleMessage("用下列方式登录"),
        "logoDefaultValue":
            MessageLookupByLibrary.simpleMessage("Thingsboard Logo"),
        "more": MessageLookupByLibrary.simpleMessage("更多"),
        "more_customer": MessageLookupByLibrary.simpleMessage("客户"),
        "more_logout": MessageLookupByLibrary.simpleMessage("注销"),
        "more_sys_admin": MessageLookupByLibrary.simpleMessage("系统管理员"),
        "more_tenant_admin": MessageLookupByLibrary.simpleMessage("租户管理员"),
        "no": MessageLookupByLibrary.simpleMessage("否"),
        "ok": MessageLookupByLibrary.simpleMessage("确定"),
        "profile_btn_txt": MessageLookupByLibrary.simpleMessage("更改密码"),
        "profile_email": MessageLookupByLibrary.simpleMessage("电子邮箱 *"),
        "profile_email_invalid":
            MessageLookupByLibrary.simpleMessage("电子邮箱格式错误"),
        "profile_email_required":
            MessageLookupByLibrary.simpleMessage("电子邮箱是必填项"),
        "profile_first_name": MessageLookupByLibrary.simpleMessage("名字"),
        "profile_info1": MessageLookupByLibrary.simpleMessage("配置更新成功"),
        "profile_info2": MessageLookupByLibrary.simpleMessage("密码修改成功"),
        "profile_last_name": MessageLookupByLibrary.simpleMessage("姓氏"),
        "profile_title": MessageLookupByLibrary.simpleMessage("配置"),
        "reset_pwd_btn_txt": MessageLookupByLibrary.simpleMessage("请求密码重置"),
        "reset_pwd_email": MessageLookupByLibrary.simpleMessage("电子邮箱 *"),
        "reset_pwd_email_invalid":
            MessageLookupByLibrary.simpleMessage("电子邮箱格式错误"),
        "reset_pwd_email_required":
            MessageLookupByLibrary.simpleMessage("电子邮箱是必填项"),
        "reset_pwd_info":
            MessageLookupByLibrary.simpleMessage("密码重置链接已发送至您的邮箱！"),
        "reset_pwd_tips": MessageLookupByLibrary.simpleMessage(
            "请输入该账号绑定的电子邮箱地址，我们会向其发送一封附带密码重置链接的邮件"),
        "reset_pwd_title": MessageLookupByLibrary.simpleMessage("重置密码"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "route_not_defined": MessageLookupByLibrary.simpleMessage("路由未定义: "),
        "route_not_found": MessageLookupByLibrary.simpleMessage("找不到路由"),
        "scan_code": MessageLookupByLibrary.simpleMessage("扫描二维码"),
        "scan_test_code": MessageLookupByLibrary.simpleMessage("测试码"),
        "scan_toggle_camera": MessageLookupByLibrary.simpleMessage("切换摄像头"),
        "scan_toggle_flash": MessageLookupByLibrary.simpleMessage("切换闪光灯"),
        "search": MessageLookupByLibrary.simpleMessage("查找"),
        "tenant_subtitle": MessageLookupByLibrary.simpleMessage("租户详情"),
        "tenant_title": MessageLookupByLibrary.simpleMessage("租户"),
        "tenants_not_found": MessageLookupByLibrary.simpleMessage("找不到租户"),
        "tenants_title": MessageLookupByLibrary.simpleMessage("租户"),
        "two_factor_backup_code_auth_description":
            MessageLookupByLibrary.simpleMessage("请输入备份验证码之一"),
        "two_factor_backup_code_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("备份验证码"),
        "two_factor_continue_text": MessageLookupByLibrary.simpleMessage("继续"),
        "two_factor_email_auth_description": m1,
        "two_factor_email_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("电子邮件验证码"),
        "two_factor_mfa_provider_backup_code":
            MessageLookupByLibrary.simpleMessage("备份验证码"),
        "two_factor_mfa_provider_email":
            MessageLookupByLibrary.simpleMessage("电子邮件"),
        "two_factor_mfa_provider_sms":
            MessageLookupByLibrary.simpleMessage("短信"),
        "two_factor_mfa_provider_topt":
            MessageLookupByLibrary.simpleMessage("验证应用"),
        "two_factor_resend_code": MessageLookupByLibrary.simpleMessage("重发验证码"),
        "two_factor_select_way_to_verify":
            MessageLookupByLibrary.simpleMessage("选择验证方式"),
        "two_factor_sms_auth_description": m3,
        "two_factor_sms_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("短信验证码"),
        "two_factor_topt_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("验证码"),
        "two_factor_totp_auth_description":
            MessageLookupByLibrary.simpleMessage("请输入验证应用上的安全码"),
        "two_factor_try_another_way":
            MessageLookupByLibrary.simpleMessage("尝试其它方式"),
        "two_factor_verification_code_incorrect":
            MessageLookupByLibrary.simpleMessage("验证码错误"),
        "two_factor_verification_code_invalid":
            MessageLookupByLibrary.simpleMessage("验证码格式错误"),
        "two_factor_verification_code_many_request":
            MessageLookupByLibrary.simpleMessage("验证码请求次数过多"),
        "two_factor_verify_your_identity":
            MessageLookupByLibrary.simpleMessage("验证身份"),
        "yes": MessageLookupByLibrary.simpleMessage("是")
      };
}

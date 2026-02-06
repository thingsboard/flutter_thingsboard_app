// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static String m0(appTitle) =>
      "恭喜！\n您的 ${appTitle} 账户已激活。\n现在您可以登录到您的 ${appTitle} 空间。";

  static String m1(authority) =>
      "Are you sure? You are going to delete your ${authority} account.";

  static String m2(count) => "${Intl.plural(count, one: '告警', other: '告警')}";

  static String m3(providerName) =>
      "Are you sure you want to deactivate ${providerName}?";

  static String m4(deviceName) => "无法与设备 ${deviceName} 建立会话。请重试";

  static String m5(link) => "Can\'t launch url: ${link}";

  static String m6(wifiName) => "Connect to Wi-Fi similar to ${wifiName}";

  static String m7(name) =>
      "Connection to the ${name} Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Device', other: 'Devices')}";

  static String m10(count) =>
      "${count}-${Intl.plural(count, one: 'digit', other: 'digits')} code";

  static String m11(contact) => "安全码已发送到您的邮箱 ${contact}。";

  static String m12(e) => "Error occured: ${e}";

  static String m13(count) => "${Intl.plural(count, one: '通知', other: '通知')}";

  static String m14(permissions) =>
      "您没有足够的\"${permissions}\"权限以继续。请打开应用设置，授予权限并点击\"再试一次\"。";

  static String m15(permissions) =>
      "您没有足够的\"${permissions}\"权限以继续。请授予所需权限并点击\"再试一次\"。";

  static String m16(deviceName) => "输入 ${deviceName} 的PIN码以确认拥有权证明";

  static String m17(time) =>
      "在 ${Intl.plural(time, one: '1 秒', other: '${time} 秒')}内重新发送验证码";

  static String m18(name) => "路由未定义: ${name}";

  static String m19(count) =>
      "${Intl.plural(count, one: '搜索用户', other: '搜索用户')}";

  static String m20(contact) => "安全码已发送到您的手机 ${contact}。";

  static String m21(name) =>
      "Unable connect to Wi-Fi because networks wasn\'t found by device ${name}";

  static String m22(version) => "更新到 ${version}";

  static String m23(deviceName) => "要继续设置您的设备 ${deviceName}，请提供您网络的凭据。";

  static String m24(network) => "输入 ${network} 的密码";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("接受"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "您必须接受我们的隐私政策",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "您必须接受我们的使用条款",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage("账户激活成功！"),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("确认"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("已确认"),
    "actionData": MessageLookupByLibrary.simpleMessage("动作数据"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Failure"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Success"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Activated"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Added"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Added Comment",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Acknowledged"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm Assigned",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Cleared"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm Deleted",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarm Unassigned",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Assigned from Tenant",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Assigned to Customer",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Assigned to Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Assigned to Tenant",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributes Deleted",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributes read",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributes Updated",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Credentials read",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Credentials Updated",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Deleted"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Deleted Comment",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Lockout"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Login"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Device provisioning was failed",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Device provisioned",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relation updated",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relation deleted",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "All relation deleted",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC Call"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS Sent"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspended"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetry deleted",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetry updated",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Unassigned from Customer",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Unassigned from Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Updated"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Updated Comment",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage("正在激活账户..."),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "您的账户正在激活中。\n请稍等...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("激活"),
    "activity": MessageLookupByLibrary.simpleMessage("活动"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage("添加评论..."),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Add verification method",
    ),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "address2": MessageLookupByLibrary.simpleMessage("地址 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage("Admin settings"),
    "aiModel": MessageLookupByLibrary.simpleMessage("Ai model"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage("你确定要确认告警吗?"),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage("确认告警"),
    "alarmClearText": MessageLookupByLibrary.simpleMessage("你确定要清除告警吗?"),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("清除告警"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage("告警严重程度列表"),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("告警状态列表"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarm type list"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("告警类型"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allDevices": MessageLookupByLibrary.simpleMessage("所有设备"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("允许访问"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有账户?"),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "收到空的请求数据。",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Any type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("Api key"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API使用状态"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Thingsboard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Apply changes"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("您确定吗?"),
    "areYouSureYouWantToDeactivate": m3,
    "areYouSureYouWantToExit": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to exit?",
    ),
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("资产名"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("资产配置文件"),
    "assets": MessageLookupByLibrary.simpleMessage("资产"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("分配给客户"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("分配给我"),
    "assignee": MessageLookupByLibrary.simpleMessage("被分配人"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage("审计日志详情"),
    "auditLogs": MessageLookupByLibrary.simpleMessage("审计报告"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "请输入您的备份码之一。",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage("备份码"),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be able to use backup codes to pass two factor authentification",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "要配置您的新设备，请确保您手机的蓝牙已打开且在新设备的信号范围内",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Calculated field"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("修改密码"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("选择地区"),
    "city": MessageLookupByLibrary.simpleMessage("城市"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("声明设备"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage("设备声明完成"),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage("设备\n声明成功"),
    "clear": MessageLookupByLibrary.simpleMessage("清除"),
    "cleared": MessageLookupByLibrary.simpleMessage("已清除"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Code verification failed!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "您必须确认您不是机器人",
    ),
    "confirmToCloseTheApp": MessageLookupByLibrary.simpleMessage(
      "Confirm to close the app",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("确认"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "确认 Wi-Fi 连接",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Connect to device",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Connect to the Wi-Fi you usually use",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Connecting to device",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Connection error"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("继续"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Copy 32-digits key to your authentication app or scan QR-code below",
        ),
    "country": MessageLookupByLibrary.simpleMessage("国家"),
    "createAccount": MessageLookupByLibrary.simpleMessage("创建账户"),
    "createPassword": MessageLookupByLibrary.simpleMessage("创建密码"),
    "critical": MessageLookupByLibrary.simpleMessage("严重"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("当前密码"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "当前密码是必填项",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("客户"),
    "customers": MessageLookupByLibrary.simpleMessage("客户"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("天"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("删除评论"),
    "details": MessageLookupByLibrary.simpleMessage("详情"),
    "deviceList": MessageLookupByLibrary.simpleMessage("设备列表"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Device not able to find Wi-Fi nearby",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "未找到设备。请确保您手机的蓝牙已打开且在新设备的信号范围内。",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("设备配置文件"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Device provisioning",
    ),
    "devices": m9,
    "digitsCode": m10,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Discard changes"),
    "domain": MessageLookupByLibrary.simpleMessage("Domain"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "duration": MessageLookupByLibrary.simpleMessage("持续时间"),
    "edge": MessageLookupByLibrary.simpleMessage("边缘"),
    "edit": MessageLookupByLibrary.simpleMessage("编辑"),
    "edited": MessageLookupByLibrary.simpleMessage("已编辑"),
    "email": MessageLookupByLibrary.simpleMessage("邮箱"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("邮箱验证码"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage("邮箱格式无效"),
    "emailRequireText": MessageLookupByLibrary.simpleMessage("邮箱是必填项"),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be prompted to enter the security code that will be sent to your email address",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage("邮箱验证"),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "请按照邮件中的说明完成注册流程。注意：如果您没有看到邮件，请检查您的\"垃圾邮件\"文件夹，或点击\"重新发送\"按钮重新发送邮件。",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "验证邮件已发送到指定的邮箱地址 ",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("邮箱验证成功"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Enter 6-digits key from your app here:",
    ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Enter an email to use as your authenticator.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("实体类型"),
    "entityView": MessageLookupByLibrary.simpleMessage("实体视图"),
    "errorOccured": m12,
    "europe": MessageLookupByLibrary.simpleMessage("欧洲"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("法兰克福"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Exit device provisioning",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to server",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "加载告警详情失败",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage("加载列表失败"),
    "failureDetails": MessageLookupByLibrary.simpleMessage("失败详情"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal application error occurred:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal error"),
    "filters": MessageLookupByLibrary.simpleMessage("过滤器"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("名"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage("名是必填项"),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("名"),
    "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Hide home dashboard toolbar",
    ),
    "home": MessageLookupByLibrary.simpleMessage("主页"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Home dashboard"),
    "hours": MessageLookupByLibrary.simpleMessage("小时"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybrid"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("我不是机器人"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperial"),
    "inactive": MessageLookupByLibrary.simpleMessage("失活"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "未激活用户已存在",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "已注册但邮箱未验证的用户。\n如果您希望重新发送验证邮件，请点击\"重新发送\"按钮。",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("不确定"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "密码长度至少为6个字符",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("is required."),
    "job": MessageLookupByLibrary.simpleMessage("Job"),
    "label": MessageLookupByLibrary.simpleMessage("标签"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastName": MessageLookupByLibrary.simpleMessage("姓"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage("姓是必填项"),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("姓"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage("列表当前为空"),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Login to app"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage("登录你的账号"),
    "loginWith": MessageLookupByLibrary.simpleMessage("登录方式"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Thingsboard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "major": MessageLookupByLibrary.simpleMessage("重要"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Mark as read"),
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metric"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("备份码"),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("邮箱"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("短信"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage("身份验证器应用"),
    "minor": MessageLookupByLibrary.simpleMessage("次要"),
    "minutes": MessageLookupByLibrary.simpleMessage("分钟"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobile app"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Mobile app bundle",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobile dashboard should be configured in device profile!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "newPassword": MessageLookupByLibrary.simpleMessage("新密码"),
    "newPassword2": MessageLookupByLibrary.simpleMessage("确认新密码"),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage("请再次输入新密码"),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage("新密码是必填项"),
    "newUserText": MessageLookupByLibrary.simpleMessage("新用户?"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "No 2FA providers found",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage("未找到告警"),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "No dashboards found",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "No notifications found",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("未找到结果"),
    "northAmerica": MessageLookupByLibrary.simpleMessage("北美"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage("北弗吉尼亚"),
    "notFound": MessageLookupByLibrary.simpleMessage("未找到"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("未实现！"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage("通知请求"),
    "notificationRule": MessageLookupByLibrary.simpleMessage("通知规则"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("通知目标"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage("通知模板"),
    "notifications": m13,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("Oauth2 client"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open app settings",
    ),
    "openAppSettingsToGrantPermissionMessage": m14,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage("打开设置并授予摄像头访问权限以继续"),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Open Wi-Fi settings",
    ),
    "or": MessageLookupByLibrary.simpleMessage("或"),
    "originator": MessageLookupByLibrary.simpleMessage("发起者"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA包"),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "输入的密码必须相同！",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage("忘记密码?"),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage("密码是必填项"),
    "passwordReset": MessageLookupByLibrary.simpleMessage("重置密码"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage("密码重置链接发送成功！"),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "输入和账号关联的邮箱，我们将发送密码重置链接到您的邮箱",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "密码修改成功",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("电话"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage("Phone is invalid"),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Phone is required",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Phone Number in E.164 format, ex. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Please contact your system administrator",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Please follow the next steps to connect your phone to device",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Please scan QR code on your device",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarm type"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("邮编"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隐私政策"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "个人资料更新成功",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage("设备配置成功"),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push notifications are not configured.\nPlease contact your system administrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("队列"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Queue stats"),
    "ready": MessageLookupByLibrary.simpleMessage("Ready"),
    "refresh": MessageLookupByLibrary.simpleMessage("刷新"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("重复输入密码"),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage("请求重置密码"),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "请求的实体不存在。",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("重新发送"),
    "resendCode": MessageLookupByLibrary.simpleMessage("重新发送验证码"),
    "resendCodeWait": m17,
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage("返回仪表板"),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Return to the app and tap Ready button",
    ),
    "routeNotDefined": m18,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("规则链"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("规则节点"),
    "scanACode": MessageLookupByLibrary.simpleMessage("扫描代码"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("扫描二维码"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchResults": MessageLookupByLibrary.simpleMessage("搜索结果"),
    "searchUsers": m19,
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "security": MessageLookupByLibrary.simpleMessage("Security"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Select country"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("选择地区"),
    "selectUser": MessageLookupByLibrary.simpleMessage("选择用户"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage("选择验证方式"),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Select Wi-Fi network",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send code"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "发送 Wi-Fi 凭据",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Set up a verification method",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Set up a verification method to continue with your login",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("严重程度"),
    "signIn": MessageLookupByLibrary.simpleMessage("登录"),
    "signUp": MessageLookupByLibrary.simpleMessage("注册"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("短信验证码"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be prompted to enter the security code that will be sent to the phone number",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("出现问题"),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "出现问题... 回滚",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("开始时间"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("州 / 省"),
    "status": MessageLookupByLibrary.simpleMessage("状态"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage("系统管理员"),
    "tbResource": MessageLookupByLibrary.simpleMessage("资源"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage("租户管理员"),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Tenant profile"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("使用条款"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "This will make your account less secure",
    ),
    "title": MessageLookupByLibrary.simpleMessage("标题"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("切换摄像头"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("切换闪光灯"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("验证码"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "请输入来自您身份验证器应用的安全码。",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will need to provide a two-factor authentication code",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("再试一次"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("尝试其他方式"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage("请尝试优化您的查询"),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage("请尝试刷新"),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Two-factor authentication",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Two-factor authentication is required",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "Two-factor authentication protects your account from unauthorized access. All you have to do is enter a security code when you log in.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("类型"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Unable connect to device",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m21,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage("无法使用摄像头"),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("未确认"),
    "unassigned": MessageLookupByLibrary.simpleMessage("未分配"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Unit system"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error."),
    "unread": MessageLookupByLibrary.simpleMessage("Unread"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage("Unsaved changes"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("需要更新"),
    "updateTo": m22,
    "url": MessageLookupByLibrary.simpleMessage("Url"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "username": MessageLookupByLibrary.simpleMessage("用户名"),
    "users": MessageLookupByLibrary.simpleMessage("用户"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage("验证码不正确"),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage("验证码格式无效"),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "验证码请求过于频繁",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verification required",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("验证您的身份"),
    "viewAll": MessageLookupByLibrary.simpleMessage("查看全部"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("查看仪表板"),
    "warning": MessageLookupByLibrary.simpleMessage("警告"),
    "widgetType": MessageLookupByLibrary.simpleMessage("组件类型"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("组件包"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi 密码"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("是"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Yes, deactivate"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Yes, discard"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "You have unsaved changes. Are you sure you want to leave this page?",
        ),
  };
}

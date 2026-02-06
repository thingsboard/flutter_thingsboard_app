// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(appTitle) =>
      "恭喜！\n您的 ${appTitle} 帳戶已啟用。\n現在您可以登入到您的 ${appTitle} 空間。";

  static String m1(authority) =>
      "Are you sure? You are going to delete your ${authority} account.";

  static String m2(count) => "${Intl.plural(count, one: '警報', other: '警報')}";

  static String m3(providerName) =>
      "Are you sure you want to deactivate ${providerName}?";

  static String m4(deviceName) => "無法與設備 ${deviceName} 建立連線。請重試";

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

  static String m11(contact) => "安全碼已發送到您的電子郵件 ${contact}。";

  static String m12(e) => "Error occured: ${e}";

  static String m13(count) => "${Intl.plural(count, one: '通知', other: '通知')}";

  static String m14(permissions) =>
      "您沒有足夠的「${permissions}」權限以繼續。請開啟應用程式設定，授予權限並點選「再試一次」。";

  static String m15(permissions) =>
      "您沒有足夠的「${permissions}」權限以繼續。請授予所需權限並點選「再試一次」。";

  static String m16(deviceName) => "輸入 ${deviceName} 的PIN碼以確認持有權證明";

  static String m17(time) =>
      "在 ${Intl.plural(time, one: '1 秒', other: '${time} 秒')}內重新發送驗證碼";

  static String m18(name) => "路由未定義：${name}";

  static String m19(count) =>
      "${Intl.plural(count, one: '搜尋使用者', other: '搜尋使用者')}";

  static String m20(contact) => "安全碼已發送到您的手機 ${contact}。";

  static String m21(name) =>
      "Unable connect to Wi-Fi because networks wasn\'t found by device ${name}";

  static String m22(version) => "更新至 ${version}";

  static String m23(deviceName) => "要繼續設定您的設備 ${deviceName}，請提供您網路的認證資料。";

  static String m24(network) => "輸入 ${network} 的密碼";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("接受"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "您必須接受我們的隱私權政策",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "您必須接受我們的使用條款",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage("帳戶啟用成功！"),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("確認"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("已確認"),
    "actionData": MessageLookupByLibrary.simpleMessage("動作資料"),
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
    "activatingAccount": MessageLookupByLibrary.simpleMessage("正在啟用帳戶..."),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "您的帳戶正在啟用中。\n請稍等...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("啟用"),
    "activity": MessageLookupByLibrary.simpleMessage("活動"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage("新增評論..."),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Add verification method",
    ),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "address2": MessageLookupByLibrary.simpleMessage("地址 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage("Admin settings"),
    "aiModel": MessageLookupByLibrary.simpleMessage("Ai model"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage("您確定要確認警報嗎？"),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage("確認警報"),
    "alarmClearText": MessageLookupByLibrary.simpleMessage("您確定要清除警報嗎？"),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("清除警報"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage("警報嚴重程度清單"),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("警報狀態清單"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarm type list"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("警報類型"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allDevices": MessageLookupByLibrary.simpleMessage("所有設備"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("允許存取"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有帳戶？"),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "收到空的請求資料。",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Any type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("Api key"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API使用狀態"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Thingsboard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Apply changes"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("您確定嗎？"),
    "areYouSureYouWantToDeactivate": m3,
    "areYouSureYouWantToExit": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to exit?",
    ),
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("資產名稱"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("資產設定檔"),
    "assets": MessageLookupByLibrary.simpleMessage("資產"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("指派給客戶"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("指派給我"),
    "assignee": MessageLookupByLibrary.simpleMessage("被指派人"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage("審計日誌詳情"),
    "auditLogs": MessageLookupByLibrary.simpleMessage("審計日誌"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "請輸入您的備份碼之一。",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage("備份碼"),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be able to use backup codes to pass two factor authentification",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "要配置您的新設備，請確保您手機的藍牙已開啟且在新設備的訊號範圍內",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Calculated field"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("修改密碼"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("選擇地區"),
    "city": MessageLookupByLibrary.simpleMessage("城市"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("宣告設備"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage("設備宣告完成"),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage("設備\n宣告成功"),
    "clear": MessageLookupByLibrary.simpleMessage("清除"),
    "cleared": MessageLookupByLibrary.simpleMessage("已清除"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Code verification failed!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "您必須確認您不是機器人",
    ),
    "confirmToCloseTheApp": MessageLookupByLibrary.simpleMessage(
      "Confirm to close the app",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("確認"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "確認 Wi-Fi 連線",
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
    "continueText": MessageLookupByLibrary.simpleMessage("繼續"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Copy 32-digits key to your authentication app or scan QR-code below",
        ),
    "country": MessageLookupByLibrary.simpleMessage("國家"),
    "createAccount": MessageLookupByLibrary.simpleMessage("建立帳戶"),
    "createPassword": MessageLookupByLibrary.simpleMessage("建立密碼"),
    "critical": MessageLookupByLibrary.simpleMessage("嚴重"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("目前密碼"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "目前密碼為必填項目",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("客戶"),
    "customers": MessageLookupByLibrary.simpleMessage("客戶"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("天"),
    "delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("刪除評論"),
    "details": MessageLookupByLibrary.simpleMessage("詳情"),
    "deviceList": MessageLookupByLibrary.simpleMessage("設備清單"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Device not able to find Wi-Fi nearby",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "未找到設備。請確保您手機的藍牙已開啟且在新設備的訊號範圍內。",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("設備設定檔"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Device provisioning",
    ),
    "devices": m9,
    "digitsCode": m10,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Discard changes"),
    "domain": MessageLookupByLibrary.simpleMessage("Domain"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "duration": MessageLookupByLibrary.simpleMessage("持續時間"),
    "edge": MessageLookupByLibrary.simpleMessage("邊緣"),
    "edit": MessageLookupByLibrary.simpleMessage("編輯"),
    "edited": MessageLookupByLibrary.simpleMessage("已編輯"),
    "email": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("電子郵件驗證碼"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage("電子郵件格式無效"),
    "emailRequireText": MessageLookupByLibrary.simpleMessage("電子郵件為必填項目"),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be prompted to enter the security code that will be sent to your email address",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage("電子郵件驗證"),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "請按照電子郵件中的說明完成註冊程序。注意：如果您沒有看到電子郵件，請檢查您的「垃圾郵件」資料夾，或點選「重新發送」按鈕重新發送電子郵件。",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "驗證電子郵件已發送到指定的電子郵件地址 ",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("電子郵件驗證成功"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Enter 6-digits key from your app here:",
    ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Enter an email to use as your authenticator.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("實體類型"),
    "entityView": MessageLookupByLibrary.simpleMessage("實體視圖"),
    "errorOccured": m12,
    "europe": MessageLookupByLibrary.simpleMessage("歐洲"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("法蘭克福"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Exit device provisioning",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to server",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "載入警報詳情失敗",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage("載入清單失敗"),
    "failureDetails": MessageLookupByLibrary.simpleMessage("失敗詳情"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal application error occurred:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal error"),
    "filters": MessageLookupByLibrary.simpleMessage("篩選器"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("名"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage("名為必填項目"),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("名"),
    "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Hide home dashboard toolbar",
    ),
    "home": MessageLookupByLibrary.simpleMessage("首頁"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Home dashboard"),
    "hours": MessageLookupByLibrary.simpleMessage("小時"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybrid"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("我不是機器人"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperial"),
    "inactive": MessageLookupByLibrary.simpleMessage("停用"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "未啟用使用者已存在",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "已註冊但電子郵件未驗證的使用者。\n如果您希望重新發送驗證電子郵件，請點選「重新發送」按鈕。",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("不確定"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "密碼長度至少需要6個字元",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("is required."),
    "job": MessageLookupByLibrary.simpleMessage("Job"),
    "label": MessageLookupByLibrary.simpleMessage("標籤"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastName": MessageLookupByLibrary.simpleMessage("姓"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage("姓為必填項目"),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("姓"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage("列表目前為空"),
    "login": MessageLookupByLibrary.simpleMessage("登入"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Login to app"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage("登入您的帳號"),
    "loginWith": MessageLookupByLibrary.simpleMessage("登入方式"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Thingsboard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "major": MessageLookupByLibrary.simpleMessage("重要"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Mark as read"),
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metric"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("備份碼"),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("簡訊"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage("身分驗證器應用程式"),
    "minor": MessageLookupByLibrary.simpleMessage("次要"),
    "minutes": MessageLookupByLibrary.simpleMessage("分鐘"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobile app"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Mobile app bundle",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobile dashboard should be configured in device profile!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
    "newPassword2": MessageLookupByLibrary.simpleMessage("確認新密碼"),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage("請再次輸入新密碼"),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage("新密碼為必填項目"),
    "newUserText": MessageLookupByLibrary.simpleMessage("新使用者？"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "No 2FA providers found",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage("未找到警報"),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "No dashboards found",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "No notifications found",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("未找到結果"),
    "northAmerica": MessageLookupByLibrary.simpleMessage("北美洲"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage("北維吉尼亞"),
    "notFound": MessageLookupByLibrary.simpleMessage("未找到"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("未實現！"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage("通知請求"),
    "notificationRule": MessageLookupByLibrary.simpleMessage("通知規則"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("通知目標"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage("通知範本"),
    "notifications": m13,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("Oauth2 client"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open app settings",
    ),
    "openAppSettingsToGrantPermissionMessage": m14,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage("開啟設定並授予攝影機存取權限以繼續"),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Open Wi-Fi settings",
    ),
    "or": MessageLookupByLibrary.simpleMessage("或"),
    "originator": MessageLookupByLibrary.simpleMessage("發起者"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA套件"),
    "password": MessageLookupByLibrary.simpleMessage("密碼"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "輸入的密碼必須相同！",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage("忘記密碼？"),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage("密碼為必填項目"),
    "passwordReset": MessageLookupByLibrary.simpleMessage("重設密碼"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage("密碼重設連結發送成功！"),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "輸入與帳號關聯的電子郵件，我們將發送密碼重設連結到您的電子郵件",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "密碼修改成功",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("電話"),
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
    "postalCode": MessageLookupByLibrary.simpleMessage("郵遞區號"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隱私權政策"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "個人資料更新成功",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage("設備配置成功"),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push notifications are not configured.\nPlease contact your system administrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("佇列"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Queue stats"),
    "ready": MessageLookupByLibrary.simpleMessage("Ready"),
    "refresh": MessageLookupByLibrary.simpleMessage("重新整理"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("重複輸入密碼"),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage("請求重設密碼"),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "請求的實體不存在。",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("重新發送"),
    "resendCode": MessageLookupByLibrary.simpleMessage("重新發送驗證碼"),
    "resendCodeWait": m17,
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage("返回儀表板"),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Return to the app and tap Ready button",
    ),
    "routeNotDefined": m18,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("規則鏈"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("規則節點"),
    "scanACode": MessageLookupByLibrary.simpleMessage("掃描代碼"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("掃描QR碼"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchResults": MessageLookupByLibrary.simpleMessage("搜尋結果"),
    "searchUsers": m19,
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "security": MessageLookupByLibrary.simpleMessage("Security"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Select country"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("選擇地區"),
    "selectUser": MessageLookupByLibrary.simpleMessage("選擇使用者"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage("選擇驗證方式"),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Select Wi-Fi network",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send code"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "發送 Wi-Fi 認證資料",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Set up a verification method",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Set up a verification method to continue with your login",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("嚴重程度"),
    "signIn": MessageLookupByLibrary.simpleMessage("登入"),
    "signUp": MessageLookupByLibrary.simpleMessage("註冊"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("簡訊驗證碼"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will be prompted to enter the security code that will be sent to the phone number",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("發生問題"),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "發生問題... 回復",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("開始時間"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("州 / 省"),
    "status": MessageLookupByLibrary.simpleMessage("狀態"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage("系統管理員"),
    "tbResource": MessageLookupByLibrary.simpleMessage("資源"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage("租戶管理員"),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Tenant profile"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("使用條款"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "This action cannot be undone",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "This will make your account less secure",
    ),
    "title": MessageLookupByLibrary.simpleMessage("標題"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("切換攝影機"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("切換閃光燈"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("驗證碼"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "請輸入來自您身分驗證器應用程式的安全碼。",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "The next time you log in, you will need to provide a two-factor authentication code",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("再試一次"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("嘗試其他方式"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage("請嘗試優化您的查詢"),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage("請嘗試重新整理"),
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
    "type": MessageLookupByLibrary.simpleMessage("類型"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Unable connect to device",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m21,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage("無法使用攝影機"),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("未確認"),
    "unassigned": MessageLookupByLibrary.simpleMessage("未指派"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Unit system"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error."),
    "unread": MessageLookupByLibrary.simpleMessage("Unread"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage("Unsaved changes"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("需要更新"),
    "updateTo": m22,
    "url": MessageLookupByLibrary.simpleMessage("Url"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "username": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "users": MessageLookupByLibrary.simpleMessage("使用者"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage("驗證碼不正確"),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage("驗證碼格式無效"),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "驗證碼請求過於頻繁",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verification required",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("驗證您的身分"),
    "viewAll": MessageLookupByLibrary.simpleMessage("查看全部"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("查看儀表板"),
    "warning": MessageLookupByLibrary.simpleMessage("警告"),
    "widgetType": MessageLookupByLibrary.simpleMessage("元件類型"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("元件包"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi 密碼"),
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

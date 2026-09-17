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

  static String m1(authority) => "您確定嗎？您將刪除您的 ${authority} 帳戶。";

  static String m2(count) => "${Intl.plural(count, one: '警報', other: '警報')}";

  static String m3(providerName) => "您確定要停用 ${providerName} 嗎？";

  static String m4(deviceName) => "無法與設備 ${deviceName} 建立連線。請重試";

  static String m5(link) => "無法開啟連結：${link}";

  static String m6(wifiName) => "連線到類似 ${wifiName} 的 Wi-Fi";

  static String m7(name) =>
      "連線 Wi-Fi 網路 ${name} 失敗。\n請確保您的手機已連線到設備的 Wi-Fi 網路，並且已在設備設定中為此應用程式啟用本地網路存取。";

  static String m8(count) => "${Intl.plural(count, one: '儀表板', other: '儀表板')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '刪除 1 則通知？', other: '刪除 ${count} 則通知？')}";

  static String m10(count) => "${Intl.plural(count, one: '設備', other: '設備')}";

  static String m11(count) => "${count}位數驗證碼";

  static String m12(contact) => "安全碼已發送到您的電子郵件 ${contact}。";

  static String m13(e) => "發生錯誤：${e}";

  static String m14(error) => "傳送驗證碼錯誤：${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 項操作失敗', other: '${count} 項操作失敗')}";

  static String m16(count) =>
      "${Intl.plural(count, one: '將 1 則通知標記為已讀？', other: '將 ${count} 則通知標記為已讀？')}";

  static String m17(count) => "已選擇 ${count} 項";

  static String m18(count) => "${Intl.plural(count, one: '通知', other: '通知')}";

  static String m19(permissions) =>
      "您沒有足夠的「${permissions}」權限以繼續。請開啟應用程式設定，授予權限並點選「再試一次」。";

  static String m20(permissions) =>
      "您沒有足夠的「${permissions}」權限以繼續。請授予所需權限並點選「再試一次」。";

  static String m21(deviceName) => "輸入 ${deviceName} 的PIN碼以確認持有權證明";

  static String m22(time) =>
      "在 ${Intl.plural(time, one: '1 秒', other: '${time} 秒')}內重新發送驗證碼";

  static String m23(name) => "路由未定義：${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: '搜尋使用者', other: '搜尋使用者')}";

  static String m25(contact) => "安全碼已發送到您的手機 ${contact}。";

  static String m26(name) => "無法連線 Wi-Fi，因為設備 ${name} 未找到網路";

  static String m27(version) => "更新至 ${version}";

  static String m28(deviceName) => "要繼續設定您的設備 ${deviceName}，請提供您網路的認證資料。";

  static String m29(network) => "輸入 ${network} 的密碼";

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
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("失敗"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("成功"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("已啟用"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("已新增"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage("已新增評論"),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("已確認"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage("警報已指派"),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("已清除"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage("警報已刪除"),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "警報已取消指派",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "從租戶指派",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "已指派給客戶",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage("已指派給邊緣"),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage("指派給租戶"),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "屬性已刪除",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage("屬性已讀取"),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "屬性已更新",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "認證資料已讀取",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "認證資料已更新",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("已刪除"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage("已刪除評論"),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("已鎖定"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("登入"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("登出"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "設備設定失敗",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage("設備已設定"),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "關係已更新",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage("關係已刪除"),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "所有關係已刪除",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC 呼叫"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("簡訊已傳送"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("已暫停"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "遙測資料已刪除",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "遙測資料已更新",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "已取消指派客戶",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "已從邊緣取消指派",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("已更新"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage("已更新評論"),
    "activatingAccount": MessageLookupByLibrary.simpleMessage("正在啟用帳戶..."),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "您的帳戶正在啟用中。\n請稍等...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("啟用"),
    "activity": MessageLookupByLibrary.simpleMessage("活動"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage("新增評論..."),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage("新增驗證方式"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "address2": MessageLookupByLibrary.simpleMessage("地址 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage("管理員設定"),
    "aiModel": MessageLookupByLibrary.simpleMessage("AI 模型"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage("您確定要確認警報嗎？"),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage("確認警報"),
    "alarmClearText": MessageLookupByLibrary.simpleMessage("您確定要清除警報嗎？"),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("清除警報"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage("警報嚴重程度清單"),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("警報狀態清單"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("警報類型清單"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("警報類型"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("全部"),
    "allDevices": MessageLookupByLibrary.simpleMessage("所有設備"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("允許存取"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage("已有帳戶？"),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "收到空的請求資料。",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("任何類型"),
    "apiKey": MessageLookupByLibrary.simpleMessage("API 金鑰"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API使用狀態"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Thingsboard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("套用變更"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("您確定嗎？"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("資產"),
    "assetName": MessageLookupByLibrary.simpleMessage("資產名稱"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("資產設定檔"),
    "assets": MessageLookupByLibrary.simpleMessage("資產"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("指派給客戶"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("指派給我"),
    "assignee": MessageLookupByLibrary.simpleMessage("被指派人"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage("審計日誌詳情"),
    "auditLogs": MessageLookupByLibrary.simpleMessage("審計日誌"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("自動"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "請輸入您的備份碼之一。",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage("備份碼"),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "下次登入時，您可以使用備份碼進行雙因素驗證",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "要配置您的新設備，請確保您手機的藍牙已開啟且在新設備的訊號範圍內",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("計算欄位"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage("無法刪除使用者帳戶"),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("修改密碼"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("選擇地區"),
    "city": MessageLookupByLibrary.simpleMessage("城市"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("宣告設備"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage("設備宣告完成"),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage("設備\n宣告成功"),
    "clear": MessageLookupByLibrary.simpleMessage("清除"),
    "cleared": MessageLookupByLibrary.simpleMessage("已清除"),
    "close": MessageLookupByLibrary.simpleMessage("關閉"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage("驗證碼驗證失敗！"),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "您必須確認您不是機器人",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("確認"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "確認 Wi-Fi 連線",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage("連線設備"),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "連線到您常用的 Wi-Fi",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage("正在連線設備"),
    "connectionError": MessageLookupByLibrary.simpleMessage("連線錯誤"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("繼續"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage("已複製到剪貼簿"),
    "copy": MessageLookupByLibrary.simpleMessage("複製"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage("將32位金鑰複製到您的驗證器應用程式或掃描下方 QR 碼"),
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
    "deleteAccount": MessageLookupByLibrary.simpleMessage("刪除帳戶"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("刪除評論"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("詳情"),
    "deviceList": MessageLookupByLibrary.simpleMessage("設備清單"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "設備無法找到附近的 Wi-Fi",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "未找到設備。請確保您手機的藍牙已開啟且在新設備的訊號範圍內。",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("設備設定檔"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage("設備設定"),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("捨棄變更"),
    "domain": MessageLookupByLibrary.simpleMessage("網域"),
    "done": MessageLookupByLibrary.simpleMessage("完成"),
    "duration": MessageLookupByLibrary.simpleMessage("持續時間"),
    "edge": MessageLookupByLibrary.simpleMessage("邊緣"),
    "edit": MessageLookupByLibrary.simpleMessage("編輯"),
    "edited": MessageLookupByLibrary.simpleMessage("已編輯"),
    "email": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("電子郵件驗證碼"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage("電子郵件格式無效"),
    "emailRequireText": MessageLookupByLibrary.simpleMessage("電子郵件為必填項目"),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "下次登入時，您將需要輸入傳送到電子郵件的安全碼",
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
      "在此輸入您應用程式中的6位數金鑰：",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage("輸入用於驗證的手機號碼"),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage("輸入用於驗證的電子郵件。"),
    "entityType": MessageLookupByLibrary.simpleMessage("實體類型"),
    "entityView": MessageLookupByLibrary.simpleMessage("實體視圖"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("歐洲"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("法蘭克福"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage("退出設備設定"),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage("無法連線至伺服器"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "載入警報詳情失敗",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage("載入清單失敗"),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("失敗詳情"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "發生致命應用程式錯誤：",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("致命錯誤"),
    "filters": MessageLookupByLibrary.simpleMessage("篩選器"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase 未設定。\n請參考官方 Firebase 文件\n了解如何設定。",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("名"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage("名為必填項目"),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("名"),
    "goBack": MessageLookupByLibrary.simpleMessage("返回"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "隱藏首頁儀表板工具列",
    ),
    "home": MessageLookupByLibrary.simpleMessage("首頁"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("首頁儀表板"),
    "hours": MessageLookupByLibrary.simpleMessage("小時"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("混合"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("我不是機器人"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("英制"),
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
    "isRequiredText": MessageLookupByLibrary.simpleMessage("為必填項目。"),
    "job": MessageLookupByLibrary.simpleMessage("工作"),
    "label": MessageLookupByLibrary.simpleMessage("標籤"),
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "lastName": MessageLookupByLibrary.simpleMessage("姓"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage("姓為必填項目"),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("姓"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage("列表目前為空"),
    "login": MessageLookupByLibrary.simpleMessage("登入"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("登入應用程式"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage("登入您的帳號"),
    "loginWith": MessageLookupByLibrary.simpleMessage("登入方式"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Thingsboard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "major": MessageLookupByLibrary.simpleMessage("重要"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("全部標記為已讀"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("標記為已讀"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("公制"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("備份碼"),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("簡訊"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage("身分驗證器應用程式"),
    "minor": MessageLookupByLibrary.simpleMessage("次要"),
    "minutes": MessageLookupByLibrary.simpleMessage("分鐘"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("行動應用程式"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage("行動應用程式套件"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage("需要在設備設定檔中設定行動儀表板！"),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "nSelected": m17,
    "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
    "newPassword2": MessageLookupByLibrary.simpleMessage("確認新密碼"),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage("請再次輸入新密碼"),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage("新密碼為必填項目"),
    "newUserText": MessageLookupByLibrary.simpleMessage("新使用者？"),
    "next": MessageLookupByLibrary.simpleMessage("下一步"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage("未找到雙因素驗證提供者"),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage("未找到警報"),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage("未找到儀表板"),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage("未找到通知"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("未找到結果"),
    "northAmerica": MessageLookupByLibrary.simpleMessage("北美洲"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage("北維吉尼亞"),
    "notFound": MessageLookupByLibrary.simpleMessage("未找到"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("未實現！"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage("通知請求"),
    "notificationRule": MessageLookupByLibrary.simpleMessage("通知規則"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("通知目標"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage("通知範本"),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("OAuth2 用戶端"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage("開啟應用程式設定"),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage("開啟設定並授予攝影機存取權限以繼續"),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage("開啟 Wi-Fi 設定"),
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
    "permissions": MessageLookupByLibrary.simpleMessage("權限"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("電話"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage("手機號碼無效"),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage("手機號碼為必填項目"),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "E.164格式的電話號碼，例如 +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage("請聯繫您的系統管理員"),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage("請按照以下步驟將您的手機連線到設備"),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage("請按照以下步驟重新將\n您的手機連線到常用 Wi-Fi"),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "請掃描您設備上的 QR 碼",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ 警報類型"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("郵遞區號"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("隱私權政策"),
    "profile": MessageLookupByLibrary.simpleMessage("個人資料"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "個人資料更新成功",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage("設備配置成功"),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage("推播通知未設定。\n請聯繫您的系統管理員。"),
    "queue": MessageLookupByLibrary.simpleMessage("佇列"),
    "queueStats": MessageLookupByLibrary.simpleMessage("佇列統計"),
    "ready": MessageLookupByLibrary.simpleMessage("準備好"),
    "refresh": MessageLookupByLibrary.simpleMessage("重新整理"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("重複輸入密碼"),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage("請求重設密碼"),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "請求的實體不存在。",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("重新發送"),
    "resendCode": MessageLookupByLibrary.simpleMessage("重新發送驗證碼"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("重設"),
    "retry": MessageLookupByLibrary.simpleMessage("重試"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage("返回儀表板"),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "返回應用程式並點選準備好按鈕",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("規則鏈"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("規則節點"),
    "scanACode": MessageLookupByLibrary.simpleMessage("掃描代碼"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("掃描QR碼"),
    "search": MessageLookupByLibrary.simpleMessage("搜尋"),
    "searchResults": MessageLookupByLibrary.simpleMessage("搜尋結果"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "security": MessageLookupByLibrary.simpleMessage("安全性"),
    "selectAll": MessageLookupByLibrary.simpleMessage("全選已載入"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("選擇國家"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("選擇地區"),
    "selectUser": MessageLookupByLibrary.simpleMessage("選擇使用者"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage("選擇驗證方式"),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage("選擇 Wi-Fi 網路"),
    "sendCode": MessageLookupByLibrary.simpleMessage("傳送驗證碼"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "發送 Wi-Fi 認證資料",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage("設定驗證方式"),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage("設定驗證方式以繼續登入"),
    "severity": MessageLookupByLibrary.simpleMessage("嚴重程度"),
    "signIn": MessageLookupByLibrary.simpleMessage("登入"),
    "signUp": MessageLookupByLibrary.simpleMessage("註冊"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("簡訊驗證碼"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "下次登入時，您將需要輸入傳送到手機號碼的安全碼",
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
    "tenant": MessageLookupByLibrary.simpleMessage("租戶"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage("租戶管理員"),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("租戶設定檔"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("使用條款"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage("此操作無法復原"),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "這將降低您帳戶的安全性",
    ),
    "title": MessageLookupByLibrary.simpleMessage("標題"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("切換攝影機"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("切換閃光燈"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("驗證碼"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "請輸入來自您身分驗證器應用程式的安全碼。",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "下次登入時，您需要提供雙因素驗證碼",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("再試一次"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("嘗試其他方式"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage("請嘗試優化您的查詢"),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage("請嘗試重新整理"),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage("雙因素驗證"),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "需要雙因素驗證",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "雙因素驗證保護您的帳戶免受未經授權的存取。您只需在登入時輸入安全碼。",
        ),
    "type": MessageLookupByLibrary.simpleMessage("類型"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage("無法連線到設備"),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage("無法使用攝影機"),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("未確認"),
    "unassigned": MessageLookupByLibrary.simpleMessage("未指派"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("單位制"),
    "unknownError": MessageLookupByLibrary.simpleMessage("未知錯誤。"),
    "unread": MessageLookupByLibrary.simpleMessage("未讀"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage("未儲存的變更"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("需要更新"),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("連結"),
    "user": MessageLookupByLibrary.simpleMessage("使用者"),
    "username": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "users": MessageLookupByLibrary.simpleMessage("使用者"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage("驗證碼不正確"),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage("驗證碼格式無效"),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "驗證碼請求過於頻繁",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage("需要驗證"),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("驗證您的身分"),
    "viewAll": MessageLookupByLibrary.simpleMessage("查看全部"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("查看儀表板"),
    "warning": MessageLookupByLibrary.simpleMessage("警告"),
    "widgetType": MessageLookupByLibrary.simpleMessage("元件類型"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("元件包"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi 密碼"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("是"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("是的，停用"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("是的，捨棄"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage("您有未儲存的變更。確定要離開此頁面嗎？"),
  };
}

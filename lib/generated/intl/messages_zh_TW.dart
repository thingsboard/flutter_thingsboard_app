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

  static String m2(name) => "Route not defined: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "actionData": MessageLookupByLibrary.simpleMessage("動作數據"),
    "active": MessageLookupByLibrary.simpleMessage("active"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "address2": MessageLookupByLibrary.simpleMessage("地址 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage("你確定要確認警報嗎?"),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage("確認警報"),
    "alarmClearText": MessageLookupByLibrary.simpleMessage("你確定要清除警報嗎?"),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("清除警報"),
    "alarms": MessageLookupByLibrary.simpleMessage("警報"),
    "allDevices": MessageLookupByLibrary.simpleMessage("所有設備"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Allow access"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Thingsboard"),
    "assetName": MessageLookupByLibrary.simpleMessage("資產名稱"),
    "assets": MessageLookupByLibrary.simpleMessage("資產"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("分派給客戶"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage("審計日誌詳情"),
    "auditLogs": MessageLookupByLibrary.simpleMessage("審計日誌"),
    "changePassword": MessageLookupByLibrary.simpleMessage("修改密碼"),
    "city": MessageLookupByLibrary.simpleMessage("城市"),
    "country": MessageLookupByLibrary.simpleMessage("國家"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("目前密碼"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage("輸入新密碼"),
    "customer": MessageLookupByLibrary.simpleMessage("客戶"),
    "customers": MessageLookupByLibrary.simpleMessage("客戶"),
    "devices": MessageLookupByLibrary.simpleMessage("設備"),
    "email": MessageLookupByLibrary.simpleMessage("電子郵件"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage("電子郵件格式錯誤"),
    "emailRequireText": MessageLookupByLibrary.simpleMessage("輸入電子郵件"),
    "entityType": MessageLookupByLibrary.simpleMessage("實體類型"),
    "failureDetails": MessageLookupByLibrary.simpleMessage("失敗詳情"),
    "firstName": MessageLookupByLibrary.simpleMessage("名"),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("名"),
    "home": MessageLookupByLibrary.simpleMessage("首頁"),
    "inactive": MessageLookupByLibrary.simpleMessage("inactive"),
    "label": MessageLookupByLibrary.simpleMessage("標籤"),
    "lastName": MessageLookupByLibrary.simpleMessage("姓"),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("姓"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage("列表當前為空"),
    "login": MessageLookupByLibrary.simpleMessage("登入"),
    "loginNotification": MessageLookupByLibrary.simpleMessage("登入你的帳號"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Thingsboard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
    "newPassword2": MessageLookupByLibrary.simpleMessage("確認新密碼"),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage("再次輸入新密碼"),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage("輸入新密碼"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "notFound": MessageLookupByLibrary.simpleMessage("Not Found"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("未實現!"),
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Open settings and grant access to camera to continue",
        ),
    "or": MessageLookupByLibrary.simpleMessage("或"),
    "password": MessageLookupByLibrary.simpleMessage("密碼"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "輸入的密碼必須相同",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage("忘記密碼?"),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage("輸入密碼"),
    "passwordReset": MessageLookupByLibrary.simpleMessage("重設密碼"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage("密碼重設連結已發送"),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "輸入和帳號關聯的電子郵件，我們將發送一個包含密碼重設連結的電子郵件",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "密碼修改成功",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("電話"),
    "postalCode": MessageLookupByLibrary.simpleMessage("郵遞區號"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "配置更新成功",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage("要求重設密碼"),
    "routeNotDefined": m2,
    "scanACode": MessageLookupByLibrary.simpleMessage("Scan a code"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("州 / 省"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage("系統管理員"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage("租戶管理員"),
    "title": MessageLookupByLibrary.simpleMessage("標題"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Toggle camera"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Toggle flash"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("再試一次"),
    "type": MessageLookupByLibrary.simpleMessage("類型"),
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Unable to use camera",
    ),
    "username": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "yes": MessageLookupByLibrary.simpleMessage("是"),
  };
}

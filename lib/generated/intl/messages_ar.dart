// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(appTitle) =>
      "تهانينا!\nتم تنشيط حساب ${appTitle} الخاص بك.\nيمكنك الآن تسجيل الدخول إلى مساحة ${appTitle} الخاصة بك.";

  static String m1(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarms')}";

  static String m2(deviceName) =>
      "لا يمكن إنشاء جلسة مع الجهاز ${deviceName}. يرجى المحاولة مرة أخرى";

  static String m3(link) => "Can\'t launch url: ${link}";

  static String m4(wifiName) => "Connect to Wi-Fi similar to ${wifiName}";

  static String m5(name) =>
      "Connection to the ${name} Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.";

  static String m6(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m7(count) =>
      "${Intl.plural(count, one: 'Device', other: 'Devices')}";

  static String m8(contact) =>
      "تم إرسال رمز أمني إلى بريدك الإلكتروني على العنوان ${contact}.";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Notification', other: 'Notifications')}";

  static String m10(permissions) =>
      "ليس لديك أذونات كافية لـ \"${permissions}\" للمتابعة. يرجى فتح إعدادات التطبيق ومنح الأذونات والضغط على \"حاول مرة أخرى\".";

  static String m11(permissions) =>
      "ليس لديك أذونات كافية لـ \"${permissions}\" للمتابعة. يرجى منح الأذونات المطلوبة والضغط على \"حاول مرة أخرى\".";

  static String m12(deviceName) =>
      "أدخل رقم PIN الخاص بـ ${deviceName} لتأكيد إثبات الحيازة";

  static String m13(time) =>
      "إعادة إرسال الرمز في ${Intl.plural(time, one: 'ثانية واحدة', other: '${time} ثواني')}";

  static String m14(name) => "المسار غير محدد: ${name}";

  static String m15(count) =>
      "${Intl.plural(count, one: 'البحث عن مستخدم', other: 'البحث عن مستخدمين')}";

  static String m16(contact) =>
      "تم إرسال رمز أمني إلى هاتفك على الرقم ${contact}.";

  static String m17(name) =>
      "Unable connect to Wi-Fi because networks wasn\'t found by device ${name}";

  static String m18(version) => "تحديث إلى ${version}";

  static String m19(deviceName) =>
      "لمتابعة إعداد جهازك ${deviceName}، يرجى تقديم بيانات اعتماد الشبكة الخاصة بك.";

  static String m20(network) => "أدخل كلمة المرور لـ ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("قبول"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "يجب أن تقبل سياسة الخصوصية الخاصة بنا",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "يجب أن تقبل شروط الاستخدام الخاصة بنا",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "تم تنشيط الحساب بنجاح!",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("إقرار"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("مُقر"),
    "actionData": MessageLookupByLibrary.simpleMessage("بيانات الإجراء"),
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
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "تنشيط الحساب...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "حسابك قيد التنشيط حالياً.\nيرجى الانتظار...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("نشط"),
    "activity": MessageLookupByLibrary.simpleMessage("النشاط"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage("إضافة تعليق..."),
    "address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "address2": MessageLookupByLibrary.simpleMessage("العنوان 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد الإقرار بالتنبيه؟",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "إقرار التنبيه",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد مسح التنبيه؟",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("مسح التنبيه"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "قائمة خطورة التنبيه",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage(
      "قائمة حالة التنبيه",
    ),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarm type list"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("أنواع التنبيهات"),
    "alarms": m1,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allDevices": MessageLookupByLibrary.simpleMessage("جميع الأجهزة"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("السماح بالوصول"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب بالفعل؟",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "تم استلام بيانات طلب فارغة.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Any type"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API Usage State"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("هل أنت متأكد؟"),
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("اسم الأصل"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Asset profile"),
    "assets": MessageLookupByLibrary.simpleMessage("الأصول"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("معين للعميل"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("معين لي"),
    "assignee": MessageLookupByLibrary.simpleMessage("المُكلف"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "تفاصيل سجل التدقيق",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("سجلات التدقيق"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال أحد الرموز الاحتياطية الخاصة بك.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "الرمز الاحتياطي",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "لتزويد جهازك الجديد، يرجى التأكد من تشغيل البلوتوث في هاتفك وأنه ضمن نطاق جهازك الجديد",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cannotEstablishSession": m2,
    "cantLaunchUrlLink": m3,
    "changePassword": MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("اختيار المنطقة"),
    "city": MessageLookupByLibrary.simpleMessage("المدينة"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("المطالبة بالجهاز"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "تمت المطالبة بالجهاز",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "تمت المطالبة\nبالجهاز بنجاح",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("مسح"),
    "cleared": MessageLookupByLibrary.simpleMessage("تم المسح"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Code verification failed!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "يجب أن تؤكد أنك لست روبوت",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("التأكيد"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "تأكيد اتصال Wi-Fi",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Connect to device",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Connect to the Wi-Fi you usually use",
    ),
    "connectToWifiSimilarToWifiname": m4,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Connecting to device",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Connection error"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m5,
    "continueText": MessageLookupByLibrary.simpleMessage("استمرار"),
    "country": MessageLookupByLibrary.simpleMessage("البلد"),
    "createAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "createPassword": MessageLookupByLibrary.simpleMessage("إنشاء كلمة مرور"),
    "critical": MessageLookupByLibrary.simpleMessage("حرج"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية مطلوبة.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("العميل"),
    "customers": MessageLookupByLibrary.simpleMessage("العملاء"),
    "dashboards": m6,
    "days": MessageLookupByLibrary.simpleMessage("أيام"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("حذف التعليق"),
    "details": MessageLookupByLibrary.simpleMessage("التفاصيل"),
    "deviceList": MessageLookupByLibrary.simpleMessage("قائمة الأجهزة"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Device not able to find Wi-Fi nearby",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على الأجهزة. يرجى التأكد من تشغيل البلوتوث في هاتفك وأنه ضمن نطاق جهازك الجديد.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Device profile"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Device provisioning",
    ),
    "devices": m7,
    "duration": MessageLookupByLibrary.simpleMessage("المدة"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("تحرير"),
    "edited": MessageLookupByLibrary.simpleMessage("محرر"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "emailAuthDescription": m8,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "رمز البريد الإلكتروني",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "صيغة البريد الإلكتروني غير صحيحة.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "تأكيد البريد الإلكتروني",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "يرجى اتباع التعليمات المقدمة في البريد الإلكتروني لإكمال إجراء التسجيل الخاص بك. ملاحظة: إذا لم تر البريد الإلكتروني لفترة، يرجى التحقق من مجلد \'الرسائل غير المرغوب فيها\' أو حاول إعادة إرسال البريد الإلكتروني بالضغط على زر \'إعادة إرسال\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "تم إرسال بريد إلكتروني يحتوي على تفاصيل التحقق إلى عنوان البريد الإلكتروني المحدد ",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage(
      "تم تأكيد البريد الإلكتروني",
    ),
    "entityType": MessageLookupByLibrary.simpleMessage("نوع الكيان"),
    "entityView": MessageLookupByLibrary.simpleMessage("Entity view"),
    "europe": MessageLookupByLibrary.simpleMessage("أوروبا"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("فرانكفورت"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Exit device provisioning",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to server",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل تفاصيل التنبيه",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل القائمة",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الفشل"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal application error occurred:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal error"),
    "filters": MessageLookupByLibrary.simpleMessage("المرشحات"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "الاسم الأول مطلوب.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "hours": MessageLookupByLibrary.simpleMessage("ساعات"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("لست روبوت"),
    "inactive": MessageLookupByLibrary.simpleMessage("غير نشط"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "يوجد مستخدم غير نشط بالفعل",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "يوجد مستخدم مسجل بالفعل بعنوان بريد إلكتروني غير مؤكد.\nانقر على زر \'إعادة إرسال\' إذا كنت تريد إعادة إرسال بريد التحقق الإلكتروني.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("غير محدد"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون كلمة المرور 6 أحرف على الأقل",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("is required."),
    "label": MessageLookupByLibrary.simpleMessage("التسمية"),
    "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "الاسم الأخير مطلوب.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "القائمة فارغة حالياً.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "loginNotification": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول إلى حسابك",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("تسجيل الدخول باستخدام"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage("شعار ثينغز بورد"),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
    "major": MessageLookupByLibrary.simpleMessage("رئيسي"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Mark as read"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "الرمز الاحتياطي",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني",
    ),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage("تطبيق المصادقة"),
    "minor": MessageLookupByLibrary.simpleMessage("ثانوي"),
    "minutes": MessageLookupByLibrary.simpleMessage("دقائق"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobile dashboard should be configured in device profile!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("المزيد"),
    "newPassword": MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور الجديدة",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور الجديدة مطلوب.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الجديدة مطلوبة.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("مستخدم جديد؟"),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على تنبيهات",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "No dashboards found",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "No notifications found",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على نتائج",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("أمريكا الشمالية"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "ن. فيرجينيا",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("غير موجود"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("لم يتم التنفيذ!"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Notification request",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Notification rule",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Notification target",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Notification template",
    ),
    "notifications": m9,
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open app settings",
    ),
    "openAppSettingsToGrantPermissionMessage": m10,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "افتح الإعدادات ومنح الوصول للكاميرا للمتابعة",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Open Wi-Fi settings",
    ),
    "or": MessageLookupByLibrary.simpleMessage("أو"),
    "originator": MessageLookupByLibrary.simpleMessage("المصدر"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA package"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "كلمات المرور المدخلة يجب أن تكون متطابقة!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "هل نسيت كلمة المرور؟",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "تم إرسال رابط إعادة تعيين كلمة المرور بنجاح!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "تم تغيير كلمة المرور بنجاح",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "permissionsNotEnoughMessage": m11,
    "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
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
    "popTitle": m12,
    "postalCode": MessageLookupByLibrary.simpleMessage("الرمز البريدي"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي بنجاح",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم توفير الجهاز بنجاح",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push notifications are not configured.\nPlease contact your system administrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Queue"),
    "ready": MessageLookupByLibrary.simpleMessage("Ready"),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage("كرر كلمة المرور"),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "طلب إعادة تعيين كلمة المرور",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "الكيان المطلوب غير موجود.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("إعادة إرسال"),
    "resendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "resendCodeWait": m13,
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "العودة إلى اللوحة",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Return to the app and tap Ready button",
    ),
    "routeNotDefined": m14,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Rule chain"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Rule node"),
    "scanACode": MessageLookupByLibrary.simpleMessage("مسح الرمز"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("مسح رمز QR"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchResults": MessageLookupByLibrary.simpleMessage("نتائج البحث"),
    "searchUsers": m15,
    "seconds": MessageLookupByLibrary.simpleMessage("ثواني"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("حدد المنطقة"),
    "selectUser": MessageLookupByLibrary.simpleMessage("اختيار المستخدمين"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "اختر طريقة للتحقق",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Select Wi-Fi network",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "إرسال بيانات اعتماد Wi-Fi",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("الخطورة"),
    "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "signUp": MessageLookupByLibrary.simpleMessage("التسجيل"),
    "smsAuthDescription": m16,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("رمز SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما ... التراجع",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("وقت البداية"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "الولاية / المقاطعة",
    ),
    "status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage("مسؤول النظام"),
    "tbResource": MessageLookupByLibrary.simpleMessage("Resource"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "مسؤول المستأجر",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Tenant profile"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("شروط الاستخدام"),
    "title": MessageLookupByLibrary.simpleMessage("العنوان"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("تبديل الكاميرا"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("تبديل الفلاش"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("الرمز"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال الرمز الأمني من تطبيق المصادقة الخاص بك.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("حاول بطريقة أخرى"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "يرجى محاولة تحسين استعلامك",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "يرجى محاولة التحديث",
    ),
    "type": MessageLookupByLibrary.simpleMessage("النوع"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Unable connect to device",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m17,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "غير قادر على استخدام الكاميرا",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("غير مُقر"),
    "unassigned": MessageLookupByLibrary.simpleMessage("غير معين"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error."),
    "unread": MessageLookupByLibrary.simpleMessage("Unread"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("تحديث مطلوب"),
    "updateTo": m18,
    "url": MessageLookupByLibrary.simpleMessage("Url"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "users": MessageLookupByLibrary.simpleMessage("المستخدمين"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "الرمز غير صحيح",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "صيغة الرمز غير صالحة",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "طلبات كثيرة للتحقق من الرمز",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("تحقق من هويتك"),
    "viewAll": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("عرض اللوحة"),
    "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widget type"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widgets bundle"),
    "wifiHelpMessage": m19,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("كلمة مرور Wi-Fi"),
    "wifiPasswordMessage": m20,
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
  };
}

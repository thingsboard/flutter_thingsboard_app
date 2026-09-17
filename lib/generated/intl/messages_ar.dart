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

  static String m1(authority) =>
      "هل أنت متأكد؟ ستقوم بحذف حساب ${authority} الخاص بك.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'تنبيه', other: 'تنبيهات')}";

  static String m3(providerName) =>
      "هل أنت متأكد أنك تريد تعطيل ${providerName}؟";

  static String m4(deviceName) =>
      "لا يمكن إنشاء جلسة مع الجهاز ${deviceName}. يرجى المحاولة مرة أخرى";

  static String m5(link) => "لا يمكن فتح الرابط: ${link}";

  static String m6(wifiName) => "اتصل بشبكة Wi-Fi مشابهة لـ ${wifiName}";

  static String m7(name) =>
      "فشل الاتصال بشبكة Wi-Fi ${name}.\nيرجى التأكد من أن هاتفك متصل بشبكة Wi-Fi الخاصة بالجهاز وأن الوصول إلى الشبكة المحلية مفعّل لهذا التطبيق.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'لوحة معلومات', other: 'لوحات معلومات')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'حذف إشعار واحد؟', other: 'حذف ${count} إشعارات؟')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'جهاز', other: 'أجهزة')}";

  static String m11(count) => "رمز من ${count} أرقام";

  static String m12(contact) =>
      "تم إرسال رمز أمني إلى بريدك الإلكتروني على العنوان ${contact}.";

  static String m13(e) => "حدث خطأ: ${e}";

  static String m14(error) => "خطأ في إرسال الرمز: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: 'فشلت عملية واحدة', other: 'فشلت ${count} عمليات')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'وضع علامة مقروء لإشعار واحد؟', other: 'وضع علامة مقروء لـ ${count} إشعارات؟')}";

  static String m17(count) => "${count} محدد";

  static String m18(count) =>
      "${Intl.plural(count, one: 'إشعار', other: 'إشعارات')}";

  static String m19(permissions) =>
      "ليس لديك أذونات كافية لـ \"${permissions}\" للمتابعة. يرجى فتح إعدادات التطبيق ومنح الأذونات والضغط على \"حاول مرة أخرى\".";

  static String m20(permissions) =>
      "ليس لديك أذونات كافية لـ \"${permissions}\" للمتابعة. يرجى منح الأذونات المطلوبة والضغط على \"حاول مرة أخرى\".";

  static String m21(deviceName) =>
      "أدخل رقم PIN الخاص بـ ${deviceName} لتأكيد إثبات الحيازة";

  static String m22(time) =>
      "إعادة إرسال الرمز في ${Intl.plural(time, one: 'ثانية واحدة', other: '${time} ثواني')}";

  static String m23(name) => "المسار غير محدد: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'البحث عن مستخدم', other: 'البحث عن مستخدمين')}";

  static String m25(contact) =>
      "تم إرسال رمز أمني إلى هاتفك على الرقم ${contact}.";

  static String m26(name) =>
      "تعذر الاتصال بـ Wi-Fi لأن الجهاز ${name} لم يجد شبكات";

  static String m27(version) => "تحديث إلى ${version}";

  static String m28(deviceName) =>
      "لمتابعة إعداد جهازك ${deviceName}، يرجى تقديم بيانات اعتماد الشبكة الخاصة بك.";

  static String m29(network) => "أدخل كلمة المرور لـ ${network}";

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
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("إقرار"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("مُقر"),
    "actionData": MessageLookupByLibrary.simpleMessage("بيانات الإجراء"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("فشل"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("نجاح"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("تم التفعيل"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("تمت الإضافة"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "تمت إضافة تعليق",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("تم الإقرار"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "تم تعيين التنبيه",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("تم المسح"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "تم حذف التنبيه",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء تعيين التنبيه",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "تم التعيين من المستأجر",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "تم التعيين للعميل",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "تم التعيين لـ Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "تم التعيين للمستأجر",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "تم حذف السمات",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "تم قراءة السمات",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "تم تحديث السمات",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "تم قراءة بيانات الاعتماد",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "تم تحديث بيانات الاعتماد",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("تم الحذف"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "تم حذف التعليق",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("تم القفل"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "فشلت تهيئة الجهاز",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تهيئة الجهاز",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "تم تحديث العلاقة",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "تم حذف العلاقة",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "تم حذف جميع العلاقات",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("استدعاء RPC"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("تم إرسال SMS"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("تم التعليق"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "تم حذف القياس عن بعد",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "تم تحديث القياس عن بعد",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء التعيين من العميل",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء التعيين من Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("تم التحديث"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "تم تحديث التعليق",
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
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "إضافة طريقة تحقق",
    ),
    "address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "address2": MessageLookupByLibrary.simpleMessage("العنوان 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage("إعدادات المسؤول"),
    "aiModel": MessageLookupByLibrary.simpleMessage("نموذج ذكاء اصطناعي"),
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
    "alarmTypeList": MessageLookupByLibrary.simpleMessage(
      "قائمة أنواع التنبيهات",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("أنواع التنبيهات"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "allDevices": MessageLookupByLibrary.simpleMessage("جميع الأجهزة"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("السماح بالوصول"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب بالفعل؟",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "تم استلام بيانات طلب فارغة.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("أي نوع"),
    "apiKey": MessageLookupByLibrary.simpleMessage("مفتاح API"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("حالة استخدام API"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("تطبيق التغييرات"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("هل أنت متأكد؟"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("الأصل"),
    "assetName": MessageLookupByLibrary.simpleMessage("اسم الأصل"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("ملف تعريف الأصل"),
    "assets": MessageLookupByLibrary.simpleMessage("الأصول"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("معين للعميل"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("معين لي"),
    "assignee": MessageLookupByLibrary.simpleMessage("المُكلف"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "تفاصيل سجل التدقيق",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("سجلات التدقيق"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("تلقائي"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال أحد الرموز الاحتياطية الخاصة بك.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "الرمز الاحتياطي",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "في المرة القادمة التي تسجل فيها الدخول، يمكنك استخدام الرموز الاحتياطية للمصادقة الثنائية",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "لتزويد جهازك الجديد، يرجى التأكد من تشغيل البلوتوث في هاتفك وأنه ضمن نطاق جهازك الجديد",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("حقل محسوب"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "لا يمكن حذف حساب المستخدم",
    ),
    "cantLaunchUrlLink": m5,
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
    "close": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "فشل التحقق من الرمز!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "يجب أن تؤكد أنك لست روبوت",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("التأكيد"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "تأكيد اتصال Wi-Fi",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage("الاتصال بالجهاز"),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "اتصل بشبكة Wi-Fi التي تستخدمها عادة",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "جاري الاتصال بالجهاز",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("خطأ في الاتصال"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("استمرار"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "تم النسخ إلى الحافظة",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("نسخ"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "انسخ المفتاح المكون من 32 رقماً إلى تطبيق المصادقة أو امسح رمز QR أدناه",
        ),
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
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("أيام"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("حذف التعليق"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("التفاصيل"),
    "deviceList": MessageLookupByLibrary.simpleMessage("قائمة الأجهزة"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "لا يمكن للجهاز العثور على Wi-Fi قريب",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على الأجهزة. يرجى التأكد من تشغيل البلوتوث في هاتفك وأنه ضمن نطاق جهازك الجديد.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("ملف تعريف الجهاز"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage("تهيئة الجهاز"),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("تجاهل التغييرات"),
    "domain": MessageLookupByLibrary.simpleMessage("النطاق"),
    "done": MessageLookupByLibrary.simpleMessage("تم"),
    "duration": MessageLookupByLibrary.simpleMessage("المدة"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("تحرير"),
    "edited": MessageLookupByLibrary.simpleMessage("محرر"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "رمز البريد الإلكتروني",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "صيغة البريد الإلكتروني غير صحيحة.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "في المرة القادمة التي تسجل فيها الدخول، سيُطلب منك إدخال رمز الأمان المرسل إلى بريدك الإلكتروني",
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
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "أدخل المفتاح المكون من 6 أرقام من تطبيقك هنا:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage("أدخل رقم هاتف لاستخدامه كمصادق"),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "أدخل بريداً إلكترونياً لاستخدامه كمصادق.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("نوع الكيان"),
    "entityView": MessageLookupByLibrary.simpleMessage("عرض الكيان"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("أوروبا"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("فرانكفورت"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "الخروج من تهيئة الجهاز",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "فشل الاتصال بالخادم",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل تفاصيل التنبيه",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل القائمة",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الفشل"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ فادح في التطبيق:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("خطأ فادح"),
    "filters": MessageLookupByLibrary.simpleMessage("المرشحات"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase غير مكوّن.\nيرجى الرجوع إلى وثائق Firebase الرسمية\nللحصول على الإرشادات.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "الاسم الأول مطلوب.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
    "goBack": MessageLookupByLibrary.simpleMessage("رجوع"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "إخفاء شريط أدوات لوحة المعلومات الرئيسية",
    ),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage(
      "لوحة المعلومات الرئيسية",
    ),
    "hours": MessageLookupByLibrary.simpleMessage("ساعات"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("هجين"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("لست روبوت"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("إمبراطوري"),
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
    "isRequiredText": MessageLookupByLibrary.simpleMessage("مطلوب."),
    "job": MessageLookupByLibrary.simpleMessage("مهمة"),
    "label": MessageLookupByLibrary.simpleMessage("التسمية"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "الاسم الأخير مطلوب.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "القائمة فارغة حالياً.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "loginToApp": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول إلى التطبيق",
    ),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول إلى حسابك",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("تسجيل الدخول باستخدام"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage("شعار ثينغز بورد"),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
    "major": MessageLookupByLibrary.simpleMessage("رئيسي"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("تحديد الكل كمقروء"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("تحديد كمقروء"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("متري"),
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
    "mobileApp": MessageLookupByLibrary.simpleMessage("تطبيق الجوال"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "حزمة تطبيق الجوال",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "يجب تكوين لوحة المعلومات المحمولة في ملف تعريف الجهاز!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("المزيد"),
    "nSelected": m17,
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
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على مزودي المصادقة الثنائية",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على تنبيهات",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على لوحات معلومات",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على إشعارات",
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
    "notificationRequest": MessageLookupByLibrary.simpleMessage("طلب الإشعار"),
    "notificationRule": MessageLookupByLibrary.simpleMessage("قاعدة الإشعار"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("هدف الإشعار"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "قالب الإشعار",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("عميل OAuth2"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "فتح إعدادات التطبيق",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "افتح الإعدادات ومنح الوصول للكاميرا للمتابعة",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "فتح إعدادات Wi-Fi",
    ),
    "or": MessageLookupByLibrary.simpleMessage("أو"),
    "originator": MessageLookupByLibrary.simpleMessage("المصدر"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("حزمة OTA"),
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
    "permissions": MessageLookupByLibrary.simpleMessage("الأذونات"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف غير صالح",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف بصيغة E.164، مثال: +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage("يرجى الاتصال بمسؤول النظام"),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "يرجى اتباع الخطوات التالية لتوصيل هاتفك بالجهاز",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "يرجى اتباع الخطوات التالية لإعادة توصيل\nهاتفك بشبكة Wi-Fi المعتادة",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "يرجى مسح رمز QR على جهازك",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ نوع تنبيه"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("الرمز البريدي"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي بنجاح",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم توفير الجهاز بنجاح",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "الإشعارات الفورية غير مكوّنة.\nيرجى الاتصال بمسؤول النظام.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("قائمة الانتظار"),
    "queueStats": MessageLookupByLibrary.simpleMessage(
      "إحصائيات قائمة الانتظار",
    ),
    "ready": MessageLookupByLibrary.simpleMessage("جاهز"),
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
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "العودة إلى اللوحة",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "عد إلى التطبيق واضغط على زر جاهز",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("سلسلة القواعد"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("عقدة القواعد"),
    "scanACode": MessageLookupByLibrary.simpleMessage("مسح الرمز"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("مسح رمز QR"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "searchResults": MessageLookupByLibrary.simpleMessage("نتائج البحث"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("ثواني"),
    "security": MessageLookupByLibrary.simpleMessage("الأمان"),
    "selectAll": MessageLookupByLibrary.simpleMessage("تحديد الكل المحمّل"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("اختيار البلد"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("حدد المنطقة"),
    "selectUser": MessageLookupByLibrary.simpleMessage("اختيار المستخدمين"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "اختر طريقة للتحقق",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "اختيار شبكة Wi-Fi",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("إرسال الرمز"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "إرسال بيانات اعتماد Wi-Fi",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "إعداد طريقة تحقق",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "قم بإعداد طريقة تحقق لمتابعة تسجيل الدخول",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("الخطورة"),
    "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "signUp": MessageLookupByLibrary.simpleMessage("التسجيل"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("رمز SMS"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "في المرة القادمة التي تسجل فيها الدخول، سيُطلب منك إدخال رمز الأمان المرسل إلى رقم الهاتف",
    ),
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
    "tbResource": MessageLookupByLibrary.simpleMessage("المورد"),
    "tenant": MessageLookupByLibrary.simpleMessage("المستأجر"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "مسؤول المستأجر",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("ملف تعريف المستأجر"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("شروط الاستخدام"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "لا يمكن التراجع عن هذا الإجراء",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "سيجعل هذا حسابك أقل أماناً",
    ),
    "title": MessageLookupByLibrary.simpleMessage("العنوان"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("تبديل الكاميرا"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("تبديل الفلاش"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("الرمز"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال الرمز الأمني من تطبيق المصادقة الخاص بك.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "في المرة القادمة التي تسجل فيها الدخول، ستحتاج إلى تقديم رمز المصادقة الثنائية",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("حاول بطريقة أخرى"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "يرجى محاولة تحسين استعلامك",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "يرجى محاولة التحديث",
    ),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "المصادقة الثنائية",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "المصادقة الثنائية مطلوبة",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "المصادقة الثنائية تحمي حسابك من الوصول غير المصرح به. كل ما عليك فعله هو إدخال رمز أمان عند تسجيل الدخول.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("النوع"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "تعذر الاتصال بالجهاز",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "غير قادر على استخدام الكاميرا",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("غير مُقر"),
    "unassigned": MessageLookupByLibrary.simpleMessage("غير معين"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("نظام الوحدات"),
    "unknownError": MessageLookupByLibrary.simpleMessage("خطأ غير معروف."),
    "unread": MessageLookupByLibrary.simpleMessage("غير مقروء"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "تغييرات غير محفوظة",
    ),
    "update": MessageLookupByLibrary.simpleMessage("تحديث"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("تحديث مطلوب"),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("رابط"),
    "user": MessageLookupByLibrary.simpleMessage("المستخدم"),
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
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "التحقق مطلوب",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage("تحقق من هويتك"),
    "viewAll": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("عرض اللوحة"),
    "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
    "widgetType": MessageLookupByLibrary.simpleMessage("نوع الأداة"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("حزمة الأدوات"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("كلمة مرور Wi-Fi"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("نعم، تعطيل"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("نعم، تجاهل"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "لديك تغييرات غير محفوظة. هل أنت متأكد أنك تريد مغادرة هذه الصفحة؟",
        ),
  };
}

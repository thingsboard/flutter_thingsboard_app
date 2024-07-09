// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.
// @dart=2.12
// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'ar';

  static m0(contact) => "تم إرسال رمز أمني إلى بريدك الإلكتروني على العنوان ${contact}.";

  static m1(time) => "إعادة إرسال الرمز في {time, plural, =1{ثانية واحدة} other{${time} ثواني}}";

  static m2(contact) => "تم إرسال رمز أمني إلى هاتفك على الرقم ${contact}.";

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'No': MessageLookupByLibrary.simpleMessage('لا'),
    'OR': MessageLookupByLibrary.simpleMessage('أو'),
    'Yes': MessageLookupByLibrary.simpleMessage('نعم'),
    'actionData': MessageLookupByLibrary.simpleMessage('بيانات الإجراء'),
    'active': MessageLookupByLibrary.simpleMessage('نشط'),
    'address': MessageLookupByLibrary.simpleMessage('العنوان'),
    'address2': MessageLookupByLibrary.simpleMessage('العنوان 2'),
    'alarmAcknowledgeText': MessageLookupByLibrary.simpleMessage('هل أنت متأكد أنك تريد الإقرار بالتنبيه؟'),
    'alarmAcknowledgeTitle': MessageLookupByLibrary.simpleMessage('إقرار التنبيه'),
    'alarmClearText': MessageLookupByLibrary.simpleMessage('هل أنت متأكد أنك تريد مسح التنبيه؟'),
    'alarmClearTitle': MessageLookupByLibrary.simpleMessage('مسح التنبيه'),
    'alarms': MessageLookupByLibrary.simpleMessage('التنبيهات'),
    'allDevices': MessageLookupByLibrary.simpleMessage('جميع الأجهزة'),
    'appTitle': MessageLookupByLibrary.simpleMessage('ThingsBoard'),
    'assetName': MessageLookupByLibrary.simpleMessage('اسم الأصل'),
    'assets': MessageLookupByLibrary.simpleMessage('الأصول'),
    'assignedToCustomer': MessageLookupByLibrary.simpleMessage('معين للعميل'),
    'auditLogDetails': MessageLookupByLibrary.simpleMessage('تفاصيل سجل التدقيق'),
    'auditLogs': MessageLookupByLibrary.simpleMessage('سجلات التدقيق'),
    'backupCodeAuthDescription': MessageLookupByLibrary.simpleMessage('يرجى إدخال أحد الرموز الاحتياطية الخاصة بك.'),
    'backupCodeAuthPlaceholder': MessageLookupByLibrary.simpleMessage('الرمز الاحتياطي'),
    'changePassword': MessageLookupByLibrary.simpleMessage('تغيير كلمة المرور'),
    'city': MessageLookupByLibrary.simpleMessage('المدينة'),
    'continueText': MessageLookupByLibrary.simpleMessage('استمرار'),
    'country': MessageLookupByLibrary.simpleMessage('البلد'),
    'currentPassword': MessageLookupByLibrary.simpleMessage('كلمة المرور الحالية'),
    'currentPasswordRequireText': MessageLookupByLibrary.simpleMessage('كلمة المرور الحالية مطلوبة.'),
    'currentPasswordStar': MessageLookupByLibrary.simpleMessage('كلمة المرور الحالية *'),
    'customer': MessageLookupByLibrary.simpleMessage('العميل'),
    'customers': MessageLookupByLibrary.simpleMessage('العملاء'),
    'devices': MessageLookupByLibrary.simpleMessage('الأجهزة'),
    'email': MessageLookupByLibrary.simpleMessage('البريد الإلكتروني'),
    'emailAuthDescription': m0,
    'emailAuthPlaceholder': MessageLookupByLibrary.simpleMessage('رمز البريد الإلكتروني'),
    'emailInvalidText': MessageLookupByLibrary.simpleMessage('صيغة البريد الإلكتروني غير صحيحة.'),
    'emailRequireText': MessageLookupByLibrary.simpleMessage('البريد الإلكتروني مطلوب.'),
    'emailStar': MessageLookupByLibrary.simpleMessage('البريد الإلكتروني *'),
    'entityType': MessageLookupByLibrary.simpleMessage('نوع الكيان'),
    'failureDetails': MessageLookupByLibrary.simpleMessage('تفاصيل الفشل'),
    'firstName': MessageLookupByLibrary.simpleMessage('الاسم الأول'),
    'firstNameUpper': MessageLookupByLibrary.simpleMessage('الاسم الأول'),
    'home': MessageLookupByLibrary.simpleMessage('الرئيسية'),
    'inactive': MessageLookupByLibrary.simpleMessage('غير نشط'),
    'label': MessageLookupByLibrary.simpleMessage('التسمية'),
    'lastName': MessageLookupByLibrary.simpleMessage('الاسم الأخير'),
    'lastNameUpper': MessageLookupByLibrary.simpleMessage('الاسم الأخير'),
    'listIsEmptyText': MessageLookupByLibrary.simpleMessage('القائمة فارغة حالياً.'),
    'login': MessageLookupByLibrary.simpleMessage('تسجيل دخول'),
    'loginNotification': MessageLookupByLibrary.simpleMessage('تسجيل الدخول إلى حسابك'),
    'logoDefaultValue': MessageLookupByLibrary.simpleMessage('شعار ثينغز بورد'),
    'logout': MessageLookupByLibrary.simpleMessage('تسجيل خروج'),
    'mfaProviderBackupCode': MessageLookupByLibrary.simpleMessage('الرمز الاحتياطي'),
    'mfaProviderEmail': MessageLookupByLibrary.simpleMessage('البريد الإلكتروني'),
    'mfaProviderSms': MessageLookupByLibrary.simpleMessage('SMS'),
    'mfaProviderTopt': MessageLookupByLibrary.simpleMessage('تطبيق المصادقة'),
    'more': MessageLookupByLibrary.simpleMessage('المزيد'),
    'newPassword': MessageLookupByLibrary.simpleMessage('كلمة المرور الجديدة'),
    'newPassword2': MessageLookupByLibrary.simpleMessage('تأكيد كلمة المرور الجديدة'),
    'newPassword2RequireText': MessageLookupByLibrary.simpleMessage('تأكيد كلمة المرور الجديدة مطلوب.'),
    'newPassword2Star': MessageLookupByLibrary.simpleMessage('تأكيد كلمة المرور الجديدة *'),
    'newPasswordRequireText': MessageLookupByLibrary.simpleMessage('كلمة المرور الجديدة مطلوبة.'),
    'newPasswordStar': MessageLookupByLibrary.simpleMessage('كلمة المرور الجديدة *'),
    'notImplemented': MessageLookupByLibrary.simpleMessage('لم يتم التنفيذ!'),
    'password': MessageLookupByLibrary.simpleMessage('كلمة المرور'),
    'passwordErrorNotification': MessageLookupByLibrary.simpleMessage('كلمات المرور المدخلة يجب أن تكون متطابقة!'),
    'passwordForgotText': MessageLookupByLibrary.simpleMessage('هل نسيت كلمة المرور؟'),
    'passwordRequireText': MessageLookupByLibrary.simpleMessage('كلمة المرور مطلوبة.'),
    'passwordReset': MessageLookupByLibrary.simpleMessage('إعادة تعيين كلمة المرور'),
    'passwordResetLinkSuccessfullySentNotification': MessageLookupByLibrary.simpleMessage('تم إرسال رابط إعادة تعيين كلمة المرور بنجاح!'),
    'passwordResetText': MessageLookupByLibrary.simpleMessage('أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور'),
    'passwordSuccessNotification': MessageLookupByLibrary.simpleMessage('تم تغيير كلمة المرور بنجاح'),
    'phone': MessageLookupByLibrary.simpleMessage('الهاتف'),
    'postalCode': MessageLookupByLibrary.simpleMessage('الرمز البريدي'),
    'profileSuccessNotification': MessageLookupByLibrary.simpleMessage('تم تحديث الملف الشخصي بنجاح'),
    'requestPasswordReset': MessageLookupByLibrary.simpleMessage('طلب إعادة تعيين كلمة المرور'),
    'resendCode': MessageLookupByLibrary.simpleMessage('إعادة إرسال الرمز'),
    'resendCodeWait': m1,
    'selectWayToVerify': MessageLookupByLibrary.simpleMessage('اختر طريقة للتحقق'),
    'smsAuthDescription': m2,
    'smsAuthPlaceholder': MessageLookupByLibrary.simpleMessage('رمز SMS'),
    'stateOrProvince': MessageLookupByLibrary.simpleMessage('الولاية / المقاطعة'),
    'systemAdministrator': MessageLookupByLibrary.simpleMessage('مسؤول النظام'),
    'tenantAdministrator': MessageLookupByLibrary.simpleMessage('مسؤول المستأجر'),
    'title': MessageLookupByLibrary.simpleMessage('العنوان'),
    'toptAuthPlaceholder': MessageLookupByLibrary.simpleMessage('الرمز'),
    'totpAuthDescription': MessageLookupByLibrary.simpleMessage('يرجى إدخال الرمز الأمني من تطبيق المصادقة الخاص بك.'),
    'tryAgain': MessageLookupByLibrary.simpleMessage('حاول مرة أخرى'),
    'tryAnotherWay': MessageLookupByLibrary.simpleMessage('حاول بطريقة أخرى'),
    'type': MessageLookupByLibrary.simpleMessage('النوع'),
    'username': MessageLookupByLibrary.simpleMessage('اسم المستخدم'),
    'verificationCodeIncorrect': MessageLookupByLibrary.simpleMessage('الرمز غير صحيح'),
    'verificationCodeInvalid': MessageLookupByLibrary.simpleMessage('صيغة الرمز غير صالحة'),
    'verificationCodeManyRequest': MessageLookupByLibrary.simpleMessage('طلبات كثيرة للتحقق من الرمز'),
    'verifyYourIdentity': MessageLookupByLibrary.simpleMessage('تحقق من هويتك')
  };
}

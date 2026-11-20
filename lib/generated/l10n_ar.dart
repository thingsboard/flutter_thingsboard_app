// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'الرئيسية';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'الأجهزة',
      one: 'جهاز',
    );
    return '$_temp0';
  }

  @override
  String get more => 'المزيد';

  @override
  String get customers => 'العملاء';

  @override
  String get assets => 'الأصول';

  @override
  String get tenants => 'المستأجرون';

  @override
  String get auditLogs => 'سجلات التدقيق';

  @override
  String get noCustomersFound => 'لم يتم العثور على عملاء';

  @override
  String get noAssetsFound => 'لم يتم العثور على أصول';

  @override
  String get noTenantsFound => 'لم يتم العثور على مستأجرين';

  @override
  String get noDevicesFound => 'لم يتم العثور على أجهزة';

  @override
  String get noAuditLogsFound => 'لا توجد سجلات تدقيق';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get loginToYourAccount => 'تسجيل الدخول إلى حسابك';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailInvalidText => 'تنسيق البريد الإلكتروني غير صالح.';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordForgotText => 'هل نسيت كلمة المرور؟';

  @override
  String get passwordReset => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordResetText =>
      'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل إليك رسالة تحتوي على رابط إعادة تعيين كلمة المرور';

  @override
  String get requestPasswordReset => 'طلب إعادة تعيين كلمة المرور';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'تم إرسال رابط التحقق من البريد الإلكتروني بنجاح!';

  @override
  String get or => 'أو';

  @override
  String get no => 'لا';

  @override
  String get yes => 'نعم';

  @override
  String get title => 'الاسم';

  @override
  String get country => 'البلد';

  @override
  String get city => 'المدينة';

  @override
  String get stateOrProvince => 'الولاية / المقاطعة';

  @override
  String get postalCode => 'الرمز البريدي';

  @override
  String get address => 'العنوان';

  @override
  String get address2 => 'العنوان 2';

  @override
  String get phone => 'الهاتف';

  @override
  String get alarmClearTitle => 'مسح الإنذار';

  @override
  String get alarmClearText => 'هل أنت متأكد أنك تريد مسح الإنذار؟';

  @override
  String get alarmAcknowledgeTitle => 'الإقرار بالإنذار';

  @override
  String get alarmAcknowledgeText => 'هل أنت متأكد أنك تريد الإقرار بالإنذار؟';

  @override
  String get assetName => 'اسم الأصل';

  @override
  String get type => 'النوع';

  @override
  String get label => 'التسمية';

  @override
  String get auditLogDetails => 'تفاصيل سجل التدقيق';

  @override
  String get customerDetails => 'تفاصيل العميل';

  @override
  String get assetDetails => 'تفاصيل الأصل';

  @override
  String get tenantDetails => 'تفاصيل المستأجر';

  @override
  String get entityType => 'نوع الكيان';

  @override
  String get actionData => 'بيانات الإجراء';

  @override
  String get failureDetails => 'تفاصيل الفشل';

  @override
  String get allDevices => 'جميع الأجهزة';

  @override
  String get active => 'نشطة';

  @override
  String get inactive => 'غير نشطة';

  @override
  String get deviceActive => 'نشط';

  @override
  String get deviceInactive => 'غير نشط';

  @override
  String get activeDevices => 'نشط';

  @override
  String get inactiveDevices => 'غير نشط';

  @override
  String get alarmStatusActiveAcknowledged => 'نشط، تم الإقرار';

  @override
  String get alarmStatusActiveUnacknowledged => 'نشط، لم يتم الإقرار';

  @override
  String get alarmStatusClearedAcknowledged => 'تم المسح، تم الإقرار';

  @override
  String get alarmStatusClearedUnacknowledged => 'تم المسح، لم يتم الإقرار';

  @override
  String get alarmStatusFilterActive => 'نشط';

  @override
  String get systemAdministrator => 'مسؤول النظام';

  @override
  String get tenantAdministrator => 'مسؤول المستأجر';

  @override
  String get customer => 'عميل';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get currentPasswordRequireText => 'كلمة المرور الحالية مطلوبة.';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get newPasswordRequireText => 'كلمة المرور الجديدة مطلوبة.';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get newPassword2RequireText => 'تأكيد كلمة المرور الجديدة مطلوب.';

  @override
  String get newPassword2 => 'تأكيد كلمة المرور الجديدة';

  @override
  String get passwordErrorNotification =>
      'يجب أن تكون كلمات المرور المدخلة متطابقة!';

  @override
  String get profileSuccessNotification => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get passwordSuccessNotification => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get notImplemented => 'غير مُنفَّذ!';

  @override
  String get listIsEmptyText => 'القائمة فارغة حاليًا.';

  @override
  String get tryAgain => 'المحاولة مرة أخرى';

  @override
  String get verifyYourIdentity => 'تحقق من هويتك';

  @override
  String get continueText => 'متابعة';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time ثانية',
      many: '$time ثانية',
      few: '$time ثوانٍ',
      two: 'ثانيتين',
      one: 'ثانية واحدة',
      zero: '$time ثانية',
    );
    return 'إعادة إرسال الرمز خلال $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'يرجى إدخال رمز الأمان من تطبيق المصادقة الخاص بك.';

  @override
  String smsAuthDescription(Object contact) {
    return 'تم إرسال رمز أمان إلى هاتفك على $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'تم إرسال رمز أمان إلى عنوان البريد الإلكتروني الخاص بك على $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'يرجى إدخال أحد الرموز الاحتياطية الخاصة بك.';

  @override
  String get toptAuthPlaceholder => 'الرمز';

  @override
  String get smsAuthPlaceholder => 'رمز SMS';

  @override
  String get emailAuthPlaceholder => 'رمز البريد الإلكتروني';

  @override
  String get backupCodeAuthPlaceholder => 'رمز احتياطي';

  @override
  String get verificationCodeIncorrect => 'رمز التحقق غير صحيح';

  @override
  String get verificationCodeManyRequest =>
      'طلبات كثيرة جدًا للتحقق من رمز التحقق';

  @override
  String get tryAnotherWay => 'جرب طريقة أخرى';

  @override
  String get selectWayToVerify => 'حدد طريقة التحقق';

  @override
  String get mfaProviderTopt => 'تطبيق المصادقة';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'البريد الإلكتروني';

  @override
  String get mfaProviderBackupCode => 'رمز احتياطي';

  @override
  String get newUserText => 'مستخدم جديد؟';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get emailVerification => 'التحقق من البريد الإلكتروني';

  @override
  String get emailVerificationSentText =>
      'تم إرسال بريد إلكتروني يحتوي على تفاصيل التحقق إلى عنوان البريد الإلكتروني المحدد ';

  @override
  String get emailVerificationInstructionsText =>
      'يرجى اتباع التعليمات الواردة في البريد الإلكتروني لإكمال إجراء التسجيل. ملاحظة: إذا لم تظهر الرسالة لبعض الوقت، يرجى التحقق من مجلد \"البريد العشوائي\" أو إعادة إرسال البريد الإلكتروني بالنقر على زر \"إعادة الإرسال\".';

  @override
  String get resend => 'إعادة الإرسال';

  @override
  String get activatingAccount => 'جارٍ تنشيط الحساب...';

  @override
  String get accountActivated => 'تم تنشيط الحساب بنجاح!';

  @override
  String get emailVerified => 'تم التحقق من البريد الإلكتروني';

  @override
  String get activatingAccountText =>
      'يجري تنشيط حسابك حاليًا.\nيرجى الانتظار...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'تهانينا!\nتم تنشيط حسابك في $appTitle.\nيمكنك الآن تسجيل الدخول إلى مساحة $appTitle الخاصة بك.';
  }

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get cancel => 'إلغاء';

  @override
  String get accept => 'قبول';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get imNotARobot => 'لست روبوتًا';

  @override
  String get signUp => 'التسجيل';

  @override
  String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get inactiveUserAlreadyExists => 'المستخدم غير النشط موجود بالفعل';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'يوجد بالفعل مستخدم مسجَّل بعنوان بريد إلكتروني غير مُتحقَّق منه.\nانقر زر \"إعادة الإرسال\" إذا كنت ترغب في إعادة إرسال بريد التحقق.';

  @override
  String get assignee => 'المُكلَّف';

  @override
  String get alarmTypes => 'أنواع الإنذارات';

  @override
  String get details => 'التفاصيل';

  @override
  String get status => 'الحالة';

  @override
  String get severity => 'الخطورة';

  @override
  String get originator => 'المُنشئ';

  @override
  String get startTime => 'وقت البدء';

  @override
  String get duration => 'المدة';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value يوم',
      many: '$value يومًا',
      few: '$value أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ساعة',
      few: '$value ساعات',
      two: 'ساعتان',
      one: 'ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value دقيقة',
      few: '$value دقائق',
      two: 'دقيقتان',
      one: 'دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ثانية',
      few: '$value ثوانٍ',
      two: 'ثانيتان',
      one: 'ثانية واحدة',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'عرض لوحة المعلومات';

  @override
  String get activity => 'النشاط';

  @override
  String get addCommentMessage => 'أضف تعليقًا...';

  @override
  String get clear => 'مسح';

  @override
  String get acknowledge => 'إقرار';

  @override
  String get edit => 'تعديل';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get delete => 'حذف';

  @override
  String get edited => 'تم التعديل';

  @override
  String get deleteComment => 'حذف التعليق';

  @override
  String get areYouSure => 'هل أنت متأكد؟';

  @override
  String get noResultsFound => 'لم يتم العثور على نتائج';

  @override
  String get tryRefiningYourQuery => 'يرجى محاولة تحسين استعلامك';

  @override
  String get failedToLoadTheList => 'فشل تحميل القائمة';

  @override
  String get tryRefreshing => 'يرجى محاولة التحديث';

  @override
  String get refresh => 'تحديث';

  @override
  String get users => 'المستخدمون';

  @override
  String get unassigned => 'غير مُعين';

  @override
  String get failedToLoadAlarmDetails => 'فشل تحميل تفاصيل الإنذار';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get chooseRegion => 'اختيار المنطقة';

  @override
  String get selectRegion => 'اختيار المنطقة';

  @override
  String get northAmerica => 'أمريكا الشمالية';

  @override
  String get europe => 'أوروبا';

  @override
  String get northAmericaRegionShort => 'شمال فيرجينيا';

  @override
  String get europeRegionShort => 'فرانكفورت';

  @override
  String get deviceList => 'قائمة الأجهزة';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'لوحات المعلومات',
      one: 'لوحة المعلومات',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'التحديث مطلوب';

  @override
  String updateTo(Object version) {
    return 'التحديث إلى $version';
  }

  @override
  String get next => 'التالي';

  @override
  String get confirmation => 'تأكيد';

  @override
  String get wifiPassword => 'كلمة مرور Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'لمتابعة إعداد جهازك $deviceName، يرجى تقديم بيانات اعتماد شبكتك.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'أدخل كلمة المرور لـ $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'ليس لديك أذونات كافية لـ \"$permissions\" للمتابعة. يرجى منح الأذونات المطلوبة والنقر على \"المحاولة مرة أخرى\".';
  }

  @override
  String get sendingWifiCredentials => 'جارٍ إرسال بيانات اعتماد Wi-Fi';

  @override
  String get confirmingWifiConnection => 'جارٍ تأكيد اتصال Wi-Fi';

  @override
  String get provisionedSuccessfully => 'تم تزويد الجهاز بنجاح';

  @override
  String get returnToDashboard => 'العودة إلى لوحة المعلومات';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'تعذّر إنشاء جلسة مع الجهاز $deviceName. يرجى المحاولة مرة أخرى';
  }

  @override
  String get claimingDevice => 'جارٍ المطالبة بالجهاز';

  @override
  String get claimingMessageSuccess => 'تمت المطالبة بالجهاز\nبنجاح';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'ليس لديك أذونات كافية لـ \"$permissions\" للمتابعة. يرجى فتح إعدادات التطبيق ومنح الأذونات والنقر على \"المحاولة مرة أخرى\".';
  }

  @override
  String get scanACode => 'مسح رمز';

  @override
  String get allowAccess => 'السماح بالوصول';

  @override
  String get toggleCamera => 'تبديل الكاميرا';

  @override
  String get toggleFlash => 'تبديل الفلاش';

  @override
  String get unableToUseCamera => 'تعذّر استخدام الكاميرا';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'افتح الإعدادات وامنح حق الوصول إلى الكاميرا للمتابعة';

  @override
  String get notFound => 'غير موجود';

  @override
  String routeNotDefined(Object name) {
    return 'المسار غير معرَّف: $name';
  }

  @override
  String get loginWith => 'تسجيل الدخول باستخدام';

  @override
  String get scanQrCode => 'مسح رمز QR';

  @override
  String get searchResults => 'نتائج البحث';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get requestedEntityDoesNotExists => 'الكيان المطلوب غير موجود.';

  @override
  String get noAlarmsFound => 'لم يتم العثور على إنذارات';

  @override
  String get filters => 'الفلاتر';

  @override
  String get alarmStatusList => 'قائمة حالات الإنذار';

  @override
  String get alarmSeverityList => 'قائمة خطورة الإنذار';

  @override
  String get cleared => 'تم المسح';

  @override
  String get acknowledged => 'تم الإقرار';

  @override
  String get unacknowledged => 'لم يتم الإقرار';

  @override
  String get critical => 'حرج';

  @override
  String get major => 'رئيسي';

  @override
  String get minor => 'ثانوي';

  @override
  String get warning => 'تحذير';

  @override
  String get indeterminate => 'غير محدد';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'بحث عن مستخدمين',
      one: 'بحث عن مستخدم',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get update => 'تحديث';

  @override
  String get alarmTypeList => 'قائمة أنواع الإنذارات';

  @override
  String get anyType => 'أي نوع';

  @override
  String get plusAlarmType => '+ نوع الإنذار';

  @override
  String get all => 'الكل';

  @override
  String get allNotifications => 'الكل';

  @override
  String get unread => 'غير المقروءة';

  @override
  String get close => 'إغلاق';

  @override
  String get fatalError => 'خطأ فادح';

  @override
  String get unknownError => 'خطأ غير معروف.';

  @override
  String get sessionExpired => 'انتهت صلاحية الجلسة';

  @override
  String get fatalApplicationErrorOccurred => 'حدث خطأ فادح في التطبيق:';

  @override
  String get connectionError => 'خطأ في الاتصال';

  @override
  String get failedToConnectToServer => 'فشل الاتصال بالخادم';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'يجب تكوين لوحة معلومات الجوال في ملف تعريف الجهاز!';

  @override
  String get openWifiSettings => 'فتح إعدادات Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'اتصل بشبكة Wi-Fi التي تستخدمها عادةً';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'ارجع إلى التطبيق واضغط على زر \"جاهز\"';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'يرجى اتباع الخطوات التالية لإعادة توصيل\nهاتفك بشبكة Wi-Fi المعتادة';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'الإشعارات الفورية غير مكوَّنة.\nيرجى التواصل مع مسؤول النظام.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase غير مكوَّن.\n يرجى الرجوع إلى وثائق Firebase الرسمية\n للاطلاع على إرشادات حول كيفية القيام بذلك.';

  @override
  String get markAllAsRead => 'تمييز الكل كمقروء';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String cantLaunchUrlLink(String link) {
    return 'تعذر فتح الرابط: $link';
  }

  @override
  String get noDashboardsFound => 'لم يتم العثور على لوحات معلومات';

  @override
  String get openAppSettings => 'فتح إعدادات التطبيق';

  @override
  String get connectingToDevice => 'جارٍ الاتصال بالجهاز';

  @override
  String get connectToDevice => 'الاتصال بالجهاز';

  @override
  String get selectWifiNetwork => 'اختر شبكة Wi-Fi';

  @override
  String get deviceProvisioning => 'تزويد الأجهزة';

  @override
  String get permissions => 'الأذونات';

  @override
  String get unableConnectToDevice => 'تعذر الاتصال بالجهاز';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'تعذر على الجهاز العثور على شبكات Wi-Fi قريبة';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'فشل الاتصال بشبكة Wi-Fi $name.\nيرجى التأكد من أن هاتفك متصل بشبكة Wi-Fi الخاصة بالجهاز وأن الوصول إلى الشبكة المحلية مُمكَّن لهذا التطبيق في إعدادات هاتفك.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'تعذر الاتصال بشبكة Wi-Fi لأن الجهاز $name لم يعثر على الشبكات';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'يرجى اتباع الخطوات التالية لتوصيل هاتفك بالجهاز';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'اتصل بشبكة Wi-Fi مشابهة لـ $wifiName';
  }

  @override
  String get ready => 'جاهز';

  @override
  String get exitDeviceProvisioning => 'الخروج من تزويد الجهاز';

  @override
  String get noNotificationsFound => 'لم يتم العثور على إشعارات';

  @override
  String get markAsRead => 'تمييز كمقروء';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'يرجى مسح رمز QR على جهازك';

  @override
  String get search => 'بحث';

  @override
  String get tenant => 'المستأجر';

  @override
  String get tenantProfile => 'ملف تعريف المستأجر';

  @override
  String get user => 'المستخدم';

  @override
  String get asset => 'أصل';

  @override
  String get deviceProfile => 'ملف تعريف الجهاز';

  @override
  String get assetProfile => 'ملف تعريف الأصل';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'الإنذارات',
      one: 'إنذار',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'سلسلة القواعد';

  @override
  String get ruleNode => 'عقدة القاعدة';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'عرض الكيان';

  @override
  String get widgetsBundle => 'حزمة الأدوات';

  @override
  String get widgetType => 'نوع الأداة';

  @override
  String get apiUsageState => 'حالة استخدام API';

  @override
  String get tbResource => 'مورد';

  @override
  String get otaPackage => 'حزمة OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'طابور';

  @override
  String get notificationTarget => 'هدف الإشعار';

  @override
  String get notificationTemplate => 'قالب الإشعار';

  @override
  String get notificationRequest => 'طلب الإشعار';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'الإشعارات',
      one: 'الإشعار',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'قاعدة الإشعار';

  @override
  String get entityGroup => 'مجموعة الكيانات';

  @override
  String get converter => 'محوّل';

  @override
  String get integration => 'التكامل';

  @override
  String get schedulerEvent => 'حدث المُجدوِل';

  @override
  String get blobEntity => 'كيان Blob';

  @override
  String get role => 'الدور';

  @override
  String get groupPermission => 'إذن المجموعة';

  @override
  String get actionStatusSuccess => 'نجاح';

  @override
  String get actionStatusFailure => 'فشل';

  @override
  String get actionTypeAdded => 'تمت الإضافة';

  @override
  String get actionTypeDeleted => 'تم الحذف';

  @override
  String get actionTypeUpdated => 'تم التحديث';

  @override
  String get actionTypeAttributesUpdated => 'تم تحديث السمات';

  @override
  String get actionTypeAttributesDeleted => 'تم حذف السمات';

  @override
  String get actionTypeRpcCall => 'استدعاء RPC';

  @override
  String get actionTypeCredentialsUpdated => 'تم تحديث بيانات الاعتماد';

  @override
  String get actionTypeAssignedToCustomer => 'تم التعيين للعميل';

  @override
  String get actionTypeUnassignedFromCustomer => 'تم إلغاء التعيين من العميل';

  @override
  String get actionTypeActivated => 'تم التنشيط';

  @override
  String get actionTypeSuspended => 'تم التعليق';

  @override
  String get actionTypeCredentialsRead => 'تمت قراءة بيانات الاعتماد';

  @override
  String get actionTypeAttributesRead => 'تمت قراءة السمات';

  @override
  String get actionTypeRelationAddOrUpdate => 'تم تحديث العلاقة';

  @override
  String get actionTypeRelationDeleted => 'تم حذف العلاقة';

  @override
  String get actionTypeRelationsDeleted => 'تم حذف جميع العلاقات';

  @override
  String get actionTypeAlarmAck => 'تم الإقرار بالإنذار';

  @override
  String get actionTypeAlarmClear => 'تم مسح الإنذار';

  @override
  String get actionTypeAlarmDelete => 'تم حذف الإنذار';

  @override
  String get actionTypeAlarmAssigned => 'تم تعيين الإنذار';

  @override
  String get actionTypeAlarmUnassigned => 'تم إلغاء تعيين الإنذار';

  @override
  String get actionTypeLogin => 'تسجيل الدخول';

  @override
  String get actionTypeLogout => 'تسجيل الخروج';

  @override
  String get actionTypeLockout => 'قفل الحساب';

  @override
  String get actionTypeAssignedFromTenant => 'تم التعيين من المستأجر';

  @override
  String get actionTypeAssignedToTenant => 'تم التعيين للمستأجر';

  @override
  String get actionTypeProvisionSuccess => 'تم تزويد الجهاز';

  @override
  String get actionTypeProvisionFailure => 'فشل تزويد الجهاز';

  @override
  String get actionTypeTimeseriesUpdated => 'تم تحديث بيانات القياس عن بُعد';

  @override
  String get actionTypeTimeseriesDeleted => 'تم حذف بيانات القياس عن بُعد';

  @override
  String get actionTypeAssignedToEdge => 'تم التعيين إلى مثيل Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'تم إلغاء التعيين من مثيل Edge';

  @override
  String get actionTypeAddedComment => 'تمت إضافة تعليق';

  @override
  String get actionTypeUpdatedComment => 'تم تحديث التعليق';

  @override
  String get actionTypeDeletedComment => 'تم حذف التعليق';

  @override
  String get actionTypeSmsSent => 'تم إرسال رسالة SMS';

  @override
  String get actionTypeAddedToEntityGroup => 'تمت الإضافة إلى مجموعة الكيانات';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'تمت الإزالة من مجموعة الكيانات';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'استدعاء محرك القواعد عبر REST API';

  @override
  String get actionTypeMadePublic => 'أصبح عامًا';

  @override
  String get actionTypeMadePrivate => 'أصبح خاصًا';

  @override
  String get actionTypeChangeOwner => 'تم تغيير المالك';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'ليس لديك الأذونات لتنفيذ هذه العملية!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'يبدو أن أذوناتك غير كافية لإكمال هذه العملية';

  @override
  String fieldIsRequired(String field) {
    return '$field حقل مطلوب.';
  }

  @override
  String get no2faProvidersFound => 'لم يتم العثور على مزودي المصادقة بخطوتين';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'يرجى الاتصال بمسؤول النظام';

  @override
  String errorOccured(Object e) {
    return 'حدث خطأ: $e';
  }

  @override
  String get unsavedChanges => 'تغييرات غير محفوظة';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'لديك تغييرات غير محفوظة. هل أنت متأكد أنك تريد مغادرة هذه الصفحة؟';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'هل أنت متأكد؟ أنت على وشك حذف حساب $authority الخاص بك.';
  }

  @override
  String get language => 'اللغة';

  @override
  String get metricUnitSystem => 'متري';

  @override
  String get imperialUnitSystem => 'إمبراطوري';

  @override
  String get hybridUnitSystem => 'هجين';

  @override
  String get autoUnitSystem => 'تلقائي';

  @override
  String get languageAuto => 'تلقائي';

  @override
  String get unitSystem => 'نظام الوحدات';

  @override
  String get selectCountry => 'اختيار البلد';

  @override
  String get hideHomeDashboardToolbar =>
      'إخفاء شريط أدوات لوحة المعلومات الرئيسية';

  @override
  String get phoneNumberHelperText =>
      'رقم الهاتف بتنسيق E.164، مثال: ⁦+1201550123⁩';

  @override
  String get homeDashboard => 'لوحة المعلومات الرئيسية';

  @override
  String get security => 'الأمان';

  @override
  String get twofactorAuthentication => 'المصادقة بخطوتين';

  @override
  String get verificationRequired => 'التحقق مطلوب';

  @override
  String get twofactorAuthenticationIsRequired => 'المصادقة بخطوتين مطلوبة';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'أعدّ طريقة تحقق لمتابعة تسجيل الدخول';

  @override
  String get setUpAVerificationMethod => 'إعداد طريقة التحقق';

  @override
  String get totpSetupSuccessDescription =>
      'في المرة القادمة التي تسجّل فيها الدخول، ستحتاج إلى تقديم رمز المصادقة بخطوتين';

  @override
  String get smsSetupSuccessDescription =>
      'في المرة القادمة التي تسجّل فيها الدخول، سيُطلب منك إدخال رمز الأمان الذي سيُرسل إلى رقم الهاتف';

  @override
  String get emailSetupSuccessDescription =>
      'في المرة القادمة التي تسجّل فيها الدخول، سيُطلب منك إدخال رمز الأمان الذي سيُرسل إلى عنوان بريدك الإلكتروني';

  @override
  String get backupCodeSetupSuccessDescription =>
      'في المرة القادمة التي تسجّل فيها الدخول، ستتمكن من استخدام الرموز الاحتياطية لاجتياز المصادقة بخطوتين';

  @override
  String get loginToApp => 'تسجيل الدخول إلى التطبيق';

  @override
  String get goBack => 'رجوع';

  @override
  String get done => 'تم';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'سيؤدي ذلك إلى جعل حسابك أقل أمانًا';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'هل أنت متأكد أنك تريد إلغاء تنشيط $providerName؟';
  }

  @override
  String get yesDeactivate => 'نعم، إلغاء التنشيط';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'أدخل عنوان بريد إلكتروني لاستخدامه كوسيلة مصادقة.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'أدخل رقم هاتف لاستخدامه كوسيلة مصادقة';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get copy => 'نسخ';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'أدخل الرمز المكون من 6 أرقام هنا';

  @override
  String digitsCode(int count) {
    return 'رمز من $count أرقام';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'انسخ المفتاح المكوّن من 32 حرفًا إلى تطبيق المصادقة، أو امسح رمز QR أدناه';

  @override
  String get applyChanges => 'تطبيق التغييرات';

  @override
  String get discardChanges => 'تجاهل التغييرات';

  @override
  String get yesDiscard => 'نعم، تجاهل';

  @override
  String get thisActionCannotBeUndone => 'لا يمكن التراجع عن هذا الإجراء';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'تحمي المصادقة بخطوتين حسابك من الوصول غير المصرح به. كل ما عليك فعله هو إدخال رمز أمان عند تسجيل الدخول.';

  @override
  String get calculatedField => 'حقل محسوب';

  @override
  String get apiKey => 'مفتاح API';

  @override
  String get aiModel => 'نموذج الذكاء الاصطناعي';

  @override
  String get adminSettings => 'إعدادات المسؤول';

  @override
  String get job => 'مهمة';

  @override
  String get mobileAppBundle => 'حزمة تطبيق الجوال';

  @override
  String get mobileApp => 'تطبيق الجوال';

  @override
  String get domain => 'النطاق';

  @override
  String get oauth2Client => 'عميل OAuth2';

  @override
  String get queueStats => 'إحصائيات الطابور';

  @override
  String get phoneIsRequired => 'الهاتف مطلوب';

  @override
  String get phoneIsInvalid => 'الهاتف غير صالح';

  @override
  String get addVerificationMethod => 'إضافة طريقة تحقق';

  @override
  String get imageSavedToGallery => 'تم الحفظ في \"معرض الصور\" بالمنصة';

  @override
  String get failedToSaveImage => 'فشل حفظ الصورة';

  @override
  String nSelected(int count) {
    return 'تم تحديد $count';
  }

  @override
  String get selectAll => 'تحديد الكل المُحمَّل';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'فشلت $count عملية',
      few: 'فشلت $count عمليات',
      two: 'فشلت عمليتان',
      one: 'فشلت عملية واحدة',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count إشعار؟',
      many: 'حذف $count إشعارًا؟',
      few: 'حذف $count إشعارات؟',
      two: 'حذف إشعارين؟',
      one: 'حذف إشعار واحد؟',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'وضع علامة مقروء على $count إشعار؟',
      many: 'وضع علامة مقروء على $count إشعارًا؟',
      few: 'وضع علامة مقروء على $count إشعارات؟',
      two: 'وضع علامة مقروء على إشعارين؟',
      one: 'وضع علامة مقروء على إشعار واحد؟',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'جارٍ الحصول على البيانات من المضيف $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'جارٍ تسجيل دخولك إلى المضيف $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'جارٍ التبديل إلى المضيف الجديد $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'فشل الحصول على رمز تسجيل الدخول من $host. يرجى مسح رمز QR جديد.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'فشل الاتصال بـ $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host ليس خادم ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'لم تعد جلسة رمز QR صالحة. يرجى تحديث رمز QR والمسح مرة أخرى.';

  @override
  String get openThisLinkTitle => 'فتح هذا الرابط؟';

  @override
  String get linkOpensSignInPage =>
      'يفتح هذا الرابط صفحة تسجيل الدخول لهذا الخادم. سيتم تسجيل خروجك من الخادم الحالي.';

  @override
  String get linkOpensSignInPageOnly =>
      'يفتح هذا الرابط صفحة تسجيل الدخول لهذا الخادم.';

  @override
  String linkSignsInAs(Object email) {
    return 'يسجّل هذا الرابط دخولك إلى هذا الخادم باسم $email.';
  }

  @override
  String get linkSignsIn => 'يسجّل هذا الرابط دخولك إلى هذا الخادم.';

  @override
  String get serverConnectionNotSecure => 'لا يستخدم هذا الخادم اتصالًا آمنًا.';

  @override
  String get linkToOtherServerNotAllowed =>
      'يعمل هذا التطبيق مع خادمه الخاص فقط ولا يمكنه فتح هذا الرابط.';

  @override
  String get liveTrackingActive => 'تتبع الموقع المباشر';

  @override
  String get liveTrackingPaused => 'تم إيقاف التتبع المباشر مؤقتًا';

  @override
  String get liveTrackingFixes => 'المواقع';

  @override
  String get liveTrackingSaved => 'المحفوظة';

  @override
  String get liveTrackingErrors => 'الأخطاء';

  @override
  String get liveTrackingStop => 'إيقاف';

  @override
  String get liveTrackingPause => 'إيقاف مؤقت';

  @override
  String get liveTrackingResume => 'استئناف';

  @override
  String get liveTrackingHide => 'إخفاء';

  @override
  String get liveTrackingSessionTitle => 'تتبع الموقع المباشر';

  @override
  String get liveTrackingTarget => 'حفظ الموقع في الكيان';

  @override
  String get liveTrackingDashboard => 'لوحة المعلومات';

  @override
  String get liveTrackingStatus => 'الحالة';

  @override
  String get liveTrackingStarted => 'وقت البدء';

  @override
  String get liveTrackingLastFix => 'آخر موقع';

  @override
  String get liveTrackingLastError => 'آخر خطأ';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'تعذر الحفظ في هذا الكيان — لم يعد موجودًا. يستمر التتبع؛ حدِّث الهدف في إجراء لوحة المعلومات.';

  @override
  String get liveTrackingErrorNoConnection =>
      'لا يوجد اتصال بالخادم. لم يتم حفظ هذه المواقع — يُستأنف الحفظ عند عودة الاتصال بالإنترنت.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'انتهت جلستك. سجّل الدخول مجددًا لمتابعة حفظ الموقع.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'تعذر الحفظ في هذا الكيان — ليس لديك إذن. يستمر التتبع؛ اطلب من مسؤولك منح الوصول.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'تعذر حفظ هذا الموقع في الخادم. ستتم إعادة المحاولة مع الموقع التالي.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'خدمات الموقع مُعطَّلة على هذا الجهاز.';

  @override
  String get liveTrackingErrorPermissionDenied => 'تم رفض إذن الموقع.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'إذن الموقع مرفوض بشكل دائم. مكّنه من إعدادات التطبيق.';

  @override
  String get liveTrackingErrorLocation => 'تعذّر تحديد الموقع.';

  @override
  String get liveTrackingMenuTitle => 'تتبع الموقع المباشر';

  @override
  String get liveTrackingNoRecord => 'لا يوجد تتبع نشط ولا جلسة حديثة.';

  @override
  String get liveTrackingLastSession => 'آخر جلسة';

  @override
  String get liveTrackingStartAgain => 'بدء من جديد';

  @override
  String get liveTrackingEnded => 'وقت الانتهاء';

  @override
  String get liveTrackingEndReason => 'سبب الانتهاء';

  @override
  String get liveTrackingEndReasonManual => 'تم الإيقاف يدويًا';

  @override
  String get liveTrackingEndReasonMaxDuration => 'بلوغ الحد الأقصى للمدة';

  @override
  String get liveTrackingEndReasonInterrupted => 'تمت المقاطعة';

  @override
  String get serverUpdateRequired => 'يلزم تحديث الخادم';

  @override
  String get backToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'يعمل هذا التطبيق مع ThingsBoard $minVersion أو أحدث.';
  }

  @override
  String get serverLabel => 'الخادم';

  @override
  String get versionLabel => 'الإصدار';

  @override
  String get askAdminToUpdateServer => 'اطلب من مسؤول الخادم تحديث الخادم.';

  @override
  String get deviceClaimFailed =>
      'تعذّرت المطالبة بالجهاز. يرجى المحاولة مرة أخرى.';

  @override
  String get deviceToClaimNotFound =>
      'لم يتم العثور على الجهاز. يرجى التواصل مع مزوّد الجهاز.';

  @override
  String get enableAuthenticatorApp => 'تمكين تطبيق المصادقة';

  @override
  String get enableSmsAuthenticator => 'تمكين المصادقة عبر SMS';

  @override
  String get enableEmailAuthenticator => 'تمكين المصادقة عبر البريد الإلكتروني';

  @override
  String get getBackupCode => 'الحصول على رمز احتياطي';

  @override
  String get twoFaTotpDescription =>
      'استخدم تطبيقات مثل Google Authenticator وAuthy أو Duo على هاتفك للمصادقة. ستُنشئ هذه التطبيقات رمز أمان لتسجيل الدخول.';

  @override
  String get twoFaSmsDescription =>
      'استخدم هاتفك للمصادقة. سنرسل إليك رمز أمان في رسالة SMS عند تسجيل الدخول.';

  @override
  String get twoFaEmailDescription =>
      'استخدم رمز أمان يتم إرساله إلى عنوان بريدك الإلكتروني للمصادقة.';

  @override
  String get twoFaBackupCodeDescription =>
      'تتيح لك رموز المرور هذه القابلة للطباعة والمخصصة للاستخدام مرة واحدة تسجيل الدخول عندما تكون بعيدًا عن هاتفك، كما في أثناء السفر.';

  @override
  String get openInAuthenticatorApp => 'فتح في تطبيق المصادقة';

  @override
  String get noAuthenticatorAppFound =>
      'لم يتم العثور على تطبيق مصادقة. انسخ المفتاح إلى تطبيقك بدلًا من ذلك.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider مُمكَّن';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'يتطلب المسؤول لديك المصادقة بخطوتين لـ $email.';
  }

  @override
  String get recommended => 'موصى به';

  @override
  String get addBackupCodesHint =>
      'أضف رموزًا احتياطية أيضًا، لتتمكن من تسجيل الدخول في حال فقدان هاتفك.';

  @override
  String get totpSecretKey => 'المفتاح السري';

  @override
  String get backupCodesDescription =>
      'اطبع الرموز لتكون في متناول يدك عندما تحتاج إلى استخدامها لتسجيل الدخول إلى حسابك. يمكنك استخدام كل رمز احتياطي مرة واحدة.';

  @override
  String get backupCodesWarning =>
      'بمجرد مغادرة هذه الصفحة، لن يمكن عرض هذه الرموز مرة أخرى. احفظها بأمان باستخدام الخيارات أدناه.';

  @override
  String get downloadTxt => 'تنزيل (txt)';
}

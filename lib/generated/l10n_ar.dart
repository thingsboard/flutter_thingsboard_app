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
      other: 'أجهزة',
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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'سجلات التدقيق';

  @override
  String get noCustomersFound => 'No customers found';

  @override
  String get noAssetsFound => 'No assets found';

  @override
  String get noTenantsFound => 'No tenants found';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get noAuditLogsFound => 'No audit logs found';

  @override
  String get logout => 'تسجيل خروج';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get logoDefaultValue => 'شعار ثينغز بورد';

  @override
  String get loginToYourAccount => 'تسجيل الدخول إلى حسابك';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailRequireText => 'البريد الإلكتروني مطلوب.';

  @override
  String get emailInvalidText => 'صيغة البريد الإلكتروني غير صحيحة.';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordRequireText => 'كلمة المرور مطلوبة.';

  @override
  String get passwordForgotText => 'هل نسيت كلمة المرور؟';

  @override
  String get passwordReset => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordResetText =>
      'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور';

  @override
  String get requestPasswordReset => 'طلب إعادة تعيين كلمة المرور';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'تم إرسال رابط إعادة تعيين كلمة المرور بنجاح!';

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
  String get title => 'العنوان';

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
  String get alarmClearTitle => 'مسح التنبيه';

  @override
  String get alarmClearText => 'هل أنت متأكد أنك تريد مسح التنبيه؟';

  @override
  String get alarmAcknowledgeTitle => 'إقرار التنبيه';

  @override
  String get alarmAcknowledgeText => 'هل أنت متأكد أنك تريد الإقرار بالتنبيه؟';

  @override
  String get assetName => 'اسم الأصل';

  @override
  String get type => 'النوع';

  @override
  String get label => 'التسمية';

  @override
  String get assignedToCustomer => 'معين للعميل';

  @override
  String get auditLogDetails => 'تفاصيل سجل التدقيق';

  @override
  String get entityType => 'نوع الكيان';

  @override
  String get actionData => 'بيانات الإجراء';

  @override
  String get failureDetails => 'تفاصيل الفشل';

  @override
  String get allDevices => 'جميع الأجهزة';

  @override
  String get active => 'نشط';

  @override
  String get inactive => 'غير نشط';

  @override
  String get systemAdministrator => 'مسؤول النظام';

  @override
  String get tenantAdministrator => 'مسؤول المستأجر';

  @override
  String get customer => 'العميل';

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
      'كلمات المرور المدخلة يجب أن تكون متطابقة!';

  @override
  String get firstNameUpper => 'الاسم الأول';

  @override
  String get lastNameUpper => 'الاسم الأخير';

  @override
  String get profileSuccessNotification => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get passwordSuccessNotification => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get notImplemented => 'لم يتم التنفيذ!';

  @override
  String get listIsEmptyText => 'القائمة فارغة حالياً.';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get verifyYourIdentity => 'تحقق من هويتك';

  @override
  String get continueText => 'استمرار';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time ثواني',
      one: 'ثانية واحدة',
    );
    return 'إعادة إرسال الرمز في $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'يرجى إدخال الرمز الأمني من تطبيق المصادقة الخاص بك.';

  @override
  String smsAuthDescription(Object contact) {
    return 'تم إرسال رمز أمني إلى هاتفك على الرقم $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'تم إرسال رمز أمني إلى بريدك الإلكتروني على العنوان $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'يرجى إدخال أحد الرموز الاحتياطية الخاصة بك.';

  @override
  String get verificationCodeInvalid => 'صيغة الرمز غير صالحة';

  @override
  String get toptAuthPlaceholder => 'الرمز';

  @override
  String get smsAuthPlaceholder => 'رمز SMS';

  @override
  String get emailAuthPlaceholder => 'رمز البريد الإلكتروني';

  @override
  String get backupCodeAuthPlaceholder => 'الرمز الاحتياطي';

  @override
  String get verificationCodeIncorrect => 'الرمز غير صحيح';

  @override
  String get verificationCodeManyRequest => 'طلبات كثيرة للتحقق من الرمز';

  @override
  String get tryAnotherWay => 'حاول بطريقة أخرى';

  @override
  String get selectWayToVerify => 'اختر طريقة للتحقق';

  @override
  String get mfaProviderTopt => 'تطبيق المصادقة';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'البريد الإلكتروني';

  @override
  String get mfaProviderBackupCode => 'الرمز الاحتياطي';

  @override
  String get newUserText => 'مستخدم جديد؟';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get emailVerification => 'تأكيد البريد الإلكتروني';

  @override
  String get emailVerificationSentText =>
      'تم إرسال بريد إلكتروني يحتوي على تفاصيل التحقق إلى عنوان البريد الإلكتروني المحدد ';

  @override
  String get emailVerificationInstructionsText =>
      'يرجى اتباع التعليمات المقدمة في البريد الإلكتروني لإكمال إجراء التسجيل الخاص بك. ملاحظة: إذا لم تر البريد الإلكتروني لفترة، يرجى التحقق من مجلد \'الرسائل غير المرغوب فيها\' أو حاول إعادة إرسال البريد الإلكتروني بالضغط على زر \'إعادة إرسال\'.';

  @override
  String get resend => 'إعادة إرسال';

  @override
  String get activatingAccount => 'تنشيط الحساب...';

  @override
  String get accountActivated => 'تم تنشيط الحساب بنجاح!';

  @override
  String get emailVerified => 'تم تأكيد البريد الإلكتروني';

  @override
  String get activatingAccountText =>
      'حسابك قيد التنشيط حالياً.\nيرجى الانتظار...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'تهانينا!\nتم تنشيط حساب $appTitle الخاص بك.\nيمكنك الآن تسجيل الدخول إلى مساحة $appTitle الخاصة بك.';
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
  String get firstNameRequireText => 'الاسم الأول مطلوب.';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get lastNameRequireText => 'الاسم الأخير مطلوب.';

  @override
  String get createPassword => 'إنشاء كلمة مرور';

  @override
  String get repeatPassword => 'كرر كلمة المرور';

  @override
  String get imNotARobot => 'لست روبوت';

  @override
  String get signUp => 'التسجيل';

  @override
  String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get inactiveUserAlreadyExists => 'يوجد مستخدم غير نشط بالفعل';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'يوجد مستخدم مسجل بالفعل بعنوان بريد إلكتروني غير مؤكد.\nانقر على زر \'إعادة إرسال\' إذا كنت تريد إعادة إرسال بريد التحقق الإلكتروني.';

  @override
  String get assignee => 'المُكلف';

  @override
  String get alarmTypes => 'أنواع التنبيهات';

  @override
  String get details => 'التفاصيل';

  @override
  String get status => 'الحالة';

  @override
  String get severity => 'الخطورة';

  @override
  String get originator => 'المصدر';

  @override
  String get startTime => 'وقت البداية';

  @override
  String get duration => 'المدة';

  @override
  String get days => 'أيام';

  @override
  String get hours => 'ساعات';

  @override
  String get minutes => 'دقائق';

  @override
  String get seconds => 'ثواني';

  @override
  String get viewDashboard => 'عرض اللوحة';

  @override
  String get activity => 'النشاط';

  @override
  String get addCommentMessage => 'إضافة تعليق...';

  @override
  String get selectUser => 'اختيار المستخدمين';

  @override
  String get assignedToMe => 'معين لي';

  @override
  String get clear => 'مسح';

  @override
  String get acknowledge => 'إقرار';

  @override
  String get edit => 'تحرير';

  @override
  String get delete => 'حذف';

  @override
  String get edited => 'محرر';

  @override
  String get deleteComment => 'حذف التعليق';

  @override
  String get areYouSure => 'هل أنت متأكد؟';

  @override
  String get noResultsFound => 'لم يتم العثور على نتائج';

  @override
  String get tryRefiningYourQuery => 'يرجى محاولة تحسين استعلامك';

  @override
  String get failedToLoadTheList => 'فشل في تحميل القائمة';

  @override
  String get tryRefreshing => 'يرجى محاولة التحديث';

  @override
  String get refresh => 'تحديث';

  @override
  String get users => 'المستخدمين';

  @override
  String get unassigned => 'غير معين';

  @override
  String get failedToLoadAlarmDetails => 'فشل في تحميل تفاصيل التنبيه';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get chooseRegion => 'اختيار المنطقة';

  @override
  String get selectRegion => 'حدد المنطقة';

  @override
  String get northAmerica => 'أمريكا الشمالية';

  @override
  String get europe => 'أوروبا';

  @override
  String get northAmericaRegionShort => 'ن. فيرجينيا';

  @override
  String get europeRegionShort => 'فرانكفورت';

  @override
  String get deviceList => 'قائمة الأجهزة';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'لوحات معلومات',
      one: 'لوحة معلومات',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'تحديث مطلوب';

  @override
  String updateTo(Object version) {
    return 'تحديث إلى $version';
  }

  @override
  String get next => 'التالي';

  @override
  String get confirmation => 'التأكيد';

  @override
  String get wifiPassword => 'كلمة مرور Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'لمتابعة إعداد جهازك $deviceName، يرجى تقديم بيانات اعتماد الشبكة الخاصة بك.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'أدخل كلمة المرور لـ $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'لم يتم العثور على الأجهزة. يرجى التأكد من تشغيل البلوتوث في هاتفك وأنه ضمن نطاق جهازك الجديد.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'ليس لديك أذونات كافية لـ \"$permissions\" للمتابعة. يرجى منح الأذونات المطلوبة والضغط على \"حاول مرة أخرى\".';
  }

  @override
  String get sendingWifiCredentials => 'إرسال بيانات اعتماد Wi-Fi';

  @override
  String get confirmingWifiConnection => 'تأكيد اتصال Wi-Fi';

  @override
  String get provisionedSuccessfully => 'تم توفير الجهاز بنجاح';

  @override
  String get returnToDashboard => 'العودة إلى اللوحة';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'لا يمكن إنشاء جلسة مع الجهاز $deviceName. يرجى المحاولة مرة أخرى';
  }

  @override
  String get claimingDevice => 'المطالبة بالجهاز';

  @override
  String get claimingDeviceDone => 'تمت المطالبة بالجهاز';

  @override
  String get claimingMessageSuccess => 'تمت المطالبة\nبالجهاز بنجاح';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'ليس لديك أذونات كافية لـ \"$permissions\" للمتابعة. يرجى فتح إعدادات التطبيق ومنح الأذونات والضغط على \"حاول مرة أخرى\".';
  }

  @override
  String get scanACode => 'مسح الرمز';

  @override
  String get allowAccess => 'السماح بالوصول';

  @override
  String get toggleCamera => 'تبديل الكاميرا';

  @override
  String get toggleFlash => 'تبديل الفلاش';

  @override
  String get unableToUseCamera => 'غير قادر على استخدام الكاميرا';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'افتح الإعدادات ومنح الوصول للكاميرا للمتابعة';

  @override
  String get notFound => 'غير موجود';

  @override
  String routeNotDefined(Object name) {
    return 'المسار غير محدد: $name';
  }

  @override
  String get loginWith => 'تسجيل الدخول باستخدام';

  @override
  String get scanQrCode => 'مسح رمز QR';

  @override
  String get anEmptyRequestDataReceived => 'تم استلام بيانات طلب فارغة.';

  @override
  String get somethingWentWrongRollback => 'حدث خطأ ما ... التراجع';

  @override
  String get searchResults => 'نتائج البحث';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get requestedEntityDoesNotExists => 'الكيان المطلوب غير موجود.';

  @override
  String get noAlarmsFound => 'لم يتم العثور على تنبيهات';

  @override
  String get filters => 'المرشحات';

  @override
  String get alarmStatusList => 'قائمة حالة التنبيه';

  @override
  String get alarmSeverityList => 'قائمة خطورة التنبيه';

  @override
  String get cleared => 'تم المسح';

  @override
  String get acknowledged => 'مُقر';

  @override
  String get unacknowledged => 'غير مُقر';

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
      other: 'البحث عن مستخدمين',
      one: 'البحث عن مستخدم',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get update => 'تحديث';

  @override
  String get alarmTypeList => 'قائمة أنواع التنبيهات';

  @override
  String get anyType => 'أي نوع';

  @override
  String get plusAlarmType => '+ نوع تنبيه';

  @override
  String get all => 'الكل';

  @override
  String get unread => 'غير مقروء';

  @override
  String get close => 'إغلاق';

  @override
  String get codeVerificationFailed => 'فشل التحقق من الرمز!';

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
      'يجب تكوين لوحة المعلومات المحمولة في ملف تعريف الجهاز!';

  @override
  String get openWifiSettings => 'فتح إعدادات Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'اتصل بشبكة Wi-Fi التي تستخدمها عادة';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'عد إلى التطبيق واضغط على زر جاهز';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'يرجى اتباع الخطوات التالية لإعادة توصيل\nهاتفك بشبكة Wi-Fi المعتادة';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'الإشعارات الفورية غير مكوّنة.\nيرجى الاتصال بمسؤول النظام.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase غير مكوّن.\nيرجى الرجوع إلى وثائق Firebase الرسمية\nللحصول على الإرشادات.';

  @override
  String get markAllAsRead => 'تحديد الكل كمقروء';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String cantLaunchUrlLink(String link) {
    return 'لا يمكن فتح الرابط: $link';
  }

  @override
  String get noDashboardsFound => 'لم يتم العثور على لوحات معلومات';

  @override
  String get openAppSettings => 'فتح إعدادات التطبيق';

  @override
  String get connectingToDevice => 'جاري الاتصال بالجهاز';

  @override
  String get connectToDevice => 'الاتصال بالجهاز';

  @override
  String get selectWifiNetwork => 'اختيار شبكة Wi-Fi';

  @override
  String get deviceProvisioning => 'تهيئة الجهاز';

  @override
  String get permissions => 'الأذونات';

  @override
  String get unableConnectToDevice => 'تعذر الاتصال بالجهاز';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'لا يمكن للجهاز العثور على Wi-Fi قريب';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'فشل الاتصال بشبكة Wi-Fi $name.\nيرجى التأكد من أن هاتفك متصل بشبكة Wi-Fi الخاصة بالجهاز وأن الوصول إلى الشبكة المحلية مفعّل لهذا التطبيق.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'تعذر الاتصال بـ Wi-Fi لأن الجهاز $name لم يجد شبكات';
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
  String get exitDeviceProvisioning => 'الخروج من تهيئة الجهاز';

  @override
  String get noNotificationsFound => 'لم يتم العثور على إشعارات';

  @override
  String get markAsRead => 'تحديد كمقروء';

  @override
  String get url => 'رابط';

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
  String get asset => 'الأصل';

  @override
  String get deviceProfile => 'ملف تعريف الجهاز';

  @override
  String get assetProfile => 'ملف تعريف الأصل';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تنبيهات',
      one: 'تنبيه',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'سلسلة القواعد';

  @override
  String get ruleNode => 'عقدة القواعد';

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
  String get tbResource => 'المورد';

  @override
  String get otaPackage => 'حزمة OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'قائمة الانتظار';

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
      other: 'إشعارات',
      one: 'إشعار',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'قاعدة الإشعار';

  @override
  String get entityGroup => 'مجموعة الكيانات';

  @override
  String get converter => 'محول';

  @override
  String get integration => 'تكامل';

  @override
  String get schedulerEvent => 'حدث المجدول';

  @override
  String get blobEntity => 'كيان Blob';

  @override
  String get role => 'دور';

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
  String get actionTypeActivated => 'تم التفعيل';

  @override
  String get actionTypeSuspended => 'تم التعليق';

  @override
  String get actionTypeCredentialsRead => 'تم قراءة بيانات الاعتماد';

  @override
  String get actionTypeAttributesRead => 'تم قراءة السمات';

  @override
  String get actionTypeRelationAddOrUpdate => 'تم تحديث العلاقة';

  @override
  String get actionTypeRelationDeleted => 'تم حذف العلاقة';

  @override
  String get actionTypeRelationsDeleted => 'تم حذف جميع العلاقات';

  @override
  String get actionTypeAlarmAck => 'تم الإقرار';

  @override
  String get actionTypeAlarmClear => 'تم المسح';

  @override
  String get actionTypeAlarmDelete => 'تم حذف التنبيه';

  @override
  String get actionTypeAlarmAssigned => 'تم تعيين التنبيه';

  @override
  String get actionTypeAlarmUnassigned => 'تم إلغاء تعيين التنبيه';

  @override
  String get actionTypeLogin => 'تسجيل دخول';

  @override
  String get actionTypeLogout => 'تسجيل خروج';

  @override
  String get actionTypeLockout => 'تم القفل';

  @override
  String get actionTypeAssignedFromTenant => 'تم التعيين من المستأجر';

  @override
  String get actionTypeAssignedToTenant => 'تم التعيين للمستأجر';

  @override
  String get actionTypeProvisionSuccess => 'تم تهيئة الجهاز';

  @override
  String get actionTypeProvisionFailure => 'فشلت تهيئة الجهاز';

  @override
  String get actionTypeTimeseriesUpdated => 'تم تحديث القياس عن بعد';

  @override
  String get actionTypeTimeseriesDeleted => 'تم حذف القياس عن بعد';

  @override
  String get actionTypeAssignedToEdge => 'تم التعيين لـ Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'تم إلغاء التعيين من Edge';

  @override
  String get actionTypeAddedComment => 'تمت إضافة تعليق';

  @override
  String get actionTypeUpdatedComment => 'تم تحديث التعليق';

  @override
  String get actionTypeDeletedComment => 'تم حذف التعليق';

  @override
  String get actionTypeSmsSent => 'تم إرسال SMS';

  @override
  String get actionTypeAddedToEntityGroup => 'تمت الإضافة إلى مجموعة الكيانات';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'تمت الإزالة من مجموعة الكيانات';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'استدعاء محرك القواعد عبر REST API';

  @override
  String get actionTypeMadePublic => 'تم جعله عاماً';

  @override
  String get actionTypeMadePrivate => 'تم جعله خاصاً';

  @override
  String get actionTypeChangeOwner => 'تم تغيير المالك';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'ليس لديك صلاحيات لتنفيذ هذه العملية!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'يبدو أن صلاحياتك غير كافية لإكمال هذه العملية';

  @override
  String get isRequiredText => 'مطلوب.';

  @override
  String get no2faProvidersFound => 'لم يتم العثور على مزودي المصادقة الثنائية';

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
    return 'هل أنت متأكد؟ ستقوم بحذف حساب $authority الخاص بك.';
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
      'رقم الهاتف بصيغة E.164، مثال: +1201550123';

  @override
  String get homeDashboard => 'لوحة المعلومات الرئيسية';

  @override
  String get security => 'الأمان';

  @override
  String get twofactorAuthentication => 'المصادقة الثنائية';

  @override
  String get verificationRequired => 'التحقق مطلوب';

  @override
  String get twofactorAuthenticationIsRequired => 'المصادقة الثنائية مطلوبة';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'قم بإعداد طريقة تحقق لمتابعة تسجيل الدخول';

  @override
  String get setUpAVerificationMethod => 'إعداد طريقة تحقق';

  @override
  String get totpSetupSuccessDescription =>
      'في المرة القادمة التي تسجل فيها الدخول، ستحتاج إلى تقديم رمز المصادقة الثنائية';

  @override
  String get smsSetupSuccessDescription =>
      'في المرة القادمة التي تسجل فيها الدخول، سيُطلب منك إدخال رمز الأمان المرسل إلى رقم الهاتف';

  @override
  String get emailSetupSuccessDescription =>
      'في المرة القادمة التي تسجل فيها الدخول، سيُطلب منك إدخال رمز الأمان المرسل إلى بريدك الإلكتروني';

  @override
  String get backupCodeSetupSuccessDescription =>
      'في المرة القادمة التي تسجل فيها الدخول، يمكنك استخدام الرموز الاحتياطية للمصادقة الثنائية';

  @override
  String get loginToApp => 'تسجيل الدخول إلى التطبيق';

  @override
  String get goBack => 'رجوع';

  @override
  String get done => 'تم';

  @override
  String get thisWillMakeYourAccountLessSecure => 'سيجعل هذا حسابك أقل أماناً';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'هل أنت متأكد أنك تريد تعطيل $providerName؟';
  }

  @override
  String get yesDeactivate => 'نعم، تعطيل';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'أدخل بريداً إلكترونياً لاستخدامه كمصادق.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'أدخل رقم هاتف لاستخدامه كمصادق';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String errorSendingCode(String error) {
    return 'خطأ في إرسال الرمز: $error';
  }

  @override
  String get copy => 'نسخ';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'أدخل المفتاح المكون من 6 أرقام من تطبيقك هنا:';

  @override
  String digitsCode(int count) {
    return 'رمز من $count أرقام';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'انسخ المفتاح المكون من 32 رقماً إلى تطبيق المصادقة أو امسح رمز QR أدناه';

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
      'المصادقة الثنائية تحمي حسابك من الوصول غير المصرح به. كل ما عليك فعله هو إدخال رمز أمان عند تسجيل الدخول.';

  @override
  String get calculatedField => 'حقل محسوب';

  @override
  String get apiKey => 'مفتاح API';

  @override
  String get aiModel => 'نموذج ذكاء اصطناعي';

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
  String get queueStats => 'إحصائيات قائمة الانتظار';

  @override
  String get phoneIsRequired => 'رقم الهاتف مطلوب';

  @override
  String get phoneIsInvalid => 'رقم الهاتف غير صالح';

  @override
  String get addVerificationMethod => 'إضافة طريقة تحقق';

  @override
  String get imageSavedToGallery => 'تم الحفظ في \'معرض الصور\'';

  @override
  String get failedToSaveImage => 'فشل في حفظ الصورة';

  @override
  String nSelected(int count) {
    return '$count محدد';
  }

  @override
  String get selectAll => 'تحديد الكل المحمّل';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'فشلت $count عمليات',
      one: 'فشلت عملية واحدة',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count إشعارات؟',
      one: 'حذف إشعار واحد؟',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'وضع علامة مقروء لـ $count إشعارات؟',
      one: 'وضع علامة مقروء لإشعار واحد؟',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Getting data from your host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Logging you into the host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Switching you to the new host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Failed to obtain a login token from $host. Please scan a new QR code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Failed to connect to $host';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'The QR code session is no longer valid. Please refresh the QR code and scan again.';

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
      'لا يمكن الحفظ في هذا الكيان لأنه لم يعد موجودًا. يستمر التتبع؛ حدّث الهدف في إجراء لوحة المعلومات.';

  @override
  String get liveTrackingErrorNoConnection =>
      'لا يوجد اتصال بالخادم. لم يتم حفظ هذه المواقع، وسيُستأنف الحفظ عند عودة الاتصال.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'انتهت جلستك. سجّل الدخول مجددًا لمواصلة حفظ الموقع.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'لا يمكن الحفظ في هذا الكيان لأنك لا تملك الصلاحية. يستمر التتبع؛ اطلب الوصول من المسؤول.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'تعذّر حفظ هذا الموقع على الخادم. ستتم إعادة المحاولة مع الموقع التالي.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'خدمات الموقع متوقفة على هذا الجهاز.';

  @override
  String get liveTrackingErrorPermissionDenied => 'تم رفض إذن الموقع.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'تم رفض إذن الموقع بشكل دائم. فعّله من إعدادات التطبيق.';

  @override
  String get liveTrackingErrorLocation => 'تعذّر تحديد الموقع.';

  @override
  String get liveTrackingMenuTitle => 'تتبع الموقع المباشر';

  @override
  String get liveTrackingNoRecord => 'لا يوجد تتبع نشط ولا جلسة حديثة.';

  @override
  String get liveTrackingLastSession => 'آخر جلسة';

  @override
  String get liveTrackingStartAgain => 'البدء من جديد';

  @override
  String get liveTrackingEnded => 'وقت الانتهاء';

  @override
  String get liveTrackingEndReason => 'سبب الانتهاء';

  @override
  String get liveTrackingEndReasonManual => 'أُوقف يدويًا';

  @override
  String get liveTrackingEndReasonMaxDuration => 'تم بلوغ المدة القصوى';

  @override
  String get liveTrackingEndReasonInterrupted => 'انقطع';

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
      'تعذّر المطالبة بالجهاز. يرجى المحاولة مرة أخرى.';

  @override
  String get deviceToClaimNotFound =>
      'لم يتم العثور على الجهاز. يرجى التواصل مع مزوّد الجهاز.';
}

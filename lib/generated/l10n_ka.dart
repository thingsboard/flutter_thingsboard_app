// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class SKa extends S {
  SKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'მთავარი';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'მოწყობილობები',
      one: 'მოწყობილობა',
    );
    return '$_temp0';
  }

  @override
  String get more => 'მეტი';

  @override
  String get customers => 'კლიენტები';

  @override
  String get assets => 'აქტივები';

  @override
  String get tenants => 'ტენანტები';

  @override
  String get auditLogs => 'აუდიტის ჟურნალები';

  @override
  String get noCustomersFound => 'კლიენტები არ მოიძებნა';

  @override
  String get noAssetsFound => 'აქტივები ვერ მოიძებნა';

  @override
  String get noTenantsFound => 'ტენანტები ვერ მოიძებნა';

  @override
  String get noDevicesFound => 'მოწყობილობები ვერ მოიძებნა';

  @override
  String get noAuditLogsFound => 'აუდიტის ჟურნალები ვერ მოიძებნა';

  @override
  String get logout => 'გამოსვლა';

  @override
  String get login => 'შესვლა';

  @override
  String get logoDefaultValue => 'ThingsBoard-ის ლოგო';

  @override
  String get loginToYourAccount => 'შედით თქვენს ანგარიშში';

  @override
  String get email => 'ელფოსტა';

  @override
  String get emailRequireText => 'ელფოსტა სავალდებულოა.';

  @override
  String get emailInvalidText => 'ელფოსტის არასწორი ფორმატი.';

  @override
  String get username => 'მომხმარებლის სახელი';

  @override
  String get password => 'პაროლი';

  @override
  String get passwordRequireText => 'პაროლი სავალდებულოა.';

  @override
  String get passwordForgotText => 'დაგავიწყდათ პაროლი?';

  @override
  String get passwordReset => 'პაროლის აღდგენა';

  @override
  String get passwordResetText =>
      'შეიყვანეთ თქვენს ანგარიშთან დაკავშირებული ელფოსტა და ჩვენ გამოგიგზავნით წერილს პაროლის აღდგენის ბმულით';

  @override
  String get requestPasswordReset => 'პაროლის აღდგენის მოთხოვნა';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'პაროლის აღდგენის ბმული წარმატებით გაიგზავნა!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'ელფოსტის დამოწმების ბმული წარმატებით გაიგზავნა!';

  @override
  String get or => 'ან';

  @override
  String get no => 'არა';

  @override
  String get yes => 'დიახ';

  @override
  String get title => 'სათაური';

  @override
  String get country => 'ქვეყანა';

  @override
  String get city => 'ქალაქი';

  @override
  String get stateOrProvince => 'შტატი / პროვინცია';

  @override
  String get postalCode => 'საფოსტო ინდექსი';

  @override
  String get address => 'მისამართი';

  @override
  String get address2 => 'მისამართი 2';

  @override
  String get phone => 'ტელეფონი';

  @override
  String get alarmClearTitle => 'განგაშის გადაწყვეტა';

  @override
  String get alarmClearText =>
      'დარწმუნებული ხართ, რომ გსურთ განგაშის გადაწყვეტა?';

  @override
  String get alarmAcknowledgeTitle => 'განგაშის დადასტურება';

  @override
  String get alarmAcknowledgeText =>
      'დარწმუნებული ხართ, რომ გსურთ განგაშის დადასტურება?';

  @override
  String get assetName => 'აქტივის სახელი';

  @override
  String get type => 'ტიპი';

  @override
  String get label => 'ნიშნული';

  @override
  String get assignedToCustomer => 'მინიჭებულია კლიენტზე';

  @override
  String get auditLogDetails => 'აუდიტის ჟურნალის დეტალები';

  @override
  String get customerDetails => 'კლიენტის დეტალები';

  @override
  String get assetDetails => 'აქტივის დეტალები';

  @override
  String get tenantDetails => 'ტენანტის დეტალები';

  @override
  String get entityType => 'ობიექტის ტიპი';

  @override
  String get actionData => 'ქმედების მონაცემები';

  @override
  String get failureDetails => 'წარუმატებლობის დეტალები';

  @override
  String get allDevices => 'ყველა მოწყობილობა';

  @override
  String get active => 'აქტიური';

  @override
  String get inactive => 'არააქტიური';

  @override
  String get activeDevices => 'აქტიური';

  @override
  String get inactiveDevices => 'არააქტიური';

  @override
  String get alarmStatusActiveAcknowledged => 'აქტიური, დადასტურებული';

  @override
  String get alarmStatusActiveUnacknowledged => 'აქტიური, დაუდასტურებელი';

  @override
  String get alarmStatusClearedAcknowledged => 'გადაწყვეტილი, დადასტურებული';

  @override
  String get alarmStatusClearedUnacknowledged => 'გადაწყვეტილი, დაუდასტურებელი';

  @override
  String get alarmStatusFilterActive => 'აქტიური';

  @override
  String get systemAdministrator => 'სისტემის ადმინისტრატორი';

  @override
  String get tenantAdministrator => 'ტენანტის ადმინისტრატორი';

  @override
  String get customer => 'კლიენტი';

  @override
  String get changePassword => 'პაროლის შეცვლა';

  @override
  String get currentPasswordRequireText => 'მიმდინარე პაროლი სავალდებულოა.';

  @override
  String get currentPassword => 'მიმდინარე პაროლი';

  @override
  String get newPasswordRequireText => 'ახალი პაროლი სავალდებულოა.';

  @override
  String get newPassword => 'ახალი პაროლი';

  @override
  String get newPassword2RequireText => 'ახალი პაროლის გამეორება სავალდებულოა.';

  @override
  String get newPassword2 => 'გაიმეორეთ ახალი პაროლი';

  @override
  String get passwordErrorNotification => 'შეყვანილი პაროლები უნდა ემთხვეოდეს!';

  @override
  String get firstNameUpper => 'სახელი';

  @override
  String get lastNameUpper => 'გვარი';

  @override
  String get profileSuccessNotification => 'პროფილი წარმატებით განახლდა';

  @override
  String get passwordSuccessNotification => 'პაროლი წარმატებით შეიცვალა';

  @override
  String get notImplemented => 'არ არის რეალიზებული!';

  @override
  String get listIsEmptyText => 'სია ამჟამად ცარიელია.';

  @override
  String get tryAgain => 'ხელახლა ცდა';

  @override
  String get verifyYourIdentity => 'დაამოწმეთ თქვენი ვინაობა';

  @override
  String get continueText => 'გაგრძელება';

  @override
  String get resendCode => 'კოდის ხელახლა გაგზავნა';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time წამში',
      one: '1 წამში',
    );
    return 'კოდის ხელახლა გაგზავნა $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'გთხოვთ, შეიყვანოთ უსაფრთხოების კოდი თქვენი ავთენტიფიკატორის აპლიკაციიდან.';

  @override
  String smsAuthDescription(Object contact) {
    return 'უსაფრთხოების კოდი გაიგზავნა თქვენი ტელეფონის ნომერზე $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'უსაფრთხოების კოდი გაიგზავნა თქვენი ელფოსტის მისამართზე $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'გთხოვთ, შეიყვანოთ თქვენი სარეზერვო კოდებიდან ერთ-ერთი.';

  @override
  String get toptAuthPlaceholder => 'კოდი';

  @override
  String get smsAuthPlaceholder => 'SMS კოდი';

  @override
  String get emailAuthPlaceholder => 'ელფოსტის კოდი';

  @override
  String get backupCodeAuthPlaceholder => 'სარეზერვო კოდი';

  @override
  String get verificationCodeIncorrect => 'დამოწმების კოდი არასწორია';

  @override
  String get verificationCodeManyRequest =>
      'დამოწმების კოდის შემოწმების ზედმეტად ბევრი მოთხოვნა';

  @override
  String get tryAnotherWay => 'სხვა გზის არჩევა';

  @override
  String get selectWayToVerify => 'აირჩიეთ დამოწმების გზა';

  @override
  String get mfaProviderTopt => 'ავთენტიფიკატორის აპლიკაცია';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'ელფოსტა';

  @override
  String get mfaProviderBackupCode => 'სარეზერვო კოდი';

  @override
  String get newUserText => 'ახალი მომხმარებელი?';

  @override
  String get createAccount => 'ანგარიშის შექმნა';

  @override
  String get emailVerification => 'ელფოსტის დამოწმება';

  @override
  String get emailVerificationSentText =>
      'მითითებულ ელფოსტის მისამართზე გაიგზავნა წერილი დამოწმების ინსტრუქციებით ';

  @override
  String get emailVerificationInstructionsText =>
      'გთხოვთ, რეგისტრაციის დასასრულებლად მიჰყვეთ წერილში მოცემულ ინსტრუქციებს. შენიშვნა: თუ წერილი დიდი ხნის განმავლობაში არ მიგიღიათ, გთხოვთ, შეამოწმოთ საქაღალდე \'სპამი\' ან სცადოთ წერილის ხელახლა გაგზავნა ღილაკზე \'ხელახლა გაგზავნა\' დაჭერით.';

  @override
  String get resend => 'ხელახლა გაგზავნა';

  @override
  String get activatingAccount => 'ანგარიშის გააქტიურება...';

  @override
  String get accountActivated => 'ანგარიში წარმატებით გააქტიურდა!';

  @override
  String get emailVerified => 'ელფოსტა დამოწმებულია';

  @override
  String get activatingAccountText =>
      'თქვენი ანგარიში ახლა აქტიურდება.\nგთხოვთ, დაელოდოთ...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'გილოცავთ!\nთქვენი $appTitle ანგარიში გააქტიურებულია.\nახლა შეგიძლიათ შეხვიდეთ თქვენს $appTitle სივრცეში.';
  }

  @override
  String get privacyPolicy => 'კონფიდენციალურობის პოლიტიკა';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get accept => 'მიღება';

  @override
  String get termsOfUse => 'გამოყენების პირობები';

  @override
  String get firstName => 'სახელი';

  @override
  String get firstNameRequireText => 'სახელი სავალდებულოა.';

  @override
  String get lastName => 'გვარი';

  @override
  String get lastNameRequireText => 'გვარი სავალდებულოა.';

  @override
  String get createPassword => 'პაროლის შექმნა';

  @override
  String get repeatPassword => 'გაიმეორეთ პაროლი';

  @override
  String get imNotARobot => 'მე არ ვარ რობოტი';

  @override
  String get signUp => 'რეგისტრაცია';

  @override
  String get alreadyHaveAnAccount => 'უკვე გაქვთ ანგარიში?';

  @override
  String get signIn => 'შესვლა';

  @override
  String get inactiveUserAlreadyExists =>
      'არააქტიური მომხმარებელი უკვე არსებობს';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'უკვე არსებობს რეგისტრირებული მომხმარებელი, რომლის ელფოსტის მისამართი დამოწმებული არ არის.\nთუ გსურთ დამოწმების წერილის ხელახლა გაგზავნა, დააჭირეთ ღილაკს \'ხელახლა გაგზავნა\'.';

  @override
  String get assignee => 'შემსრულებელი';

  @override
  String get alarmTypes => 'განგაშის ტიპები';

  @override
  String get details => 'დეტალები';

  @override
  String get status => 'სტატუსი';

  @override
  String get severity => 'სიმძიმე';

  @override
  String get originator => 'ინიციატორი';

  @override
  String get startTime => 'დაწყების დრო';

  @override
  String get duration => 'ხანგრძლივობა';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value დღე',
      one: '$value დღე',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value საათი',
      one: '$value საათი',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value წუთი',
      one: '$value წუთი',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value წამი',
      one: '$value წამი',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'სამუშაო დაფის ნახვა';

  @override
  String get activity => 'აქტივობა';

  @override
  String get addCommentMessage => 'დაამატეთ კომენტარი...';

  @override
  String get selectUser => 'მომხმარებლების არჩევა';

  @override
  String get assignedToMe => 'ჩემზე მინიჭებული';

  @override
  String get clear => 'გადაწყვეტა';

  @override
  String get acknowledge => 'დადასტურება';

  @override
  String get edit => 'რედაქტირება';

  @override
  String get editProfile => 'პროფილის რედაქტირება';

  @override
  String get delete => 'წაშლა';

  @override
  String get edited => 'რედაქტირებული';

  @override
  String get deleteComment => 'კომენტარის წაშლა';

  @override
  String get areYouSure => 'დარწმუნებული ხართ?';

  @override
  String get noResultsFound => 'შედეგები ვერ მოიძებნა';

  @override
  String get tryRefiningYourQuery => 'გთხოვთ, დააზუსტოთ მოთხოვნა';

  @override
  String get failedToLoadTheList => 'სიის ჩატვირთვა ვერ მოხერხდა';

  @override
  String get tryRefreshing => 'გთხოვთ, სცადოთ განახლება';

  @override
  String get refresh => 'განახლება';

  @override
  String get users => 'მომხმარებლები';

  @override
  String get unassigned => 'მინიჭების გარეშე';

  @override
  String get failedToLoadAlarmDetails =>
      'განგაშის დეტალების ჩატვირთვა ვერ მოხერხდა';

  @override
  String get somethingWentWrong => 'რაღაც შეცდომა მოხდა';

  @override
  String get chooseRegion => 'აირჩიეთ რეგიონი';

  @override
  String get selectRegion => 'აირჩიეთ რეგიონი';

  @override
  String get northAmerica => 'ჩრდილოეთ ამერიკა';

  @override
  String get europe => 'ევროპა';

  @override
  String get northAmericaRegionShort => 'ჩრდ. ვირჯინია';

  @override
  String get europeRegionShort => 'ფრანკფურტი';

  @override
  String get deviceList => 'მოწყობილობების სია';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'სამუშაო დაფები',
      one: 'სამუშაო დაფა',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'საჭიროა განახლება';

  @override
  String updateTo(Object version) {
    return '$version-მდე განახლება';
  }

  @override
  String get next => 'შემდეგი';

  @override
  String get confirmation => 'დადასტურება';

  @override
  String get wifiPassword => 'Wi-Fi პაროლი';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'თქვენი მოწყობილობის $deviceName დაყენების გასაგრძელებლად, გთხოვთ, მიუთითოთ თქვენი ქსელის ავტორიზაციის მონაცემები.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'შეიყვანეთ პაროლი ქსელისთვის $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'მოწყობილობები ვერ მოიძებნა. გთხოვთ, დარწმუნდეთ, რომ თქვენი ტელეფონის Bluetooth ჩართულია და ახალი მოწყობილობის რადიუსშია.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'გასაგრძელებლად არ გაქვთ საკმარისი ნებართვები \"$permissions\"-ისთვის. გთხოვთ, მიანიჭოთ საჭირო ნებართვები და დააჭიროთ ღილაკს \"ხელახლა ცდა\".';
  }

  @override
  String get sendingWifiCredentials =>
      'Wi-Fi-ის ავტორიზაციის მონაცემების გაგზავნა';

  @override
  String get confirmingWifiConnection => 'Wi-Fi კავშირის დადასტურება';

  @override
  String get provisionedSuccessfully => 'მოწყობილობა წარმატებით პროვიზიონირდა';

  @override
  String get returnToDashboard => 'სამუშაო დაფაზე დაბრუნება';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'ვერ ხერხდება სესიის დამყარება მოწყობილობასთან $deviceName. გთხოვთ, სცადოთ თავიდან';
  }

  @override
  String get claimingDevice => 'მოწყობილობის მიბმა';

  @override
  String get claimingDeviceDone => 'მოწყობილობის მიბმა დასრულდა';

  @override
  String get claimingMessageSuccess => 'მოწყობილობა წარმატებით\nმიება';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'გასაგრძელებლად არ გაქვთ საკმარისი ნებართვები \"$permissions\"-ისთვის. გთხოვთ, გახსნათ აპლიკაციის პარამეტრები, მიანიჭოთ ნებართვები და დააჭიროთ ღილაკს \"ხელახლა ცდა\".';
  }

  @override
  String get scanACode => 'კოდის სკანირება';

  @override
  String get allowAccess => 'წვდომის დაშვება';

  @override
  String get toggleCamera => 'კამერის გადართვა';

  @override
  String get toggleFlash => 'ფლეშის გადართვა';

  @override
  String get unableToUseCamera => 'კამერის გამოყენება შეუძლებელია';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'გასაგრძელებლად გახსენით პარამეტრები და დაუშვით წვდომა კამერაზე';

  @override
  String get notFound => 'ვერ მოიძებნა';

  @override
  String routeNotDefined(Object name) {
    return 'მარშრუტი არ არის განსაზღვრული: $name';
  }

  @override
  String get loginWith => 'შესვლა შემდეგით';

  @override
  String get scanQrCode => 'QR კოდის სკანირება';

  @override
  String get anEmptyRequestDataReceived =>
      'მიღებულია ცარიელი მოთხოვნის მონაცემები.';

  @override
  String get somethingWentWrongRollback => 'რაღაც შეცდომა მოხდა ... დაბრუნება';

  @override
  String get searchResults => 'ძებნის შედეგები';

  @override
  String get viewAll => 'ყველას ნახვა';

  @override
  String get requestedEntityDoesNotExists => 'მოთხოვნილი ობიექტი არ არსებობს.';

  @override
  String get noAlarmsFound => 'განგაშები ვერ მოიძებნა';

  @override
  String get filters => 'ფილტრები';

  @override
  String get alarmStatusList => 'განგაშის სტატუსების სია';

  @override
  String get alarmSeverityList => 'განგაშის სიმძიმეების სია';

  @override
  String get cleared => 'გადაწყვეტილი';

  @override
  String get acknowledged => 'დადასტურებული';

  @override
  String get unacknowledged => 'დაუდასტურებელი';

  @override
  String get critical => 'კრიტიკული';

  @override
  String get major => 'მძიმე';

  @override
  String get minor => 'მსუბუქი';

  @override
  String get warning => 'გაფრთხილება';

  @override
  String get indeterminate => 'განუსაზღვრელი';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'მომხმარებლების ძებნა',
      one: 'მომხმარებლის ძებნა',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'ჩამოყრა';

  @override
  String get update => 'განახლება';

  @override
  String get alarmTypeList => 'განგაშის ტიპების სია';

  @override
  String get anyType => 'ნებისმიერი ტიპი';

  @override
  String get plusAlarmType => '+ განგაშის ტიპი';

  @override
  String get all => 'ყველა';

  @override
  String get allNotifications => 'ყველა';

  @override
  String get unread => 'წაუკითხავი';

  @override
  String get close => 'დახურვა';

  @override
  String get codeVerificationFailed => 'კოდის დამოწმება ვერ მოხერხდა!';

  @override
  String get fatalError => 'ფატალური შეცდომა';

  @override
  String get unknownError => 'უცნობი შეცდომა.';

  @override
  String get sessionExpired => 'სესიის ვადა ამოიწურა';

  @override
  String get fatalApplicationErrorOccurred => 'აპლიკაციის ფატალური შეცდომა:';

  @override
  String get connectionError => 'კავშირის შეცდომა';

  @override
  String get failedToConnectToServer => 'სერვერთან დაკავშირება ვერ მოხერხდა';

  @override
  String get retry => 'ხელახლა ცდა';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'მობილური სამუშაო დაფა უნდა იყოს კონფიგურირებული მოწყობილობის პროფილში!';

  @override
  String get openWifiSettings => 'Wi-Fi-ის პარამეტრების გახსნა';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'დაუკავშირდით Wi-Fi-ს, რომელსაც ჩვეულებრივ იყენებთ';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'დაბრუნდით აპლიკაციაში და დააჭირეთ ღილაკს „მზადაა“';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'გთხოვთ, მიჰყვეთ შემდეგ ნაბიჯებს თქვენი ტელეფონის\nთქვენს ჩვეულებრივ Wi-Fi-თან ხელახლა დასაკავშირებლად';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-შეტყობინებები არ არის კონფიგურირებული.\nგთხოვთ, დაუკავშირდეთ სისტემის ადმინისტრატორს.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase არ არის კონფიგურირებული.\n გთხოვთ, იხილოთ Firebase-ის ოფიციალური დოკუმენტაცია\n კონფიგურაციის ინსტრუქციისთვის.';

  @override
  String get markAllAsRead => 'ყველას წაკითხულად მონიშვნა';

  @override
  String get profile => 'პროფილი';

  @override
  String cantLaunchUrlLink(String link) {
    return 'ბმულის გახსნა ვერ ხერხდება: $link';
  }

  @override
  String get noDashboardsFound => 'სამუშაო დაფები ვერ მოიძებნა';

  @override
  String get openAppSettings => 'აპლიკაციის პარამეტრების გახსნა';

  @override
  String get connectingToDevice => 'მოწყობილობასთან დაკავშირება';

  @override
  String get connectToDevice => 'მოწყობილობასთან დაკავშირება';

  @override
  String get selectWifiNetwork => 'Wi-Fi ქსელის არჩევა';

  @override
  String get deviceProvisioning => 'მოწყობილობის პროვიზიონირება';

  @override
  String get permissions => 'ნებართვები';

  @override
  String get unableConnectToDevice =>
      'მოწყობილობასთან დაკავშირება ვერ ხერხდება';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'მოწყობილობამ ახლომდებარე Wi-Fi ვერ იპოვა';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '$name Wi-Fi ქსელთან დაკავშირება ვერ მოხერხდა.\nგთხოვთ, დარწმუნდეთ, რომ თქვენი ტელეფონი დაკავშირებულია მოწყობილობის Wi-Fi ქსელთან და რომ ამ აპლიკაციისთვის ჩართულია ლოკალური ქსელის წვდომა თქვენი ტელეფონის პარამეტრებში.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Wi-Fi-თან დაკავშირება ვერ ხერხდება, რადგან ქსელები ვერ მოიძებნა მოწყობილობის $name მიერ';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'გთხოვთ, მიჰყვეთ შემდეგ ნაბიჯებს თქვენი ტელეფონის მოწყობილობასთან დასაკავშირებლად';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'დაუკავშირდით $wifiName-ის მსგავს Wi-Fi ქსელს';
  }

  @override
  String get ready => 'მზადაა';

  @override
  String get exitDeviceProvisioning => 'მოწყობილობის პროვიზიონირებიდან გასვლა';

  @override
  String get noNotificationsFound => 'შეტყობინებები ვერ მოიძებნა';

  @override
  String get markAsRead => 'წაკითხულად მონიშვნა';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'გთხოვთ, დაასკანიროთ QR კოდი თქვენს მოწყობილობაზე';

  @override
  String get search => 'ძებნა';

  @override
  String get tenant => 'ტენანტი';

  @override
  String get tenantProfile => 'ტენანტის პროფილი';

  @override
  String get user => 'მომხმარებელი';

  @override
  String get asset => 'აქტივი';

  @override
  String get deviceProfile => 'მოწყობილობის პროფილი';

  @override
  String get assetProfile => 'აქტივის პროფილი';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'განგაშები',
      one: 'განგაში',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'წესების ჯაჭვი';

  @override
  String get ruleNode => 'წესის კვანძი';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'ობიექტის ხედი';

  @override
  String get widgetsBundle => 'ვიჯეტების ნაკრები';

  @override
  String get widgetType => 'ვიჯეტის ტიპი';

  @override
  String get apiUsageState => 'API-ის გამოყენების მდგომარეობა';

  @override
  String get tbResource => 'რესურსი';

  @override
  String get otaPackage => 'OTA პაკეტი';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'რიგი';

  @override
  String get notificationTarget => 'შეტყობინების მიმღები';

  @override
  String get notificationTemplate => 'შეტყობინების შაბლონი';

  @override
  String get notificationRequest => 'შეტყობინების მოთხოვნა';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'შეტყობინებები',
      one: 'შეტყობინება',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'შეტყობინების წესი';

  @override
  String get entityGroup => 'ობიექტების ჯგუფი';

  @override
  String get converter => 'კონვერტორი';

  @override
  String get integration => 'ინტეგრაცია';

  @override
  String get schedulerEvent => 'დამგეგმავის მოვლენა';

  @override
  String get blobEntity => 'Blob ობიექტი';

  @override
  String get role => 'როლი';

  @override
  String get groupPermission => 'ჯგუფის ნებართვა';

  @override
  String get actionStatusSuccess => 'წარმატებული';

  @override
  String get actionStatusFailure => 'წარუმატებელი';

  @override
  String get actionTypeAdded => 'დამატებული';

  @override
  String get actionTypeDeleted => 'წაშლილი';

  @override
  String get actionTypeUpdated => 'განახლებული';

  @override
  String get actionTypeAttributesUpdated => 'ატრიბუტები განახლებულია';

  @override
  String get actionTypeAttributesDeleted => 'ატრიბუტები წაშლილია';

  @override
  String get actionTypeRpcCall => 'RPC გამოძახება';

  @override
  String get actionTypeCredentialsUpdated =>
      'ავტორიზაციის მონაცემები განახლებულია';

  @override
  String get actionTypeAssignedToCustomer => 'კლიენტზე მინიჭებული';

  @override
  String get actionTypeUnassignedFromCustomer => 'კლიენტისგან მოხსნილი';

  @override
  String get actionTypeActivated => 'გააქტიურებული';

  @override
  String get actionTypeSuspended => 'შეჩერებული';

  @override
  String get actionTypeCredentialsRead => 'ავტორიზაციის მონაცემები წაკითხულია';

  @override
  String get actionTypeAttributesRead => 'ატრიბუტები წაკითხულია';

  @override
  String get actionTypeRelationAddOrUpdate => 'ურთიერთობა განახლებულია';

  @override
  String get actionTypeRelationDeleted => 'ურთიერთობა წაშლილია';

  @override
  String get actionTypeRelationsDeleted => 'ყველა ურთიერთობა წაშლილია';

  @override
  String get actionTypeAlarmAck => 'დადასტურებული';

  @override
  String get actionTypeAlarmClear => 'გადაწყვეტილი';

  @override
  String get actionTypeAlarmDelete => 'განგაში წაიშალა';

  @override
  String get actionTypeAlarmAssigned => 'განგაში მიენიჭა';

  @override
  String get actionTypeAlarmUnassigned => 'განგაშის მინიჭება მოიხსნა';

  @override
  String get actionTypeLogin => 'შესვლა';

  @override
  String get actionTypeLogout => 'გამოსვლა';

  @override
  String get actionTypeLockout => 'ჩაკეტვა';

  @override
  String get actionTypeAssignedFromTenant => 'მინიჭებულია ტენანტისგან';

  @override
  String get actionTypeAssignedToTenant => 'მინიჭებულია ტენანტზე';

  @override
  String get actionTypeProvisionSuccess =>
      'მოწყობილობის პროვიზიონირება შესრულდა';

  @override
  String get actionTypeProvisionFailure =>
      'მოწყობილობის პროვიზიონირება ვერ მოხერხდა';

  @override
  String get actionTypeTimeseriesUpdated => 'ტელემეტრია განახლდა';

  @override
  String get actionTypeTimeseriesDeleted => 'ტელემეტრია წაიშალა';

  @override
  String get actionTypeAssignedToEdge => 'Edge-ზე მინიჭებული';

  @override
  String get actionTypeUnassignedFromEdge => 'Edge-ისგან მოხსნილი';

  @override
  String get actionTypeAddedComment => 'კომენტარი დაემატა';

  @override
  String get actionTypeUpdatedComment => 'კომენტარი განახლდა';

  @override
  String get actionTypeDeletedComment => 'კომენტარი წაიშალა';

  @override
  String get actionTypeSmsSent => 'SMS გაგზავნილია';

  @override
  String get actionTypeAddedToEntityGroup => 'ობიექტების ჯგუფში დამატებული';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'ობიექტების ჯგუფიდან ამოღებული';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'წესების ძრავის REST API გამოძახება';

  @override
  String get actionTypeMadePublic => 'საჯაროდ გადაიქცა';

  @override
  String get actionTypeMadePrivate => 'პრივატულად გადაიქცა';

  @override
  String get actionTypeChangeOwner => 'მფლობელი შეცვლილია';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'თქვენ არ გაქვთ ამ ოპერაციის შესრულების უფლება!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'როგორც ჩანს, თქვენი უფლებები საკმარისი არ არის ამ ოპერაციის დასასრულებლად';

  @override
  String get isRequiredText => 'სავალდებულოა.';

  @override
  String get no2faProvidersFound => '2FA პროვაიდერები ვერ მოიძებნა';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'გთხოვთ, დაუკავშირდეთ თქვენი სისტემის ადმინისტრატორს';

  @override
  String errorOccured(Object e) {
    return 'დაფიქსირდა შეცდომა: $e';
  }

  @override
  String get unsavedChanges => 'შეუნახავი ცვლილებები';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'თქვენ გაქვთ შეუნახავი ცვლილებები. დარწმუნებული ხართ, რომ გსურთ ამ გვერდის დატოვება?';

  @override
  String get deleteAccount => 'ანგარიშის წაშლა';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'დარწმუნებული ხართ? თქვენ აპირებთ თქვენი ანგარიშის ($authority) წაშლას.';
  }

  @override
  String get language => 'ენა';

  @override
  String get metricUnitSystem => 'მეტრული';

  @override
  String get imperialUnitSystem => 'იმპერიული';

  @override
  String get hybridUnitSystem => 'ჰიბრიდული';

  @override
  String get autoUnitSystem => 'ავტომატური';

  @override
  String get languageAuto => 'ავტომატური';

  @override
  String get unitSystem => 'ერთეულების სისტემა';

  @override
  String get selectCountry => 'აირჩიეთ ქვეყანა';

  @override
  String get hideHomeDashboardToolbar =>
      'მთავარი სამუშაო დაფის ხელსაწყოთა ზოლის დამალვა';

  @override
  String get phoneNumberHelperText =>
      'ტელეფონის ნომერი E.164 ფორმატში, მაგ. +1201550123';

  @override
  String get homeDashboard => 'მთავარი სამუშაო დაფა';

  @override
  String get security => 'უსაფრთხოება';

  @override
  String get twofactorAuthentication => 'ორფაქტორიანი ავთენტიფიკაცია';

  @override
  String get verificationRequired => 'საჭიროა დამოწმება';

  @override
  String get twofactorAuthenticationIsRequired =>
      'ორფაქტორიანი ავთენტიფიკაცია სავალდებულოა';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'ავტორიზაციის გასაგრძელებლად დააყენეთ დამოწმების მეთოდი';

  @override
  String get setUpAVerificationMethod => 'დამოწმების მეთოდის დაყენება';

  @override
  String get totpSetupSuccessDescription =>
      'შემდეგ ჯერზე, როცა სისტემაში შეხვალთ, დაგჭირდებათ ორფაქტორიანი ავთენტიფიკაციის კოდის მითითება';

  @override
  String get smsSetupSuccessDescription =>
      'შემდეგ ჯერზე, როცა სისტემაში შეხვალთ, მოგეთხოვებათ უსაფრთხოების კოდის შეყვანა, რომელიც გაიგზავნება ტელეფონის ნომერზე';

  @override
  String get emailSetupSuccessDescription =>
      'შემდეგ ჯერზე, როცა სისტემაში შეხვალთ, მოგეთხოვებათ უსაფრთხოების კოდის შეყვანა, რომელიც გაიგზავნება თქვენს ელფოსტის მისამართზე';

  @override
  String get backupCodeSetupSuccessDescription =>
      'შემდეგი ავტორიზაციისას ორფაქტორიანი ავთენტიფიკაციის გასავლელად შეძლებთ სარეზერვო კოდების გამოყენებას';

  @override
  String get loginToApp => 'აპლიკაციაში შესვლა';

  @override
  String get goBack => 'უკან დაბრუნება';

  @override
  String get done => 'მზადაა';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'ეს თქვენს ანგარიშს ნაკლებად დაცულს გახდის';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'დარწმუნებული ხართ, რომ გსურთ \'$providerName\'-ის გამორთვა?';
  }

  @override
  String get yesDeactivate => 'დიახ, გამორთვა';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'შეიყვანეთ ელფოსტა, რომელსაც ავთენტიფიკატორად გამოიყენებთ.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'შეიყვანეთ ტელეფონის ნომერი, რომელსაც გამოიყენებთ ავთენტიფიკატორად';

  @override
  String get sendCode => 'კოდის გაგზავნა';

  @override
  String errorSendingCode(String error) {
    return 'კოდის გაგზავნის შეცდომა: $error';
  }

  @override
  String get copy => 'კოპირება';

  @override
  String get copiedToClipboard => 'დაკოპირდა გაცვლის ბუფერში';

  @override
  String get enter6digitsKeyFromYourAppHere => 'აქ შეიყვანეთ 6-ნიშნა კოდი';

  @override
  String digitsCode(int count) {
    return '$count-ნიშნა კოდი';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'დააკოპირეთ 32-სიმბოლოიანი გასაღები ავთენტიფიკატორის აპლიკაციაში ან დაასკანირეთ ქვემოთ მოცემული QR კოდი';

  @override
  String get applyChanges => 'ცვლილებების გამოყენება';

  @override
  String get discardChanges => 'ცვლილებების გაუქმება';

  @override
  String get yesDiscard => 'დიახ, უგულებელყოფა';

  @override
  String get thisActionCannotBeUndone => 'ამ ქმედების დაბრუნება შეუძლებელია';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'ორფაქტორიანი ავთენტიფიკაცია იცავს თქვენს ანგარიშს არასანქცირებული წვდომისგან. საკმარისია, სისტემაში შესვლისას შეიყვანოთ უსაფრთხოების კოდი.';

  @override
  String get calculatedField => 'გამოთვლილი ველი';

  @override
  String get apiKey => 'API-ის გასაღები';

  @override
  String get aiModel => 'AI მოდელი';

  @override
  String get adminSettings => 'ადმინისტრატორის პარამეტრები';

  @override
  String get job => 'დავალება';

  @override
  String get mobileAppBundle => 'მობილური ნაკრები';

  @override
  String get mobileApp => 'მობილური აპლიკაცია';

  @override
  String get domain => 'დომენი';

  @override
  String get oauth2Client => 'OAuth 2.0 კლიენტი';

  @override
  String get queueStats => 'რიგის სტატისტიკა';

  @override
  String get phoneIsRequired => 'ტელეფონი სავალდებულოა.';

  @override
  String get phoneIsInvalid => 'ტელეფონი არასწორია.';

  @override
  String get addVerificationMethod => 'დამოწმების მეთოდის დამატება';

  @override
  String get imageSavedToGallery =>
      'შენახულია პლატფორმის \'სურათების გალერეაში\'';

  @override
  String get failedToSaveImage => 'სურათის შენახვა ვერ მოხერხდა';

  @override
  String nSelected(int count) {
    return 'არჩეულია $count';
  }

  @override
  String get selectAll => 'ყველა ჩატვირთულის არჩევა';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ოპერაცია ვერ შესრულდა',
      one: '1 ოპერაცია ვერ შესრულდა',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'წაიშალოს $count შეტყობინება?',
      one: 'წაიშალოს 1 შეტყობინება?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'მოინიშნოს $count შეტყობინება წაკითხულად?',
      one: 'მოინიშნოს 1 შეტყობინება წაკითხულად?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'მონაცემების მიღება თქვენი ჰოსტიდან $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'ხდება თქვენი ავტორიზაცია ჰოსტზე $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'ხდება თქვენი გადართვა ახალ ჰოსტზე $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '$host-დან ავტორიზაციის ტოკენის მიღება ვერ მოხერხდა. გთხოვთ, დაასკანიროთ ახალი QR კოდი.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '$host-თან დაკავშირება ვერ მოხერხდა';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host არ არის ThingsBoard სერვერი';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR კოდის სესია აღარ არის მოქმედი. გთხოვთ, განაახლოთ QR კოდი და დაასკანიროთ ხელახლა.';

  @override
  String get openThisLinkTitle => 'გაიხსნას ეს ბმული?';

  @override
  String get linkOpensSignInPage =>
      'ეს ბმული ხსნის ამ სერვერზე ავტორიზაციის გვერდს. თქვენ გამოხვალთ მიმდინარე სერვერიდან.';

  @override
  String get linkOpensSignInPageOnly =>
      'ეს ბმული ხსნის ამ სერვერზე ავტორიზაციის გვერდს.';

  @override
  String linkSignsInAs(Object email) {
    return 'ამ ბმულით შეხვალთ ამ სერვერზე, როგორც $email.';
  }

  @override
  String get linkSignsIn => 'ამ ბმულით შეხვალთ ამ სერვერზე.';

  @override
  String get serverConnectionNotSecure =>
      'ეს სერვერი არ იყენებს უსაფრთხო კავშირს.';

  @override
  String get linkToOtherServerNotAllowed =>
      'ეს აპლიკაცია მუშაობს მხოლოდ საკუთარ სერვერთან და ვერ გახსნის ამ ბმულს.';

  @override
  String get liveTrackingActive => 'მდებარეობის რეალურ დროში თვალყურის დევნება';

  @override
  String get liveTrackingPaused => 'რეალურ დროში თვალყურის დევნება შეჩერებულია';

  @override
  String get liveTrackingFixes => 'მდებარეობები';

  @override
  String get liveTrackingSaved => 'შენახული';

  @override
  String get liveTrackingErrors => 'შეცდომები';

  @override
  String get liveTrackingStop => 'გაჩერება';

  @override
  String get liveTrackingPause => 'შეჩერება';

  @override
  String get liveTrackingResume => 'გაგრძელება';

  @override
  String get liveTrackingHide => 'დამალვა';

  @override
  String get liveTrackingSessionTitle =>
      'მდებარეობის რეალურ დროში თვალყურის დევნება';

  @override
  String get liveTrackingTarget => 'მდებარეობის ობიექტში შენახვა';

  @override
  String get liveTrackingDashboard => 'სამუშაო დაფა';

  @override
  String get liveTrackingStatus => 'სტატუსი';

  @override
  String get liveTrackingStarted => 'დაწყების დრო';

  @override
  String get liveTrackingLastFix => 'ბოლო მდებარეობა';

  @override
  String get liveTrackingLastError => 'ბოლო შეცდომა';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'ამ ობიექტში შენახვა შეუძლებელია — ის აღარ არსებობს. თვალყურის დევნება გრძელდება; განაახლეთ სამიზნე სამუშაო დაფის ქმედებაში.';

  @override
  String get liveTrackingErrorNoConnection =>
      'სერვერთან კავშირი არ არის. ეს მდებარეობები არ შენახულა — შენახვა განახლდება, როცა ქსელი დაბრუნდება.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'თქვენი სესია დასრულდა. მდებარეობის შენახვის გასაგრძელებლად ხელახლა შედით სისტემაში.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'ამ ობიექტში შენახვა შეუძლებელია — არ გაქვთ ნებართვა. თვალყურის დევნება გრძელდება; სთხოვეთ ადმინისტრატორს წვდომის მინიჭება.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'ამ მდებარეობის სერვერზე შენახვა ვერ მოხერხდა. შენახვა განმეორდება შემდეგი მდებარეობისას.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'ამ მოწყობილობაზე მდებარეობის სერვისები გამორთულია.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'მდებარეობაზე წვდომა უარყოფილია.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'მდებარეობაზე წვდომა სამუდამოდ უარყოფილია. ჩართეთ იგი აპლიკაციის პარამეტრებში.';

  @override
  String get liveTrackingErrorLocation =>
      'მდებარეობის განსაზღვრა ვერ მოხერხდა.';

  @override
  String get liveTrackingMenuTitle =>
      'მდებარეობის რეალურ დროში თვალყურის დევნება';

  @override
  String get liveTrackingNoRecord =>
      'აქტიური თვალყურის დევნება და ბოლოდროინდელი სესია არ არის.';

  @override
  String get liveTrackingLastSession => 'ბოლო სესია';

  @override
  String get liveTrackingStartAgain => 'ხელახლა დაწყება';

  @override
  String get liveTrackingEnded => 'დასრულების დრო';

  @override
  String get liveTrackingEndReason => 'დასრულების მიზეზი';

  @override
  String get liveTrackingEndReasonManual => 'ხელით გაჩერებული';

  @override
  String get liveTrackingEndReasonMaxDuration => 'მიღწეულია მაქს. ხანგრძლივობა';

  @override
  String get liveTrackingEndReasonInterrupted => 'შეწყვეტილი';

  @override
  String get serverUpdateRequired => 'საჭიროა სერვერის განახლება';

  @override
  String get backToLogin => 'შესვლაზე დაბრუნება';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'ეს აპლიკაცია მუშაობს ThingsBoard $minVersion-თან ან უფრო ახალთან.';
  }

  @override
  String get serverLabel => 'სერვერი';

  @override
  String get versionLabel => 'ვერსია';

  @override
  String get askAdminToUpdateServer =>
      'მიმართეთ სერვერის ადმინისტრატორს სერვერის განახლებისთვის.';

  @override
  String get deviceClaimFailed =>
      'მოწყობილობის მიბმა ვერ მოხერხდა. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get deviceToClaimNotFound =>
      'მოწყობილობა ვერ მოიძებნა. გთხოვთ, დაუკავშირდეთ მოწყობილობის მომწოდებელს.';

  @override
  String get enableAuthenticatorApp => 'ავთენტიფიკატორის აპლიკაციის ჩართვა';

  @override
  String get enableSmsAuthenticator => 'SMS ავთენტიფიკატორის ჩართვა';

  @override
  String get enableEmailAuthenticator => 'ელფოსტის ავთენტიფიკატორის ჩართვა';

  @override
  String get getBackupCode => 'სარეზერვო კოდის მიღება';

  @override
  String get twoFaTotpDescription =>
      'ავთენტიფიკაციისთვის გამოიყენეთ ტელეფონში ისეთი აპლიკაციები, როგორიცაა Google Authenticator, Authy ან Duo. ის შექმნის უსაფრთხოების კოდს სისტემაში შესასვლელად.';

  @override
  String get twoFaSmsDescription =>
      'ავთენტიფიკაციისთვის გამოიყენეთ თქვენი ტელეფონი. სისტემაში შესვლისას უსაფრთხოების კოდს SMS შეტყობინებით გამოგიგზავნით.';

  @override
  String get twoFaEmailDescription =>
      'ავთენტიფიკაციისთვის გამოიყენეთ თქვენი ელფოსტის მისამართზე გამოგზავნილი უსაფრთხოების კოდი.';

  @override
  String get twoFaBackupCodeDescription =>
      'ეს დასაბეჭდი ერთჯერადი კოდები საშუალებას გაძლევთ, შეხვიდეთ სისტემაში, როცა ტელეფონი ხელთ არ გაქვთ, მაგალითად, მოგზაურობისას.';

  @override
  String get openInAuthenticatorApp => 'ავთენტიფიკატორის აპლიკაციაში გახსნა';

  @override
  String get noAuthenticatorAppFound =>
      'ავთენტიფიკატორის აპლიკაცია ვერ მოიძებნა. გასაღები დააკოპირეთ თქვენს აპლიკაციაში.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider ჩართულია';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'თქვენი ადმინისტრატორი მოითხოვს ორფაქტორიან ავთენტიფიკაციას $email-ისთვის.';
  }

  @override
  String get recommended => 'რეკომენდებული';

  @override
  String get addBackupCodesHint =>
      'დაამატეთ სარეზერვო კოდებიც, რომ შეძლოთ შესვლა ტელეფონის დაკარგვის შემთხვევაში.';

  @override
  String get totpSecretKey => 'საიდუმლო გასაღები';

  @override
  String get backupCodesDescription =>
      'ამობეჭდეთ კოდები, რომ ხელთ გქონდეთ, როცა ანგარიშში შესასვლელად დაგჭირდებათ. თითოეული სარეზერვო კოდის გამოყენება მხოლოდ ერთხელ შეგიძლიათ.';

  @override
  String get backupCodesWarning =>
      'ამ გვერდის დატოვების შემდეგ ეს კოდები ხელახლა ვეღარ გამოჩნდება. შეინახეთ ისინი უსაფრთხოდ ქვემოთ მოცემული ვარიანტებით.';

  @override
  String get downloadTxt => 'ჩამოტვირთვა (txt)';
}

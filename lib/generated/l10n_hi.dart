// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class SHi extends S {
  SHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'होम';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'डिवाइस',
      one: 'डिवाइस',
    );
    return '$_temp0';
  }

  @override
  String get more => 'अधिक';

  @override
  String get customers => 'ग्राहक';

  @override
  String get assets => 'एसेट';

  @override
  String get tenants => 'टेनेंट';

  @override
  String get auditLogs => 'ऑडिट लॉग';

  @override
  String get noCustomersFound => 'कोई ग्राहक नहीं मिला';

  @override
  String get noAssetsFound => 'कोई एसेट नहीं मिला';

  @override
  String get noTenantsFound => 'कोई टेनेंट नहीं मिला';

  @override
  String get noDevicesFound => 'कोई डिवाइस नहीं मिला';

  @override
  String get noAuditLogsFound => 'कोई ऑडिट लॉग नहीं मिला';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get login => 'लॉगिन';

  @override
  String get loginToYourAccount => 'अपने खाते में लॉगिन करें';

  @override
  String get email => 'ईमेल';

  @override
  String get emailInvalidText => 'अमान्य ईमेल फ़ॉर्मेट।';

  @override
  String get username => 'उपयोगकर्ता नाम';

  @override
  String get password => 'पासवर्ड';

  @override
  String get passwordForgotText => 'पासवर्ड भूल गए?';

  @override
  String get passwordReset => 'पासवर्ड रीसेट करें';

  @override
  String get passwordResetText =>
      'अपने खाते से जुड़ा ईमेल दर्ज करें और हम पासवर्ड रीसेट लिंक के साथ एक ईमेल भेजेंगे';

  @override
  String get requestPasswordReset => 'पासवर्ड रीसेट का अनुरोध करें';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'ईमेल सत्यापन लिंक सफलतापूर्वक भेजा गया!';

  @override
  String get or => 'या';

  @override
  String get no => 'नहीं';

  @override
  String get yes => 'हाँ';

  @override
  String get title => 'शीर्षक';

  @override
  String get country => 'देश';

  @override
  String get city => 'शहर';

  @override
  String get stateOrProvince => 'राज्य / प्रांत';

  @override
  String get postalCode => 'ज़िप / डाक कोड';

  @override
  String get address => 'पता';

  @override
  String get address2 => 'पता 2';

  @override
  String get phone => 'फ़ोन';

  @override
  String get alarmClearTitle => 'अलार्म क्लियर करें';

  @override
  String get alarmClearText => 'क्या आप वाकई अलार्म क्लियर करना चाहते हैं?';

  @override
  String get alarmAcknowledgeTitle => 'अलार्म स्वीकार करें';

  @override
  String get alarmAcknowledgeText =>
      'क्या आप वाकई अलार्म स्वीकार करना चाहते हैं?';

  @override
  String get assetName => 'एसेट नाम';

  @override
  String get type => 'प्रकार';

  @override
  String get label => 'लेबल';

  @override
  String get auditLogDetails => 'ऑडिट लॉग विवरण';

  @override
  String get customerDetails => 'ग्राहक विवरण';

  @override
  String get assetDetails => 'एसेट विवरण';

  @override
  String get tenantDetails => 'टेनेंट विवरण';

  @override
  String get entityType => 'एंटिटी प्रकार';

  @override
  String get actionData => 'कार्रवाई डेटा';

  @override
  String get failureDetails => 'विफलता विवरण';

  @override
  String get allDevices => 'सभी डिवाइस';

  @override
  String get active => 'सक्रिय';

  @override
  String get inactive => 'निष्क्रिय';

  @override
  String get deviceActive => 'सक्रिय';

  @override
  String get deviceInactive => 'निष्क्रिय';

  @override
  String get activeDevices => 'सक्रिय';

  @override
  String get inactiveDevices => 'निष्क्रिय';

  @override
  String get alarmStatusActiveAcknowledged => 'सक्रिय, स्वीकार किया गया';

  @override
  String get alarmStatusActiveUnacknowledged => 'सक्रिय, स्वीकार नहीं किया गया';

  @override
  String get alarmStatusClearedAcknowledged =>
      'क्लियर किया गया, स्वीकार किया गया';

  @override
  String get alarmStatusClearedUnacknowledged =>
      'क्लियर किया गया, स्वीकार नहीं किया गया';

  @override
  String get alarmStatusFilterActive => 'सक्रिय';

  @override
  String get systemAdministrator => 'सिस्टम एडमिनिस्ट्रेटर';

  @override
  String get tenantAdministrator => 'टेनेंट एडमिनिस्ट्रेटर';

  @override
  String get customer => 'ग्राहक';

  @override
  String get changePassword => 'पासवर्ड बदलें';

  @override
  String get currentPasswordRequireText => 'वर्तमान पासवर्ड आवश्यक है।';

  @override
  String get currentPassword => 'वर्तमान पासवर्ड';

  @override
  String get newPasswordRequireText => 'नया पासवर्ड आवश्यक है।';

  @override
  String get newPassword => 'नया पासवर्ड';

  @override
  String get newPassword2RequireText => 'नए पासवर्ड की पुष्टि आवश्यक है।';

  @override
  String get newPassword2 => 'नए पासवर्ड की पुष्टि करें';

  @override
  String get passwordErrorNotification =>
      'दर्ज किए गए पासवर्ड समान होने चाहिए!';

  @override
  String get profileSuccessNotification => 'प्रोफ़ाइल सफलतापूर्वक अपडेट की गई';

  @override
  String get passwordSuccessNotification => 'पासवर्ड सफलतापूर्वक बदला गया';

  @override
  String get notImplemented => 'लागू नहीं किया गया!';

  @override
  String get listIsEmptyText => 'सूची फिलहाल खाली है।';

  @override
  String get tryAgain => 'पुनः प्रयास करें';

  @override
  String get verifyYourIdentity => 'अपनी पहचान सत्यापित करें';

  @override
  String get continueText => 'जारी रखें';

  @override
  String get resendCode => 'कोड फिर से भेजें';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time सेकंड',
      one: '$time सेकंड',
    );
    return '$_temp0 में कोड फिर से भेजें';
  }

  @override
  String get totpAuthDescription =>
      'कृपया अपने ऑथेंटिकेटर ऐप से सिक्योरिटी कोड दर्ज करें।';

  @override
  String smsAuthDescription(Object contact) {
    return 'आपके फ़ोन $contact पर सिक्योरिटी कोड भेजा गया है।';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'आपके ईमेल पते $contact पर सिक्योरिटी कोड भेजा गया है।';
  }

  @override
  String get backupCodeAuthDescription =>
      'कृपया अपने बैकअप कोडों में से एक दर्ज करें।';

  @override
  String get toptAuthPlaceholder => 'कोड';

  @override
  String get smsAuthPlaceholder => 'SMS कोड';

  @override
  String get emailAuthPlaceholder => 'ईमेल कोड';

  @override
  String get backupCodeAuthPlaceholder => 'बैकअप कोड';

  @override
  String get verificationCodeIncorrect => 'सत्यापन कोड गलत है';

  @override
  String get verificationCodeManyRequest =>
      'बहुत अधिक अनुरोध, सत्यापन कोड जाँचें';

  @override
  String get tryAnotherWay => 'कोई अन्य तरीका आज़माएँ';

  @override
  String get selectWayToVerify => 'सत्यापित करने का तरीका चुनें';

  @override
  String get mfaProviderTopt => 'ऑथेंटिकेटर ऐप';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'ईमेल';

  @override
  String get mfaProviderBackupCode => 'बैकअप कोड';

  @override
  String get newUserText => 'नए उपयोगकर्ता?';

  @override
  String get createAccount => 'खाता बनाएँ';

  @override
  String get emailVerification => 'ईमेल सत्यापन';

  @override
  String get emailVerificationSentText =>
      'सत्यापन विवरण वाला ईमेल निर्दिष्ट ईमेल पते पर भेज दिया गया है ';

  @override
  String get emailVerificationInstructionsText =>
      'अपनी साइन अप प्रक्रिया पूरी करने के लिए कृपया ईमेल में दिए गए निर्देशों का पालन करें। ध्यान दें: यदि आपको कुछ समय से ईमेल नहीं मिला है, तो कृपया अपना \'स्पैम\' फ़ोल्डर जाँचें या \'फिर से भेजें\' बटन पर क्लिक करके ईमेल दोबारा भेजने का प्रयास करें।';

  @override
  String get resend => 'फिर से भेजें';

  @override
  String get activatingAccount => 'खाता सक्रिय किया जा रहा है...';

  @override
  String get accountActivated => 'खाता सफलतापूर्वक सक्रिय किया गया!';

  @override
  String get emailVerified => 'ईमेल सत्यापित';

  @override
  String get activatingAccountText =>
      'आपका खाता वर्तमान में सक्रिय हो रहा है।\nकृपया प्रतीक्षा करें...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'बधाई हो!\nआपका $appTitle खाता सक्रिय हो गया है।\nअब आप अपने $appTitle स्पेस में लॉगिन कर सकते हैं।';
  }

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get accept => 'स्वीकार करें';

  @override
  String get termsOfUse => 'उपयोग की शर्तें';

  @override
  String get firstName => 'पहला नाम';

  @override
  String get lastName => 'अंतिम नाम';

  @override
  String get imNotARobot => 'मैं रोबोट नहीं हूँ';

  @override
  String get signUp => 'साइन अप';

  @override
  String get alreadyHaveAnAccount => 'क्या आपका पहले से खाता है?';

  @override
  String get signIn => 'साइन इन करें';

  @override
  String get inactiveUserAlreadyExists =>
      'निष्क्रिय उपयोगकर्ता पहले से मौजूद है';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'असत्यापित ईमेल पते वाला पंजीकृत उपयोगकर्ता पहले से मौजूद है।\nसत्यापन ईमेल दोबारा भेजने के लिए \'फिर से भेजें\' बटन पर क्लिक करें।';

  @override
  String get assignee => 'असाइन प्राप्तकर्ता';

  @override
  String get alarmTypes => 'अलार्म प्रकार';

  @override
  String get details => 'विवरण';

  @override
  String get status => 'स्थिति';

  @override
  String get severity => 'गंभीरता';

  @override
  String get originator => 'ओरिजिनेटर';

  @override
  String get startTime => 'प्रारंभ समय';

  @override
  String get duration => 'अवधि';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value दिन',
      one: '$value दिन',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value घंटे',
      one: '$value घंटा',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value मिनट',
      one: '$value मिनट',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value सेकंड',
      one: '$value सेकंड',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'डैशबोर्ड देखें';

  @override
  String get activity => 'गतिविधि';

  @override
  String get addCommentMessage => 'टिप्पणी जोड़ें...';

  @override
  String get clear => 'क्लियर करें';

  @override
  String get acknowledge => 'स्वीकार करें';

  @override
  String get edit => 'संपादित करें';

  @override
  String get editProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get edited => 'संपादित';

  @override
  String get deleteComment => 'टिप्पणी हटाएँ';

  @override
  String get areYouSure => 'क्या आप वाकई ऐसा करना चाहते हैं?';

  @override
  String get noResultsFound => 'कोई परिणाम नहीं मिला';

  @override
  String get tryRefiningYourQuery =>
      'कृपया अपनी क्वेरी को परिष्कृत करने का प्रयास करें';

  @override
  String get failedToLoadTheList => 'सूची लोड करने में विफल';

  @override
  String get tryRefreshing => 'कृपया रीफ़्रेश करने का प्रयास करें';

  @override
  String get refresh => 'रीफ़्रेश करें';

  @override
  String get users => 'उपयोगकर्ता';

  @override
  String get unassigned => 'असाइन नहीं किया गया';

  @override
  String get failedToLoadAlarmDetails => 'अलार्म विवरण लोड करने में विफल';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया';

  @override
  String get chooseRegion => 'क्षेत्र चुनें';

  @override
  String get selectRegion => 'क्षेत्र चुनें';

  @override
  String get northAmerica => 'उत्तरी अमेरिका';

  @override
  String get europe => 'यूरोप';

  @override
  String get northAmericaRegionShort => 'उत्तरी वर्जीनिया';

  @override
  String get europeRegionShort => 'फ़्रैंकफ़र्ट';

  @override
  String get deviceList => 'डिवाइस सूची';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'डैशबोर्ड',
      one: 'डैशबोर्ड',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'अपडेट आवश्यक है';

  @override
  String updateTo(Object version) {
    return '$version पर अपडेट करें';
  }

  @override
  String get next => 'अगला';

  @override
  String get confirmation => 'पुष्टि';

  @override
  String get wifiPassword => 'Wi-Fi पासवर्ड';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'अपने डिवाइस $deviceName का सेटअप जारी रखने के लिए, कृपया अपने नेटवर्क के क्रेडेंशियल्स प्रदान करें।';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '$network के लिए पासवर्ड दर्ज करें';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'आगे बढ़ने के लिए आपके पास \"$permissions\" के लिए पर्याप्त अनुमतियाँ नहीं हैं। कृपया आवश्यक अनुमतियाँ दें और \"पुनः प्रयास करें\" पर टैप करें।';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi क्रेडेंशियल्स भेजे जा रहे हैं';

  @override
  String get confirmingWifiConnection => 'Wi-Fi कनेक्शन की पुष्टि की जा रही है';

  @override
  String get provisionedSuccessfully => 'डिवाइस सफलतापूर्वक प्रोविज़न किया गया';

  @override
  String get returnToDashboard => 'डैशबोर्ड पर लौटें';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'डिवाइस $deviceName के साथ सत्र स्थापित नहीं हो सका। कृपया पुनः प्रयास करें';
  }

  @override
  String get claimingDevice => 'डिवाइस क्लेम किया जा रहा है';

  @override
  String get claimingMessageSuccess => 'डिवाइस सफलतापूर्वक\nक्लेम किया गया';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'जारी रखने के लिए आपके पास \"$permissions\" हेतु पर्याप्त अनुमतियाँ नहीं हैं। कृपया ऐप सेटिंग्स खोलें, अनुमतियाँ दें और \"पुनः प्रयास करें\" पर टैप करें।';
  }

  @override
  String get scanACode => 'कोड स्कैन करें';

  @override
  String get allowAccess => 'ऐक्सेस की अनुमति दें';

  @override
  String get toggleCamera => 'कैमरा बदलें';

  @override
  String get toggleFlash => 'फ़्लैश टॉगल करें';

  @override
  String get unableToUseCamera => 'कैमरे का उपयोग नहीं किया जा सकता';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'जारी रखने के लिए सेटिंग्स खोलें और कैमरे का ऐक्सेस दें';

  @override
  String get notFound => 'नहीं मिला';

  @override
  String routeNotDefined(Object name) {
    return 'रूट परिभाषित नहीं है: $name';
  }

  @override
  String get loginWith => 'इसके साथ लॉगिन करें';

  @override
  String get scanQrCode => 'QR कोड स्कैन करें';

  @override
  String get searchResults => 'खोज परिणाम';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String get requestedEntityDoesNotExists => 'अनुरोधित एंटिटी मौजूद नहीं है।';

  @override
  String get noAlarmsFound => 'कोई अलार्म नहीं मिला';

  @override
  String get filters => 'फ़िल्टर';

  @override
  String get alarmStatusList => 'अलार्म स्थिति सूची';

  @override
  String get alarmSeverityList => 'अलार्म गंभीरता सूची';

  @override
  String get cleared => 'क्लियर किया गया';

  @override
  String get acknowledged => 'स्वीकार किया गया';

  @override
  String get unacknowledged => 'स्वीकार नहीं किया गया';

  @override
  String get critical => 'क्रिटिकल';

  @override
  String get major => 'मेजर';

  @override
  String get minor => 'माइनर';

  @override
  String get warning => 'चेतावनी';

  @override
  String get indeterminate => 'अनिर्धारित';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'उपयोगकर्ता खोजें',
      one: 'उपयोगकर्ता खोजें',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'रीसेट करें';

  @override
  String get update => 'अपडेट करें';

  @override
  String get alarmTypeList => 'अलार्म प्रकार सूची';

  @override
  String get anyType => 'कोई भी प्रकार';

  @override
  String get plusAlarmType => '+ अलार्म प्रकार';

  @override
  String get all => 'सभी';

  @override
  String get allNotifications => 'सभी';

  @override
  String get unread => 'अपठित';

  @override
  String get close => 'बंद करें';

  @override
  String get fatalError => 'गंभीर त्रुटि';

  @override
  String get unknownError => 'अज्ञात त्रुटि।';

  @override
  String get sessionExpired => 'सत्र समाप्त हो गया है';

  @override
  String get fatalApplicationErrorOccurred => 'गंभीर एप्लिकेशन त्रुटि हुई:';

  @override
  String get connectionError => 'कनेक्शन त्रुटि';

  @override
  String get failedToConnectToServer => 'सर्वर से कनेक्ट करने में विफल';

  @override
  String get retry => 'फिर से प्रयास करें';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'मोबाइल डैशबोर्ड को डिवाइस प्रोफ़ाइल में कॉन्फ़िगर किया जाना चाहिए।';

  @override
  String get openWifiSettings => 'Wi-Fi सेटिंग्स खोलें';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'उस Wi-Fi से कनेक्ट करें जिसका आप आमतौर पर उपयोग करते हैं';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'ऐप पर वापस जाएँ और \'तैयार\' बटन पर टैप करें';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'अपने फ़ोन को अपने नियमित Wi-Fi से पुनः कनेक्ट करने के लिए\nकृपया अगले चरणों का पालन करें';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'पुश सूचनाएँ कॉन्फ़िगर नहीं हैं।\nकृपया अपने सिस्टम एडमिनिस्ट्रेटर से संपर्क करें।';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase कॉन्फ़िगर नहीं है।\n कृपया इसे करने के तरीके के मार्गदर्शन के लिए\n आधिकारिक Firebase दस्तावेज़ देखें।';

  @override
  String get markAllAsRead => 'सभी को पढ़ा हुआ चिह्नित करें';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String cantLaunchUrlLink(String link) {
    return 'URL लॉन्च नहीं हो सकता: $link';
  }

  @override
  String get noDashboardsFound => 'कोई डैशबोर्ड नहीं मिला';

  @override
  String get openAppSettings => 'ऐप सेटिंग्स खोलें';

  @override
  String get connectingToDevice => 'डिवाइस से कनेक्ट हो रहा है';

  @override
  String get connectToDevice => 'डिवाइस से कनेक्ट करें';

  @override
  String get selectWifiNetwork => 'Wi-Fi नेटवर्क चुनें';

  @override
  String get deviceProvisioning => 'डिवाइस प्रोविज़निंग';

  @override
  String get permissions => 'अनुमतियाँ';

  @override
  String get unableConnectToDevice => 'डिवाइस से कनेक्ट करने में असमर्थ';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'डिवाइस आस-पास का Wi-Fi नहीं ढूँढ पा रहा';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '$name Wi-Fi नेटवर्क से कनेक्शन विफल रहा।\nकृपया सुनिश्चित करें कि आपका फ़ोन डिवाइस के Wi-Fi नेटवर्क से कनेक्ट है और आपकी डिवाइस सेटिंग्स में इस ऐप के लिए स्थानीय नेटवर्क ऐक्सेस सक्षम है।';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Wi-Fi से कनेक्ट करने में असमर्थ क्योंकि डिवाइस $name को नेटवर्क नहीं मिले';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'अपने फ़ोन को डिवाइस से कनेक्ट करने के लिए कृपया अगले चरणों का पालन करें';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '$wifiName के समान Wi-Fi से कनेक्ट करें';
  }

  @override
  String get ready => 'तैयार';

  @override
  String get exitDeviceProvisioning => 'डिवाइस प्रोविज़निंग से बाहर निकलें';

  @override
  String get noNotificationsFound => 'कोई सूचना नहीं मिली';

  @override
  String get markAsRead => 'पढ़ा हुआ चिह्नित करें';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'कृपया अपने डिवाइस पर QR कोड स्कैन करें';

  @override
  String get search => 'खोजें';

  @override
  String get tenant => 'टेनेंट';

  @override
  String get tenantProfile => 'टेनेंट प्रोफ़ाइल';

  @override
  String get user => 'उपयोगकर्ता';

  @override
  String get asset => 'एसेट';

  @override
  String get deviceProfile => 'डिवाइस प्रोफ़ाइल';

  @override
  String get assetProfile => 'एसेट प्रोफ़ाइल';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'अलार्म',
      one: 'अलार्म',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'रूल चेन';

  @override
  String get ruleNode => 'रूल नोड';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'एंटिटी व्यू';

  @override
  String get widgetsBundle => 'विजेट बंडल';

  @override
  String get widgetType => 'विजेट प्रकार';

  @override
  String get apiUsageState => 'API उपयोग स्थिति';

  @override
  String get tbResource => 'संसाधन';

  @override
  String get otaPackage => 'OTA पैकेज';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'क्यू';

  @override
  String get notificationTarget => 'सूचना प्राप्तकर्ता';

  @override
  String get notificationTemplate => 'सूचना टेम्पलेट';

  @override
  String get notificationRequest => 'सूचना अनुरोध';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'सूचनाएँ',
      one: 'सूचना',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'सूचना नियम';

  @override
  String get entityGroup => 'एंटिटी समूह';

  @override
  String get converter => 'कन्वर्टर';

  @override
  String get integration => 'इंटीग्रेशन';

  @override
  String get schedulerEvent => 'शेड्यूलर इवेंट';

  @override
  String get blobEntity => 'ब्लॉब एंटिटी';

  @override
  String get role => 'रोल';

  @override
  String get groupPermission => 'समूह अनुमति';

  @override
  String get actionStatusSuccess => 'सफल';

  @override
  String get actionStatusFailure => 'विफल';

  @override
  String get actionTypeAdded => 'जोड़ा गया';

  @override
  String get actionTypeDeleted => 'हटाया गया';

  @override
  String get actionTypeUpdated => 'अपडेट किया गया';

  @override
  String get actionTypeAttributesUpdated => 'विशेषताएँ अपडेट की गईं';

  @override
  String get actionTypeAttributesDeleted => 'विशेषताएँ हटाई गईं';

  @override
  String get actionTypeRpcCall => 'RPC कॉल';

  @override
  String get actionTypeCredentialsUpdated => 'क्रेडेंशियल्स अपडेट किए गए';

  @override
  String get actionTypeAssignedToCustomer => 'ग्राहक को असाइन किया गया';

  @override
  String get actionTypeUnassignedFromCustomer => 'ग्राहक से अनअसाइन किया गया';

  @override
  String get actionTypeActivated => 'सक्रिय किया गया';

  @override
  String get actionTypeSuspended => 'निलंबित किया गया';

  @override
  String get actionTypeCredentialsRead => 'क्रेडेंशियल्स पढ़े गए';

  @override
  String get actionTypeAttributesRead => 'विशेषताएँ पढ़ी गईं';

  @override
  String get actionTypeRelationAddOrUpdate => 'रिलेशन अपडेट किया गया';

  @override
  String get actionTypeRelationDeleted => 'रिलेशन हटाया गया';

  @override
  String get actionTypeRelationsDeleted => 'सभी रिलेशन हटाए गए';

  @override
  String get actionTypeAlarmAck => 'अलार्म स्वीकार किया गया';

  @override
  String get actionTypeAlarmClear => 'अलार्म क्लियर किया गया';

  @override
  String get actionTypeAlarmDelete => 'अलार्म हटाया गया';

  @override
  String get actionTypeAlarmAssigned => 'अलार्म असाइन किया गया';

  @override
  String get actionTypeAlarmUnassigned => 'अलार्म अनअसाइन किया गया';

  @override
  String get actionTypeLogin => 'लॉगिन';

  @override
  String get actionTypeLogout => 'लॉगआउट';

  @override
  String get actionTypeLockout => 'लॉकआउट';

  @override
  String get actionTypeAssignedFromTenant => 'टेनेंट से असाइन किया गया';

  @override
  String get actionTypeAssignedToTenant => 'टेनेंट को असाइन किया गया';

  @override
  String get actionTypeProvisionSuccess => 'डिवाइस प्रोविज़न किया गया';

  @override
  String get actionTypeProvisionFailure => 'डिवाइस प्रोविज़निंग विफल रही';

  @override
  String get actionTypeTimeseriesUpdated => 'टेलीमेट्री अपडेट की गई';

  @override
  String get actionTypeTimeseriesDeleted => 'टेलीमेट्री हटाई गई';

  @override
  String get actionTypeAssignedToEdge => 'Edge को असाइन किया गया';

  @override
  String get actionTypeUnassignedFromEdge => 'Edge से अनअसाइन किया गया';

  @override
  String get actionTypeAddedComment => 'टिप्पणी जोड़ी गई';

  @override
  String get actionTypeUpdatedComment => 'टिप्पणी अपडेट की गई';

  @override
  String get actionTypeDeletedComment => 'टिप्पणी हटाई गई';

  @override
  String get actionTypeSmsSent => 'SMS भेजा गया';

  @override
  String get actionTypeAddedToEntityGroup => 'एंटिटी समूह में जोड़ा गया';

  @override
  String get actionTypeRemovedFromEntityGroup => 'एंटिटी समूह से निकाला गया';

  @override
  String get actionTypeRestApiRuleEngineCall => 'रूल इंजन REST API कॉल';

  @override
  String get actionTypeMadePublic => 'सार्वजनिक बनाया गया';

  @override
  String get actionTypeMadePrivate => 'निजी बनाया गया';

  @override
  String get actionTypeChangeOwner => 'ओनर बदला गया';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'यह ऑपरेशन करने के लिए आपके पास अनुमतियाँ नहीं हैं!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'ऐसा लगता है कि यह ऑपरेशन पूरा करने के लिए आपकी अनुमतियाँ पर्याप्त नहीं हैं';

  @override
  String get isRequiredText => 'आवश्यक है।';

  @override
  String get no2faProvidersFound => 'कोई 2FA प्रदाता नहीं मिला';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'कृपया अपने सिस्टम एडमिनिस्ट्रेटर से संपर्क करें';

  @override
  String errorOccured(Object e) {
    return 'त्रुटि हुई: $e';
  }

  @override
  String get unsavedChanges => 'बिना सहेजे गए परिवर्तन';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'आपके पास बिना सहेजे गए परिवर्तन हैं। क्या आप वाकई इस पेज से बाहर जाना चाहते हैं?';

  @override
  String get deleteAccount => 'खाता हटाएँ';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'क्या आप वाकई ऐसा करना चाहते हैं? आप अपना $authority खाता हटाने जा रहे हैं।';
  }

  @override
  String get language => 'भाषा';

  @override
  String get metricUnitSystem => 'मेट्रिक';

  @override
  String get imperialUnitSystem => 'इम्पीरियल';

  @override
  String get hybridUnitSystem => 'हाइब्रिड';

  @override
  String get autoUnitSystem => 'ऑटो';

  @override
  String get languageAuto => 'ऑटो';

  @override
  String get unitSystem => 'इकाई सिस्टम';

  @override
  String get selectCountry => 'देश चुनें';

  @override
  String get hideHomeDashboardToolbar => 'होम डैशबोर्ड टूलबार छिपाएँ';

  @override
  String get phoneNumberHelperText =>
      'फ़ोन नंबर E.164 फ़ॉर्मेट में, जैसे +1201550123';

  @override
  String get homeDashboard => 'होम डैशबोर्ड';

  @override
  String get security => 'सुरक्षा';

  @override
  String get twofactorAuthentication => 'दो-कारक प्रमाणीकरण';

  @override
  String get verificationRequired => 'सत्यापन आवश्यक';

  @override
  String get twofactorAuthenticationIsRequired =>
      'दो-कारक प्रमाणीकरण आवश्यक है';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'लॉगिन जारी रखने के लिए सत्यापन विधि सेट करें';

  @override
  String get setUpAVerificationMethod => 'सत्यापन विधि सेट करें';

  @override
  String get totpSetupSuccessDescription =>
      'अगली बार जब आप साइन इन करेंगे, तो आपको दो-कारक प्रमाणीकरण कोड प्रदान करना होगा';

  @override
  String get smsSetupSuccessDescription =>
      'अगली बार साइन इन करते समय आपसे वह सिक्योरिटी कोड दर्ज करने के लिए कहा जाएगा, जो आपके फ़ोन नंबर पर भेजा जाएगा';

  @override
  String get emailSetupSuccessDescription =>
      'अगली बार साइन इन करते समय आपसे वह सिक्योरिटी कोड दर्ज करने के लिए कहा जाएगा, जो आपके ईमेल पते पर भेजा जाएगा';

  @override
  String get backupCodeSetupSuccessDescription =>
      'अगली बार लॉगिन करते समय, आप दो-कारक प्रमाणीकरण पास करने के लिए बैकअप कोड का उपयोग कर सकेंगे';

  @override
  String get loginToApp => 'ऐप में लॉगिन करें';

  @override
  String get goBack => 'वापस जाएँ';

  @override
  String get done => 'हो गया';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'इससे आपका खाता कम सुरक्षित हो जाएगा';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'क्या आप वाकई $providerName को अक्षम करना चाहते हैं?';
  }

  @override
  String get yesDeactivate => 'हाँ, अक्षम करें';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'वह ईमेल दर्ज करें, जिसे आप अपने ऑथेंटिकेटर के रूप में उपयोग करेंगे।';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'अपने ऑथेंटिकेटर के रूप में उपयोग करने के लिए फ़ोन नंबर दर्ज करें';

  @override
  String get sendCode => 'कोड भेजें';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get enter6digitsKeyFromYourAppHere => 'यहाँ 6-अंकों का कोड दर्ज करें';

  @override
  String digitsCode(int count) {
    return '$count-अंकीय कोड';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '32-वर्णों वाली कुंजी को अपने ऑथेंटिकेटर ऐप में कॉपी करें, या नीचे दिए गए QR कोड को स्कैन करें';

  @override
  String get applyChanges => 'परिवर्तनों को लागू करें';

  @override
  String get discardChanges => 'बदलाव छोड़ें';

  @override
  String get yesDiscard => 'हाँ, छोड़ें';

  @override
  String get thisActionCannotBeUndone => 'यह क्रिया पूर्ववत नहीं की जा सकती';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'दो-कारक प्रमाणीकरण आपके खाते को अनधिकृत पहुँच से बचाता है। आपको बस लॉगिन करते समय एक सिक्योरिटी कोड दर्ज करना होता है।';

  @override
  String get calculatedField => 'कैलक्युलेटेड फ़ील्ड';

  @override
  String get apiKey => 'API कुंजी';

  @override
  String get aiModel => 'AI मॉडल';

  @override
  String get adminSettings => 'एडमिनिस्ट्रेटर सेटिंग्स';

  @override
  String get job => 'जॉब';

  @override
  String get mobileAppBundle => 'मोबाइल ऐप बंडल';

  @override
  String get mobileApp => 'मोबाइल ऐप';

  @override
  String get domain => 'डोमेन';

  @override
  String get oauth2Client => 'OAuth2 क्लाइंट';

  @override
  String get queueStats => 'क्यू आँकड़े';

  @override
  String get phoneIsRequired => 'फ़ोन नंबर आवश्यक है';

  @override
  String get phoneIsInvalid => 'फ़ोन नंबर अमान्य है';

  @override
  String get addVerificationMethod => 'सत्यापन विधि जोड़ें';

  @override
  String get imageSavedToGallery =>
      'प्लेटफ़ॉर्म की \'इमेज गैलरी\' में सहेजा गया';

  @override
  String get failedToSaveImage => 'इमेज सहेजने में विफल';

  @override
  String nSelected(int count) {
    return '$count चयनित';
  }

  @override
  String get selectAll => 'सभी लोड किए गए चुनें';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ऑपरेशन विफल हुए',
      one: '1 ऑपरेशन विफल हुआ',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सूचनाएँ हटाएँ?',
      one: '1 सूचना हटाएँ?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सूचनाओं को पढ़ा हुआ चिह्नित करें?',
      one: '1 सूचना को पढ़ा हुआ चिह्नित करें?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'आपके होस्ट $host से डेटा प्राप्त किया जा रहा है';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'होस्ट $host में साइन इन किया जा रहा है';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'नए होस्ट $host पर स्विच किया जा रहा है';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '$host से लॉगिन टोकन प्राप्त करने में विफल। कृपया नया QR कोड स्कैन करें।';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '$host से कनेक्ट करने में विफल';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host ThingsBoard सर्वर नहीं है';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR कोड सत्र अब मान्य नहीं है। कृपया QR कोड रीफ़्रेश करें और फिर से स्कैन करें।';

  @override
  String get openThisLinkTitle => 'यह लिंक खोलें?';

  @override
  String get linkOpensSignInPage =>
      'यह लिंक इस सर्वर का साइन-इन पृष्ठ खोलता है। आप अपने वर्तमान सर्वर से साइन आउट हो जाएँगे।';

  @override
  String get linkOpensSignInPageOnly =>
      'यह लिंक इस सर्वर का साइन-इन पृष्ठ खोलता है।';

  @override
  String linkSignsInAs(Object email) {
    return 'यह लिंक आपको इस सर्वर में $email के रूप में साइन इन करता है।';
  }

  @override
  String get linkSignsIn => 'यह लिंक आपको इस सर्वर में साइन इन करता है।';

  @override
  String get serverConnectionNotSecure =>
      'यह सर्वर सुरक्षित कनेक्शन का उपयोग नहीं करता।';

  @override
  String get linkToOtherServerNotAllowed =>
      'यह ऐप केवल अपने स्वयं के सर्वर के साथ काम करता है और इस लिंक को नहीं खोल सकता।';

  @override
  String get liveTrackingActive => 'लाइव स्थान ट्रैकिंग';

  @override
  String get liveTrackingPaused => 'लाइव ट्रैकिंग पॉज़ की गई';

  @override
  String get liveTrackingFixes => 'प्राप्त स्थान';

  @override
  String get liveTrackingSaved => 'सहेजा गया';

  @override
  String get liveTrackingErrors => 'त्रुटियाँ';

  @override
  String get liveTrackingStop => 'रोकें';

  @override
  String get liveTrackingPause => 'पॉज़ करें';

  @override
  String get liveTrackingResume => 'जारी रखें';

  @override
  String get liveTrackingHide => 'छिपाएँ';

  @override
  String get liveTrackingSessionTitle => 'लाइव स्थान ट्रैकिंग';

  @override
  String get liveTrackingTarget => 'स्थान को एंटिटी में सहेजें';

  @override
  String get liveTrackingDashboard => 'डैशबोर्ड';

  @override
  String get liveTrackingStatus => 'स्थिति';

  @override
  String get liveTrackingStarted => 'प्रारंभ समय';

  @override
  String get liveTrackingLastFix => 'अंतिम स्थान';

  @override
  String get liveTrackingLastError => 'अंतिम त्रुटि';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'इस एंटिटी में सहेजा नहीं जा सकता — यह अब मौजूद नहीं है। ट्रैकिंग जारी है; डैशबोर्ड एक्शन में लक्ष्य अपडेट करें।';

  @override
  String get liveTrackingErrorNoConnection =>
      'सर्वर से कोई कनेक्शन नहीं है। ये स्थान सहेजे नहीं गए — ऑनलाइन होने पर सहेजना फिर से शुरू हो जाएगा।';

  @override
  String get liveTrackingErrorUnauthorized =>
      'आपका सत्र समाप्त हो गया। स्थान सहेजना जारी रखने के लिए फिर से साइन इन करें।';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'इस एंटिटी में सहेजा नहीं जा सकता — आपके पास अनुमति नहीं है। ट्रैकिंग जारी है; अपने एडमिनिस्ट्रेटर से ऐक्सेस देने के लिए कहें।';

  @override
  String get liveTrackingErrorSaveFailed =>
      'यह स्थान सर्वर पर सहेजा नहीं जा सका। अगला स्थान मिलने पर फिर से सहेजने का प्रयास किया जाएगा।';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'इस डिवाइस पर स्थान सेवाएँ बंद हैं।';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'स्थान अनुमति अस्वीकार कर दी गई।';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'स्थान अनुमति स्थायी रूप से अस्वीकार कर दी गई है। इसे ऐप सेटिंग्स में सक्षम करें।';

  @override
  String get liveTrackingErrorLocation => 'स्थान प्राप्त नहीं किया जा सका।';

  @override
  String get liveTrackingMenuTitle => 'लाइव स्थान ट्रैकिंग';

  @override
  String get liveTrackingNoRecord =>
      'कोई सक्रिय ट्रैकिंग नहीं और कोई हाल का सत्र नहीं।';

  @override
  String get liveTrackingLastSession => 'अंतिम सत्र';

  @override
  String get liveTrackingStartAgain => 'फिर से प्रारंभ करें';

  @override
  String get liveTrackingEnded => 'समाप्ति समय';

  @override
  String get liveTrackingEndReason => 'समाप्ति का कारण';

  @override
  String get liveTrackingEndReasonManual => 'मैन्युअल रूप से रोका गया';

  @override
  String get liveTrackingEndReasonMaxDuration => 'अधिकतम अवधि तक पहुँचा';

  @override
  String get liveTrackingEndReasonInterrupted => 'बाधित';

  @override
  String get serverUpdateRequired => 'सर्वर अपडेट आवश्यक है';

  @override
  String get backToLogin => 'लॉगिन पर वापस जाएँ';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'यह ऐप ThingsBoard $minVersion या बाद वाले संस्करण के साथ काम करता है।';
  }

  @override
  String get serverLabel => 'सर्वर';

  @override
  String get versionLabel => 'संस्करण';

  @override
  String get askAdminToUpdateServer =>
      'अपने सर्वर एडमिनिस्ट्रेटर से सर्वर अपडेट करने के लिए कहें।';

  @override
  String get deviceClaimFailed =>
      'डिवाइस क्लेम नहीं किया जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get deviceToClaimNotFound =>
      'डिवाइस नहीं मिला। कृपया डिवाइस प्रदाता से संपर्क करें।';

  @override
  String get enableAuthenticatorApp => 'ऑथेंटिकेटर ऐप सक्षम करें';

  @override
  String get enableSmsAuthenticator => 'SMS ऑथेंटिकेटर सक्षम करें';

  @override
  String get enableEmailAuthenticator => 'ईमेल ऑथेंटिकेटर सक्षम करें';

  @override
  String get getBackupCode => 'बैकअप कोड प्राप्त करें';

  @override
  String get twoFaTotpDescription =>
      'अपने फ़ोन पर Google Authenticator, Authy या Duo जैसी ऐप का उपयोग करके ऑथेंटिकेट करें। यह लॉगिन के लिए सिक्योरिटी कोड जनरेट करेगी।';

  @override
  String get twoFaSmsDescription =>
      'ऑथेंटिकेट करने के लिए अपने फ़ोन का उपयोग करें। जब आप लॉगिन करेंगे तो हम आपको SMS संदेश के माध्यम से सिक्योरिटी कोड भेजेंगे।';

  @override
  String get twoFaEmailDescription =>
      'ऑथेंटिकेट करने के लिए अपने ईमेल पते पर भेजे गए सिक्योरिटी कोड का उपयोग करें।';

  @override
  String get twoFaBackupCodeDescription =>
      'ये प्रिंट करने योग्य एक-बार उपयोग होने वाले पासकोड आपको तब साइन-इन करने देते हैं जब आप अपने फ़ोन से दूर हों, जैसे यात्रा करते समय।';

  @override
  String get openInAuthenticatorApp => 'ऑथेंटिकेटर ऐप में खोलें';

  @override
  String get noAuthenticatorAppFound =>
      'कोई ऑथेंटिकेटर ऐप नहीं मिला। इसके बजाय कुंजी को अपने ऐप में कॉपी करें।';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider सक्षम है';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'आपके एडमिनिस्ट्रेटर ने $email के लिए दो-कारक प्रमाणीकरण आवश्यक कर दिया है।';
  }

  @override
  String get recommended => 'अनुशंसित';

  @override
  String get addBackupCodesHint =>
      'बैकअप कोड भी जोड़ें, ताकि फ़ोन खोने पर भी आप साइन इन कर सकें।';

  @override
  String get totpSecretKey => 'सीक्रेट कुंजी';

  @override
  String get backupCodesDescription =>
      'कोड प्रिंट कर लें, ताकि अपने खाते में लॉगिन करते समय ज़रूरत पड़ने पर वे आपके पास हों। आप प्रत्येक बैकअप कोड का केवल एक बार उपयोग कर सकते हैं।';

  @override
  String get backupCodesWarning =>
      'इस पेज को छोड़ने के बाद ये कोड फिर से नहीं दिखाए जाएँगे। इन्हें नीचे दिए गए विकल्पों का उपयोग करके सुरक्षित रूप से स्टोर करें।';

  @override
  String get downloadTxt => 'डाउनलोड (txt)';
}

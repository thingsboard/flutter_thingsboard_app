// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class SLt extends S {
  SLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Pagrindinis';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Įrenginiai',
      one: 'Įrenginys',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Daugiau';

  @override
  String get customers => 'Klientai';

  @override
  String get assets => 'Turtas';

  @override
  String get tenants => 'Nuomininkai';

  @override
  String get auditLogs => 'Audito žurnalai';

  @override
  String get noCustomersFound => 'Klientų nėra';

  @override
  String get noAssetsFound => 'Turtas nerastas';

  @override
  String get noTenantsFound => 'Nuomininkų nėra';

  @override
  String get noDevicesFound => 'Įrenginių nėra';

  @override
  String get noAuditLogsFound => 'Audito žurnalų nerasta';

  @override
  String get logout => 'Atsijungti';

  @override
  String get login => 'Prisijungti';

  @override
  String get loginToYourAccount => 'Prisijunkite prie savo paskyros';

  @override
  String get email => 'El. paštas';

  @override
  String get emailInvalidText => 'Neteisingas el. pašto formatas.';

  @override
  String get username => 'naudotojo vardas';

  @override
  String get password => 'Slaptažodis';

  @override
  String get passwordForgotText => 'Pamiršote slaptažodį?';

  @override
  String get passwordReset => 'Atstatyti slaptažodį';

  @override
  String get passwordResetText =>
      'Įveskite su jūsų paskyra susietą el. paštą ir mes išsiųsime el. laišką su slaptažodžio atstatymo nuoroda';

  @override
  String get requestPasswordReset => 'Prašyti slaptažodžio atstatymo';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'El. pašto patvirtinimo nuoroda sėkmingai išsiųsta!';

  @override
  String get or => 'ARBA';

  @override
  String get no => 'Ne';

  @override
  String get yes => 'Taip';

  @override
  String get title => 'Pavadinimas';

  @override
  String get country => 'Šalis';

  @override
  String get city => 'Miestas';

  @override
  String get stateOrProvince => 'Rajonas';

  @override
  String get postalCode => 'Pašto kodas';

  @override
  String get address => 'Adresas';

  @override
  String get address2 => 'Adresas 2';

  @override
  String get phone => 'Telefonas';

  @override
  String get alarmClearTitle => 'Išvalyti įspėjimą';

  @override
  String get alarmClearText => 'Išvalyti įspėjimą?';

  @override
  String get alarmAcknowledgeTitle => 'Patvirtinti įspėjimą';

  @override
  String get alarmAcknowledgeText => 'Patvirtinti įspėjimą?';

  @override
  String get assetName => 'Turto pavadinimas';

  @override
  String get type => 'Tipas';

  @override
  String get label => 'Etiketė';

  @override
  String get auditLogDetails => 'Audito žurnalo informacija';

  @override
  String get customerDetails => 'Informacija apie klientą';

  @override
  String get assetDetails => 'Turto informacija';

  @override
  String get tenantDetails => 'Informacija apie nuomininką';

  @override
  String get entityType => 'Subjekto tipas';

  @override
  String get actionData => 'Veiksmų informacija';

  @override
  String get failureDetails => 'Nesėkmės informacija';

  @override
  String get allDevices => 'Visi įrenginiai';

  @override
  String get active => 'Aktyvus';

  @override
  String get inactive => 'Neaktyvus';

  @override
  String get deviceActive => 'Aktyvus';

  @override
  String get deviceInactive => 'Neaktyvus';

  @override
  String get activeDevices => 'Aktyvūs';

  @override
  String get inactiveDevices => 'Neaktyvūs';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktyvus, patvirtintas';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktyvus, nepatvirtintas';

  @override
  String get alarmStatusClearedAcknowledged => 'Išvalytas, patvirtintas';

  @override
  String get alarmStatusClearedUnacknowledged => 'Išvalytas, nepatvirtintas';

  @override
  String get alarmStatusFilterActive => 'Aktyvūs';

  @override
  String get systemAdministrator => 'Sistemos administratorius';

  @override
  String get tenantAdministrator => 'Nuomininko administratorius';

  @override
  String get customer => 'Klientas';

  @override
  String get changePassword => 'Pakeisti slaptažodį';

  @override
  String get currentPasswordRequireText =>
      'Dabartinis slaptažodis yra privalomas.';

  @override
  String get currentPassword => 'Dabartinis slaptažodis';

  @override
  String get newPasswordRequireText => 'Naujas slaptažodis yra privalomas.';

  @override
  String get newPassword => 'Naujas slaptažodis';

  @override
  String get newPassword2RequireText =>
      'Naujo slaptažodžio pakartojimas yra privalomas.';

  @override
  String get newPassword2 => 'Pakartokite naują slaptažodį';

  @override
  String get passwordErrorNotification => 'Įvesti slaptažodžiai turi sutapti!';

  @override
  String get profileSuccessNotification => 'Profilis sėkmingai atnaujintas';

  @override
  String get passwordSuccessNotification => 'Slaptažodis sėkmingai pakeistas';

  @override
  String get notImplemented => 'Neįgyvendinta!';

  @override
  String get listIsEmptyText => 'Sąrašas šiuo metu tuščias.';

  @override
  String get tryAgain => 'Bandyti dar kartą';

  @override
  String get verifyYourIdentity => 'Patvirtinkite savo tapatybę';

  @override
  String get continueText => 'Tęsti';

  @override
  String get resendCode => 'Siųsti kodą iš naujo';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekundžių',
      one: '$time sekundės',
    );
    return 'Siųsti kodą iš naujo po $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Įveskite saugos kodą iš autentifikavimo programėlės.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Saugos kodas išsiųstas į jūsų telefoną numeriu $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Saugos kodas išsiųstas į jūsų el. paštą adresu $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Įveskite vieną iš atsarginių kodų.';

  @override
  String get toptAuthPlaceholder => 'Kodas';

  @override
  String get smsAuthPlaceholder => 'SMS kodas';

  @override
  String get emailAuthPlaceholder => 'El. pašto kodas';

  @override
  String get backupCodeAuthPlaceholder => 'Atsarginis kodas';

  @override
  String get verificationCodeIncorrect => 'Neteisingas patvirtinimo kodas';

  @override
  String get verificationCodeManyRequest =>
      'Per daug patvirtinimo kodo tikrinimo užklausų';

  @override
  String get tryAnotherWay => 'Bandykite kitu būdu';

  @override
  String get selectWayToVerify => 'Pasirinkite tapatybės patvirtinimo būdą';

  @override
  String get mfaProviderTopt => 'Autentifikavimo programėlė';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'El. paštas';

  @override
  String get mfaProviderBackupCode => 'Atsarginis kodas';

  @override
  String get newUserText => 'Naujas naudotojas?';

  @override
  String get createAccount => 'Sukurti paskyrą';

  @override
  String get emailVerification => 'El. pašto adreso patvirtinimas';

  @override
  String get emailVerificationSentText =>
      'El. laiškas su patvirtinimo informacija išsiųstas nurodytu el. pašto adresu ';

  @override
  String get emailVerificationInstructionsText =>
      'Vadovaukitės el. laiške pateiktomis instrukcijomis, kad užbaigtumėte registracijos procedūrą. Pastaba: jei kurį laiką nematote el. laiško, patikrinkite šlamšto aplanką arba pabandykite išsiųsti el. laišką iš naujo paspausdami mygtuką „Siųsti dar kartą“.';

  @override
  String get resend => 'Siųsti dar kartą';

  @override
  String get activatingAccount => 'Paskyros aktyvavimas...';

  @override
  String get accountActivated => 'Paskyra aktyvuota!';

  @override
  String get emailVerified => 'El. paštas patvirtintas';

  @override
  String get activatingAccountText =>
      'Jūsų paskyra šiuo metu aktyvuojama.\nPalaukite...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Sveikiname!\nJūsų $appTitle paskyra aktyvuota.\nDabar galite prisijungti prie savo $appTitle erdvės.';
  }

  @override
  String get privacyPolicy => 'Privatumo politika';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get accept => 'Sutikti';

  @override
  String get termsOfUse => 'Naudojimo sąlygos';

  @override
  String get firstName => 'Vardas';

  @override
  String get lastName => 'Pavardė';

  @override
  String get imNotARobot => 'Aš nesu robotas';

  @override
  String get signUp => 'Registracija';

  @override
  String get alreadyHaveAnAccount => 'Jau turite paskyrą?';

  @override
  String get signIn => 'Prisijungti';

  @override
  String get inactiveUserAlreadyExists =>
      'Neaktyvuotas naudotojas jau egzistuoja';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Jau yra registruotas naudotojas su nepatvirtintu el. pašto adresu.\nSpustelėkite mygtuką „Siųsti dar kartą“, jei norite pakartotinai išsiųsti patvirtinimo el. laišką.';

  @override
  String get assignee => 'Atsakingas';

  @override
  String get alarmTypes => 'Įspėjimų tipai';

  @override
  String get details => 'Informacija';

  @override
  String get status => 'Būsena';

  @override
  String get severity => 'Svarba';

  @override
  String get originator => 'Siuntėjas';

  @override
  String get startTime => 'Pradžios laikas';

  @override
  String get duration => 'Trukmė';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dienų',
      few: '$value dienos',
      one: '$value diena',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value valandų',
      many: '$value valandos',
      few: '$value valandos',
      one: '$value valanda',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minučių',
      many: '$value minutės',
      few: '$value minutės',
      one: '$value minutė',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value sekundžių',
      many: '$value sekundės',
      few: '$value sekundės',
      one: '$value sekundė',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Peržiūrėti skydelį';

  @override
  String get activity => 'Veikla';

  @override
  String get addCommentMessage => 'Parašykite komentarą...';

  @override
  String get clear => 'Išvalyti';

  @override
  String get acknowledge => 'Patvirtinti';

  @override
  String get edit => 'Redaguoti';

  @override
  String get editProfile => 'Redaguoti profilį';

  @override
  String get delete => 'Ištrinti';

  @override
  String get edited => 'Redaguota';

  @override
  String get deleteComment => 'Ištrinti komentarą';

  @override
  String get areYouSure => 'Ar tikrai?';

  @override
  String get noResultsFound => 'Rezultatų nerasta';

  @override
  String get tryRefiningYourQuery => 'Pabandykite patikslinti užklausą';

  @override
  String get failedToLoadTheList => 'Nepavyko įkelti sąrašo';

  @override
  String get tryRefreshing => 'Pabandykite atnaujinti';

  @override
  String get refresh => 'Atnaujinti';

  @override
  String get users => 'Naudotojai';

  @override
  String get unassigned => 'Nepriskirta';

  @override
  String get failedToLoadAlarmDetails =>
      'Nepavyko įkelti įspėjimo informacijos';

  @override
  String get somethingWentWrong => 'Kažkas nutiko ne taip';

  @override
  String get chooseRegion => 'Pasirinkti regioną';

  @override
  String get selectRegion => 'Pasirinkite regioną';

  @override
  String get northAmerica => 'Šiaurės Amerika';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'Š. Virdžinija';

  @override
  String get europeRegionShort => 'Frankfurtas';

  @override
  String get deviceList => 'Įrenginių sąrašas';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skydeliai',
      one: 'Skydelis',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Reikia atnaujinti';

  @override
  String updateTo(Object version) {
    return 'Atnaujinti į $version';
  }

  @override
  String get next => 'Toliau';

  @override
  String get confirmation => 'Patvirtinimas';

  @override
  String get wifiPassword => 'Wi-Fi slaptažodis';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Norėdami tęsti įrenginio „$deviceName“ sąranką, pateikite savo tinklo prisijungimo duomenis.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Įveskite „$network“ slaptažodį';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Jūs neturite pakankamai leidimų „$permissions“, kad galėtumėte tęsti. Suteikite reikalingus leidimus ir palieskite „Bandyti dar kartą“.';
  }

  @override
  String get sendingWifiCredentials => 'Siunčiami Wi-Fi prisijungimo duomenys';

  @override
  String get confirmingWifiConnection => 'Patvirtinamas Wi-Fi ryšys';

  @override
  String get provisionedSuccessfully => 'Įrenginys sėkmingai paruoštas';

  @override
  String get returnToDashboard => 'Grįžti į skydelį';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Nepavyksta užmegzti ryšio su įrenginiu „$deviceName“. Bandykite dar kartą';
  }

  @override
  String get claimingDevice => 'Perimamas įrenginys';

  @override
  String get claimingMessageSuccess => 'Įrenginys sėkmingai\nperimtas';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Jūs neturite pakankamai leidimų „$permissions“, kad galėtumėte tęsti. Atidarykite programėlės nustatymus, suteikite leidimus ir palieskite „Bandyti dar kartą“.';
  }

  @override
  String get scanACode => 'Nuskaityti kodą';

  @override
  String get allowAccess => 'Leisti prieigą';

  @override
  String get toggleCamera => 'Perjungti kamerą';

  @override
  String get toggleFlash => 'Perjungti blykstę';

  @override
  String get unableToUseCamera => 'Nepavyksta naudoti kameros';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Atidarykite nustatymus ir suteikite prieigą prie kameros, kad galėtumėte tęsti';

  @override
  String get notFound => 'Nerasta';

  @override
  String routeNotDefined(Object name) {
    return 'Maršrutas neapibrėžtas: $name';
  }

  @override
  String get loginWith => 'Prisijungti naudojant';

  @override
  String get scanQrCode => 'Nuskaityti QR kodą';

  @override
  String get searchResults => 'Paieškos rezultatai';

  @override
  String get viewAll => 'Peržiūrėti visus';

  @override
  String get requestedEntityDoesNotExists => 'Prašomas subjektas neegzistuoja.';

  @override
  String get noAlarmsFound => 'Įspėjimų nėra';

  @override
  String get filters => 'Filtrai';

  @override
  String get alarmStatusList => 'Įspėjimo būsenų sąrašas';

  @override
  String get alarmSeverityList => 'Įspėjimo svarbos sąrašas';

  @override
  String get cleared => 'Išvalyti';

  @override
  String get acknowledged => 'Patvirtinti';

  @override
  String get unacknowledged => 'Nepatvirtinti';

  @override
  String get critical => 'Kritinė';

  @override
  String get major => 'Didelė';

  @override
  String get minor => 'Nedidelė';

  @override
  String get warning => 'Perspėjimas';

  @override
  String get indeterminate => 'Nenustatyta';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ieškoti naudotojų',
      one: 'Ieškoti naudotojo',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Nustatyti iš naujo';

  @override
  String get update => 'Atnaujinti';

  @override
  String get alarmTypeList => 'Įspėjimų tipų sąrašas';

  @override
  String get anyType => 'Bet koks tipas';

  @override
  String get plusAlarmType => '+ Įspėjimo tipas';

  @override
  String get all => 'Visi';

  @override
  String get allNotifications => 'Visi';

  @override
  String get unread => 'Neskaityti';

  @override
  String get close => 'Uždaryti';

  @override
  String get fatalError => 'Kritinė klaida';

  @override
  String get unknownError => 'Nežinoma klaida.';

  @override
  String get sessionExpired => 'Sesijos galiojimas baigėsi';

  @override
  String get fatalApplicationErrorOccurred =>
      'Įvyko kritinė programėlės klaida:';

  @override
  String get connectionError => 'Ryšio klaida';

  @override
  String get failedToConnectToServer => 'Nepavyko prisijungti prie serverio';

  @override
  String get retry => 'Bandyti dar kartą';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilusis skydelis turi būti sukonfigūruotas įrenginio profilyje!';

  @override
  String get openWifiSettings => 'Atidaryti Wi-Fi nustatymus';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Prisijunkite prie įprastai naudojamo Wi-Fi';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Grįžkite į programėlę ir palieskite mygtuką „Pasiruošta“';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Atlikite toliau nurodytus veiksmus, kad vėl prijungtumėte\ntelefoną prie įprasto Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push pranešimai nesukonfigūruoti.\nKreipkitės į sistemos administratorių.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase nesukonfigūruotas.\n Vadovaukitės oficialia Firebase dokumentacija, kaip tai padaryti.';

  @override
  String get markAllAsRead => 'Pažymėti visus kaip skaitytus';

  @override
  String get profile => 'Profilis';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Nepavyko atidaryti URL: $link';
  }

  @override
  String get noDashboardsFound => 'Skydelių nėra';

  @override
  String get openAppSettings => 'Atidaryti programėlės nustatymus';

  @override
  String get connectingToDevice => 'Jungiamasi prie įrenginio';

  @override
  String get connectToDevice => 'Prisijungti prie įrenginio';

  @override
  String get selectWifiNetwork => 'Pasirinkite Wi-Fi tinklą';

  @override
  String get deviceProvisioning => 'Įrenginių paruošimas';

  @override
  String get permissions => 'Leidimai';

  @override
  String get unableConnectToDevice => 'Nepavyko prisijungti prie įrenginio';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Įrenginys nerado šalia esančių Wi-Fi tinklų';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Nepavyko prisijungti prie Wi-Fi tinklo „$name“.\nĮsitikinkite, kad telefonas prijungtas prie įrenginio Wi-Fi tinklo ir kad šiai programėlei telefono nustatymuose įjungta prieiga prie vietinio tinklo.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Nepavyko prisijungti prie Wi-Fi, nes įrenginys „$name“ nerado tinklų';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Atlikite toliau nurodytus veiksmus, kad prijungtumėte telefoną prie įrenginio';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Prisijunkite prie Wi-Fi, panašaus į „$wifiName“';
  }

  @override
  String get ready => 'Pasiruošta';

  @override
  String get exitDeviceProvisioning => 'Išeiti iš įrenginio paruošimo';

  @override
  String get noNotificationsFound => 'Pranešimų nerasta';

  @override
  String get markAsRead => 'Pažymėti kaip skaitytą';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Nuskaitykite QR kodą savo įrenginyje';

  @override
  String get search => 'Paieška';

  @override
  String get tenant => 'Nuomininkas';

  @override
  String get tenantProfile => 'Nuomininko profilis';

  @override
  String get user => 'Naudotojas';

  @override
  String get asset => 'Turtas';

  @override
  String get deviceProfile => 'Įrenginio profilis';

  @override
  String get assetProfile => 'Turto profilis';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Įspėjimai',
      one: 'Įspėjimas',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Taisyklių grandinė';

  @override
  String get ruleNode => 'Taisyklių mazgas';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Subjektų rodinys';

  @override
  String get widgetsBundle => 'Valdiklių rinkinys';

  @override
  String get widgetType => 'Valdiklio tipas';

  @override
  String get apiUsageState => 'API naudojimo būsena';

  @override
  String get tbResource => 'Išteklius';

  @override
  String get otaPackage => 'OTA paketas';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Eilė';

  @override
  String get notificationTarget => 'Pranešimo gavėjas';

  @override
  String get notificationTemplate => 'Pranešimo šablonas';

  @override
  String get notificationRequest => 'Pranešimo užklausa';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pranešimai',
      one: 'Pranešimas',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Pranešimo taisyklė';

  @override
  String get entityGroup => 'Subjektų grupė';

  @override
  String get converter => 'Keitiklis';

  @override
  String get integration => 'Integracija';

  @override
  String get schedulerEvent => 'Planuoklės įvykis';

  @override
  String get blobEntity => 'Blob subjektas';

  @override
  String get role => 'Rolė';

  @override
  String get groupPermission => 'Grupės leidimas';

  @override
  String get actionStatusSuccess => 'Sėkminga';

  @override
  String get actionStatusFailure => 'Nesėkminga';

  @override
  String get actionTypeAdded => 'Pridėta';

  @override
  String get actionTypeDeleted => 'Ištrinta';

  @override
  String get actionTypeUpdated => 'Atnaujinta';

  @override
  String get actionTypeAttributesUpdated => 'Atributai atnaujinti';

  @override
  String get actionTypeAttributesDeleted => 'Atributai ištrinti';

  @override
  String get actionTypeRpcCall => 'RPC iškvietimas';

  @override
  String get actionTypeCredentialsUpdated => 'Prisijungimo duomenys atnaujinti';

  @override
  String get actionTypeAssignedToCustomer => 'Priskirta klientui';

  @override
  String get actionTypeUnassignedFromCustomer => 'Atsieta nuo kliento';

  @override
  String get actionTypeActivated => 'Aktyvuota';

  @override
  String get actionTypeSuspended => 'Sustabdyta';

  @override
  String get actionTypeCredentialsRead => 'Prisijungimo duomenys nuskaityti';

  @override
  String get actionTypeAttributesRead => 'Atributai nuskaityti';

  @override
  String get actionTypeRelationAddOrUpdate => 'Ryšys pridėtas arba atnaujintas';

  @override
  String get actionTypeRelationDeleted => 'Ryšys ištrintas';

  @override
  String get actionTypeRelationsDeleted => 'Visi ryšiai ištrinti';

  @override
  String get actionTypeAlarmAck => 'Įspėjimas patvirtintas';

  @override
  String get actionTypeAlarmClear => 'Įspėjimas išvalytas';

  @override
  String get actionTypeAlarmDelete => 'Įspėjimas ištrintas';

  @override
  String get actionTypeAlarmAssigned => 'Įspėjimas priskirtas';

  @override
  String get actionTypeAlarmUnassigned => 'Įspėjimas atsietas';

  @override
  String get actionTypeLogin => 'Prisijungimas';

  @override
  String get actionTypeLogout => 'Atsijungimas';

  @override
  String get actionTypeLockout => 'Užblokuotas';

  @override
  String get actionTypeAssignedFromTenant => 'Priskirta iš nuomininko';

  @override
  String get actionTypeAssignedToTenant => 'Priskirta nuomininkui';

  @override
  String get actionTypeProvisionSuccess => 'Įrenginys paruoštas';

  @override
  String get actionTypeProvisionFailure => 'Įrenginio paruošimas nepavyko';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrija atnaujinta';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrija ištrinta';

  @override
  String get actionTypeAssignedToEdge => 'Priskirta Edge egzemplioriui';

  @override
  String get actionTypeUnassignedFromEdge => 'Atsieta nuo Edge egzemplioriaus';

  @override
  String get actionTypeAddedComment => 'Komentaras pridėtas';

  @override
  String get actionTypeUpdatedComment => 'Komentaras atnaujintas';

  @override
  String get actionTypeDeletedComment => 'Komentaras ištrintas';

  @override
  String get actionTypeSmsSent => 'SMS išsiųsta';

  @override
  String get actionTypeAddedToEntityGroup => 'Pridėta prie subjektų grupės';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Pašalinta iš subjektų grupės';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'REST API taisyklių variklio iškvietimas';

  @override
  String get actionTypeMadePublic => 'Padaryta viešu';

  @override
  String get actionTypeMadePrivate => 'Padaryta privačiu';

  @override
  String get actionTypeChangeOwner => 'Savininkas pakeistas';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Neturite leidimų atlikti šio veiksmo!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Panašu, kad jūsų leidimų nepakanka šiam veiksmui atlikti';

  @override
  String get isRequiredText => 'yra privalomas laukas.';

  @override
  String get no2faProvidersFound => '2FA tiekėjų nerasta';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Susisiekite su sistemos administratoriumi';

  @override
  String errorOccured(Object e) {
    return 'Įvyko klaida: $e';
  }

  @override
  String get unsavedChanges => 'Neišsaugoti pakeitimai';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Turite neišsaugotų pakeitimų. Ar tikrai norite palikti šį puslapį?';

  @override
  String get deleteAccount => 'Ištrinti paskyrą';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Ar tikrai? Ketinate ištrinti savo paskyrą ($authority).';
  }

  @override
  String get language => 'Kalba';

  @override
  String get metricUnitSystem => 'Metrinė';

  @override
  String get imperialUnitSystem => 'Imperinė';

  @override
  String get hybridUnitSystem => 'Hibridinė';

  @override
  String get autoUnitSystem => 'Automatinė';

  @override
  String get languageAuto => 'Automatinė';

  @override
  String get unitSystem => 'Matavimo sistema';

  @override
  String get selectCountry => 'Pasirinkite šalį';

  @override
  String get hideHomeDashboardToolbar =>
      'Slėpti pagrindinio skydelio įrankių juostą';

  @override
  String get phoneNumberHelperText =>
      'Telefono numeris E.164 formatu, pvz., +1201550123';

  @override
  String get homeDashboard => 'Pagrindinis skydelis';

  @override
  String get security => 'Saugumas';

  @override
  String get twofactorAuthentication => 'Dviejų veiksnių autentifikavimas';

  @override
  String get verificationRequired => 'Reikalingas patvirtinimas';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Dviejų veiksnių autentifikavimas yra privalomas';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Nustatykite patvirtinimo būdą, kad galėtumėte tęsti prisijungimą';

  @override
  String get setUpAVerificationMethod => 'Nustatyti patvirtinimo būdą';

  @override
  String get totpSetupSuccessDescription =>
      'Kitą kartą prisijungdami turėsite pateikti dviejų veiksnių autentifikavimo kodą';

  @override
  String get smsSetupSuccessDescription =>
      'Kai kitą kartą prisijungsite, būsite paprašyti įvesti saugos kodą, kuris bus išsiųstas į telefono numerį';

  @override
  String get emailSetupSuccessDescription =>
      'Kai kitą kartą prisijungsite, būsite paprašyti įvesti saugos kodą, kuris bus išsiųstas į jūsų el. pašto adresą';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Kitą kartą prisijungdami dviejų veiksnių autentifikavimui galėsite naudoti atsarginius kodus';

  @override
  String get loginToApp => 'Prisijungti prie programėlės';

  @override
  String get goBack => 'Grįžti';

  @override
  String get done => 'Atlikta';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Taip jūsų paskyra taps mažiau saugi';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Ar tikrai norite išjungti autentifikavimo būdą „$providerName“?';
  }

  @override
  String get yesDeactivate => 'Taip, išjungti';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Įveskite el. pašto adresą, kurį naudosite kaip autentifikatorių.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Įveskite telefono numerį, kurį naudosite kaip autentifikatorių';

  @override
  String get sendCode => 'Siųsti kodą';

  @override
  String get copy => 'Kopijuoti';

  @override
  String get copiedToClipboard => 'Nukopijuota į iškarpinę';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Įveskite 6 skaitmenų kodą';

  @override
  String digitsCode(int count) {
    return '$count skaitmenų kodas';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Nukopijuokite 32 simbolių raktą į autentifikavimo programėlę arba nuskaitykite žemiau esantį QR kodą';

  @override
  String get applyChanges => 'Pritaikyti pakeitimus';

  @override
  String get discardChanges => 'Atsisakyti pakeitimų';

  @override
  String get yesDiscard => 'Taip, atsisakyti';

  @override
  String get thisActionCannotBeUndone => 'Šio veiksmo negalima anuliuoti';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Dviejų veiksnių autentifikavimas apsaugo jūsų paskyrą nuo neteisėtos prieigos. Prisijungdami turėsite įvesti saugos kodą.';

  @override
  String get calculatedField => 'Apskaičiuotas laukas';

  @override
  String get apiKey => 'API raktas';

  @override
  String get aiModel => 'DI modelis';

  @override
  String get adminSettings => 'Administratoriaus nustatymai';

  @override
  String get job => 'Užduotis';

  @override
  String get mobileAppBundle => 'Mobilusis paketas';

  @override
  String get mobileApp => 'Mobilioji programėlė';

  @override
  String get domain => 'Domenas';

  @override
  String get oauth2Client => 'OAuth 2.0 klientas';

  @override
  String get queueStats => 'Eilės statistika';

  @override
  String get phoneIsRequired => 'Telefonas yra privalomas';

  @override
  String get phoneIsInvalid => 'Neteisingas telefono numeris';

  @override
  String get addVerificationMethod => 'Pridėti patvirtinimo būdą';

  @override
  String get imageSavedToGallery =>
      'Išsaugota platformos paveikslėlių galerijoje';

  @override
  String get failedToSaveImage => 'Nepavyko išsaugoti paveikslėlio';

  @override
  String nSelected(int count) {
    return 'Pasirinkta: $count';
  }

  @override
  String get selectAll => 'Pasirinkti visus įkeltus';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nepavyko atlikti $count operacijų',
      few: 'Nepavyko atlikti $count operacijų',
      one: 'Nepavyko atlikti $count operacijos',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinti $count pranešimų?',
      few: 'Ištrinti $count pranešimus?',
      one: 'Ištrinti $count pranešimą?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pažymėti $count pranešimų kaip skaitytų?',
      few: 'Pažymėti $count pranešimus kaip skaitytus?',
      one: 'Pažymėti $count pranešimą kaip skaitytą?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Gaunami duomenys iš jūsų serverio $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Jungiama prie serverio $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Perjungiama į naują serverį $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Nepavyko gauti prisijungimo žetono iš $host. Nuskaitykite naują QR kodą.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Nepavyko prisijungti prie $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host nėra ThingsBoard serveris';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR kodo sesija nebegalioja. Atnaujinkite QR kodą ir nuskaitykite dar kartą.';

  @override
  String get openThisLinkTitle => 'Atidaryti šią nuorodą?';

  @override
  String get linkOpensSignInPage =>
      'Ši nuoroda atidaro šio serverio prisijungimo puslapį. Jūs būsite atjungti nuo dabartinio serverio.';

  @override
  String get linkOpensSignInPageOnly =>
      'Ši nuoroda atidaro šio serverio prisijungimo puslapį.';

  @override
  String linkSignsInAs(Object email) {
    return 'Ši nuoroda prijungia jus prie šio serverio kaip $email.';
  }

  @override
  String get linkSignsIn => 'Ši nuoroda prijungia jus prie šio serverio.';

  @override
  String get serverConnectionNotSecure =>
      'Šis serveris nenaudoja saugaus ryšio.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Ši programėlė veikia tik su savo serveriu ir negali atidaryti šios nuorodos.';

  @override
  String get liveTrackingActive => 'Vietos sekimas realiuoju laiku';

  @override
  String get liveTrackingPaused => 'Sekimas realiuoju laiku pristabdytas';

  @override
  String get liveTrackingFixes => 'Padėtys';

  @override
  String get liveTrackingSaved => 'Išsaugota';

  @override
  String get liveTrackingErrors => 'Klaidos';

  @override
  String get liveTrackingStop => 'Sustabdyti';

  @override
  String get liveTrackingPause => 'Pristabdyti';

  @override
  String get liveTrackingResume => 'Tęsti';

  @override
  String get liveTrackingHide => 'Slėpti';

  @override
  String get liveTrackingSessionTitle => 'Vietos sekimas realiuoju laiku';

  @override
  String get liveTrackingTarget => 'Išsaugoti vietą subjekte';

  @override
  String get liveTrackingDashboard => 'Skydelis';

  @override
  String get liveTrackingStatus => 'Būsena';

  @override
  String get liveTrackingStarted => 'Pradžios laikas';

  @override
  String get liveTrackingLastFix => 'Paskutinė padėtis';

  @override
  String get liveTrackingLastError => 'Paskutinė klaida';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Nepavyko išsaugoti į šį subjektą – jo nebėra. Sekimas tęsiamas; atnaujinkite tikslinį subjektą skydelio veiksme.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Nėra ryšio su serveriu. Šios padėtys nebuvo išsaugotos – išsaugojimas bus tęsiamas, kai vėl prisijungsite prie interneto.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Jūsų sesija baigėsi. Prisijunkite dar kartą, kad būtų toliau išsaugoma vieta.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Nepavyko išsaugoti į šį subjektą – neturite leidimo. Sekimas tęsiamas; paprašykite administratoriaus suteikti prieigą.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Nepavyko išsaugoti šios padėties serveryje. Išsaugoti bus bandoma su kita padėtimi.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Šiame įrenginyje vietos nustatymo paslaugos yra išjungtos.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Leidimas naudoti vietą buvo atmestas.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Leidimas naudoti vietą atmestas visam laikui. Įjunkite jį programėlės nustatymuose.';

  @override
  String get liveTrackingErrorLocation => 'Nepavyko nustatyti vietos.';

  @override
  String get liveTrackingMenuTitle => 'Vietos sekimas realiuoju laiku';

  @override
  String get liveTrackingNoRecord =>
      'Nėra aktyvaus sekimo ir nėra naujausios sesijos.';

  @override
  String get liveTrackingLastSession => 'Paskutinė sesija';

  @override
  String get liveTrackingStartAgain => 'Pradėti iš naujo';

  @override
  String get liveTrackingEnded => 'Pabaigos laikas';

  @override
  String get liveTrackingEndReason => 'Pabaigos priežastis';

  @override
  String get liveTrackingEndReasonManual => 'Sustabdyta rankiniu būdu';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Pasiekta maks. trukmė';

  @override
  String get liveTrackingEndReasonInterrupted => 'Nutraukta';

  @override
  String get serverUpdateRequired => 'Reikia atnaujinti serverį';

  @override
  String get backToLogin => 'Grįžti į prisijungimą';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Ši programėlė veikia su ThingsBoard $minVersion arba naujesne versija.';
  }

  @override
  String get serverLabel => 'Serveris';

  @override
  String get versionLabel => 'Versija';

  @override
  String get askAdminToUpdateServer =>
      'Paprašykite serverio administratoriaus atnaujinti serverį.';

  @override
  String get deviceClaimFailed =>
      'Nepavyko perimti įrenginio. Bandykite dar kartą.';

  @override
  String get deviceToClaimNotFound =>
      'Įrenginys nerastas. Susisiekite su įrenginio tiekėju.';

  @override
  String get enableAuthenticatorApp => 'Įjungti autentifikavimo programėlę';

  @override
  String get enableSmsAuthenticator => 'Įjungti SMS autentifikatorių';

  @override
  String get enableEmailAuthenticator => 'Įjungti el. pašto autentifikatorių';

  @override
  String get getBackupCode => 'Gauti atsarginį kodą';

  @override
  String get twoFaTotpDescription =>
      'Autentifikavimui naudokite telefone įdiegtas programėles, tokias kaip Google Authenticator, Authy ar Duo. Jos sugeneruos prisijungimo saugos kodą.';

  @override
  String get twoFaSmsDescription =>
      'Naudokite savo telefoną autentifikavimui. Prisijungiant išsiųsime jums saugos kodą SMS žinute.';

  @override
  String get twoFaEmailDescription =>
      'Naudokite saugos kodą, išsiųstą į jūsų el. pašto adresą, kad autentifikuotumėtės.';

  @override
  String get twoFaBackupCodeDescription =>
      'Šie vienkartiniai spausdinami kodai leidžia prisijungti, kai neturite prieigos prie telefono, pavyzdžiui, keliaujant.';

  @override
  String get openInAuthenticatorApp => 'Atidaryti autentifikavimo programėlėje';

  @override
  String get noAuthenticatorAppFound =>
      'Autentifikavimo programėlė nerasta. Vietoj to nukopijuokite raktą į savo programėlę.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Įjungta: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Jūsų administratorius reikalauja dviejų veiksnių autentifikavimo paskyrai $email.';
  }

  @override
  String get recommended => 'Rekomenduojama';

  @override
  String get addBackupCodesHint =>
      'Taip pat pridėkite atsarginius kodus, kad galėtumėte prisijungti praradę telefoną.';

  @override
  String get totpSecretKey => 'Slaptasis raktas';

  @override
  String get backupCodesDescription =>
      'Atsispausdinkite kodus, kad jie būtų po ranka, kai prireiks jais prisijungti prie savo paskyros. Kiekvieną atsarginį kodą galite naudoti vieną kartą.';

  @override
  String get backupCodesWarning =>
      'Kai išeisite iš šio puslapio, šių kodų nebebus galima parodyti dar kartą. Išsaugokite juos saugioje vietoje naudodami toliau pateiktas parinktis.';

  @override
  String get downloadTxt => 'Atsisiųsti (txt)';
}

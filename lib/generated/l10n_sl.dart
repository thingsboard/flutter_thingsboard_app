// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class SSl extends S {
  SSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Domov';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Naprave',
      one: 'Naprava',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Več';

  @override
  String get customers => 'Stranke';

  @override
  String get assets => 'Sredstva';

  @override
  String get tenants => 'Najemniki';

  @override
  String get auditLogs => 'Revizijski dnevniki';

  @override
  String get noCustomersFound => 'Ni najdenih strank';

  @override
  String get noAssetsFound => 'Ni najdenih sredstev';

  @override
  String get noTenantsFound => 'Ni najdenih najemnikov';

  @override
  String get noDevicesFound => 'Ni najdenih naprav';

  @override
  String get noAuditLogsFound => 'Ni najdenih revizijskih dnevnikov';

  @override
  String get logout => 'Odjava';

  @override
  String get login => 'Prijava';

  @override
  String get logoDefaultValue => 'Logotip ThingsBoard';

  @override
  String get loginToYourAccount => 'Prijavite se v svoj račun';

  @override
  String get email => 'E-pošta';

  @override
  String get emailRequireText => 'E-pošta je obvezna.';

  @override
  String get emailInvalidText => 'Neveljavna oblika e-poštnega naslova.';

  @override
  String get username => 'uporabniško ime';

  @override
  String get password => 'Geslo';

  @override
  String get passwordRequireText => 'Geslo je obvezno.';

  @override
  String get passwordForgotText => 'Ste pozabili geslo?';

  @override
  String get passwordReset => 'Ponastavi geslo';

  @override
  String get passwordResetText =>
      'Vnesite e-pošto, povezano z vašim računom, in poslali vam bomo sporočilo s povezavo za ponastavitev gesla';

  @override
  String get requestPasswordReset => 'Zahtevaj ponastavitev gesla';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Povezava za ponastavitev gesla je bila uspešno poslana!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Povezava za preverjanje e-pošte je bila uspešno poslana!';

  @override
  String get or => 'ALI';

  @override
  String get no => 'Ne';

  @override
  String get yes => 'Da';

  @override
  String get title => 'Naslov';

  @override
  String get country => 'Država';

  @override
  String get city => 'Mesto';

  @override
  String get stateOrProvince => 'Regija / pokrajina';

  @override
  String get postalCode => 'Poštna številka';

  @override
  String get address => 'Naslov';

  @override
  String get address2 => 'Naslov 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Ponastavi alarm';

  @override
  String get alarmClearText =>
      'Ali ste prepričani, da želite ponastaviti alarm?';

  @override
  String get alarmAcknowledgeTitle => 'Potrdi alarm';

  @override
  String get alarmAcknowledgeText =>
      'Ali ste prepričani, da želite potrditi alarm?';

  @override
  String get assetName => 'Ime sredstva';

  @override
  String get type => 'Vrsta';

  @override
  String get label => 'Oznaka';

  @override
  String get assignedToCustomer => 'Dodeljeno stranki';

  @override
  String get auditLogDetails => 'Podrobnosti revizijskega dnevnika';

  @override
  String get customerDetails => 'Podrobnosti stranke';

  @override
  String get assetDetails => 'Podrobnosti sredstva';

  @override
  String get tenantDetails => 'Podrobnosti najemnika';

  @override
  String get entityType => 'Vrsta entitete';

  @override
  String get actionData => 'Podatki o dejanju';

  @override
  String get failureDetails => 'Podrobnosti napake';

  @override
  String get allDevices => 'Vse naprave';

  @override
  String get active => 'Aktiven';

  @override
  String get inactive => 'Neaktiven';

  @override
  String get activeDevices => 'Aktivne';

  @override
  String get inactiveDevices => 'Neaktivne';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktiven, potrjen';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktiven, nepotrjen';

  @override
  String get alarmStatusClearedAcknowledged => 'Ponastavljen, potrjen';

  @override
  String get alarmStatusClearedUnacknowledged => 'Ponastavljen, nepotrjen';

  @override
  String get alarmStatusFilterActive => 'Aktiven';

  @override
  String get systemAdministrator => 'Sistemski administrator';

  @override
  String get tenantAdministrator => 'Skrbnik najemnika';

  @override
  String get customer => 'Stranka';

  @override
  String get changePassword => 'Spremeni geslo';

  @override
  String get currentPasswordRequireText => 'Trenutno geslo je obvezno.';

  @override
  String get currentPassword => 'Trenutno geslo';

  @override
  String get newPasswordRequireText => 'Novo geslo je obvezno.';

  @override
  String get newPassword => 'Novo geslo';

  @override
  String get newPassword2RequireText => 'Ponovitev novega gesla je obvezna.';

  @override
  String get newPassword2 => 'Potrdite novo geslo';

  @override
  String get passwordErrorNotification => 'Vneseni gesli se morata ujemati!';

  @override
  String get firstNameUpper => 'Ime';

  @override
  String get lastNameUpper => 'Priimek';

  @override
  String get profileSuccessNotification => 'Profil je bil uspešno posodobljen';

  @override
  String get passwordSuccessNotification => 'Geslo je bilo uspešno spremenjeno';

  @override
  String get notImplemented => 'Ni implementirano!';

  @override
  String get listIsEmptyText => 'Seznam je trenutno prazen.';

  @override
  String get tryAgain => 'Poskusi znova';

  @override
  String get verifyYourIdentity => 'Preverite identiteto';

  @override
  String get continueText => 'Nadaljuj';

  @override
  String get resendCode => 'Ponovno pošlji kodo';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekund',
      few: '$time sekunde',
      two: '$time sekundi',
      one: '$time sekundo',
    );
    return 'Ponovno pošlji kodo čez $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Vnesite varnostno kodo iz aplikacije za avtentikacijo.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Varnostna koda je bila poslana na vašo telefonsko številko $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Varnostna koda je bila poslana na vaš e-poštni naslov $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Vnesite eno od rezervnih kod.';

  @override
  String get toptAuthPlaceholder => 'Koda';

  @override
  String get smsAuthPlaceholder => 'Koda SMS';

  @override
  String get emailAuthPlaceholder => 'E-poštna koda';

  @override
  String get backupCodeAuthPlaceholder => 'Rezervna koda';

  @override
  String get verificationCodeIncorrect => 'Koda za preverjanje je napačna';

  @override
  String get verificationCodeManyRequest => 'Preveč zahtev za preverjanje kode';

  @override
  String get tryAnotherWay => 'Poskusite drug način';

  @override
  String get selectWayToVerify => 'Izberite način preverjanja';

  @override
  String get mfaProviderTopt => 'Aplikacija za avtentikacijo';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-pošta';

  @override
  String get mfaProviderBackupCode => 'Rezervna koda';

  @override
  String get newUserText => 'Nov uporabnik?';

  @override
  String get createAccount => 'Ustvari račun';

  @override
  String get emailVerification => 'Preverjanje e-pošte';

  @override
  String get emailVerificationSentText =>
      'E-pošta s podrobnostmi za preverjanje je bila poslana na navedeni e-poštni naslov ';

  @override
  String get emailVerificationInstructionsText =>
      'Za dokončanje registracije sledite navodilom v e-poštnem sporočilu. Opomba: če e-poštnega sporočila dalj časa ne prejmete, preverite mapo »Neželena pošta« ali ga poskusite poslati znova s klikom gumba »Pošlji znova«.';

  @override
  String get resend => 'Pošlji znova';

  @override
  String get activatingAccount => 'Aktiviranje računa...';

  @override
  String get accountActivated => 'Račun je bil uspešno aktiviran!';

  @override
  String get emailVerified => 'E-pošta preverjena';

  @override
  String get activatingAccountText =>
      'Vaš račun se trenutno aktivira.\nPočakajte...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Čestitamo!\nVaš račun $appTitle je bil aktiviran.\nZdaj se lahko prijavite v svoj prostor $appTitle.';
  }

  @override
  String get privacyPolicy => 'Pravilnik o zasebnosti';

  @override
  String get cancel => 'Prekliči';

  @override
  String get accept => 'Sprejmi';

  @override
  String get termsOfUse => 'Pogoji uporabe';

  @override
  String get firstName => 'Ime';

  @override
  String get firstNameRequireText => 'Ime je obvezno.';

  @override
  String get lastName => 'Priimek';

  @override
  String get lastNameRequireText => 'Priimek je obvezen.';

  @override
  String get createPassword => 'Ustvarite geslo';

  @override
  String get repeatPassword => 'Ponovite geslo';

  @override
  String get imNotARobot => 'Nisem robot';

  @override
  String get signUp => 'Registracija';

  @override
  String get alreadyHaveAnAccount => 'Že imate račun?';

  @override
  String get signIn => 'Prijava';

  @override
  String get inactiveUserAlreadyExists => 'Neaktiven uporabnik že obstaja';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Uporabnik z nepreverjenim e-poštnim naslovom je že registriran.\nČe želite znova poslati e-poštno sporočilo za preverjanje, kliknite gumb »Pošlji znova«.';

  @override
  String get assignee => 'Dodeljeni uporabnik';

  @override
  String get alarmTypes => 'Vrste alarmov';

  @override
  String get details => 'Podrobnosti';

  @override
  String get status => 'Stanje';

  @override
  String get severity => 'Resnost';

  @override
  String get originator => 'Izvor';

  @override
  String get startTime => 'Začetni čas';

  @override
  String get duration => 'Trajanje';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dni',
      few: '$value dnevi',
      two: '$value dneva',
      one: '$value dan',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ur',
      few: '$value ure',
      two: '$value uri',
      one: '$value ura',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minut',
      few: '$value minute',
      two: '$value minuti',
      one: '$value minuta',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value sekund',
      few: '$value sekunde',
      two: '$value sekundi',
      one: '$value sekunda',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Prikaži nadzorno ploščo';

  @override
  String get activity => 'Aktivnost';

  @override
  String get addCommentMessage => 'Dodajte komentar...';

  @override
  String get selectUser => 'Izberi uporabnike';

  @override
  String get assignedToMe => 'Dodeljeno meni';

  @override
  String get clear => 'Ponastavi';

  @override
  String get acknowledge => 'Potrdi';

  @override
  String get edit => 'Uredi';

  @override
  String get delete => 'Izbriši';

  @override
  String get edited => 'Urejeno';

  @override
  String get deleteComment => 'Izbriši komentar';

  @override
  String get areYouSure => 'Ali ste prepričani?';

  @override
  String get noResultsFound => 'Ni rezultatov';

  @override
  String get tryRefiningYourQuery =>
      'Poskusite natančneje opredeliti poizvedbo';

  @override
  String get failedToLoadTheList => 'Nalaganje seznama ni uspelo';

  @override
  String get tryRefreshing => 'Poskusite osvežiti';

  @override
  String get refresh => 'Osveži';

  @override
  String get users => 'Uporabniki';

  @override
  String get unassigned => 'Ni dodeljeno';

  @override
  String get failedToLoadAlarmDetails =>
      'Nalaganje podrobnosti alarma ni uspelo';

  @override
  String get somethingWentWrong => 'Nekaj je šlo narobe';

  @override
  String get chooseRegion => 'Izberite regijo';

  @override
  String get selectRegion => 'Izberite regijo';

  @override
  String get northAmerica => 'Severna Amerika';

  @override
  String get europe => 'Evropa';

  @override
  String get northAmericaRegionShort => 'S. Virginija';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Seznam naprav';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nadzorne plošče',
      one: 'Nadzorna plošča',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Potrebna je posodobitev';

  @override
  String updateTo(Object version) {
    return 'Posodobi na $version';
  }

  @override
  String get next => 'Naprej';

  @override
  String get confirmation => 'Potrditev';

  @override
  String get wifiPassword => 'Geslo za Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Za nadaljevanje nastavitve naprave $deviceName vnesite poverilnice svojega omrežja.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Vnesite geslo za $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Naprav ni mogoče najti. Prepričajte se, da je Bluetooth v telefonu vklopljen in da je telefon v dosegu nove naprave.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Za nadaljevanje nimate dovolj dovoljenj za »$permissions«. Dodelite zahtevana dovoljenja in tapnite »Poskusi znova«.';
  }

  @override
  String get sendingWifiCredentials => 'Pošiljanje poverilnic za Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Potrjevanje povezave Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Naprava je uspešno pripravljena';

  @override
  String get returnToDashboard => 'Nazaj na nadzorno ploščo';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Seje z napravo »$deviceName« ni mogoče vzpostaviti. Poskusite znova';
  }

  @override
  String get claimingDevice => 'Prevzemanje naprave';

  @override
  String get claimingDeviceDone => 'Prevzem naprave končan';

  @override
  String get claimingMessageSuccess => 'Naprava je bila\nuspešno prevzeta';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Za nadaljevanje nimate dovolj dovoljenj za »$permissions«. Odprite nastavitve aplikacije, dodelite dovoljenja in tapnite »Poskusi znova«.';
  }

  @override
  String get scanACode => 'Skeniraj kodo';

  @override
  String get allowAccess => 'Dovoli dostop';

  @override
  String get toggleCamera => 'Preklopi kamero';

  @override
  String get toggleFlash => 'Preklopi bliskavico';

  @override
  String get unableToUseCamera => 'Kamere ni mogoče uporabiti';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Za nadaljevanje odprite nastavitve in dovolite dostop do kamere';

  @override
  String get notFound => 'Ni najdeno';

  @override
  String routeNotDefined(Object name) {
    return 'Pot ni določena: $name';
  }

  @override
  String get loginWith => 'Prijava z';

  @override
  String get scanQrCode => 'Skeniraj kodo QR';

  @override
  String get anEmptyRequestDataReceived =>
      'Prejeti so bili prazni podatki zahteve.';

  @override
  String get somethingWentWrongRollback => 'Nekaj je šlo narobe ... Povrni';

  @override
  String get searchResults => 'Rezultati iskanja';

  @override
  String get viewAll => 'Prikaži vse';

  @override
  String get requestedEntityDoesNotExists => 'Zahtevana entiteta ne obstaja.';

  @override
  String get noAlarmsFound => 'Ni najdenih alarmov';

  @override
  String get filters => 'Filtri';

  @override
  String get alarmStatusList => 'Seznam stanj alarmov';

  @override
  String get alarmSeverityList => 'Seznam resnosti alarmov';

  @override
  String get cleared => 'Ponastavljen';

  @override
  String get acknowledged => 'Potrjen';

  @override
  String get unacknowledged => 'Nepotrjen';

  @override
  String get critical => 'Kritična';

  @override
  String get major => 'Visoka';

  @override
  String get minor => 'Nizka';

  @override
  String get warning => 'Opozorilna';

  @override
  String get indeterminate => 'Nedoločena';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Iskanje uporabnikov',
      one: 'Iskanje uporabnika',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Ponastavi';

  @override
  String get update => 'Posodobi';

  @override
  String get alarmTypeList => 'Seznam vrst alarmov';

  @override
  String get anyType => 'Katera koli vrsta';

  @override
  String get plusAlarmType => '+ Vrsta alarma';

  @override
  String get all => 'Vse';

  @override
  String get unread => 'Neprebrano';

  @override
  String get close => 'Zapri';

  @override
  String get codeVerificationFailed => 'Preverjanje kode ni uspelo!';

  @override
  String get fatalError => 'Usodna napaka';

  @override
  String get unknownError => 'Neznana napaka.';

  @override
  String get sessionExpired => 'Seja je potekla';

  @override
  String get fatalApplicationErrorOccurred =>
      'Prišlo je do usodne napake aplikacije:';

  @override
  String get connectionError => 'Napaka povezave';

  @override
  String get failedToConnectToServer => 'Povezava s strežnikom ni uspela';

  @override
  String get retry => 'Poskusi znova';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilna nadzorna plošča mora biti nastavljena v profilu naprave!';

  @override
  String get openWifiSettings => 'Odpri nastavitve Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Povežite se z Wi-Fi omrežjem, ki ga običajno uporabljate';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Vrnite se v aplikacijo in tapnite gumb »Pripravljeno«';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Sledite naslednjim korakom, da telefon\nponovno povežete s svojim običajnim Wi-Fi omrežjem';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Potisna obvestila niso nastavljena.\nObrnite se na sistemskega administratorja.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase ni nastavljen.\n Za navodila glejte uradno dokumentacijo Firebase.';

  @override
  String get markAllAsRead => 'Označi vse kot prebrano';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Povezave ni mogoče odpreti: $link';
  }

  @override
  String get noDashboardsFound => 'Ni najdenih nadzornih plošč';

  @override
  String get openAppSettings => 'Odpri nastavitve aplikacije';

  @override
  String get connectingToDevice => 'Povezovanje z napravo';

  @override
  String get connectToDevice => 'Poveži se z napravo';

  @override
  String get selectWifiNetwork => 'Izberite Wi-Fi omrežje';

  @override
  String get deviceProvisioning => 'Priprava naprav';

  @override
  String get permissions => 'Dovoljenja';

  @override
  String get unableConnectToDevice => 'Povezava z napravo ni mogoča';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Naprava v bližini ne najde omrežja Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Povezava z Wi-Fi omrežjem $name ni uspela.\nPrepričajte se, da je vaš telefon povezan z Wi-Fi omrežjem naprave in da je za to aplikacijo v nastavitvah telefona omogočen dostop do lokalnega omrežja.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Povezava z Wi-Fi ni mogoča, ker naprava $name ni našla omrežij';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Sledite naslednjim korakom za povezavo telefona z napravo';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Povežite se z Wi-Fi, podobnim $wifiName';
  }

  @override
  String get ready => 'Pripravljeno';

  @override
  String get exitDeviceProvisioning => 'Zapri pripravo naprave';

  @override
  String get noNotificationsFound => 'Ni najdenih obvestil';

  @override
  String get markAsRead => 'Označi kot prebrano';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Skenirajte kodo QR na napravi';

  @override
  String get search => 'Iskanje';

  @override
  String get tenant => 'Najemnik';

  @override
  String get tenantProfile => 'Profil najemnika';

  @override
  String get user => 'Uporabnik';

  @override
  String get asset => 'Sredstvo';

  @override
  String get deviceProfile => 'Profil naprave';

  @override
  String get assetProfile => 'Profil sredstva';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmi',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Veriga pravil';

  @override
  String get ruleNode => 'Vozlišče pravil';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Pogled entitete';

  @override
  String get widgetsBundle => 'Paket gradnikov';

  @override
  String get widgetType => 'Vrsta gradnika';

  @override
  String get apiUsageState => 'Stanje uporabe API-ja';

  @override
  String get tbResource => 'Vir';

  @override
  String get otaPackage => 'Paket OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Čakalna vrsta';

  @override
  String get notificationTarget => 'Prejemnik obvestil';

  @override
  String get notificationTemplate => 'Predloga obvestila';

  @override
  String get notificationRequest => 'Zahteva za obvestilo';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Obvestila',
      one: 'Obvestilo',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Pravilo za obvestila';

  @override
  String get entityGroup => 'Skupina entitet';

  @override
  String get converter => 'Pretvornik';

  @override
  String get integration => 'Integracija';

  @override
  String get schedulerEvent => 'Dogodek razporejevalnika';

  @override
  String get blobEntity => 'Entiteta blob';

  @override
  String get role => 'Vloga';

  @override
  String get groupPermission => 'Dovoljenje skupine';

  @override
  String get actionStatusSuccess => 'Uspešno';

  @override
  String get actionStatusFailure => 'Neuspešno';

  @override
  String get actionTypeAdded => 'Dodano';

  @override
  String get actionTypeDeleted => 'Izbrisano';

  @override
  String get actionTypeUpdated => 'Posodobljeno';

  @override
  String get actionTypeAttributesUpdated => 'Atributi posodobljeni';

  @override
  String get actionTypeAttributesDeleted => 'Atributi izbrisani';

  @override
  String get actionTypeRpcCall => 'Klic RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Poverilnice posodobljene';

  @override
  String get actionTypeAssignedToCustomer => 'Dodeljeno stranki';

  @override
  String get actionTypeUnassignedFromCustomer => 'Dodelitev stranki preklicana';

  @override
  String get actionTypeActivated => 'Aktivirano';

  @override
  String get actionTypeSuspended => 'Začasno ustavljeno';

  @override
  String get actionTypeCredentialsRead => 'Poverilnice prebrane';

  @override
  String get actionTypeAttributesRead => 'Atributi prebrani';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relacija posodobljena';

  @override
  String get actionTypeRelationDeleted => 'Relacija izbrisana';

  @override
  String get actionTypeRelationsDeleted => 'Vse relacije izbrisane';

  @override
  String get actionTypeAlarmAck => 'Potrjen';

  @override
  String get actionTypeAlarmClear => 'Ponastavljen';

  @override
  String get actionTypeAlarmDelete => 'Alarm izbrisan';

  @override
  String get actionTypeAlarmAssigned => 'Alarm dodeljen';

  @override
  String get actionTypeAlarmUnassigned => 'Dodelitev alarma preklicana';

  @override
  String get actionTypeLogin => 'Prijava';

  @override
  String get actionTypeLogout => 'Odjava';

  @override
  String get actionTypeLockout => 'Zaklenitev računa';

  @override
  String get actionTypeAssignedFromTenant => 'Dodeljeno od najemnika';

  @override
  String get actionTypeAssignedToTenant => 'Dodeljeno najemniku';

  @override
  String get actionTypeProvisionSuccess => 'Naprava pripravljena';

  @override
  String get actionTypeProvisionFailure => 'Priprava naprave ni uspela';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrija posodobljena';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrija izbrisana';

  @override
  String get actionTypeAssignedToEdge => 'Dodeljeno Edge-u';

  @override
  String get actionTypeUnassignedFromEdge => 'Dodelitev Edge-u preklicana';

  @override
  String get actionTypeAddedComment => 'Komentar dodan';

  @override
  String get actionTypeUpdatedComment => 'Komentar posodobljen';

  @override
  String get actionTypeDeletedComment => 'Komentar izbrisan';

  @override
  String get actionTypeSmsSent => 'SMS poslan';

  @override
  String get actionTypeAddedToEntityGroup => 'Dodano v skupino entitet';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Odstranjeno iz skupine entitet';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Klic API-ja REST za mehanizem pravil';

  @override
  String get actionTypeMadePublic => 'Nastavljeno kot javno';

  @override
  String get actionTypeMadePrivate => 'Nastavljeno kot zasebno';

  @override
  String get actionTypeChangeOwner => 'Lastnik spremenjen';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Nimate dovoljenj za izvedbo te operacije!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Videti je, da vaša dovoljenja ne zadostujejo za izvedbo te operacije';

  @override
  String get isRequiredText => 'je obvezno polje.';

  @override
  String get no2faProvidersFound => 'Ni najdenih ponudnikov 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Obrnite se na sistemskega administratorja';

  @override
  String errorOccured(Object e) {
    return 'Prišlo je do napake: $e';
  }

  @override
  String get unsavedChanges => 'Neshranjene spremembe';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Imate neshranjene spremembe. Ali ste prepričani, da želite zapustiti to stran?';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Ali ste prepričani? Izbrisali boste svoj račun »$authority«.';
  }

  @override
  String get language => 'Jezik';

  @override
  String get metricUnitSystem => 'Metrični';

  @override
  String get imperialUnitSystem => 'Imperialni';

  @override
  String get hybridUnitSystem => 'Hibridni';

  @override
  String get autoUnitSystem => 'Samodejno';

  @override
  String get languageAuto => 'Samodejno';

  @override
  String get unitSystem => 'Sistem enot';

  @override
  String get selectCountry => 'Izberite državo';

  @override
  String get hideHomeDashboardToolbar =>
      'Skrij orodno vrstico domače nadzorne plošče';

  @override
  String get phoneNumberHelperText =>
      'Telefonska številka v zapisu E.164, npr. +1201550123';

  @override
  String get homeDashboard => 'Domača nadzorna plošča';

  @override
  String get security => 'Varnost';

  @override
  String get twofactorAuthentication => 'Dvostopenjska avtentikacija';

  @override
  String get verificationRequired => 'Potrebno je preverjanje';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Dvostopenjska avtentikacija je obvezna';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Za nadaljevanje prijave nastavite način preverjanja';

  @override
  String get setUpAVerificationMethod => 'Nastavite način preverjanja';

  @override
  String get totpSetupSuccessDescription =>
      'Ob naslednji prijavi boste morali vnesti kodo za dvostopenjsko avtentikacijo';

  @override
  String get smsSetupSuccessDescription =>
      'Ob naslednji prijavi boste morali vnesti varnostno kodo, ki bo poslana na telefonsko številko';

  @override
  String get emailSetupSuccessDescription =>
      'Ob naslednji prijavi boste morali vnesti varnostno kodo, ki bo poslana na vaš e-poštni naslov';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Ob naslednji prijavi boste lahko za dvostopenjsko avtentikacijo uporabili rezervne kode';

  @override
  String get loginToApp => 'Prijava v aplikacijo';

  @override
  String get goBack => 'Nazaj';

  @override
  String get done => 'Končano';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'S tem bo vaš račun manj varen';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Ali ste prepričani, da želite deaktivirati »$providerName«?';
  }

  @override
  String get yesDeactivate => 'Da, deaktiviraj';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Vnesite e-poštni naslov, ki ga želite uporabiti za avtentikacijo.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Vnesite telefonsko številko, ki jo želite uporabiti za avtentikacijo';

  @override
  String get sendCode => 'Pošlji kodo';

  @override
  String errorSendingCode(String error) {
    return 'Napaka pri pošiljanju kode: $error';
  }

  @override
  String get copy => 'Kopiraj';

  @override
  String get copiedToClipboard => 'Kopirano v odložišče';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Tukaj vnesite 6-mestno kodo';

  @override
  String digitsCode(int count) {
    return '$count-mestna koda';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopirajte 32-mestni ključ v aplikacijo za avtentikacijo ali skenirajte spodnjo kodo QR';

  @override
  String get applyChanges => 'Uporabi spremembe';

  @override
  String get discardChanges => 'Zavrzi spremembe';

  @override
  String get yesDiscard => 'Da, zavrzi';

  @override
  String get thisActionCannotBeUndone => 'Tega dejanja ni mogoče razveljaviti';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Dvostopenjska avtentikacija ščiti vaš račun pred nepooblaščenim dostopom. Ob prijavi morate le vnesti varnostno kodo.';

  @override
  String get calculatedField => 'Izračunano polje';

  @override
  String get apiKey => 'Ključ API';

  @override
  String get aiModel => 'Model umetne inteligence';

  @override
  String get adminSettings => 'Skrbniške nastavitve';

  @override
  String get job => 'Opravilo';

  @override
  String get mobileAppBundle => 'Paket mobilnih aplikacij';

  @override
  String get mobileApp => 'Mobilna aplikacija';

  @override
  String get domain => 'Domena';

  @override
  String get oauth2Client => 'Odjemalec OAuth 2.0';

  @override
  String get queueStats => 'Statistika čakalne vrste';

  @override
  String get phoneIsRequired => 'Telefon je obvezen';

  @override
  String get phoneIsInvalid => 'Telefon ni veljaven';

  @override
  String get addVerificationMethod => 'Dodaj način preverjanja';

  @override
  String get imageSavedToGallery => 'Shranjeno v »Galerijo slik« platforme';

  @override
  String get failedToSaveImage => 'Slike ni bilo mogoče shraniti';

  @override
  String nSelected(int count) {
    return 'Izbrano: $count';
  }

  @override
  String get selectAll => 'Izberi vse naložene';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operacij ni uspelo',
      few: '$count operacije niso uspele',
      two: '$count operaciji nista uspeli',
      one: '$count operacija ni uspela',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbriši $count obvestil?',
      few: 'Izbriši $count obvestila?',
      two: 'Izbriši $count obvestili?',
      one: 'Izbriši $count obvestilo?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Označi $count obvestil kot prebranih?',
      few: 'Označi $count obvestila kot prebrana?',
      two: 'Označi $count obvestili kot prebrani?',
      one: 'Označi $count obvestilo kot prebrano?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Pridobivanje podatkov z gostitelja $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Prijavljanje v gostitelja $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Preklop na novega gostitelja $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Žetona za prijavo z gostitelja $host ni bilo mogoče pridobiti. Skenirajte novo kodo QR.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Povezava z gostiteljem $host ni uspela';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host ni strežnik ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Seja kode QR ni več veljavna. Osvežite kodo QR in jo znova skenirajte.';

  @override
  String get openThisLinkTitle => 'Odpri to povezavo?';

  @override
  String get linkOpensSignInPage =>
      'Ta povezava odpre stran za prijavo tega strežnika. Odjavljeni boste s trenutnega strežnika.';

  @override
  String get linkOpensSignInPageOnly =>
      'Ta povezava odpre stran za prijavo tega strežnika.';

  @override
  String linkSignsInAs(Object email) {
    return 'S to povezavo se v ta strežnik prijavite kot $email.';
  }

  @override
  String get linkSignsIn => 'S to povezavo se prijavite v ta strežnik.';

  @override
  String get serverConnectionNotSecure =>
      'Ta strežnik ne uporablja varne povezave.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Ta aplikacija deluje samo s svojim strežnikom in te povezave ne more odpreti.';

  @override
  String get liveTrackingActive => 'Sledenje lokaciji v živo';

  @override
  String get liveTrackingPaused => 'Sledenje v živo je začasno ustavljeno';

  @override
  String get liveTrackingFixes => 'Položaji';

  @override
  String get liveTrackingSaved => 'Shranjeno';

  @override
  String get liveTrackingErrors => 'Napake';

  @override
  String get liveTrackingStop => 'Ustavi';

  @override
  String get liveTrackingPause => 'Začasno ustavi';

  @override
  String get liveTrackingResume => 'Nadaljuj';

  @override
  String get liveTrackingHide => 'Skrij';

  @override
  String get liveTrackingSessionTitle => 'Sledenje lokaciji v živo';

  @override
  String get liveTrackingTarget => 'Shrani lokacijo v entiteto';

  @override
  String get liveTrackingDashboard => 'Nadzorna plošča';

  @override
  String get liveTrackingStatus => 'Stanje';

  @override
  String get liveTrackingStarted => 'Začetni čas';

  @override
  String get liveTrackingLastFix => 'Zadnji položaj';

  @override
  String get liveTrackingLastError => 'Zadnja napaka';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Shranjevanje v to entiteto ni mogoče — ne obstaja več. Sledenje se nadaljuje; posodobite cilj v dejanju nadzorne plošče.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Ni povezave s strežnikom. Ti položaji niso bili shranjeni — shranjevanje se nadaljuje, ko boste spet povezani.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Vaša seja se je končala. Znova se prijavite, da se bo lokacija še naprej shranjevala.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Shranjevanje v to entiteto ni mogoče — nimate dovoljenja. Sledenje se nadaljuje; prosite skrbnika za dostop.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Tega položaja ni bilo mogoče shraniti na strežnik. Shranjevanje se znova poskusi z naslednjim položajem.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Lokacijske storitve so na tej napravi izklopljene.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Dovoljenje za lokacijo je bilo zavrnjeno.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Dovoljenje za lokacijo je trajno zavrnjeno. Omogočite ga v nastavitvah aplikacije.';

  @override
  String get liveTrackingErrorLocation =>
      'Določitve lokacije ni bilo mogoče pridobiti.';

  @override
  String get liveTrackingMenuTitle => 'Sledenje lokaciji v živo';

  @override
  String get liveTrackingNoRecord =>
      'Ni aktivnega sledenja in ni nedavne seje.';

  @override
  String get liveTrackingLastSession => 'Zadnja seja';

  @override
  String get liveTrackingStartAgain => 'Začni znova';

  @override
  String get liveTrackingEnded => 'Končni čas';

  @override
  String get liveTrackingEndReason => 'Razlog zaključka';

  @override
  String get liveTrackingEndReasonManual => 'Ročno ustavljeno';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Doseženo najdaljše trajanje';

  @override
  String get liveTrackingEndReasonInterrupted => 'Prekinjeno';

  @override
  String get serverUpdateRequired => 'Zahtevana je posodobitev strežnika';

  @override
  String get backToLogin => 'Nazaj na prijavo';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Ta aplikacija deluje s platformo ThingsBoard različice $minVersion ali novejše.';
  }

  @override
  String get serverLabel => 'Strežnik';

  @override
  String get versionLabel => 'Različica';

  @override
  String get askAdminToUpdateServer =>
      'Prosite skrbnika strežnika, naj posodobi strežnik.';

  @override
  String get deviceClaimFailed =>
      'Naprave ni bilo mogoče prevzeti. Poskusite znova.';

  @override
  String get deviceToClaimNotFound =>
      'Naprava ni bila najdena. Obrnite se na ponudnika naprave.';

  @override
  String get enableAuthenticatorApp => 'Omogoči aplikacijo za avtentikacijo';

  @override
  String get enableSmsAuthenticator => 'Omogoči avtentikacijo prek SMS-a';

  @override
  String get enableEmailAuthenticator => 'Omogoči avtentikacijo prek e-pošte';

  @override
  String get getBackupCode => 'Pridobi rezervno kodo';

  @override
  String get twoFaTotpDescription =>
      'Za avtentikacijo uporabite aplikacijo v telefonu, na primer Google Authenticator, Authy ali Duo. Ustvarila bo varnostno kodo za prijavo.';

  @override
  String get twoFaSmsDescription =>
      'Za avtentikacijo uporabite telefon. Ob prijavi vam bomo poslali varnostno kodo v sporočilu SMS.';

  @override
  String get twoFaEmailDescription =>
      'Za avtentikacijo uporabite varnostno kodo, poslano na vaš e-poštni naslov.';

  @override
  String get twoFaBackupCodeDescription =>
      'Te natisljive enkratne kode vam omogočajo prijavo, ko pri sebi nimate telefona, na primer na potovanju.';

  @override
  String get openInAuthenticatorApp => 'Odpri v aplikaciji za avtentikacijo';

  @override
  String get noAuthenticatorAppFound =>
      'Aplikacije za avtentikacijo ni bilo mogoče najti. Ključ raje kopirajte v svojo aplikacijo.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Omogočeno: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Vaš skrbnik zahteva dvostopenjsko avtentikacijo za $email.';
  }

  @override
  String get recommended => 'Priporočeno';

  @override
  String get addBackupCodesHint =>
      'Dodajte tudi rezervne kode, da se boste lahko prijavili, tudi če izgubite telefon.';

  @override
  String get totpSecretKey => 'Skrivni ključ';

  @override
  String get backupCodesDescription =>
      'Natisnite kode, da jih boste imeli pri roki, ko jih boste potrebovali za prijavo v račun. Vsako rezervno kodo lahko uporabite samo enkrat.';

  @override
  String get backupCodesWarning =>
      'Ko zapustite to stran, teh kod ne bo več mogoče prikazati. Varno jih shranite s spodnjimi možnostmi.';

  @override
  String get downloadTxt => 'Prenesi (txt)';
}

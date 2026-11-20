// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class SLv extends S {
  SLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Sākums';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Iekārtas',
      one: 'Iekārta',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Vairāk';

  @override
  String get customers => 'Klienti';

  @override
  String get assets => 'Aktīvi';

  @override
  String get tenants => 'Nomnieki';

  @override
  String get auditLogs => 'Audita žurnāli';

  @override
  String get noCustomersFound => 'Klienti nav atrasti';

  @override
  String get noAssetsFound => 'Aktīvi nav atrasti';

  @override
  String get noTenantsFound => 'Nav atrasts neviens nomnieks';

  @override
  String get noDevicesFound => 'Iekārtas nav atrastas';

  @override
  String get noAuditLogsFound => 'Audita žurnāli nav atrasti';

  @override
  String get logout => 'Izrakstīties';

  @override
  String get login => 'Pierakstīties';

  @override
  String get loginToYourAccount => 'Pierakstīties savā kontā';

  @override
  String get email => 'E-pasts';

  @override
  String get emailInvalidText => 'Nederīgs e-pasta formāts.';

  @override
  String get username => 'lietotājvārds';

  @override
  String get password => 'Parole';

  @override
  String get passwordForgotText => 'Aizmirsāt paroli?';

  @override
  String get passwordReset => 'Atiestatīt paroli';

  @override
  String get passwordResetText =>
      'Ievadiet ar savu kontu saistīto e-pasta adresi, un mēs nosūtīsim e-pasta ziņojumu ar paroles atiestatīšanas saiti';

  @override
  String get requestPasswordReset => 'Pieprasīt paroles atiestatīšanu';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-pasta verifikācijas saite tika veiksmīgi nosūtīta!';

  @override
  String get or => 'VAI';

  @override
  String get no => 'Nē';

  @override
  String get yes => 'Jā';

  @override
  String get title => 'Virsraksts';

  @override
  String get country => 'Valsts';

  @override
  String get city => 'Pilsēta';

  @override
  String get stateOrProvince => 'Štats / province';

  @override
  String get postalCode => 'Pasta indekss';

  @override
  String get address => 'Adrese';

  @override
  String get address2 => 'Adrese 2';

  @override
  String get phone => 'Tālrunis';

  @override
  String get alarmClearTitle => 'Atrisināt trauksmi';

  @override
  String get alarmClearText => 'Vai tiešām vēlaties atrisināt trauksmi?';

  @override
  String get alarmAcknowledgeTitle => 'Apstiprināt trauksmi';

  @override
  String get alarmAcknowledgeText =>
      'Vai tiešām vēlaties apstiprināt trauksmi?';

  @override
  String get assetName => 'Aktīva nosaukums';

  @override
  String get type => 'Tips';

  @override
  String get label => 'Etiķete';

  @override
  String get auditLogDetails => 'Audita žurnāla detaļas';

  @override
  String get customerDetails => 'Klienta detaļas';

  @override
  String get assetDetails => 'Aktīva detaļas';

  @override
  String get tenantDetails => 'Nomnieka detaļas';

  @override
  String get entityType => 'Entītijas tips';

  @override
  String get actionData => 'Darbības dati';

  @override
  String get failureDetails => 'Kļūmes detaļas';

  @override
  String get allDevices => 'Visas iekārtas';

  @override
  String get active => 'Aktīva';

  @override
  String get inactive => 'Neaktīva';

  @override
  String get deviceActive => 'Aktīva';

  @override
  String get deviceInactive => 'Neaktīva';

  @override
  String get activeDevices => 'Aktīvas';

  @override
  String get inactiveDevices => 'Neaktīvas';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktīvs, apstiprināts';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktīvs, neapstiprināts';

  @override
  String get alarmStatusClearedAcknowledged => 'Atrisināts, apstiprināts';

  @override
  String get alarmStatusClearedUnacknowledged => 'Atrisināts, neapstiprināts';

  @override
  String get alarmStatusFilterActive => 'Aktīvs';

  @override
  String get systemAdministrator => 'Sistēmas administrators';

  @override
  String get tenantAdministrator => 'Nomnieka administrators';

  @override
  String get customer => 'Klients';

  @override
  String get changePassword => 'Mainīt paroli';

  @override
  String get currentPasswordRequireText => 'Pašreizējā parole ir nepieciešama.';

  @override
  String get currentPassword => 'Pašreizējā parole';

  @override
  String get newPasswordRequireText => 'Jaunā parole ir nepieciešama.';

  @override
  String get newPassword => 'Jaunā parole';

  @override
  String get newPassword2RequireText =>
      'Jaunās paroles atkārtojums ir nepieciešams.';

  @override
  String get newPassword2 => 'Apstiprināt jauno paroli';

  @override
  String get passwordErrorNotification => 'Ievadītajām parolēm ir jāsakrīt!';

  @override
  String get profileSuccessNotification => 'Profils veiksmīgi atjaunināts';

  @override
  String get passwordSuccessNotification => 'Parole veiksmīgi mainīta';

  @override
  String get notImplemented => 'Nav ieviests!';

  @override
  String get listIsEmptyText => 'Saraksts pašlaik ir tukšs.';

  @override
  String get tryAgain => 'Mēģināt vēlreiz';

  @override
  String get verifyYourIdentity => 'Apstipriniet savu identitāti';

  @override
  String get continueText => 'Turpināt';

  @override
  String get resendCode => 'Nosūtīt kodu atkārtoti';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekundēm',
      one: '$time sekundes',
    );
    return 'Nosūtīt kodu atkārtoti pēc $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Lūdzu, ievadiet drošības kodu no savas autentifikatora lietotnes.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Drošības kods ir nosūtīts uz jūsu tālruni $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Drošības kods ir nosūtīts uz jūsu e-pasta adresi $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Lūdzu, ievadiet vienu no saviem rezerves kodiem.';

  @override
  String get toptAuthPlaceholder => 'Kods';

  @override
  String get smsAuthPlaceholder => 'SMS kods';

  @override
  String get emailAuthPlaceholder => 'E-pasta kods';

  @override
  String get backupCodeAuthPlaceholder => 'Rezerves kods';

  @override
  String get verificationCodeIncorrect => 'Verifikācijas kods ir nepareizs';

  @override
  String get verificationCodeManyRequest =>
      'Pārāk daudz pieprasījumu verifikācijas koda pārbaudei';

  @override
  String get tryAnotherWay => 'Izmēģināt citu veidu';

  @override
  String get selectWayToVerify => 'Atlasiet apstiprināšanas veidu';

  @override
  String get mfaProviderTopt => 'Autentifikatora lietotne';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-pasts';

  @override
  String get mfaProviderBackupCode => 'Rezerves kods';

  @override
  String get newUserText => 'Jauns lietotājs?';

  @override
  String get createAccount => 'Izveidot kontu';

  @override
  String get emailVerification => 'E-pasta verifikācija';

  @override
  String get emailVerificationSentText =>
      'Uz norādīto e-pasta adresi ir nosūtīts e-pasta ziņojums ar verifikācijas informāciju ';

  @override
  String get emailVerificationInstructionsText =>
      'Lūdzu, izpildiet e-pasta ziņojumā sniegtos norādījumus, lai pabeigtu reģistrēšanos. Piezīme: ja e-pasta ziņojums ilgāku laiku nav saņemts, lūdzu, pārbaudiet mapi \'spam\' vai mēģiniet nosūtīt e-pasta ziņojumu atkārtoti, noklikšķinot uz pogas \'Atkārtoti nosūtīt\'.';

  @override
  String get resend => 'Atkārtoti nosūtīt';

  @override
  String get activatingAccount => 'Notiek konta aktivizēšana...';

  @override
  String get accountActivated => 'Konts sekmīgi aktivizēts!';

  @override
  String get emailVerified => 'E-pasts verificēts';

  @override
  String get activatingAccountText =>
      'Jūsu konts pašlaik tiek aktivizēts.\nLūdzu, uzgaidiet...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Apsveicam!\nJūsu $appTitle konts ir aktivizēts.\nTagad varat pierakstīties savā $appTitle vidē.';
  }

  @override
  String get privacyPolicy => 'Privātuma politika';

  @override
  String get cancel => 'Atcelt';

  @override
  String get accept => 'Pieņemt';

  @override
  String get termsOfUse => 'Lietošanas noteikumi';

  @override
  String get firstName => 'Vārds';

  @override
  String get lastName => 'Uzvārds';

  @override
  String get imNotARobot => 'Es neesmu robots';

  @override
  String get signUp => 'Reģistrēties';

  @override
  String get alreadyHaveAnAccount => 'Jau ir konts?';

  @override
  String get signIn => 'Pierakstīties';

  @override
  String get inactiveUserAlreadyExists => 'Neaktīvs lietotājs jau pastāv';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Jau ir reģistrēts lietotājs ar neapstiprinātu e-pasta adresi.\nNoklikšķiniet uz pogas \'Atkārtoti nosūtīt\', ja vēlaties vēlreiz nosūtīt verifikācijas e-pasta ziņojumu.';

  @override
  String get assignee => 'Atbildīgais';

  @override
  String get alarmTypes => 'Trauksmju tipi';

  @override
  String get details => 'Detaļas';

  @override
  String get status => 'Statuss';

  @override
  String get severity => 'Smaguma pakāpe';

  @override
  String get originator => 'Iniciators';

  @override
  String get startTime => 'Sākuma laiks';

  @override
  String get duration => 'Ilgums';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dienas',
      one: '$value diena',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value stundas',
      one: '$value stunda',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minūtes',
      one: '$value minūte',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value sekundes',
      one: '$value sekunde',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Skatīt infopaneli';

  @override
  String get activity => 'Aktivitāte';

  @override
  String get addCommentMessage => 'Pievienojiet komentāru...';

  @override
  String get clear => 'Atrisināt';

  @override
  String get acknowledge => 'Apstiprināt';

  @override
  String get edit => 'Rediģēt';

  @override
  String get editProfile => 'Rediģēt profilu';

  @override
  String get delete => 'Dzēst';

  @override
  String get edited => 'Rediģēts';

  @override
  String get deleteComment => 'Dzēst komentāru';

  @override
  String get areYouSure => 'Vai tiešām?';

  @override
  String get noResultsFound => 'Rezultāti nav atrasti';

  @override
  String get tryRefiningYourQuery => 'Lūdzu, precizējiet vaicājumu';

  @override
  String get failedToLoadTheList => 'Neizdevās ielādēt sarakstu';

  @override
  String get tryRefreshing => 'Lūdzu, mēģiniet atsvaidzināt';

  @override
  String get refresh => 'Atsvaidzināt';

  @override
  String get users => 'Lietotāji';

  @override
  String get unassigned => 'Nepiešķirts';

  @override
  String get failedToLoadAlarmDetails => 'Neizdevās ielādēt trauksmes detaļas';

  @override
  String get somethingWentWrong => 'Kaut kas nogāja greizi';

  @override
  String get chooseRegion => 'Izvēlieties reģionu';

  @override
  String get selectRegion => 'Atlasiet reģionu';

  @override
  String get northAmerica => 'Ziemeļamerika';

  @override
  String get europe => 'Eiropa';

  @override
  String get northAmericaRegionShort => 'Z. Virdžīnija';

  @override
  String get europeRegionShort => 'Frankfurte';

  @override
  String get deviceList => 'Iekārtu saraksts';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Infopaneļi',
      one: 'Infopanelis',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Nepieciešams atjauninājums';

  @override
  String updateTo(Object version) {
    return 'Atjaunināt uz $version';
  }

  @override
  String get next => 'Tālāk';

  @override
  String get confirmation => 'Apstiprinājums';

  @override
  String get wifiPassword => 'Wi-Fi parole';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Lai turpinātu iekārtas $deviceName iestatīšanu, lūdzu, norādiet tīkla akreditācijas datus.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Ievadiet paroli tīklam $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Jums nav pietiekamu atļauju \"$permissions\", lai turpinātu. Lūdzu, piešķiriet nepieciešamās atļaujas un pieskarieties pogai \"Mēģināt vēlreiz\".';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi akreditācijas datu nosūtīšana';

  @override
  String get confirmingWifiConnection => 'Wi-Fi savienojuma apstiprināšana';

  @override
  String get provisionedSuccessfully => 'Iekārta ir veiksmīgi nodrošināta';

  @override
  String get returnToDashboard => 'Atgriezties infopanelī';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Nevar izveidot sesiju ar iekārtu $deviceName. Lūdzu, mēģiniet vēlreiz';
  }

  @override
  String get claimingDevice => 'Iekārtas pieņemšana īpašumā';

  @override
  String get claimingMessageSuccess => 'Iekārta ir\nveiksmīgi pieņemta īpašumā';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Jums nav pietiekamu atļauju \"$permissions\", lai turpinātu. Lūdzu, atveriet lietotnes iestatījumus, piešķiriet atļaujas un pieskarieties pogai \"Mēģināt vēlreiz\".';
  }

  @override
  String get scanACode => 'Skenēt kodu';

  @override
  String get allowAccess => 'Atļaut piekļuvi';

  @override
  String get toggleCamera => 'Pārslēgt kameru';

  @override
  String get toggleFlash => 'Pārslēgt zibspuldzi';

  @override
  String get unableToUseCamera => 'Nevar izmantot kameru';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Lai turpinātu, atveriet iestatījumus un piešķiriet piekļuvi kamerai';

  @override
  String get notFound => 'Nav atrasts';

  @override
  String routeNotDefined(Object name) {
    return 'Maršruts nav definēts: $name';
  }

  @override
  String get loginWith => 'PIERAKSTĪTIES AR';

  @override
  String get scanQrCode => 'Skenēt QR kodu';

  @override
  String get searchResults => 'Meklēšanas rezultāti';

  @override
  String get viewAll => 'Skatīt visus';

  @override
  String get requestedEntityDoesNotExists => 'Pieprasītā entītija neeksistē.';

  @override
  String get noAlarmsFound => 'Trauksmes nav atrastas';

  @override
  String get filters => 'Filtri';

  @override
  String get alarmStatusList => 'Trauksmes statusu saraksts';

  @override
  String get alarmSeverityList => 'Trauksmes smaguma pakāpju saraksts';

  @override
  String get cleared => 'Atrisināts';

  @override
  String get acknowledged => 'Apstiprināts';

  @override
  String get unacknowledged => 'Neapstiprināts';

  @override
  String get critical => 'Kritiska';

  @override
  String get major => 'Augsta';

  @override
  String get minor => 'Zema';

  @override
  String get warning => 'Brīdinājums';

  @override
  String get indeterminate => 'Nenoteikta';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Meklēt lietotājus',
      one: 'Meklēt lietotāju',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Atiestatīt';

  @override
  String get update => 'Atjaunināt';

  @override
  String get alarmTypeList => 'Trauksmes tipu saraksts';

  @override
  String get anyType => 'Jebkurš tips';

  @override
  String get plusAlarmType => '+ Trauksmes tips';

  @override
  String get all => 'Visi';

  @override
  String get allNotifications => 'Visi';

  @override
  String get unread => 'Nelasītie';

  @override
  String get close => 'Aizvērt';

  @override
  String get fatalError => 'Kritiska kļūda';

  @override
  String get unknownError => 'Nezināma kļūda.';

  @override
  String get sessionExpired => 'Sesija ir beigusies';

  @override
  String get fatalApplicationErrorOccurred => 'Radās kritiska lietotnes kļūda:';

  @override
  String get connectionError => 'Savienojuma kļūda';

  @override
  String get failedToConnectToServer =>
      'Neizdevās izveidot savienojumu ar serveri';

  @override
  String get retry => 'Mēģināt vēlreiz';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilais infopanelis ir jākonfigurē iekārtas profilā!';

  @override
  String get openWifiSettings => 'Atvērt Wi-Fi iestatījumus';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Izveidojiet savienojumu ar Wi-Fi, kuru parasti izmantojat';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Atgriezieties lietotnē un pieskarieties pogai Gatavs';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Lūdzu, izpildiet turpmāk minētos soļus, lai atkārtoti savienotu\ntālruni ar parasto Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push paziņojumi nav konfigurēti.\nLūdzu, sazinieties ar sistēmas administratoru.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase nav konfigurēts.\n Lūdzu, skatiet oficiālo Firebase dokumentāciju,\n lai uzzinātu, kā to izdarīt.';

  @override
  String get markAllAsRead => 'Atzīmēt visus kā izlasītus';

  @override
  String get profile => 'Profils';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Nevar atvērt URL: $link';
  }

  @override
  String get noDashboardsFound => 'Infopaneļi nav atrasti';

  @override
  String get openAppSettings => 'Atvērt lietotnes iestatījumus';

  @override
  String get connectingToDevice => 'Notiek savienošana ar iekārtu';

  @override
  String get connectToDevice => 'Izveidot savienojumu ar iekārtu';

  @override
  String get selectWifiNetwork => 'Atlasīt Wi-Fi tīklu';

  @override
  String get deviceProvisioning => 'Iekārtas nodrošināšana';

  @override
  String get permissions => 'Atļaujas';

  @override
  String get unableConnectToDevice => 'Nevar izveidot savienojumu ar iekārtu';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Iekārta nevar atrast tuvumā esošu Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Neizdevās izveidot savienojumu ar Wi-Fi tīklu $name.\nLūdzu, pārliecinieties, ka tālrunis ir savienots ar iekārtas Wi-Fi tīklu un ka šai lietotnei tālruņa iestatījumos ir iespējota piekļuve lokālajam tīklam.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Nevar izveidot savienojumu ar Wi-Fi, jo iekārta $name neatrada tīklus';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Lūdzu, izpildiet turpmāk minētos soļus, lai savienotu tālruni ar iekārtu';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Izveidojiet savienojumu ar Wi-Fi, kas līdzīgs $wifiName';
  }

  @override
  String get ready => 'Gatavs';

  @override
  String get exitDeviceProvisioning => 'Iziet no iekārtas nodrošināšanas';

  @override
  String get noNotificationsFound => 'Paziņojumi nav atrasti';

  @override
  String get markAsRead => 'Atzīmēt kā izlasītu';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Lūdzu, noskenējiet QR kodu uz iekārtas';

  @override
  String get search => 'Meklēt';

  @override
  String get tenant => 'Nomnieks';

  @override
  String get tenantProfile => 'Nomnieka profils';

  @override
  String get user => 'Lietotājs';

  @override
  String get asset => 'Aktīvs';

  @override
  String get deviceProfile => 'Iekārtas profils';

  @override
  String get assetProfile => 'Aktīva profils';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Trauksmes',
      one: 'Trauksme',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Noteikumu ķēde';

  @override
  String get ruleNode => 'Noteikumu mezgls';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entītijas skats';

  @override
  String get widgetsBundle => 'Logrīku apkopojums';

  @override
  String get widgetType => 'Logrīka tips';

  @override
  String get apiUsageState => 'API lietojuma stāvoklis';

  @override
  String get tbResource => 'Resurss';

  @override
  String get otaPackage => 'OTA pakotne';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Rinda';

  @override
  String get notificationTarget => 'Paziņojuma saņēmējs';

  @override
  String get notificationTemplate => 'Paziņojuma veidne';

  @override
  String get notificationRequest => 'Paziņojuma pieprasījums';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Paziņojumi',
      one: 'Paziņojums',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Paziņojumu noteikums';

  @override
  String get entityGroup => 'Entītiju grupa';

  @override
  String get converter => 'Datu pārveidotājs';

  @override
  String get integration => 'Integrācija';

  @override
  String get schedulerEvent => 'Plānotāja notikums';

  @override
  String get blobEntity => 'Blob entītija';

  @override
  String get role => 'Loma';

  @override
  String get groupPermission => 'Grupas atļauja';

  @override
  String get actionStatusSuccess => 'Sekmīgi';

  @override
  String get actionStatusFailure => 'Neveiksme';

  @override
  String get actionTypeAdded => 'Pievienots';

  @override
  String get actionTypeDeleted => 'Dzēsts';

  @override
  String get actionTypeUpdated => 'Atjaunināts';

  @override
  String get actionTypeAttributesUpdated => 'Atribūti atjaunināti';

  @override
  String get actionTypeAttributesDeleted => 'Atribūti dzēsti';

  @override
  String get actionTypeRpcCall => 'RPC izsaukums';

  @override
  String get actionTypeCredentialsUpdated => 'Akreditācijas dati atjaunināti';

  @override
  String get actionTypeAssignedToCustomer => 'Piešķirts klientam';

  @override
  String get actionTypeUnassignedFromCustomer => 'Noņemts no klienta';

  @override
  String get actionTypeActivated => 'Aktivizēts';

  @override
  String get actionTypeSuspended => 'Apturēts';

  @override
  String get actionTypeCredentialsRead => 'Akreditācijas dati nolasīti';

  @override
  String get actionTypeAttributesRead => 'Atribūti nolasīti';

  @override
  String get actionTypeRelationAddOrUpdate => 'Attiecība atjaunināta';

  @override
  String get actionTypeRelationDeleted => 'Attiecība dzēsta';

  @override
  String get actionTypeRelationsDeleted => 'Visas attiecības dzēstas';

  @override
  String get actionTypeAlarmAck => 'Trauksme apstiprināta';

  @override
  String get actionTypeAlarmClear => 'Trauksme atrisināta';

  @override
  String get actionTypeAlarmDelete => 'Trauksme dzēsta';

  @override
  String get actionTypeAlarmAssigned => 'Trauksme piešķirta';

  @override
  String get actionTypeAlarmUnassigned => 'Trauksmes piešķīrums noņemts';

  @override
  String get actionTypeLogin => 'Pierakstīšanās';

  @override
  String get actionTypeLogout => 'Izrakstīšanās';

  @override
  String get actionTypeLockout => 'Bloķēšana';

  @override
  String get actionTypeAssignedFromTenant => 'Piešķirts no nomnieka';

  @override
  String get actionTypeAssignedToTenant => 'Piešķirts nomniekam';

  @override
  String get actionTypeProvisionSuccess => 'Iekārta nodrošināta';

  @override
  String get actionTypeProvisionFailure => 'Iekārtas nodrošināšana neizdevās';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrija atjaunināta';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrija dzēsta';

  @override
  String get actionTypeAssignedToEdge => 'Piešķirts Edge eksemplāram';

  @override
  String get actionTypeUnassignedFromEdge => 'Noņemts no Edge eksemplāra';

  @override
  String get actionTypeAddedComment => 'Komentārs pievienots';

  @override
  String get actionTypeUpdatedComment => 'Komentārs atjaunināts';

  @override
  String get actionTypeDeletedComment => 'Komentārs dzēsts';

  @override
  String get actionTypeSmsSent => 'SMS nosūtīts';

  @override
  String get actionTypeAddedToEntityGroup => 'Pievienots entītiju grupai';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Noņemts no entītiju grupas';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'REST API noteikumu dzinēja izsaukums';

  @override
  String get actionTypeMadePublic => 'Padarīts publisks';

  @override
  String get actionTypeMadePrivate => 'Padarīts privāts';

  @override
  String get actionTypeChangeOwner => 'Īpašnieks mainīts';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Jums nav atļauju veikt šo darbību!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Šķiet, ka jūsu atļaujas nav pietiekamas šīs darbības veikšanai';

  @override
  String fieldIsRequired(String field) {
    return '$field ir obligāts lauks.';
  }

  @override
  String get no2faProvidersFound => '2FA nodrošinātāji nav atrasti';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Lūdzu, sazinieties ar sistēmas administratoru';

  @override
  String errorOccured(Object e) {
    return 'Radās kļūda: $e';
  }

  @override
  String get unsavedChanges => 'Nesaglabātas izmaiņas';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Jums ir nesaglabātas izmaiņas. Vai tiešām vēlaties pamest šo lapu?';

  @override
  String get deleteAccount => 'Dzēst kontu';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Vai tiešām? Jūs gatavojaties dzēst savu kontu ($authority).';
  }

  @override
  String get language => 'Valoda';

  @override
  String get metricUnitSystem => 'Metriskā';

  @override
  String get imperialUnitSystem => 'Imperiālā';

  @override
  String get hybridUnitSystem => 'Hibrīdā';

  @override
  String get autoUnitSystem => 'Automātiski';

  @override
  String get languageAuto => 'Automātiski';

  @override
  String get unitSystem => 'Mērvienību sistēma';

  @override
  String get selectCountry => 'Atlasīt valsti';

  @override
  String get hideHomeDashboardToolbar => 'Paslēpt sākuma infopaneļa rīkjoslu';

  @override
  String get phoneNumberHelperText =>
      'Tālruņa numurs E.164 formātā, piemēram, +1201550123';

  @override
  String get homeDashboard => 'Sākuma infopanelis';

  @override
  String get security => 'Drošība';

  @override
  String get twofactorAuthentication => 'Divu faktoru autentifikācija';

  @override
  String get verificationRequired => 'Nepieciešama verifikācija';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Nepieciešama divu faktoru autentifikācija';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Iestatiet apstiprināšanas metodi, lai turpinātu pierakstīšanos';

  @override
  String get setUpAVerificationMethod => 'Iestatīt apstiprināšanas metodi';

  @override
  String get totpSetupSuccessDescription =>
      'Nākamajā pierakstīšanās reizē būs jānorāda divu faktoru autentifikācijas kods';

  @override
  String get smsSetupSuccessDescription =>
      'Nākamajā pierakstīšanās reizē tiks lūgts ievadīt drošības kodu, kas tiks nosūtīts uz tālruņa numuru';

  @override
  String get emailSetupSuccessDescription =>
      'Nākamajā pierakstīšanās reizē tiks lūgts ievadīt drošības kodu, kas tiks nosūtīts uz jūsu e-pasta adresi';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Nākamajā pierakstīšanās reizē varēsiet izmantot rezerves kodus, lai izietu divu faktoru autentifikāciju';

  @override
  String get loginToApp => 'Pierakstīties lietotnē';

  @override
  String get goBack => 'Atpakaļ';

  @override
  String get done => 'Gatavs';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Tas padarīs jūsu kontu mazāk drošu';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Vai tiešām vēlaties deaktivizēt $providerName?';
  }

  @override
  String get yesDeactivate => 'Jā, deaktivizēt';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Ievadiet e-pastu, ko izmantot kā autentifikatoru.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Ievadiet tālruņa numuru, ko izmantot kā autentifikatoru';

  @override
  String get sendCode => 'Nosūtīt kodu';

  @override
  String get copy => 'Kopēt';

  @override
  String get copiedToClipboard => 'Nokopēts starpliktuvē';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Ievadiet 6 ciparu kodu šeit';

  @override
  String digitsCode(int count) {
    return '$count ciparu kods';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopējiet 32 rakstzīmju atslēgu savā autentifikatora lietotnē vai noskenējiet zemāk esošo QR kodu';

  @override
  String get applyChanges => 'Pielietot izmaiņas';

  @override
  String get discardChanges => 'Atmest izmaiņas';

  @override
  String get yesDiscard => 'Jā, atmest';

  @override
  String get thisActionCannotBeUndone => 'Šo darbību nevar atsaukt';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Divu faktoru autentifikācija aizsargā jūsu kontu no nesankcionētas piekļuves. Jums tikai jāievada drošības kods, kad pierakstāties.';

  @override
  String get calculatedField => 'Aprēķinātais lauks';

  @override
  String get apiKey => 'API atslēga';

  @override
  String get aiModel => 'MI modelis';

  @override
  String get adminSettings => 'Administratora iestatījumi';

  @override
  String get job => 'Uzdevums';

  @override
  String get mobileAppBundle => 'Mobilo lietotņu apkopojums';

  @override
  String get mobileApp => 'Mobilā lietotne';

  @override
  String get domain => 'Domēns';

  @override
  String get oauth2Client => 'OAuth 2.0 klients';

  @override
  String get queueStats => 'Rindas statistika';

  @override
  String get phoneIsRequired => 'Tālrunis ir nepieciešams';

  @override
  String get phoneIsInvalid => 'Tālrunis nav derīgs';

  @override
  String get addVerificationMethod => 'Pievienot apstiprināšanas metodi';

  @override
  String get imageSavedToGallery =>
      'Saglabāts platformas mapē \'Attēlu galerija\'';

  @override
  String get failedToSaveImage => 'Neizdevās saglabāt attēlu';

  @override
  String nSelected(int count) {
    return 'Atlasīti: $count';
  }

  @override
  String get selectAll => 'Atlasīt visus ielādētos';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Neizdevās $count darbības',
      one: 'Neizdevās $count darbība',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dzēst $count paziņojumus?',
      one: 'Dzēst $count paziņojumu?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Atzīmēt $count paziņojumus kā izlasītus?',
      one: 'Atzīmēt $count paziņojumu kā izlasītu?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Notiek datu iegūšana no jūsu resursdatora $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Notiek pierakstīšanās resursdatorā $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Notiek pārslēgšana uz jauno resursdatoru $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Neizdevās iegūt pierakstīšanās tokenu no $host. Lūdzu, noskenējiet jaunu QR kodu.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Neizdevās izveidot savienojumu ar $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host nav ThingsBoard serveris';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR koda sesija vairs nav derīga. Lūdzu, atsvaidziniet QR kodu un skenējiet vēlreiz.';

  @override
  String get openThisLinkTitle => 'Vai atvērt šo saiti?';

  @override
  String get linkOpensSignInPage =>
      'Šī saite atver šī servera pierakstīšanās lapu. Pašreizējā serverī notiks izrakstīšanās.';

  @override
  String get linkOpensSignInPageOnly =>
      'Šī saite atver šī servera pierakstīšanās lapu.';

  @override
  String linkSignsInAs(Object email) {
    return 'Šī saite pieraksta jūs šajā serverī kā $email.';
  }

  @override
  String get linkSignsIn => 'Šī saite pieraksta jūs šajā serverī.';

  @override
  String get serverConnectionNotSecure =>
      'Šis serveris neizmanto drošu savienojumu.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Šī lietotne darbojas tikai ar savu serveri un nevar atvērt šo saiti.';

  @override
  String get liveTrackingActive => 'Atrašanās vietas izsekošana reāllaikā';

  @override
  String get liveTrackingPaused => 'Izsekošana reāllaikā pauzēta';

  @override
  String get liveTrackingFixes => 'Fiksācijas';

  @override
  String get liveTrackingSaved => 'Saglabātas';

  @override
  String get liveTrackingErrors => 'Kļūdas';

  @override
  String get liveTrackingStop => 'Apturēt';

  @override
  String get liveTrackingPause => 'Pauzēt';

  @override
  String get liveTrackingResume => 'Turpināt';

  @override
  String get liveTrackingHide => 'Slēpt';

  @override
  String get liveTrackingSessionTitle =>
      'Atrašanās vietas izsekošana reāllaikā';

  @override
  String get liveTrackingTarget => 'Saglabāt atrašanās vietu entītijā';

  @override
  String get liveTrackingDashboard => 'Infopanelis';

  @override
  String get liveTrackingStatus => 'Statuss';

  @override
  String get liveTrackingStarted => 'Sākuma laiks';

  @override
  String get liveTrackingLastFix => 'Pēdējā fiksācija';

  @override
  String get liveTrackingLastError => 'Pēdējā kļūda';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Nevar saglabāt šajā entītijā — tā vairs nepastāv. Izsekošana turpinās; atjauniniet mērķi infopaneļa darbībā.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Nav savienojuma ar serveri. Šīs fiksācijas netika saglabātas — saglabāšana atsāksies, kad būsiet atkal tiešsaistē.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Jūsu sesija beidzās. Pierakstieties vēlreiz, lai turpinātu saglabāt atrašanās vietu.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Nevar saglabāt šajā entītijā — jums nav atļaujas. Izsekošana turpinās; lūdziet administratoru piešķirt piekļuvi.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Neizdevās saglabāt šo fiksāciju serverī. Saglabāšana tiks mēģināta vēlreiz ar nākamo fiksāciju.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Atrašanās vietas pakalpojumi šajā ierīcē ir izslēgti.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Atrašanās vietas atļauja tika noraidīta.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Atrašanās vietas atļauja ir pastāvīgi noraidīta. Iespējojiet to lietotnes iestatījumos.';

  @override
  String get liveTrackingErrorLocation => 'Neizdevās noteikt atrašanās vietu.';

  @override
  String get liveTrackingMenuTitle => 'Atrašanās vietas izsekošana reāllaikā';

  @override
  String get liveTrackingNoRecord =>
      'Nav aktīvas izsekošanas un nav nesenas sesijas.';

  @override
  String get liveTrackingLastSession => 'Pēdējā sesija';

  @override
  String get liveTrackingStartAgain => 'Sākt vēlreiz';

  @override
  String get liveTrackingEnded => 'Beigu laiks';

  @override
  String get liveTrackingEndReason => 'Beigšanas iemesls';

  @override
  String get liveTrackingEndReasonManual => 'Apturēts manuāli';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Sasniegts maks. ilgums';

  @override
  String get liveTrackingEndReasonInterrupted => 'Pārtraukts';

  @override
  String get serverUpdateRequired => 'Nepieciešams servera atjauninājums';

  @override
  String get backToLogin => 'Atpakaļ uz pierakstīšanos';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Šī lietotne darbojas ar ThingsBoard $minVersion vai jaunāku versiju.';
  }

  @override
  String get serverLabel => 'Serveris';

  @override
  String get versionLabel => 'Versija';

  @override
  String get askAdminToUpdateServer =>
      'Lūdziet servera administratoram atjaunināt serveri.';

  @override
  String get deviceClaimFailed =>
      'Iekārtu neizdevās pieņemt īpašumā. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get deviceToClaimNotFound =>
      'Iekārta nav atrasta. Lūdzu, sazinieties ar iekārtas piegādātāju.';

  @override
  String get enableAuthenticatorApp => 'Iespējot autentifikatora lietotni';

  @override
  String get enableSmsAuthenticator => 'Iespējot SMS autentifikatoru';

  @override
  String get enableEmailAuthenticator => 'Iespējot e-pasta autentifikatoru';

  @override
  String get getBackupCode => 'Iegūt rezerves kodu';

  @override
  String get twoFaTotpDescription =>
      'Autentifikācijai izmantojiet tālrunī tādas lietotnes kā Google Authenticator, Authy vai Duo. Tā ģenerēs drošības kodu pierakstīšanās veikšanai.';

  @override
  String get twoFaSmsDescription =>
      'Autentifikācijai izmantojiet savu tālruni. Pierakstoties, mēs jums nosūtīsim drošības kodu ar SMS ziņojumu.';

  @override
  String get twoFaEmailDescription =>
      'Autentifikācijai izmantojiet drošības kodu, kas nosūtīts uz jūsu e-pasta adresi.';

  @override
  String get twoFaBackupCodeDescription =>
      'Šie izdrukājamie vienreizlietojamie kodi ļauj jums pierakstīties, kad atrodaties prom no tālruņa, piemēram, ceļojuma laikā.';

  @override
  String get openInAuthenticatorApp => 'Atvērt autentifikatora lietotnē';

  @override
  String get noAuthenticatorAppFound =>
      'Autentifikatora lietotne nav atrasta. Tā vietā nokopējiet atslēgu savā lietotnē.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Iespējots: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Jūsu administrators pieprasa divu faktoru autentifikāciju lietotājam $email.';
  }

  @override
  String get recommended => 'Ieteicams';

  @override
  String get addBackupCodesHint =>
      'Pievienojiet arī rezerves kodus, lai jūs varētu pierakstīties, ja pazaudējat tālruni.';

  @override
  String get totpSecretKey => 'Slepenā atslēga';

  @override
  String get backupCodesDescription =>
      'Izdrukājiet kodus, lai tie būtu pie rokas, kad tie būs nepieciešami, lai pierakstītos savā kontā. Katru rezerves kodu var izmantot vienu reizi.';

  @override
  String get backupCodesWarning =>
      'Pēc šīs lapas aizvēršanas šos kodus vairs nevarēs parādīt. Saglabājiet tos drošā vietā, izmantojot tālāk norādītās iespējas.';

  @override
  String get downloadTxt => 'Lejupielādēt (txt)';
}

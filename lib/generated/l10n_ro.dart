// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class SRo extends S {
  SRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Acasă';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispozitive',
      one: 'Dispozitiv',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Mai mult';

  @override
  String get customers => 'Clienți';

  @override
  String get assets => 'Active';

  @override
  String get tenants => 'Chiriași';

  @override
  String get auditLogs => 'Jurnale de audit';

  @override
  String get noCustomersFound => 'Nu au fost găsiți clienți';

  @override
  String get noAssetsFound => 'Nu au fost găsite active';

  @override
  String get noTenantsFound => 'Nu au fost găsiți chiriași';

  @override
  String get noDevicesFound => 'Nu există dispozitive';

  @override
  String get noAuditLogsFound => 'Nu s-au găsit jurnale de audit';

  @override
  String get logout => 'Deconectare';

  @override
  String get login => 'Conectare';

  @override
  String get loginToYourAccount => 'Conectați-vă la cont';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalidText => 'Format de e-mail nevalid.';

  @override
  String get username => 'nume utilizator';

  @override
  String get password => 'Parolă';

  @override
  String get passwordForgotText => 'Ați uitat parola?';

  @override
  String get passwordReset => 'Resetează parola';

  @override
  String get passwordResetText =>
      'Introduceți adresa de e-mail asociată contului dumneavoastră și vă vom trimite un e-mail cu linkul de resetare a parolei';

  @override
  String get requestPasswordReset => 'Solicită resetarea parolei';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Linkul de verificare a e-mailului a fost trimis cu succes!';

  @override
  String get or => 'SAU';

  @override
  String get no => 'Nu';

  @override
  String get yes => 'Da';

  @override
  String get title => 'Titlu';

  @override
  String get country => 'Țară';

  @override
  String get city => 'Oraș';

  @override
  String get stateOrProvince => 'Județ';

  @override
  String get postalCode => 'Cod poștal';

  @override
  String get address => 'Adresă';

  @override
  String get address2 => 'Adresă 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Rezolvă alarma';

  @override
  String get alarmClearText => 'Sigur doriți să rezolvați alarma?';

  @override
  String get alarmAcknowledgeTitle => 'Confirmă alarma';

  @override
  String get alarmAcknowledgeText => 'Sigur doriți să confirmați alarma?';

  @override
  String get assetName => 'Nume activ';

  @override
  String get type => 'Tip';

  @override
  String get label => 'Etichetă';

  @override
  String get auditLogDetails => 'Detalii jurnal audit';

  @override
  String get customerDetails => 'Detalii client';

  @override
  String get assetDetails => 'Detalii activ';

  @override
  String get tenantDetails => 'Detalii chiriaș';

  @override
  String get entityType => 'Tip de entitate';

  @override
  String get actionData => 'Date acțiune';

  @override
  String get failureDetails => 'Detalii eșec';

  @override
  String get allDevices => 'Toate dispozitivele';

  @override
  String get active => 'Activă';

  @override
  String get inactive => 'Inactivă';

  @override
  String get deviceActive => 'Activ';

  @override
  String get deviceInactive => 'Inactiv';

  @override
  String get activeDevices => 'Active';

  @override
  String get inactiveDevices => 'Inactive';

  @override
  String get alarmStatusActiveAcknowledged => 'Activă confirmată';

  @override
  String get alarmStatusActiveUnacknowledged => 'Activă neconfirmată';

  @override
  String get alarmStatusClearedAcknowledged => 'Rezolvată confirmată';

  @override
  String get alarmStatusClearedUnacknowledged => 'Rezolvată neconfirmată';

  @override
  String get alarmStatusFilterActive => 'Activă';

  @override
  String get systemAdministrator => 'Administrator de sistem';

  @override
  String get tenantAdministrator => 'Administrator de chiriaș';

  @override
  String get customer => 'Client';

  @override
  String get changePassword => 'Schimbă parola';

  @override
  String get currentPasswordRequireText => 'Parola actuală este obligatorie.';

  @override
  String get currentPassword => 'Parola actuală';

  @override
  String get newPasswordRequireText => 'Parola nouă este obligatorie.';

  @override
  String get newPassword => 'Parolă nouă';

  @override
  String get newPassword2RequireText =>
      'Confirmarea parolei noi este obligatorie.';

  @override
  String get newPassword2 => 'Confirmare parolă nouă';

  @override
  String get passwordErrorNotification =>
      'Parola reintrodusă trebuie să fie identică!';

  @override
  String get profileSuccessNotification => 'Profil actualizat cu succes';

  @override
  String get passwordSuccessNotification => 'Parolă schimbată cu succes';

  @override
  String get notImplemented => 'Neimplementat!';

  @override
  String get listIsEmptyText => 'Lista este momentan goală.';

  @override
  String get tryAgain => 'Încearcă din nou';

  @override
  String get verifyYourIdentity => 'Verificați-vă identitatea';

  @override
  String get continueText => 'Continuă';

  @override
  String get resendCode => 'Retrimite codul';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time de secunde',
      few: '$time secunde',
      one: '$time secundă',
    );
    return 'Retrimite codul în $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Introduceți codul de securitate din aplicația de autentificare.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Un cod de securitate a fost trimis pe telefonul dumneavoastră, la numărul $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Un cod de securitate a fost trimis la adresa dumneavoastră de e-mail $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Introduceți unul dintre codurile dumneavoastră de rezervă.';

  @override
  String get toptAuthPlaceholder => 'Cod';

  @override
  String get smsAuthPlaceholder => 'Cod SMS';

  @override
  String get emailAuthPlaceholder => 'Cod din e-mail';

  @override
  String get backupCodeAuthPlaceholder => 'Cod de rezervă';

  @override
  String get verificationCodeIncorrect => 'Codul de verificare este incorect';

  @override
  String get verificationCodeManyRequest =>
      'Prea multe solicitări de verificare a codului';

  @override
  String get tryAnotherWay => 'Încearcă altă metodă';

  @override
  String get selectWayToVerify => 'Selectați o metodă de verificare';

  @override
  String get mfaProviderTopt => 'Aplicație de autentificare';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Cod de rezervă';

  @override
  String get newUserText => 'Utilizator nou?';

  @override
  String get createAccount => 'Creează cont';

  @override
  String get emailVerification => 'Verificare e-mail';

  @override
  String get emailVerificationSentText =>
      'Un e-mail cu detalii de verificare a fost trimis la adresa de e-mail specificată ';

  @override
  String get emailVerificationInstructionsText =>
      'Urmați instrucțiunile din e-mail pentru a finaliza procedura de înregistrare. Notă: dacă nu ați primit e-mailul de ceva timp, verificați dosarul „spam” sau încercați să retrimiteți e-mailul apăsând butonul „Retrimite”.';

  @override
  String get resend => 'Retrimite';

  @override
  String get activatingAccount => 'Se activează contul...';

  @override
  String get accountActivated => 'Contul a fost activat cu succes!';

  @override
  String get emailVerified => 'E-mail verificat';

  @override
  String get activatingAccountText =>
      'Contul dumneavoastră este în curs de activare.\nVă rugăm să așteptați...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Felicitări!\nContul dumneavoastră $appTitle a fost activat.\nAcum vă puteți conecta în spațiul dumneavoastră $appTitle.';
  }

  @override
  String get privacyPolicy => 'Politica de confidențialitate';

  @override
  String get cancel => 'Renunță';

  @override
  String get accept => 'Acceptă';

  @override
  String get termsOfUse => 'Termenii de utilizare';

  @override
  String get firstName => 'Prenume';

  @override
  String get lastName => 'Nume de familie';

  @override
  String get imNotARobot => 'Nu sunt robot';

  @override
  String get signUp => 'Înregistrează-te';

  @override
  String get alreadyHaveAnAccount => 'Aveți deja un cont?';

  @override
  String get signIn => 'Conectare';

  @override
  String get inactiveUserAlreadyExists => 'Există deja un utilizator inactiv';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Există deja un utilizator înregistrat cu o adresă de e-mail neverificată.\nApăsați butonul „Retrimite” dacă doriți să retrimiteți e-mailul de verificare.';

  @override
  String get assignee => 'Responsabil';

  @override
  String get alarmTypes => 'Tipuri de alarme';

  @override
  String get details => 'Detalii';

  @override
  String get status => 'Stare';

  @override
  String get severity => 'Severitate';

  @override
  String get originator => 'Inițiator';

  @override
  String get startTime => 'Ora de început';

  @override
  String get duration => 'Durată';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value de zile',
      few: '$value zile',
      one: '$value zi',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value de ore',
      few: '$value ore',
      one: '$value oră',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value de minute',
      few: '$value minute',
      one: '$value minut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value de secunde',
      few: '$value secunde',
      one: '$value secundă',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Vizualizează tabloul de bord';

  @override
  String get activity => 'Activitate';

  @override
  String get addCommentMessage => 'Adăugați un comentariu...';

  @override
  String get clear => 'Rezolvă';

  @override
  String get acknowledge => 'Confirmă';

  @override
  String get edit => 'Editează';

  @override
  String get editProfile => 'Editează profilul';

  @override
  String get delete => 'Șterge';

  @override
  String get edited => 'Editat';

  @override
  String get deleteComment => 'Șterge comentariul';

  @override
  String get areYouSure => 'Sigur doriți să continuați?';

  @override
  String get noResultsFound => 'Niciun rezultat găsit';

  @override
  String get tryRefiningYourQuery => 'Încercați să rafinați interogarea';

  @override
  String get failedToLoadTheList => 'Nu s-a putut încărca lista';

  @override
  String get tryRefreshing => 'Încercați să reîmprospătați';

  @override
  String get refresh => 'Reîmprospătează';

  @override
  String get users => 'Utilizatori';

  @override
  String get unassigned => 'Neatribuită';

  @override
  String get failedToLoadAlarmDetails =>
      'Nu s-au putut încărca detaliile alarmei';

  @override
  String get somethingWentWrong => 'Ceva nu a funcționat';

  @override
  String get chooseRegion => 'Alege regiunea';

  @override
  String get selectRegion => 'Selectează regiunea';

  @override
  String get northAmerica => 'America de Nord';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Listă dispozitive';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tablouri de bord',
      one: 'Tablou de bord',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Actualizare necesară';

  @override
  String updateTo(Object version) {
    return 'Actualizează la $version';
  }

  @override
  String get next => 'Următorul';

  @override
  String get confirmation => 'Confirmare';

  @override
  String get wifiPassword => 'Parolă Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Pentru a continua configurarea dispozitivului $deviceName, furnizați acreditările rețelei dumneavoastră.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Introduceți parola pentru $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Nu aveți permisiuni suficiente pentru „$permissions” pentru a continua. Acordați permisiunile necesare și apăsați „Încearcă din nou”.';
  }

  @override
  String get sendingWifiCredentials => 'Se trimit acreditările Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Se confirmă conexiunea Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'Dispozitivul a fost provizionat cu succes';

  @override
  String get returnToDashboard => 'Înapoi la tabloul de bord';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Nu se poate stabili sesiunea cu dispozitivul $deviceName. Încercați din nou';
  }

  @override
  String get claimingDevice => 'Se revendică dispozitivul';

  @override
  String get claimingMessageSuccess =>
      'Dispozitivul a fost\nrevendicat cu succes';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Nu aveți permisiuni suficiente pentru „$permissions” pentru a continua. Deschideți setările aplicației, acordați permisiunile și apăsați „Încearcă din nou”.';
  }

  @override
  String get scanACode => 'Scanați un cod';

  @override
  String get allowAccess => 'Permite accesul';

  @override
  String get toggleCamera => 'Comută camera';

  @override
  String get toggleFlash => 'Comută blițul';

  @override
  String get unableToUseCamera => 'Camera nu poate fi utilizată';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Deschideți setările și acordați acces la cameră pentru a continua';

  @override
  String get notFound => 'Nu a fost găsit';

  @override
  String routeNotDefined(Object name) {
    return 'Rută nedefinită: $name';
  }

  @override
  String get loginWith => 'Conectare cu';

  @override
  String get scanQrCode => 'Scanează codul QR';

  @override
  String get searchResults => 'Rezultatele căutării';

  @override
  String get viewAll => 'Vezi tot';

  @override
  String get requestedEntityDoesNotExists => 'Entitatea solicitată nu există.';

  @override
  String get noAlarmsFound => 'Nicio alarmă găsită';

  @override
  String get filters => 'Filtre';

  @override
  String get alarmStatusList => 'Lista stărilor alarmei';

  @override
  String get alarmSeverityList => 'Lista severităților alarmei';

  @override
  String get cleared => 'Rezolvată';

  @override
  String get acknowledged => 'Confirmată';

  @override
  String get unacknowledged => 'Neconfirmată';

  @override
  String get critical => 'Critică';

  @override
  String get major => 'Majoră';

  @override
  String get minor => 'Minoră';

  @override
  String get warning => 'Avertizare';

  @override
  String get indeterminate => 'Nedeterminată';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Caută utilizatori',
      few: 'Caută utilizatori',
      one: 'Caută utilizator',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Resetează';

  @override
  String get update => 'Actualizează';

  @override
  String get alarmTypeList => 'Listă de tipuri de alarmă';

  @override
  String get anyType => 'Orice tip';

  @override
  String get plusAlarmType => '+ Tip de alarmă';

  @override
  String get all => 'Toate';

  @override
  String get allNotifications => 'Toate';

  @override
  String get unread => 'Necitite';

  @override
  String get close => 'Închide';

  @override
  String get fatalError => 'Eroare fatală';

  @override
  String get unknownError => 'Eroare necunoscută.';

  @override
  String get sessionExpired => 'Sesiunea a expirat';

  @override
  String get fatalApplicationErrorOccurred =>
      'A apărut o eroare fatală a aplicației:';

  @override
  String get connectionError => 'Eroare de conexiune';

  @override
  String get failedToConnectToServer => 'Conectarea la server a eșuat';

  @override
  String get retry => 'Reîncearcă';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Tabloul de bord mobil trebuie configurat în profilul de dispozitiv!';

  @override
  String get openWifiSettings => 'Deschide setările Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Conectați-vă la rețeaua Wi-Fi pe care o utilizați de obicei';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Reveniți la aplicație și apăsați butonul „Gata”';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Urmați pașii următori pentru a reconecta\ntelefonul la rețeaua Wi-Fi obișnuită';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Notificările push nu sunt configurate.\nContactați administratorul de sistem.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase nu este configurat.\n Consultați documentația oficială Firebase pentru\n îndrumări despre cum să procedați.';

  @override
  String get markAllAsRead => 'Marchează toate ca citite';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Nu se poate deschide adresa URL: $link';
  }

  @override
  String get noDashboardsFound => 'Nu au fost găsite tablouri de bord';

  @override
  String get openAppSettings => 'Deschide setările aplicației';

  @override
  String get connectingToDevice => 'Se conectează la dispozitiv';

  @override
  String get connectToDevice => 'Conectează-te la dispozitiv';

  @override
  String get selectWifiNetwork => 'Selectează rețeaua Wi-Fi';

  @override
  String get deviceProvisioning => 'Provizionarea dispozitivelor';

  @override
  String get permissions => 'Permisiuni';

  @override
  String get unableConnectToDevice => 'Conectarea la dispozitiv a eșuat';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Dispozitivul nu poate găsi rețele Wi-Fi în apropiere';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Conectarea la rețeaua Wi-Fi $name a eșuat.\nAsigurați-vă că telefonul este conectat la rețeaua Wi-Fi a dispozitivului și că accesul la rețeaua locală este activat pentru această aplicație în setările telefonului.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Conectarea la Wi-Fi a eșuat deoarece rețelele nu au fost găsite de dispozitivul $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Urmați pașii următori pentru a conecta telefonul la dispozitiv';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Conectați-vă la o rețea Wi-Fi cu un nume similar cu $wifiName';
  }

  @override
  String get ready => 'Gata';

  @override
  String get exitDeviceProvisioning => 'Ieși din provizionarea dispozitivului';

  @override
  String get noNotificationsFound => 'Nu au fost găsite notificări';

  @override
  String get markAsRead => 'Marchează ca citită';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Scanați codul QR de pe dispozitivul dumneavoastră';

  @override
  String get search => 'Caută';

  @override
  String get tenant => 'Chiriaș';

  @override
  String get tenantProfile => 'Profil de chiriaș';

  @override
  String get user => 'Utilizator';

  @override
  String get asset => 'Activ';

  @override
  String get deviceProfile => 'Profil de dispozitiv';

  @override
  String get assetProfile => 'Profil de activ';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarme',
      one: 'Alarmă',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Lanț de reguli';

  @override
  String get ruleNode => 'Nod de regulă';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Vizualizare de entitate';

  @override
  String get widgetsBundle => 'Pachet de widgeturi';

  @override
  String get widgetType => 'Tip widget';

  @override
  String get apiUsageState => 'Stare utilizare API';

  @override
  String get tbResource => 'Resursă';

  @override
  String get otaPackage => 'Pachet OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Coadă';

  @override
  String get notificationTarget => 'Destinatar de notificări';

  @override
  String get notificationTemplate => 'Șablon de notificare';

  @override
  String get notificationRequest => 'Cerere de notificare';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notificări',
      one: 'Notificare',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Regulă de notificare';

  @override
  String get entityGroup => 'Grup de entități';

  @override
  String get converter => 'Convertor';

  @override
  String get integration => 'Integrare';

  @override
  String get schedulerEvent => 'Eveniment de planificator';

  @override
  String get blobEntity => 'Entitate blob';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Permisiune de grup';

  @override
  String get actionStatusSuccess => 'Succes';

  @override
  String get actionStatusFailure => 'Eșec';

  @override
  String get actionTypeAdded => 'Adăugat';

  @override
  String get actionTypeDeleted => 'Șters';

  @override
  String get actionTypeUpdated => 'Actualizat';

  @override
  String get actionTypeAttributesUpdated => 'Atribute actualizate';

  @override
  String get actionTypeAttributesDeleted => 'Atribute șterse';

  @override
  String get actionTypeRpcCall => 'Apel RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Acreditări actualizate';

  @override
  String get actionTypeAssignedToCustomer => 'Atribuit clientului';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Atribuire către client eliminată';

  @override
  String get actionTypeActivated => 'Activat';

  @override
  String get actionTypeSuspended => 'Suspendat';

  @override
  String get actionTypeCredentialsRead => 'Acreditări citite';

  @override
  String get actionTypeAttributesRead => 'Atribute citite';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relație actualizată';

  @override
  String get actionTypeRelationDeleted => 'Relație ștearsă';

  @override
  String get actionTypeRelationsDeleted => 'Toate relațiile șterse';

  @override
  String get actionTypeAlarmAck => 'Alarmă confirmată';

  @override
  String get actionTypeAlarmClear => 'Alarmă rezolvată';

  @override
  String get actionTypeAlarmDelete => 'Alarmă ștearsă';

  @override
  String get actionTypeAlarmAssigned => 'Alarmă atribuită';

  @override
  String get actionTypeAlarmUnassigned => 'Atribuire alarmă eliminată';

  @override
  String get actionTypeLogin => 'Conectare';

  @override
  String get actionTypeLogout => 'Deconectare';

  @override
  String get actionTypeLockout => 'Blocat';

  @override
  String get actionTypeAssignedFromTenant => 'Atribuit de la chiriaș';

  @override
  String get actionTypeAssignedToTenant => 'Atribuit chiriașului';

  @override
  String get actionTypeProvisionSuccess => 'Dispozitiv provizionat';

  @override
  String get actionTypeProvisionFailure =>
      'Provizionarea dispozitivului a eșuat';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrie actualizată';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrie ștearsă';

  @override
  String get actionTypeAssignedToEdge => 'Atribuit instanței Edge';

  @override
  String get actionTypeUnassignedFromEdge =>
      'Atribuire eliminată de la instanța Edge';

  @override
  String get actionTypeAddedComment => 'Comentariu adăugat';

  @override
  String get actionTypeUpdatedComment => 'Comentariu actualizat';

  @override
  String get actionTypeDeletedComment => 'Comentariu șters';

  @override
  String get actionTypeSmsSent => 'SMS trimis';

  @override
  String get actionTypeAddedToEntityGroup => 'Adăugat în grupul de entități';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Eliminat din grupul de entități';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Apel REST API al motorului de reguli';

  @override
  String get actionTypeMadePublic => 'Făcut public';

  @override
  String get actionTypeMadePrivate => 'Făcut privat';

  @override
  String get actionTypeChangeOwner => 'Proprietar schimbat';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Nu aveți permisiunea de a efectua această operațiune!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Se pare că permisiunile dumneavoastră nu sunt suficiente pentru a finaliza această operațiune';

  @override
  String get isRequiredText => 'este un câmp obligatoriu.';

  @override
  String get no2faProvidersFound => 'Nu s-au găsit furnizori 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Contactați administratorul de sistem';

  @override
  String errorOccured(Object e) {
    return 'A apărut o eroare: $e';
  }

  @override
  String get unsavedChanges => 'Modificări nesalvate';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Au rămas modificări nesalvate. Doriți să părăsiți această pagină fără a salva modificările?';

  @override
  String get deleteAccount => 'Șterge contul';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Sigur doriți să ștergeți contul dumneavoastră de $authority?';
  }

  @override
  String get language => 'Limbă';

  @override
  String get metricUnitSystem => 'Metric';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Hibrid';

  @override
  String get autoUnitSystem => 'Automat';

  @override
  String get languageAuto => 'Automat';

  @override
  String get unitSystem => 'Sistem de unități';

  @override
  String get selectCountry => 'Selectează țara';

  @override
  String get hideHomeDashboardToolbar =>
      'Ascunde bara de instrumente a tabloului de bord principal';

  @override
  String get phoneNumberHelperText =>
      'Număr de telefon în format E.164, de ex. +1201550123';

  @override
  String get homeDashboard => 'Tablou de bord principal';

  @override
  String get security => 'Securitate';

  @override
  String get twofactorAuthentication => 'Autentificare cu doi factori';

  @override
  String get verificationRequired => 'Verificare necesară';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Autentificarea cu doi factori este obligatorie';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configurați o metodă de verificare pentru a continua conectarea';

  @override
  String get setUpAVerificationMethod => 'Configurează o metodă de verificare';

  @override
  String get totpSetupSuccessDescription =>
      'La următoarea conectare, va trebui să furnizați un cod de autentificare cu doi factori';

  @override
  String get smsSetupSuccessDescription =>
      'La următoarea conectare, vi se va solicita să introduceți codul de securitate care va fi trimis la numărul de telefon';

  @override
  String get emailSetupSuccessDescription =>
      'La următoarea conectare, vi se va solicita să introduceți codul de securitate care va fi trimis la adresa dumneavoastră de e-mail';

  @override
  String get backupCodeSetupSuccessDescription =>
      'La următoarea conectare, veți putea folosi codurile de rezervă pentru a trece de autentificarea cu doi factori';

  @override
  String get loginToApp => 'Conectare la aplicație';

  @override
  String get goBack => 'Înapoi';

  @override
  String get done => 'Gata';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Acest lucru va face contul dumneavoastră mai puțin sigur';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Sigur doriți să dezactivați „$providerName”?';
  }

  @override
  String get yesDeactivate => 'Da, dezactivează';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Introduceți o adresă de e-mail pe care să o folosiți ca autentificator.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Introduceți un număr de telefon pe care să îl utilizați ca autentificator';

  @override
  String get sendCode => 'Trimite codul';

  @override
  String get copy => 'Copiază';

  @override
  String get copiedToClipboard => 'Copiat în clipboard';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Introduceți aici codul din 6 cifre';

  @override
  String digitsCode(int count) {
    return 'Cod din $count cifre';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copiați cheia de 32 de caractere în aplicația de autentificare sau scanați codul QR de mai jos';

  @override
  String get applyChanges => 'Aplică schimbările';

  @override
  String get discardChanges => 'Abandonează modificările';

  @override
  String get yesDiscard => 'Da, abandonează';

  @override
  String get thisActionCannotBeUndone => 'Această acțiune nu poate fi anulată';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Autentificarea cu doi factori vă protejează contul împotriva accesului neautorizat. Tot ce trebuie să faceți este să introduceți un cod de securitate când vă conectați.';

  @override
  String get calculatedField => 'Câmp calculat';

  @override
  String get apiKey => 'Cheie API';

  @override
  String get aiModel => 'Model IA';

  @override
  String get adminSettings => 'Setări de administrare';

  @override
  String get job => 'Sarcină';

  @override
  String get mobileAppBundle => 'Pachet de aplicație mobilă';

  @override
  String get mobileApp => 'Aplicație mobilă';

  @override
  String get domain => 'Domeniu';

  @override
  String get oauth2Client => 'Client OAuth 2.0';

  @override
  String get queueStats => 'Statistici ale cozii';

  @override
  String get phoneIsRequired => 'Telefonul este obligatoriu.';

  @override
  String get phoneIsInvalid => 'Telefon nevalid.';

  @override
  String get addVerificationMethod => 'Adaugă o metodă de verificare';

  @override
  String get imageSavedToGallery =>
      'Salvat în „Galerie de imagini” din platformă';

  @override
  String get failedToSaveImage => 'Salvarea imaginii a eșuat';

  @override
  String nSelected(int count) {
    return 'Selectate: $count';
  }

  @override
  String get selectAll => 'Selectează toate';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de operațiuni eșuate',
      few: '$count operațiuni eșuate',
      one: '$count operațiune eșuată',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ștergeți $count de notificări?',
      few: 'Ștergeți $count notificări?',
      one: 'Ștergeți $count notificare?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Marcați $count de notificări ca citite?',
      few: 'Marcați $count notificări ca citite?',
      one: 'Marcați $count notificare ca citită?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Se obțin date de la gazda dumneavoastră $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Se realizează conectarea la gazda $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Se comută pe noua gazdă $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Nu s-a putut obține un token de conectare de la $host. Scanați un cod QR nou.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Conectarea la $host a eșuat';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host nu este un server ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Sesiunea codului QR nu mai este validă. Reîmprospătați codul QR și scanați din nou.';

  @override
  String get openThisLinkTitle => 'Deschideți acest link?';

  @override
  String get linkOpensSignInPage =>
      'Acest link deschide pagina de conectare a acestui server. Sesiunea de pe serverul curent se va încheia.';

  @override
  String get linkOpensSignInPageOnly =>
      'Acest link deschide pagina de conectare a acestui server.';

  @override
  String linkSignsInAs(Object email) {
    return 'Acest link vă conectează la acest server ca $email.';
  }

  @override
  String get linkSignsIn => 'Acest link vă conectează la acest server.';

  @override
  String get serverConnectionNotSecure =>
      'Acest server nu utilizează o conexiune securizată.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Această aplicație funcționează doar cu propriul server și nu poate deschide acest link.';

  @override
  String get liveTrackingActive => 'Urmărire locație în timp real';

  @override
  String get liveTrackingPaused => 'Urmărire în timp real în pauză';

  @override
  String get liveTrackingFixes => 'Înregistrări';

  @override
  String get liveTrackingSaved => 'Salvate';

  @override
  String get liveTrackingErrors => 'Erori';

  @override
  String get liveTrackingStop => 'Oprește';

  @override
  String get liveTrackingPause => 'Pauză';

  @override
  String get liveTrackingResume => 'Reia';

  @override
  String get liveTrackingHide => 'Ascunde';

  @override
  String get liveTrackingSessionTitle => 'Urmărire locație în timp real';

  @override
  String get liveTrackingTarget => 'Salvează locația în entitate';

  @override
  String get liveTrackingDashboard => 'Tablou de bord';

  @override
  String get liveTrackingStatus => 'Stare';

  @override
  String get liveTrackingStarted => 'Ora de început';

  @override
  String get liveTrackingLastFix => 'Ultima înregistrare';

  @override
  String get liveTrackingLastError => 'Ultima eroare';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Nu se poate salva în această entitate – nu mai există. Urmărirea continuă; actualizați ținta în acțiunea tabloului de bord.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Nu există conexiune la server. Aceste înregistrări nu au fost salvate – salvarea se reia când reveniți online.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Sesiunea dumneavoastră s-a încheiat. Conectați-vă din nou pentru a continua salvarea locației.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Nu se poate salva în această entitate – nu aveți permisiunea. Urmărirea continuă; solicitați administratorului să vă acorde acces.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Această înregistrare nu a putut fi salvată pe server. Salvarea se reîncearcă la următoarea înregistrare.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Serviciile de localizare sunt dezactivate pe acest dispozitiv.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Permisiunea de localizare a fost refuzată.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Permisiunea de localizare este refuzată definitiv. Activați-o din setările aplicației.';

  @override
  String get liveTrackingErrorLocation =>
      'Nu s-a putut obține o înregistrare a locației.';

  @override
  String get liveTrackingMenuTitle => 'Urmărire locație în timp real';

  @override
  String get liveTrackingNoRecord =>
      'Nicio urmărire activă și nicio sesiune recentă.';

  @override
  String get liveTrackingLastSession => 'Ultima sesiune';

  @override
  String get liveTrackingStartAgain => 'Începe din nou';

  @override
  String get liveTrackingEnded => 'Ora de sfârșit';

  @override
  String get liveTrackingEndReason => 'Motivul încheierii';

  @override
  String get liveTrackingEndReasonManual => 'Oprită manual';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Durata maximă atinsă';

  @override
  String get liveTrackingEndReasonInterrupted => 'Întreruptă';

  @override
  String get serverUpdateRequired => 'Actualizare a serverului necesară';

  @override
  String get backToLogin => 'Înapoi la conectare';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Această aplicație funcționează cu ThingsBoard $minVersion sau o versiune ulterioară.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Versiune';

  @override
  String get askAdminToUpdateServer =>
      'Solicitați administratorului serverului să actualizeze serverul.';

  @override
  String get deviceClaimFailed =>
      'Dispozitivul nu a putut fi revendicat. Încercați din nou.';

  @override
  String get deviceToClaimNotFound =>
      'Dispozitiv negăsit. Contactați furnizorul dispozitivului.';

  @override
  String get enableAuthenticatorApp => 'Activează aplicația de autentificare';

  @override
  String get enableSmsAuthenticator => 'Activează autentificatorul SMS';

  @override
  String get enableEmailAuthenticator => 'Activează autentificatorul de e-mail';

  @override
  String get getBackupCode => 'Obține codul de rezervă';

  @override
  String get twoFaTotpDescription =>
      'Folosiți pe telefon aplicații precum Google Authenticator, Authy sau Duo pentru autentificare. Acestea vor genera un cod de securitate pentru conectare.';

  @override
  String get twoFaSmsDescription =>
      'Folosiți telefonul pentru autentificare. Vă vom trimite un cod de securitate prin mesaj SMS la conectare.';

  @override
  String get twoFaEmailDescription =>
      'Folosiți pentru autentificare un cod de securitate trimis la adresa dumneavoastră de e-mail.';

  @override
  String get twoFaBackupCodeDescription =>
      'Aceste coduri de acces de unică folosință, care pot fi tipărite, vă permit să vă conectați atunci când nu aveți telefonul la îndemână, de exemplu când călătoriți.';

  @override
  String get openInAuthenticatorApp => 'Deschide în aplicația de autentificare';

  @override
  String get noAuthenticatorAppFound =>
      'Nu a fost găsită nicio aplicație de autentificare. Copiați cheia în aplicația dumneavoastră.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Metodă activată: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Administratorul dumneavoastră solicită autentificarea cu doi factori pentru $email.';
  }

  @override
  String get recommended => 'Recomandat';

  @override
  String get addBackupCodesHint =>
      'Adăugați și coduri de rezervă, pentru a vă putea conecta chiar dacă pierdeți telefonul.';

  @override
  String get totpSecretKey => 'Cheie secretă';

  @override
  String get backupCodesDescription =>
      'Imprimați codurile pentru a le avea la îndemână atunci când trebuie să le utilizați pentru a vă conecta la cont. Puteți utiliza fiecare cod de rezervă o singură dată.';

  @override
  String get backupCodesWarning =>
      'După ce părăsiți această pagină, aceste coduri nu mai pot fi afișate din nou. Păstrați-le în siguranță folosind opțiunile de mai jos.';

  @override
  String get downloadTxt => 'Descarcă (txt)';
}

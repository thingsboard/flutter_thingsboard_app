// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class SDa extends S {
  SDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Hjem';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enheder',
      one: 'Enhed',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Mere';

  @override
  String get customers => 'Kunder';

  @override
  String get assets => 'Aktiver';

  @override
  String get tenants => 'Lejere';

  @override
  String get auditLogs => 'Revisionslogge';

  @override
  String get noCustomersFound => 'Ingen kunder fundet';

  @override
  String get noAssetsFound => 'Ingen aktiver fundet';

  @override
  String get noTenantsFound => 'Ingen lejere fundet';

  @override
  String get noDevicesFound => 'Ingen enheder fundet';

  @override
  String get noAuditLogsFound => 'Ingen revisionslogge fundet';

  @override
  String get logout => 'Log ud';

  @override
  String get login => 'Log ind';

  @override
  String get logoDefaultValue => 'ThingsBoard-logo';

  @override
  String get loginToYourAccount => 'Log ind på din konto';

  @override
  String get email => 'E-mail';

  @override
  String get emailRequireText => 'E-mail er påkrævet.';

  @override
  String get emailInvalidText => 'Ugyldigt e-mailformat.';

  @override
  String get username => 'brugernavn';

  @override
  String get password => 'Adgangskode';

  @override
  String get passwordRequireText => 'Adgangskode er påkrævet.';

  @override
  String get passwordForgotText => 'Glemt adgangskode?';

  @override
  String get passwordReset => 'Nulstil adgangskode';

  @override
  String get passwordResetText =>
      'Indtast den e-mail, der er knyttet til din konto, så sender vi en e-mail med et link til nulstilling af adgangskoden';

  @override
  String get requestPasswordReset => 'Anmod om nulstilling af adgangskode';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Linket til nulstilling af adgangskode blev sendt!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Linket til e-mailbekræftelse blev sendt!';

  @override
  String get or => 'ELLER';

  @override
  String get no => 'Nej';

  @override
  String get yes => 'Ja';

  @override
  String get title => 'Titel';

  @override
  String get country => 'Land';

  @override
  String get city => 'By';

  @override
  String get stateOrProvince => 'Stat / Provins';

  @override
  String get postalCode => 'Postnummer';

  @override
  String get address => 'Adresse';

  @override
  String get address2 => 'Adresse 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Ryd alarm';

  @override
  String get alarmClearText => 'Er du sikker på, at du vil rydde alarmen?';

  @override
  String get alarmAcknowledgeTitle => 'Kvittér alarm';

  @override
  String get alarmAcknowledgeText =>
      'Er du sikker på, at du vil kvittere alarmen?';

  @override
  String get assetName => 'Aktivnavn';

  @override
  String get type => 'Type';

  @override
  String get label => 'Etiket';

  @override
  String get assignedToCustomer => 'Tildelt kunde';

  @override
  String get auditLogDetails => 'Detaljer for revisionslog';

  @override
  String get customerDetails => 'Kundedetaljer';

  @override
  String get assetDetails => 'Aktivdetaljer';

  @override
  String get tenantDetails => 'Lejerdetaljer';

  @override
  String get entityType => 'Entitetstype';

  @override
  String get actionData => 'Handlingsdata';

  @override
  String get failureDetails => 'Fejldetaljer';

  @override
  String get allDevices => 'Alle enheder';

  @override
  String get active => 'Aktiv';

  @override
  String get inactive => 'Inaktiv';

  @override
  String get deviceActive => 'Aktiv';

  @override
  String get deviceInactive => 'Inaktiv';

  @override
  String get activeDevices => 'Aktiv';

  @override
  String get inactiveDevices => 'Inaktiv';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktiv - kvitteret';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktiv - ikke kvitteret';

  @override
  String get alarmStatusClearedAcknowledged => 'Ryddet - kvitteret';

  @override
  String get alarmStatusClearedUnacknowledged => 'Ryddet - ikke kvitteret';

  @override
  String get alarmStatusFilterActive => 'Aktiv';

  @override
  String get systemAdministrator => 'Systemadministrator';

  @override
  String get tenantAdministrator => 'Lejeradministrator';

  @override
  String get customer => 'Kunde';

  @override
  String get changePassword => 'Skift adgangskode';

  @override
  String get currentPasswordRequireText => 'Nuværende adgangskode er påkrævet.';

  @override
  String get currentPassword => 'Nuværende adgangskode';

  @override
  String get newPasswordRequireText => 'Ny adgangskode er påkrævet.';

  @override
  String get newPassword => 'Ny adgangskode';

  @override
  String get newPassword2RequireText => 'Ny adgangskode igen er påkrævet.';

  @override
  String get newPassword2 => 'Bekræft ny adgangskode';

  @override
  String get passwordErrorNotification =>
      'De indtastede adgangskoder skal være ens!';

  @override
  String get firstNameUpper => 'Fornavn';

  @override
  String get lastNameUpper => 'Efternavn';

  @override
  String get profileSuccessNotification => 'Profilen er opdateret';

  @override
  String get passwordSuccessNotification => 'Adgangskoden er ændret';

  @override
  String get notImplemented => 'Ikke implementeret!';

  @override
  String get listIsEmptyText => 'Listen er tom i øjeblikket.';

  @override
  String get tryAgain => 'Prøv igen';

  @override
  String get verifyYourIdentity => 'Bekræft din identitet';

  @override
  String get continueText => 'Fortsæt';

  @override
  String get resendCode => 'Send kode igen';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekunder',
      one: '1 sekund',
    );
    return 'Send koden igen om $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Indtast sikkerhedskoden fra din autentifikator-app.';

  @override
  String smsAuthDescription(Object contact) {
    return 'En sikkerhedskode er sendt til din telefon på $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'En sikkerhedskode er sendt til din e-mailadresse på $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Indtast en af dine backupkoder.';

  @override
  String get toptAuthPlaceholder => 'Kode';

  @override
  String get smsAuthPlaceholder => 'SMS-kode';

  @override
  String get emailAuthPlaceholder => 'E-mail-kode';

  @override
  String get backupCodeAuthPlaceholder => 'Backupkode';

  @override
  String get verificationCodeIncorrect => 'Verifikationskoden er forkert';

  @override
  String get verificationCodeManyRequest =>
      'For mange anmodninger om at kontrollere verifikationskoden';

  @override
  String get tryAnotherWay => 'Prøv en anden metode';

  @override
  String get selectWayToVerify => 'Vælg en metode til bekræftelse';

  @override
  String get mfaProviderTopt => 'Autentificeringsapp';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Backupkode';

  @override
  String get newUserText => 'Ny bruger?';

  @override
  String get createAccount => 'Opret konto';

  @override
  String get emailVerification => 'Bekræftelse af e-mail';

  @override
  String get emailVerificationSentText =>
      'En e-mail med bekræftelsesoplysninger er sendt til den angivne e-mailadresse ';

  @override
  String get emailVerificationInstructionsText =>
      'Følg instruktionerne i e-mailen for at fuldføre din tilmelding. Bemærk: hvis du ikke har set e-mailen i et stykke tid, så tjek din \'spam\'-mappe eller prøv at sende e-mailen igen ved at klikke på knappen \'Send igen\'.';

  @override
  String get resend => 'Send igen';

  @override
  String get activatingAccount => 'Aktiverer konto...';

  @override
  String get accountActivated => 'Kontoen er aktiveret!';

  @override
  String get emailVerified => 'E-mail bekræftet';

  @override
  String get activatingAccountText =>
      'Din konto aktiveres i øjeblikket.\nVent venligst...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Tillykke!\nDin $appTitle-konto er blevet aktiveret.\nNu kan du logge ind på dit $appTitle-område.';
  }

  @override
  String get privacyPolicy => 'Privatlivspolitik';

  @override
  String get cancel => 'Annullér';

  @override
  String get accept => 'Acceptér';

  @override
  String get termsOfUse => 'Brugsbetingelser';

  @override
  String get firstName => 'Fornavn';

  @override
  String get firstNameRequireText => 'Fornavn er påkrævet.';

  @override
  String get lastName => 'Efternavn';

  @override
  String get lastNameRequireText => 'Efternavn er påkrævet.';

  @override
  String get createPassword => 'Opret en adgangskode';

  @override
  String get repeatPassword => 'Gentag din adgangskode';

  @override
  String get imNotARobot => 'Jeg er ikke en robot';

  @override
  String get signUp => 'Tilmeld';

  @override
  String get alreadyHaveAnAccount => 'Har du allerede en konto?';

  @override
  String get signIn => 'Log ind';

  @override
  String get inactiveUserAlreadyExists => 'Inaktiv bruger eksisterer allerede';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Der er allerede en registreret bruger med en ubekræftet e-mailadresse.\nKlik på knappen \'Send igen\', hvis du vil sende bekræftelses-e-mailen igen.';

  @override
  String get assignee => 'Tildelt person';

  @override
  String get alarmTypes => 'Alarmtyper';

  @override
  String get details => 'Detaljer';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Alvorlighed';

  @override
  String get originator => 'Afsender';

  @override
  String get startTime => 'Starttidspunkt';

  @override
  String get duration => 'Varighed';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dage',
      one: '$value dag',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value timer',
      one: '$value time',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minutter',
      one: '$value minut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value sekunder',
      one: '$value sekund',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Vis dashboard';

  @override
  String get activity => 'Aktivitet';

  @override
  String get addCommentMessage => 'Tilføj en kommentar...';

  @override
  String get selectUser => 'Vælg brugere';

  @override
  String get assignedToMe => 'Tildelt mig';

  @override
  String get clear => 'Ryd';

  @override
  String get acknowledge => 'Kvittér';

  @override
  String get edit => 'Redigér';

  @override
  String get editProfile => 'Redigér profil';

  @override
  String get delete => 'Slet';

  @override
  String get edited => 'Redigeret';

  @override
  String get deleteComment => 'Slet kommentar';

  @override
  String get areYouSure => 'Er du sikker?';

  @override
  String get noResultsFound => 'Ingen resultater fundet';

  @override
  String get tryRefiningYourQuery => 'Prøv at præcisere din forespørgsel';

  @override
  String get failedToLoadTheList => 'Kunne ikke indlæse listen';

  @override
  String get tryRefreshing => 'Prøv at opdatere';

  @override
  String get refresh => 'Opdatér';

  @override
  String get users => 'Brugere';

  @override
  String get unassigned => 'Ikke tildelt';

  @override
  String get failedToLoadAlarmDetails => 'Kunne ikke indlæse alarmdetaljer';

  @override
  String get somethingWentWrong => 'Noget gik galt';

  @override
  String get chooseRegion => 'Vælg region';

  @override
  String get selectRegion => 'Vælg region';

  @override
  String get northAmerica => 'Nordamerika';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Enhedsliste';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dashboards',
      one: 'Dashboard',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Opdatering påkrævet';

  @override
  String updateTo(Object version) {
    return 'Opdatér til $version';
  }

  @override
  String get next => 'Næste';

  @override
  String get confirmation => 'Bekræftelse';

  @override
  String get wifiPassword => 'Wi-Fi-adgangskode';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'For at fortsætte opsætningen af din enhed $deviceName skal du angive legitimationsoplysningerne til dit netværk.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Indtast adgangskode for $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Ingen enheder fundet. Kontrollér, at din telefons Bluetooth er slået til, og at du er inden for rækkevidde af din nye enhed.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Du har ikke tilstrækkelige tilladelser til \"$permissions\" for at fortsætte. Giv de påkrævede tilladelser, og tryk på \"Prøv igen\".';
  }

  @override
  String get sendingWifiCredentials => 'Sender Wi-Fi-legitimationsoplysninger';

  @override
  String get confirmingWifiConnection => 'Bekræfter Wi-Fi-forbindelse';

  @override
  String get provisionedSuccessfully => 'Enheden er blevet klargjort';

  @override
  String get returnToDashboard => 'Tilbage til dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Kan ikke etablere session med enheden $deviceName. Prøv igen';
  }

  @override
  String get claimingDevice => 'Tager enheden i brug';

  @override
  String get claimingDeviceDone => 'Enheden er taget i brug';

  @override
  String get claimingMessageSuccess => 'Enheden blev\ntaget i brug';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Du har ikke tilstrækkelige tilladelser til \"$permissions\" for at fortsætte. Åbn applikationsindstillinger, giv tilladelser og tryk på \"Prøv igen\".';
  }

  @override
  String get scanACode => 'Scan en kode';

  @override
  String get allowAccess => 'Tillad adgang';

  @override
  String get toggleCamera => 'Skift kamera';

  @override
  String get toggleFlash => 'Skift blitz';

  @override
  String get unableToUseCamera => 'Kan ikke bruge kamera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Åbn indstillinger og giv adgang til kamera for at fortsætte';

  @override
  String get notFound => 'Ikke fundet';

  @override
  String routeNotDefined(Object name) {
    return 'Rute ikke defineret: $name';
  }

  @override
  String get loginWith => 'Log ind med';

  @override
  String get scanQrCode => 'Scan QR-kode';

  @override
  String get anEmptyRequestDataReceived => 'Tomme forespørgselsdata modtaget.';

  @override
  String get somethingWentWrongRollback => 'Noget gik galt ... Tilbagerulning';

  @override
  String get searchResults => 'Søgeresultater';

  @override
  String get viewAll => 'Vis alle';

  @override
  String get requestedEntityDoesNotExists =>
      'Den anmodede entitet findes ikke.';

  @override
  String get noAlarmsFound => 'Ingen alarmer fundet';

  @override
  String get filters => 'Filtre';

  @override
  String get alarmStatusList => 'Liste over alarmstatus';

  @override
  String get alarmSeverityList => 'Liste over alvorlighedsniveauer';

  @override
  String get cleared => 'Ryddet';

  @override
  String get acknowledged => 'Kvitteret';

  @override
  String get unacknowledged => 'Ikke kvitteret';

  @override
  String get critical => 'Kritisk';

  @override
  String get major => 'Alvorlig';

  @override
  String get minor => 'Mindre alvorlig';

  @override
  String get warning => 'Advarsel';

  @override
  String get indeterminate => 'Ubestemt';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Søg brugere',
      one: 'Søg bruger',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Nulstil';

  @override
  String get update => 'Opdatér';

  @override
  String get alarmTypeList => 'Liste over alarmtyper';

  @override
  String get anyType => 'Enhver type';

  @override
  String get plusAlarmType => '+ Alarmtype';

  @override
  String get all => 'Alle';

  @override
  String get allNotifications => 'Alle';

  @override
  String get unread => 'Ulæst';

  @override
  String get close => 'Luk';

  @override
  String get codeVerificationFailed => 'Kodeverifikation mislykkedes!';

  @override
  String get fatalError => 'Fatal fejl';

  @override
  String get unknownError => 'Ukendt fejl.';

  @override
  String get sessionExpired => 'Sessionen er udløbet';

  @override
  String get fatalApplicationErrorOccurred =>
      'Der opstod en fatal applikationsfejl:';

  @override
  String get connectionError => 'Forbindelsesfejl';

  @override
  String get failedToConnectToServer =>
      'Kunne ikke oprette forbindelse til serveren';

  @override
  String get retry => 'Prøv igen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobildashboard skal konfigureres i enhedsprofilen!';

  @override
  String get openWifiSettings => 'Åbn Wi-Fi-indstillinger';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Opret forbindelse til den Wi-Fi, du normalt bruger';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Vend tilbage til applikationen og tryk på knappen Klar';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Følg de næste trin for at genoprette forbindelse\nmellem din telefon og din sædvanlige Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-notifikationer er ikke konfigureret.\nKontakt din systemadministrator.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase er ikke konfigureret.\n Se den officielle Firebase-dokumentation for\n vejledning i, hvordan du gør det.';

  @override
  String get markAllAsRead => 'Markér alle som læst';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Kan ikke åbne URL: $link';
  }

  @override
  String get noDashboardsFound => 'Ingen dashboards fundet';

  @override
  String get openAppSettings => 'Åbn applikationsindstillinger';

  @override
  String get connectingToDevice => 'Opretter forbindelse til enheden';

  @override
  String get connectToDevice => 'Opret forbindelse til enheden';

  @override
  String get selectWifiNetwork => 'Vælg Wi-Fi-netværk';

  @override
  String get deviceProvisioning => 'Klargøring af enheder';

  @override
  String get permissions => 'Tilladelser';

  @override
  String get unableConnectToDevice =>
      'Kan ikke oprette forbindelse til enheden';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Enheden kan ikke finde Wi-Fi i nærheden';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Forbindelsen til Wi-Fi-netværket $name mislykkedes.\nSørg for, at din telefon er forbundet til enhedens Wi-Fi-netværk, og at adgang til lokalt netværk er aktiveret for denne applikation i telefonens indstillinger.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Kan ikke oprette forbindelse til Wi-Fi, fordi enheden $name ikke fandt nogen netværk';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Følg de næste trin for at forbinde din telefon til enheden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Opret forbindelse til Wi-Fi svarende til $wifiName';
  }

  @override
  String get ready => 'Klar';

  @override
  String get exitDeviceProvisioning => 'Afslut enhedsklargøring';

  @override
  String get noNotificationsFound => 'Ingen notifikationer fundet';

  @override
  String get markAsRead => 'Markér som læst';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Scan QR-koden på din enhed';

  @override
  String get search => 'Søg';

  @override
  String get tenant => 'Lejer';

  @override
  String get tenantProfile => 'Lejerprofil';

  @override
  String get user => 'Bruger';

  @override
  String get asset => 'Aktiv';

  @override
  String get deviceProfile => 'Enhedsprofil';

  @override
  String get assetProfile => 'Aktivprofil';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmer',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Regelkæde';

  @override
  String get ruleNode => 'Regelnode';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entitetsvisning';

  @override
  String get widgetsBundle => 'Widgetpakke';

  @override
  String get widgetType => 'Widgettype';

  @override
  String get apiUsageState => 'API-brugsstatus';

  @override
  String get tbResource => 'Ressource';

  @override
  String get otaPackage => 'OTA-pakke';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Kø';

  @override
  String get notificationTarget => 'Notifikationsmodtager';

  @override
  String get notificationTemplate => 'Notifikationsskabelon';

  @override
  String get notificationRequest => 'Notifikationsanmodning';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notifikationer',
      one: 'Notifikation',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Notifikationsregel';

  @override
  String get entityGroup => 'Entitetsgruppe';

  @override
  String get converter => 'Datakonverter';

  @override
  String get integration => 'Integration';

  @override
  String get schedulerEvent => 'Planlæggerhændelse';

  @override
  String get blobEntity => 'Blob-entitet';

  @override
  String get role => 'Rolle';

  @override
  String get groupPermission => 'Gruppetilladelse';

  @override
  String get actionStatusSuccess => 'Succes';

  @override
  String get actionStatusFailure => 'Fejl';

  @override
  String get actionTypeAdded => 'Tilføjet';

  @override
  String get actionTypeDeleted => 'Slettet';

  @override
  String get actionTypeUpdated => 'Opdateret';

  @override
  String get actionTypeAttributesUpdated => 'Attributter opdateret';

  @override
  String get actionTypeAttributesDeleted => 'Attributter slettet';

  @override
  String get actionTypeRpcCall => 'RPC-kald';

  @override
  String get actionTypeCredentialsUpdated =>
      'Legitimationsoplysninger opdateret';

  @override
  String get actionTypeAssignedToCustomer => 'Tildelt til kunde';

  @override
  String get actionTypeUnassignedFromCustomer => 'Tildeling til kunde fjernet';

  @override
  String get actionTypeActivated => 'Aktiveret';

  @override
  String get actionTypeSuspended => 'Suspenderet';

  @override
  String get actionTypeCredentialsRead => 'Legitimationsoplysninger læst';

  @override
  String get actionTypeAttributesRead => 'Attributter læst';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relation opdateret';

  @override
  String get actionTypeRelationDeleted => 'Relation slettet';

  @override
  String get actionTypeRelationsDeleted => 'Alle relationer slettet';

  @override
  String get actionTypeAlarmAck => 'Kvitteret';

  @override
  String get actionTypeAlarmClear => 'Ryddet';

  @override
  String get actionTypeAlarmDelete => 'Alarm slettet';

  @override
  String get actionTypeAlarmAssigned => 'Alarm tildelt';

  @override
  String get actionTypeAlarmUnassigned => 'Alarmtildeling fjernet';

  @override
  String get actionTypeLogin => 'Login';

  @override
  String get actionTypeLogout => 'Logout';

  @override
  String get actionTypeLockout => 'Låst ude';

  @override
  String get actionTypeAssignedFromTenant => 'Tildelt fra lejer';

  @override
  String get actionTypeAssignedToTenant => 'Tildelt til lejer';

  @override
  String get actionTypeProvisionSuccess => 'Enhed klargjort';

  @override
  String get actionTypeProvisionFailure => 'Klargøring af enhed mislykkedes';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetri opdateret';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetri slettet';

  @override
  String get actionTypeAssignedToEdge => 'Tildelt til Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Tildeling til Edge fjernet';

  @override
  String get actionTypeAddedComment => 'Kommentar tilføjet';

  @override
  String get actionTypeUpdatedComment => 'Kommentar opdateret';

  @override
  String get actionTypeDeletedComment => 'Kommentar slettet';

  @override
  String get actionTypeSmsSent => 'SMS sendt';

  @override
  String get actionTypeAddedToEntityGroup => 'Tilføjet til entitetsgruppe';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Fjernet fra entitetsgruppe';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API-kald til Rule Engine';

  @override
  String get actionTypeMadePublic => 'Gjort offentlig';

  @override
  String get actionTypeMadePrivate => 'Gjort privat';

  @override
  String get actionTypeChangeOwner => 'Ejer ændret';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Du har ikke tilladelse til at udføre denne handling!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Det ser ud til, at dine tilladelser ikke er tilstrækkelige til at udføre denne handling';

  @override
  String get isRequiredText => 'er påkrævet.';

  @override
  String get no2faProvidersFound => 'Ingen 2FA-udbydere fundet';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Kontakt din systemadministrator';

  @override
  String errorOccured(Object e) {
    return 'Der opstod en fejl: $e';
  }

  @override
  String get unsavedChanges => 'Ikke gemte ændringer';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Du har ikke gemte ændringer. Er du sikker på, at du vil forlade denne side?';

  @override
  String get deleteAccount => 'Slet konto';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Er du sikker? Du er ved at slette din $authority-konto.';
  }

  @override
  String get language => 'Sprog';

  @override
  String get metricUnitSystem => 'Metrisk';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Hybrid';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Måleenhedssystem';

  @override
  String get selectCountry => 'Vælg land';

  @override
  String get hideHomeDashboardToolbar => 'Skjul værktøjslinje i startdashboard';

  @override
  String get phoneNumberHelperText =>
      'Telefonnummer i E.164-format, f.eks. +1201550123';

  @override
  String get homeDashboard => 'Startdashboard';

  @override
  String get security => 'Sikkerhed';

  @override
  String get twofactorAuthentication => 'Tofaktorgodkendelse';

  @override
  String get verificationRequired => 'Verifikation påkrævet';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Tofaktorgodkendelse er påkrævet';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Opsæt en verifikationsmetode for at fortsætte med dit login';

  @override
  String get setUpAVerificationMethod => 'Opsæt en verifikationsmetode';

  @override
  String get totpSetupSuccessDescription =>
      'Næste gang du logger ind, skal du angive en tofaktorgodkendelseskode';

  @override
  String get smsSetupSuccessDescription =>
      'Næste gang du logger ind, bliver du bedt om at indtaste sikkerhedskoden, som sendes til telefonnummeret';

  @override
  String get emailSetupSuccessDescription =>
      'Næste gang du logger ind, bliver du bedt om at indtaste sikkerhedskoden, som sendes til din e-mailadresse';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Næste gang du logger ind, kan du bruge backupkoder til at gennemføre tofaktorgodkendelse';

  @override
  String get loginToApp => 'Log ind på applikationen';

  @override
  String get goBack => 'Gå tilbage';

  @override
  String get done => 'Færdig';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Dette vil gøre din konto mindre sikker';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Er du sikker på, at du vil deaktivere $providerName?';
  }

  @override
  String get yesDeactivate => 'Ja, deaktivér';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Indtast en e-mail, der skal bruges som godkendelsesmetode.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Indtast et telefonnummer, der skal bruges som godkendelsesmetode';

  @override
  String get sendCode => 'Send kode';

  @override
  String errorSendingCode(String error) {
    return 'Fejl ved afsendelse af kode: $error';
  }

  @override
  String get copy => 'Kopiér';

  @override
  String get copiedToClipboard => 'Kopieret til udklipsholder';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Indtast 6-cifret kode her';

  @override
  String digitsCode(int count) {
    return '$count-cifret kode';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopiér nøglen på 32 tegn ind i din godkendelsesapp, eller scan QR-koden nedenfor';

  @override
  String get applyChanges => 'Anvend ændringer';

  @override
  String get discardChanges => 'Kassér ændringer';

  @override
  String get yesDiscard => 'Ja, kassér';

  @override
  String get thisActionCannotBeUndone => 'Denne handling kan ikke fortrydes';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Tofaktorgodkendelse beskytter din konto mod uautoriseret adgang. Du skal blot indtaste en sikkerhedskode ved login.';

  @override
  String get calculatedField => 'Beregnet felt';

  @override
  String get apiKey => 'API-nøgle';

  @override
  String get aiModel => 'AI-model';

  @override
  String get adminSettings => 'Administratorindstillinger';

  @override
  String get job => 'Job';

  @override
  String get mobileAppBundle => 'Mobilpakke';

  @override
  String get mobileApp => 'Mobilapp';

  @override
  String get domain => 'Domæne';

  @override
  String get oauth2Client => 'OAuth 2.0-klient';

  @override
  String get queueStats => 'Køstatistik';

  @override
  String get phoneIsRequired => 'Telefonnummer er påkrævet';

  @override
  String get phoneIsInvalid => 'Telefonnummer er ugyldigt';

  @override
  String get addVerificationMethod => 'Tilføj verifikationsmetode';

  @override
  String get imageSavedToGallery => 'Gemt i platformens \'Billedgalleri\'';

  @override
  String get failedToSaveImage => 'Kunne ikke gemme billedet';

  @override
  String nSelected(int count) {
    return '$count valgt';
  }

  @override
  String get selectAll => 'Vælg alle indlæste';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count handlinger mislykkedes',
      one: '1 handling mislykkedes',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slet $count notifikationer?',
      one: 'Slet 1 notifikation?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Markér $count notifikationer som læst?',
      one: 'Markér 1 notifikation som læst?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Henter data fra din vært $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Logger dig ind på værten $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Skifter til den nye vært $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Kunne ikke hente et login-token fra $host. Scan en ny QR-kode.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Kunne ikke oprette forbindelse til $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host er ikke en ThingsBoard-server';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR-kodesessionen er ikke længere gyldig. Opdatér QR-koden, og scan igen.';

  @override
  String get openThisLinkTitle => 'Åbn dette link?';

  @override
  String get linkOpensSignInPage =>
      'Dette link åbner loginsiden for denne server. Du bliver logget ud af din aktuelle server.';

  @override
  String get linkOpensSignInPageOnly =>
      'Dette link åbner loginsiden for denne server.';

  @override
  String linkSignsInAs(Object email) {
    return 'Dette link logger dig ind på denne server som $email.';
  }

  @override
  String get linkSignsIn => 'Dette link logger dig ind på denne server.';

  @override
  String get serverConnectionNotSecure =>
      'Denne server bruger ikke en sikker forbindelse.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Denne applikation fungerer kun med sin egen server og kan ikke åbne dette link.';

  @override
  String get liveTrackingActive => 'Live-sporing af placering';

  @override
  String get liveTrackingPaused => 'Live-sporing sat på pause';

  @override
  String get liveTrackingFixes => 'Positioner';

  @override
  String get liveTrackingSaved => 'Gemt';

  @override
  String get liveTrackingErrors => 'Fejl';

  @override
  String get liveTrackingStop => 'Stop';

  @override
  String get liveTrackingPause => 'Pause';

  @override
  String get liveTrackingResume => 'Genoptag';

  @override
  String get liveTrackingHide => 'Skjul';

  @override
  String get liveTrackingSessionTitle => 'Live-sporing af placering';

  @override
  String get liveTrackingTarget => 'Gem placering på entitet';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Starttidspunkt';

  @override
  String get liveTrackingLastFix => 'Seneste position';

  @override
  String get liveTrackingLastError => 'Seneste fejl';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Kan ikke gemme til denne entitet — den findes ikke længere. Sporingen fortsætter; opdatér målet i dashboardhandlingen.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Ingen forbindelse til serveren. Disse positioner blev ikke gemt — lagringen genoptages, når du er online igen.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Din session er udløbet. Log ind igen for at fortsætte med at gemme placeringen.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Kan ikke gemme til denne entitet — du har ikke tilladelse. Sporingen fortsætter; bed din administrator om at give adgang.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Kunne ikke gemme denne position på serveren. Lagringen forsøges igen med næste position.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Placeringstjenester er slået fra på denne enhed.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Placeringstilladelse blev afvist.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Placeringstilladelse er permanent afvist. Aktivér den i applikationens indstillinger.';

  @override
  String get liveTrackingErrorLocation => 'Kunne ikke hente en placering.';

  @override
  String get liveTrackingMenuTitle => 'Live-sporing af placering';

  @override
  String get liveTrackingNoRecord =>
      'Ingen aktiv sporing og ingen nylig session.';

  @override
  String get liveTrackingLastSession => 'Seneste session';

  @override
  String get liveTrackingStartAgain => 'Start igen';

  @override
  String get liveTrackingEnded => 'Sluttidspunkt';

  @override
  String get liveTrackingEndReason => 'Afslutningsårsag';

  @override
  String get liveTrackingEndReasonManual => 'Stoppet manuelt';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Maksimal varighed nået';

  @override
  String get liveTrackingEndReasonInterrupted => 'Afbrudt';

  @override
  String get serverUpdateRequired => 'Serveropdatering påkrævet';

  @override
  String get backToLogin => 'Tilbage til login';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Denne applikation fungerer med ThingsBoard $minVersion eller nyere.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Bed din serveradministrator om at opdatere serveren.';

  @override
  String get deviceClaimFailed => 'Enheden kunne ikke tages i brug. Prøv igen.';

  @override
  String get deviceToClaimNotFound =>
      'Enhed ikke fundet. Kontakt enhedsleverandøren.';

  @override
  String get enableAuthenticatorApp => 'Aktivér godkendelsesapp';

  @override
  String get enableSmsAuthenticator => 'Aktivér SMS-godkendelse';

  @override
  String get enableEmailAuthenticator => 'Aktivér e-mail-godkendelse';

  @override
  String get getBackupCode => 'Hent backupkode';

  @override
  String get twoFaTotpDescription =>
      'Brug apps som Google Authenticator, Authy eller Duo til autentificering. De genererer en sikkerhedskode til login.';

  @override
  String get twoFaSmsDescription =>
      'Brug din telefon til autentificering. Vi sender dig en sikkerhedskode via SMS, når du logger ind.';

  @override
  String get twoFaEmailDescription =>
      'Brug en kode sendt til din e-mail til autentificering.';

  @override
  String get twoFaBackupCodeDescription =>
      'Disse udskrivbare engangskoder giver dig mulighed for at logge ind, når du ikke har din telefon.';

  @override
  String get openInAuthenticatorApp => 'Åbn i godkendelsesapp';

  @override
  String get noAuthenticatorAppFound =>
      'Ingen godkendelsesapp fundet. Kopiér i stedet nøglen ind i din godkendelsesapp.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider er aktiveret';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Din administrator kræver tofaktorgodkendelse for $email.';
  }

  @override
  String get recommended => 'Anbefalet';

  @override
  String get addBackupCodesHint =>
      'Tilføj også backupkoder, så du stadig kan logge ind, hvis du mister din telefon.';

  @override
  String get totpSecretKey => 'Hemmelig nøgle';

  @override
  String get backupCodesDescription =>
      'Udskriv koderne, så du har dem ved hånden, når du skal bruge dem til at logge ind på din konto. Du kan bruge hver backupkode én gang.';

  @override
  String get backupCodesWarning =>
      'Når du forlader denne side, kan disse koder ikke vises igen. Opbevar dem sikkert ved hjælp af mulighederne nedenfor.';

  @override
  String get downloadTxt => 'Download (txt)';
}

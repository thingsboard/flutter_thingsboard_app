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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Revisionslogfiler';

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
  String get logout => 'Log ud';

  @override
  String get login => 'Log ind';

  @override
  String get logoDefaultValue => 'ThingsBoard-logo';

  @override
  String get loginToYourAccount => 'Log ind på din konto';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'Email er påkrævet.';

  @override
  String get emailInvalidText => 'Ugyldigt emailformat.';

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
      'Indtast den email, der er tilknyttet din konto, og vi sender en email med link til nulstilling af adgangskode';

  @override
  String get requestPasswordReset => 'Anmod om nulstilling af adgangskode';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Link til nulstilling af adgangskode blev sendt med succes!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-mailbekræftelseslinket blev sendt!';

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
  String get alarmAcknowledgeTitle => 'Bekræft alarm';

  @override
  String get alarmAcknowledgeText =>
      'Er du sikker på, at du vil bekræfte alarmen?';

  @override
  String get assetName => 'Aktivnavn';

  @override
  String get type => 'Type';

  @override
  String get label => 'Etiket';

  @override
  String get assignedToCustomer => 'Tildelt kunde';

  @override
  String get auditLogDetails => 'Revisionslogdetaljer';

  @override
  String get entityType => 'Enhedstype';

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
  String get newPassword2RequireText => 'Bekræft ny adgangskode er påkrævet.';

  @override
  String get newPassword2 => 'Bekræft ny adgangskode';

  @override
  String get passwordErrorNotification =>
      'Indtastede adgangskoder skal være ens!';

  @override
  String get firstNameUpper => 'Fornavn';

  @override
  String get lastNameUpper => 'Efternavn';

  @override
  String get profileSuccessNotification => 'Profilen blev opdateret';

  @override
  String get passwordSuccessNotification => 'Adgangskoden blev ændret';

  @override
  String get notImplemented => 'Ikke implementeret!';

  @override
  String get listIsEmptyText => 'Listen er i øjeblikket tom.';

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
    return 'Send kode igen om $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Indtast sikkerhedskoden fra din autentifikatorapp.';

  @override
  String smsAuthDescription(Object contact) {
    return 'En sikkerhedskode er blevet sendt til din telefon på $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'En sikkerhedskode er blevet sendt til din emailadresse på $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Indtast en af dine backupkoder.';

  @override
  String get verificationCodeInvalid => 'Ugyldigt format for verificeringskode';

  @override
  String get toptAuthPlaceholder => 'Kode';

  @override
  String get smsAuthPlaceholder => 'SMS-kode';

  @override
  String get emailAuthPlaceholder => 'Email-kode';

  @override
  String get backupCodeAuthPlaceholder => 'Backupkode';

  @override
  String get verificationCodeIncorrect => 'Verifikationskoden er forkert';

  @override
  String get verificationCodeManyRequest =>
      'For mange forespørgsler, kontroller verifikationskoden';

  @override
  String get tryAnotherWay => 'Prøv en anden metode';

  @override
  String get selectWayToVerify => 'Vælg en metode til verifikation';

  @override
  String get mfaProviderTopt => 'Autentifikatorapp';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Backupkode';

  @override
  String get newUserText => 'Ny bruger?';

  @override
  String get createAccount => 'Opret konto';

  @override
  String get emailVerification => 'Email-verifikation';

  @override
  String get emailVerificationSentText =>
      'En email med verifikationsdetaljer er sendt til den angivne emailadresse';

  @override
  String get emailVerificationInstructionsText =>
      'Følg venligst instruktionerne i emailen for at fuldføre din registrering. Bemærk: Hvis du ikke har set emailen i et stykke tid, så tjek din \'spam\'-mappe eller prøv at gensende emailen ved at klikke på \'Gensend\'-knappen.';

  @override
  String get resend => 'Gensend';

  @override
  String get activatingAccount => 'Aktiverer konto...';

  @override
  String get accountActivated => 'Kontoen blev aktiveret!';

  @override
  String get emailVerified => 'Email verificeret';

  @override
  String get activatingAccountText =>
      'Din konto aktiveres i øjeblikket.\nVent venligst...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Tillykke!\nDin $appTitle-konto er blevet aktiveret.\nDu kan nu logge ind på din $appTitle-platform.';
  }

  @override
  String get privacyPolicy => 'Privatlivspolitik';

  @override
  String get cancel => 'Annuller';

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
  String get inactiveUserAlreadyExists => 'Inaktiv bruger findes allerede';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Der er allerede en registreret bruger med en ikke-verificeret emailadresse.\nKlik på \'Gensend\'-knappen, hvis du ønsker at gensende verifikationsmailen.';

  @override
  String get assignee => 'Tildelt';

  @override
  String get alarmTypes => 'Alarmtyper';

  @override
  String get details => 'Detaljer';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Alvorlighed';

  @override
  String get originator => 'Oprindelse';

  @override
  String get startTime => 'Starttidspunkt';

  @override
  String get duration => 'Varighed';

  @override
  String get days => 'dage';

  @override
  String get hours => 'timer';

  @override
  String get minutes => 'minutter';

  @override
  String get seconds => 'sekunder';

  @override
  String get viewDashboard => 'Vis Dashboard';

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
  String get acknowledge => 'Bekræft';

  @override
  String get edit => 'Rediger';

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
  String get tryRefiningYourQuery => 'Prøv venligst at forfine din søgning';

  @override
  String get failedToLoadTheList => 'Kunne ikke indlæse listen';

  @override
  String get tryRefreshing => 'Prøv venligst at opdatere';

  @override
  String get refresh => 'Opdater';

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
    return 'Opdater til $version';
  }

  @override
  String get next => 'Næste';

  @override
  String get confirmation => 'Bekræftelse';

  @override
  String get wifiPassword => 'Wi-Fi adgangskode';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'For at fortsætte opsætningen af din enhed $deviceName, skal du angive netværkets legitimationsoplysninger.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Indtast adgangskode til $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Enheder blev ikke fundet. Sørg for, at telefonens Bluetooth er slået til og inden for rækkevidde af den nye enhed.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Du har ikke tilstrækkelige tilladelser til \"$permissions\" for at fortsætte. Giv de nødvendige tilladelser og tryk på \"Prøv igen\".';
  }

  @override
  String get sendingWifiCredentials => 'Sender Wi-Fi-legitimationsoplysninger';

  @override
  String get confirmingWifiConnection => 'Bekræfter Wi-Fi-forbindelse';

  @override
  String get provisionedSuccessfully => 'Enheden blev konfigureret med succes';

  @override
  String get returnToDashboard => 'Vend tilbage til dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Kan ikke oprette session med enheden $deviceName. Prøv igen';
  }

  @override
  String get claimingDevice => 'Tilknytter enhed';

  @override
  String get claimingDeviceDone => 'Enhedstilknytning fuldført';

  @override
  String get claimingMessageSuccess => 'Enheden blev\ntilknyttet med succes';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Du har ikke tilstrækkelige tilladelser til \"$permissions\" for at fortsætte. Åbn app-indstillingerne, giv tilladelser og tryk på \"Prøv igen\".';
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
  String get unableToUseCamera => 'Kan ikke bruge kameraet';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Åbn indstillinger og giv adgang til kameraet for at fortsætte';

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
  String get somethingWentWrongRollback => 'Noget gik galt ... Ruller tilbage';

  @override
  String get searchResults => 'Søgeresultater';

  @override
  String get viewAll => 'Vis alle';

  @override
  String get requestedEntityDoesNotExists =>
      'Den anmodede entitet eksisterer ikke.';

  @override
  String get noAlarmsFound => 'Ingen alarmer fundet';

  @override
  String get filters => 'Filtre';

  @override
  String get alarmStatusList => 'Alarmstatusliste';

  @override
  String get alarmSeverityList => 'Alarm alvorlighedsliste';

  @override
  String get cleared => 'Ryddet';

  @override
  String get acknowledged => 'Bekræftet';

  @override
  String get unacknowledged => 'Ubekræftet';

  @override
  String get critical => 'Kritisk';

  @override
  String get major => 'Alvorlig';

  @override
  String get minor => 'Mindre';

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
  String get update => 'Opdater';

  @override
  String get alarmTypeList => 'Alarmtypeliste';

  @override
  String get anyType => 'Enhver type';

  @override
  String get plusAlarmType => '+ Alarmtype';

  @override
  String get all => 'Alle';

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
  String get fatalApplicationErrorOccurred => 'Fatal applikationsfejl opstod:';

  @override
  String get connectionError => 'Forbindelsesfejl';

  @override
  String get failedToConnectToServer =>
      'Kunne ikke oprette forbindelse til serveren';

  @override
  String get retry => 'Prøv igen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilt dashboard skal konfigureres i enhedsprofilen!';

  @override
  String get openWifiSettings => 'Åbn Wi-Fi-indstillinger';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Opret forbindelse til det Wi-Fi, du normalt bruger';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Vend tilbage til appen og tryk på Klar-knappen';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Følg venligst de næste trin for at genoprette\nforbindelsen til dit normale Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-meddelelser er ikke konfigureret.\nKontakt venligst din systemadministrator.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase er ikke konfigureret.\nSe venligst den officielle Firebase-dokumentation\nfor vejledning.';

  @override
  String get markAllAsRead => 'Markér alle som læst';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Kan ikke åbne url: $link';
  }

  @override
  String get noDashboardsFound => 'Ingen dashboards fundet';

  @override
  String get openAppSettings => 'Åbn app-indstillinger';

  @override
  String get connectingToDevice => 'Opretter forbindelse til enhed';

  @override
  String get connectToDevice => 'Opret forbindelse til enhed';

  @override
  String get selectWifiNetwork => 'Vælg Wi-Fi-netværk';

  @override
  String get deviceProvisioning => 'Enhedsklargøring';

  @override
  String get permissions => 'Tilladelser';

  @override
  String get unableConnectToDevice => 'Kan ikke oprette forbindelse til enhed';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Enheden kan ikke finde Wi-Fi i nærheden';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Forbindelse til Wi-Fi-netværket $name mislykkedes.\nSørg venligst for, at din telefon er tilsluttet enhedens Wi-Fi-netværk, og at lokal netværksadgang er aktiveret for denne app i enhedsindstillingerne.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Kan ikke oprette forbindelse til Wi-Fi, fordi netværk ikke blev fundet af enheden $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Følg venligst de næste trin for at tilslutte din telefon til enheden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Opret forbindelse til Wi-Fi lignende $wifiName';
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
  String get url => 'Url';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Scan venligst QR-koden på din enhed';

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
  String get ruleNode => 'Regelknude';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entitetsvisning';

  @override
  String get widgetsBundle => 'Widget-pakke';

  @override
  String get widgetType => 'Widget-type';

  @override
  String get apiUsageState => 'API-brugstilstand';

  @override
  String get tbResource => 'Ressource';

  @override
  String get otaPackage => 'OTA-pakke';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Kø';

  @override
  String get notificationTarget => 'Notifikationsmål';

  @override
  String get notificationTemplate => 'Notifikationsskabelon';

  @override
  String get notificationRequest => 'Notifikationsforespørgsel';

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
  String get converter => 'Konverter';

  @override
  String get integration => 'Integration';

  @override
  String get schedulerEvent => 'Planlægningshændelse';

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
  String get actionTypeAssignedToCustomer => 'Tildelt kunde';

  @override
  String get actionTypeUnassignedFromCustomer => 'Fjernet fra kunde';

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
  String get actionTypeAlarmAck => 'Bekræftet';

  @override
  String get actionTypeAlarmClear => 'Ryddet';

  @override
  String get actionTypeAlarmDelete => 'Alarm slettet';

  @override
  String get actionTypeAlarmAssigned => 'Alarm tildelt';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm fjernet';

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
  String get actionTypeProvisionFailure => 'Enhedsklargøring mislykkedes';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetri opdateret';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetri slettet';

  @override
  String get actionTypeAssignedToEdge => 'Tildelt til Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Fjernet fra Edge';

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
  String get actionTypeRestApiRuleEngineCall => 'REST API regelmotor-kald';

  @override
  String get actionTypeMadePublic => 'Gjort offentlig';

  @override
  String get actionTypeMadePrivate => 'Gjort privat';

  @override
  String get actionTypeChangeOwner => 'Ejer ændret';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Du har ikke tilladelser til at udføre denne handling!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Det ser ud til, at dine tilladelser ikke er tilstrækkelige til at fuldføre denne handling';

  @override
  String get isRequiredText => 'er påkrævet.';

  @override
  String get no2faProvidersFound => 'Ingen 2FA-udbydere fundet';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Kontakt venligst din systemadministrator';

  @override
  String errorOccured(Object e) {
    return 'Fejl opstod: $e';
  }

  @override
  String get unsavedChanges => 'Ikke-gemte ændringer';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Du har ikke-gemte ændringer. Er du sikker på, at du vil forlade denne side?';

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
  String get unitSystem => 'Enhedssystem';

  @override
  String get selectCountry => 'Vælg land';

  @override
  String get hideHomeDashboardToolbar =>
      'Skjul hjemmeside-dashboard værktøjslinje';

  @override
  String get phoneNumberHelperText =>
      'Telefonnummer i E.164-format, f.eks. +1201550123';

  @override
  String get homeDashboard => 'Hjemmeside-dashboard';

  @override
  String get security => 'Sikkerhed';

  @override
  String get twofactorAuthentication => 'To-faktor-godkendelse';

  @override
  String get verificationRequired => 'Verifikation påkrævet';

  @override
  String get twofactorAuthenticationIsRequired =>
      'To-faktor-godkendelse er påkrævet';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Opsæt en verifikationsmetode for at fortsætte med dit login';

  @override
  String get setUpAVerificationMethod => 'Opsæt en verifikationsmetode';

  @override
  String get totpSetupSuccessDescription =>
      'Næste gang du logger ind, skal du angive en to-faktor-godkendelseskode';

  @override
  String get smsSetupSuccessDescription =>
      'Næste gang du logger ind, vil du blive bedt om at indtaste sikkerhedskoden, der sendes til telefonnummeret';

  @override
  String get emailSetupSuccessDescription =>
      'Næste gang du logger ind, vil du blive bedt om at indtaste sikkerhedskoden, der sendes til din emailadresse';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Næste gang du logger ind, kan du bruge backupkoder til at gennemføre to-faktor-godkendelse';

  @override
  String get loginToApp => 'Log ind i appen';

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
  String get yesDeactivate => 'Ja, deaktiver';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Indtast en email til brug som din autentifikator.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Indtast et telefonnummer til brug som din autentifikator';

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
  String get enter6digitsKeyFromYourAppHere =>
      'Indtast 6-cifret kode fra din app her:';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'cifre',
      one: 'cifret',
    );
    return '$count-$_temp0 kode';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopiér 32-cifret nøgle til din autentifikatorapp eller scan QR-koden nedenfor';

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
      'To-faktor-godkendelse beskytter din konto mod uautoriseret adgang. Alt du skal gøre er at indtaste en sikkerhedskode, når du logger ind.';

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
  String get mobileAppBundle => 'Mobil app-pakke';

  @override
  String get mobileApp => 'Mobil app';

  @override
  String get domain => 'Domæne';

  @override
  String get oauth2Client => 'OAuth2-klient';

  @override
  String get queueStats => 'Køstatistik';

  @override
  String get phoneIsRequired => 'Telefon er påkrævet';

  @override
  String get phoneIsInvalid => 'Telefonnummer er ugyldigt';

  @override
  String get addVerificationMethod => 'Tilføj verifikationsmetode';

  @override
  String get imageSavedToGallery => 'Gemt i \'Billedgalleri\'';

  @override
  String get failedToSaveImage => 'Kunne ikke gemme billede';

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
  String get liveTrackingTarget => 'Gem placering på enhed';

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
      'Kan ikke gemme på denne enhed – den findes ikke længere. Sporingen fortsætter; opdater målet i dashboard-handlingen.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Ingen forbindelse til serveren. Disse positioner blev ikke gemt – gemningen genoptages, når du er online igen.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Din session er udløbet. Log ind igen for at fortsætte med at gemme placeringen.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Kan ikke gemme på denne enhed – du har ikke tilladelse. Sporingen fortsætter; bed din administrator om adgang.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Kunne ikke gemme denne position på serveren. Gemningen forsøges igen med den næste position.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Placeringstjenester er slået fra på denne enhed.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Tilladelse til placering blev afvist.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Tilladelse til placering er permanent afvist. Aktivér den i appens indstillinger.';

  @override
  String get liveTrackingErrorLocation => 'Kunne ikke bestemme placeringen.';

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
  String get liveTrackingEndReason => 'Årsag til afslutning';

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
    return 'Denne app virker med ThingsBoard $minVersion eller nyere.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Bed din serveradministrator om at opdatere serveren.';

  @override
  String get deviceClaimFailed =>
      'Enheden kunne ikke gøres krav på. Prøv igen.';

  @override
  String get deviceToClaimNotFound =>
      'Enheden blev ikke fundet. Kontakt enhedens leverandør.';
}

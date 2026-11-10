// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class SNo extends S {
  SNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Hjem';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enheter',
      one: 'Enhet',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Mer';

  @override
  String get customers => 'Kunder';

  @override
  String get assets => 'Eiendeler';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Revisjonslogger';

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
  String get logout => 'Logg ut';

  @override
  String get login => 'Logg inn';

  @override
  String get logoDefaultValue => 'ThingsBoard-logo';

  @override
  String get loginToYourAccount => 'Logg inn på kontoen din';

  @override
  String get email => 'E-post';

  @override
  String get emailRequireText => 'E-post er påkrevd.';

  @override
  String get emailInvalidText => 'Ugyldig e-postformat.';

  @override
  String get username => 'brukernavn';

  @override
  String get password => 'Passord';

  @override
  String get passwordRequireText => 'Passord er påkrevd.';

  @override
  String get passwordForgotText => 'Glemt passord?';

  @override
  String get passwordReset => 'Tilbakestill passord';

  @override
  String get passwordResetText =>
      'Skriv inn e-posten som er knyttet til kontoen din, så sender vi en lenke for tilbakestilling av passord';

  @override
  String get requestPasswordReset => 'Be om tilbakestilling av passord';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Lenken for tilbakestilling av passord ble sendt!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-postbekreftelseslenken ble sendt!';

  @override
  String get or => 'ELLER';

  @override
  String get no => 'Nei';

  @override
  String get yes => 'Ja';

  @override
  String get title => 'Tittel';

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
  String get alarmClearTitle => 'Fjern alarm';

  @override
  String get alarmClearText => 'Er du sikker på at du vil fjerne alarmen?';

  @override
  String get alarmAcknowledgeTitle => 'Bekreft alarm';

  @override
  String get alarmAcknowledgeText =>
      'Er du sikker på at du vil bekrefte alarmen?';

  @override
  String get assetName => 'Eiendelsnavn';

  @override
  String get type => 'Type';

  @override
  String get label => 'Etikett';

  @override
  String get assignedToCustomer => 'Tildelt kunde';

  @override
  String get auditLogDetails => 'Detaljer for revisjonslogg';

  @override
  String get entityType => 'Enhetstype';

  @override
  String get actionData => 'Handlingsdata';

  @override
  String get failureDetails => 'Feildetaljer';

  @override
  String get allDevices => 'Alle enheter';

  @override
  String get active => 'Aktiv';

  @override
  String get inactive => 'Inaktiv';

  @override
  String get systemAdministrator => 'Systemadministrator';

  @override
  String get tenantAdministrator => 'Leietakeradministrator';

  @override
  String get customer => 'Kunde';

  @override
  String get changePassword => 'Endre passord';

  @override
  String get currentPasswordRequireText => 'Nåværende passord er påkrevd.';

  @override
  String get currentPassword => 'Nåværende passord';

  @override
  String get newPasswordRequireText => 'Nytt passord er påkrevd.';

  @override
  String get newPassword => 'Nytt passord';

  @override
  String get newPassword2RequireText => 'Bekreft nytt passord er påkrevd.';

  @override
  String get newPassword2 => 'Bekreft nytt passord';

  @override
  String get passwordErrorNotification => 'Passordene må være like!';

  @override
  String get firstNameUpper => 'Fornavn';

  @override
  String get lastNameUpper => 'Etternavn';

  @override
  String get profileSuccessNotification => 'Profilen ble oppdatert';

  @override
  String get passwordSuccessNotification => 'Passordet ble endret';

  @override
  String get notImplemented => 'Ikke implementert!';

  @override
  String get listIsEmptyText => 'Listen er for øyeblikket tom.';

  @override
  String get tryAgain => 'Prøv igjen';

  @override
  String get verifyYourIdentity => 'Bekreft identiteten din';

  @override
  String get continueText => 'Fortsett';

  @override
  String get resendCode => 'Send koden på nytt';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekunder',
      one: '1 sekund',
    );
    return 'Send koden på nytt om $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Vennligst skriv inn sikkerhetskoden fra autentiseringsappen din.';

  @override
  String smsAuthDescription(Object contact) {
    return 'En sikkerhetskode har blitt sendt til telefonen din på $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'En sikkerhetskode har blitt sendt til e-postadressen din på $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Vennligst skriv inn en av dine reservekoder.';

  @override
  String get verificationCodeInvalid => 'Ugyldig format på verifiseringskode';

  @override
  String get toptAuthPlaceholder => 'Kode';

  @override
  String get smsAuthPlaceholder => 'SMS-kode';

  @override
  String get emailAuthPlaceholder => 'E-postkode';

  @override
  String get backupCodeAuthPlaceholder => 'Reservekode';

  @override
  String get verificationCodeIncorrect => 'Verifiseringskoden er feil';

  @override
  String get verificationCodeManyRequest =>
      'For mange forespørsler, sjekk verifiseringskoden';

  @override
  String get tryAnotherWay => 'Prøv en annen måte';

  @override
  String get selectWayToVerify => 'Velg en verifiseringsmetode';

  @override
  String get mfaProviderTopt => 'Autentiseringsapp';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-post';

  @override
  String get mfaProviderBackupCode => 'Reservekode';

  @override
  String get newUserText => 'Ny bruker?';

  @override
  String get createAccount => 'Opprett konto';

  @override
  String get emailVerification => 'E-postverifisering';

  @override
  String get emailVerificationSentText =>
      'En e-post med verifiseringsdetaljer ble sendt til den angitte e-postadressen';

  @override
  String get emailVerificationInstructionsText =>
      'Vennligst følg instruksjonene i e-posten for å fullføre registreringen. Merk: hvis du ikke har sett e-posten etter en stund, sjekk \'søppelpost\'-mappen eller prøv å sende e-posten på nytt ved å klikke på \'Send på nytt\'.';

  @override
  String get resend => 'Send på nytt';

  @override
  String get activatingAccount => 'Aktiverer konto...';

  @override
  String get accountActivated => 'Kontoen ble aktivert!';

  @override
  String get emailVerified => 'E-post bekreftet';

  @override
  String get activatingAccountText =>
      'Kontoen din aktiveres for øyeblikket.\nVennligst vent...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Gratulerer!\nDin $appTitle-konto har blitt aktivert.\nDu kan nå logge inn på ditt $appTitle-område.';
  }

  @override
  String get privacyPolicy => 'Personvernerklæring';

  @override
  String get cancel => 'Avbryt';

  @override
  String get accept => 'Godta';

  @override
  String get termsOfUse => 'Vilkår for bruk';

  @override
  String get firstName => 'Fornavn';

  @override
  String get firstNameRequireText => 'Fornavn er påkrevd.';

  @override
  String get lastName => 'Etternavn';

  @override
  String get lastNameRequireText => 'Etternavn er påkrevd.';

  @override
  String get createPassword => 'Opprett et passord';

  @override
  String get repeatPassword => 'Gjenta passordet ditt';

  @override
  String get imNotARobot => 'Jeg er ikke en robot';

  @override
  String get signUp => 'Registrer deg';

  @override
  String get alreadyHaveAnAccount => 'Har du allerede en konto?';

  @override
  String get signIn => 'Logg inn';

  @override
  String get inactiveUserAlreadyExists => 'Inaktiv bruker finnes allerede';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Det finnes allerede en registrert bruker med en ubekreftet e-postadresse.\nKlikk på \'Send på nytt\'-knappen hvis du ønsker å sende verifiseringsmailen på nytt.';

  @override
  String get assignee => 'Tildelt person';

  @override
  String get alarmTypes => 'Alarmtyper';

  @override
  String get details => 'Detaljer';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Alvorlighetsgrad';

  @override
  String get originator => 'Opprinnelse';

  @override
  String get startTime => 'Starttid';

  @override
  String get duration => 'Varighet';

  @override
  String get days => 'dager';

  @override
  String get hours => 'timer';

  @override
  String get minutes => 'minutter';

  @override
  String get seconds => 'sekunder';

  @override
  String get viewDashboard => 'Vis dashbord';

  @override
  String get activity => 'Aktivitet';

  @override
  String get addCommentMessage => 'Legg til en kommentar...';

  @override
  String get selectUser => 'Velg brukere';

  @override
  String get assignedToMe => 'Tildelt meg';

  @override
  String get clear => 'Fjern';

  @override
  String get acknowledge => 'Bekreft';

  @override
  String get edit => 'Rediger';

  @override
  String get delete => 'Slett';

  @override
  String get edited => 'Redigert';

  @override
  String get deleteComment => 'Slett kommentar';

  @override
  String get areYouSure => 'Er du sikker?';

  @override
  String get noResultsFound => 'Ingen resultater funnet';

  @override
  String get tryRefiningYourQuery => 'Prøv å forbedre søket ditt';

  @override
  String get failedToLoadTheList => 'Kunne ikke laste listen';

  @override
  String get tryRefreshing => 'Prøv å oppdatere';

  @override
  String get refresh => 'Oppdater';

  @override
  String get users => 'Brukere';

  @override
  String get unassigned => 'Ikke tildelt';

  @override
  String get failedToLoadAlarmDetails => 'Kunne ikke laste alarmdetaljer';

  @override
  String get somethingWentWrong => 'Noe gikk galt';

  @override
  String get chooseRegion => 'Velg region';

  @override
  String get selectRegion => 'Velg region';

  @override
  String get northAmerica => 'Nord-Amerika';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Enhetsliste';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dashbord',
      one: 'Dashbord',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Oppdatering kreves';

  @override
  String updateTo(Object version) {
    return 'Oppdater til $version';
  }

  @override
  String get next => 'Neste';

  @override
  String get confirmation => 'Bekreftelse';

  @override
  String get wifiPassword => 'Wi-Fi-passord';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'For å fortsette oppsettet av enheten din $deviceName, vennligst oppgi nettverksinformasjonen din.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Skriv inn passordet for $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Enheter ble ikke funnet. Sørg for at telefonens Bluetooth er slått på og at du er innenfor rekkevidde av enheten.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Du har ikke tilstrekkelige tillatelser for \"$permissions\" til å fortsette. Gi nødvendige tillatelser og trykk \"Prøv igjen\".';
  }

  @override
  String get sendingWifiCredentials => 'Sender Wi-Fi-opplysninger';

  @override
  String get confirmingWifiConnection => 'Bekrefter Wi-Fi-tilkobling';

  @override
  String get provisionedSuccessfully => 'Enheten ble klargjort';

  @override
  String get returnToDashboard => 'Gå tilbake til dashbordet';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Kan ikke opprette økt med enheten $deviceName. Vennligst prøv igjen';
  }

  @override
  String get claimingDevice => 'Krever eierskap til enhet';

  @override
  String get claimingDeviceDone => 'Eierskapskrav fullført';

  @override
  String get claimingMessageSuccess => 'Enheten ble\nregistrert med suksess';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Du har ikke tilstrekkelige tillatelser for \"$permissions\" til å fortsette. Åpne appinnstillingene, gi nødvendige tillatelser og trykk \"Prøv igjen\".';
  }

  @override
  String get scanACode => 'Skann en kode';

  @override
  String get allowAccess => 'Tillat tilgang';

  @override
  String get toggleCamera => 'Bytt kamera';

  @override
  String get toggleFlash => 'Slå av/på blits';

  @override
  String get unableToUseCamera => 'Kan ikke bruke kameraet';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Åpne innstillinger og gi tilgang til kameraet for å fortsette';

  @override
  String get notFound => 'Ikke funnet';

  @override
  String routeNotDefined(Object name) {
    return 'Rute ikke definert: $name';
  }

  @override
  String get loginWith => 'Logg inn med';

  @override
  String get scanQrCode => 'Skann QR-kode';

  @override
  String get anEmptyRequestDataReceived => 'Tomme forespørselsdata mottatt.';

  @override
  String get somethingWentWrongRollback => 'Noe gikk galt ... Ruller tilbake';

  @override
  String get searchResults => 'Søkeresultater';

  @override
  String get viewAll => 'Vis alle';

  @override
  String get requestedEntityDoesNotExists =>
      'Den forespurte enheten eksisterer ikke.';

  @override
  String get noAlarmsFound => 'Ingen alarmer funnet';

  @override
  String get filters => 'Filtre';

  @override
  String get alarmStatusList => 'Alarmstatusliste';

  @override
  String get alarmSeverityList => 'Alarm alvorlighetsliste';

  @override
  String get cleared => 'Fjernet';

  @override
  String get acknowledged => 'Bekreftet';

  @override
  String get unacknowledged => 'Ubekreftet';

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
      other: 'Søk brukere',
      one: 'Søk bruker',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Tilbakestill';

  @override
  String get update => 'Oppdater';

  @override
  String get alarmTypeList => 'Alarmtypeliste';

  @override
  String get anyType => 'Enhver type';

  @override
  String get plusAlarmType => '+ Alarmtype';

  @override
  String get all => 'Alle';

  @override
  String get unread => 'Ulest';

  @override
  String get close => 'Lukk';

  @override
  String get codeVerificationFailed => 'Kodeverifisering mislyktes!';

  @override
  String get fatalError => 'Fatal feil';

  @override
  String get unknownError => 'Ukjent feil.';

  @override
  String get sessionExpired => 'Økten er utløpt';

  @override
  String get fatalApplicationErrorOccurred => 'Fatal applikasjonsfeil oppstod:';

  @override
  String get connectionError => 'Tilkoblingsfeil';

  @override
  String get failedToConnectToServer => 'Kunne ikke koble til serveren';

  @override
  String get retry => 'Prøv igjen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilt dashbord må konfigureres i enhetsprofilen!';

  @override
  String get openWifiSettings => 'Åpne Wi-Fi-innstillinger';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Koble til Wi-Fi du vanligvis bruker';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Gå tilbake til appen og trykk Klar-knappen';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Følg de neste trinnene for å koble\ntelefonen din til vanlig Wi-Fi igjen';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-varsler er ikke konfigurert.\nKontakt systemadministratoren din.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase er ikke konfigurert.\nSe den offisielle Firebase-dokumentasjonen\nfor veiledning.';

  @override
  String get markAllAsRead => 'Merk alle som lest';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Kan ikke åpne url: $link';
  }

  @override
  String get noDashboardsFound => 'Ingen dashbord funnet';

  @override
  String get openAppSettings => 'Åpne appinnstillinger';

  @override
  String get connectingToDevice => 'Kobler til enhet';

  @override
  String get connectToDevice => 'Koble til enhet';

  @override
  String get selectWifiNetwork => 'Velg Wi-Fi-nettverk';

  @override
  String get deviceProvisioning => 'Enhetsklargjøring';

  @override
  String get permissions => 'Tillatelser';

  @override
  String get unableConnectToDevice => 'Kan ikke koble til enhet';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Enheten finner ikke Wi-Fi i nærheten';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Tilkobling til Wi-Fi-nettverket $name mislyktes.\nSørg for at telefonen er koblet til enhetens Wi-Fi-nettverk og at lokal nettverkstilgang er aktivert.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Kan ikke koble til Wi-Fi fordi enheten $name ikke fant nettverk';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Følg de neste trinnene for å koble telefonen din til enheten';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Koble til Wi-Fi lignende $wifiName';
  }

  @override
  String get ready => 'Klar';

  @override
  String get exitDeviceProvisioning => 'Avslutt enhetsklargjøring';

  @override
  String get noNotificationsFound => 'Ingen varsler funnet';

  @override
  String get markAsRead => 'Merk som lest';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Skann QR-koden på enheten din';

  @override
  String get search => 'Søk';

  @override
  String get tenant => 'Leietaker';

  @override
  String get tenantProfile => 'Leietakerprofil';

  @override
  String get user => 'Bruker';

  @override
  String get asset => 'Eiendel';

  @override
  String get deviceProfile => 'Enhetsprofil';

  @override
  String get assetProfile => 'Eiendelsprofil';

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
  String get ruleChain => 'Regelkjede';

  @override
  String get ruleNode => 'Regelnode';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Enhetsvisning';

  @override
  String get widgetsBundle => 'Widgetpakke';

  @override
  String get widgetType => 'Widgettype';

  @override
  String get apiUsageState => 'API-bruksstatus';

  @override
  String get tbResource => 'Ressurs';

  @override
  String get otaPackage => 'OTA-pakke';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Kø';

  @override
  String get notificationTarget => 'Varslingsmål';

  @override
  String get notificationTemplate => 'Varslingsmal';

  @override
  String get notificationRequest => 'Varslingsforespørsel';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Varsler',
      one: 'Varsel',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Varslingsregel';

  @override
  String get entityGroup => 'Entitetsgruppe';

  @override
  String get converter => 'Konverter';

  @override
  String get integration => 'Integrasjon';

  @override
  String get schedulerEvent => 'Planlegger-hendelse';

  @override
  String get blobEntity => 'Blob-entitet';

  @override
  String get role => 'Rolle';

  @override
  String get groupPermission => 'Gruppetillatelse';

  @override
  String get actionStatusSuccess => 'Suksess';

  @override
  String get actionStatusFailure => 'Mislykket';

  @override
  String get actionTypeAdded => 'Lagt til';

  @override
  String get actionTypeDeleted => 'Slettet';

  @override
  String get actionTypeUpdated => 'Oppdatert';

  @override
  String get actionTypeAttributesUpdated => 'Attributter oppdatert';

  @override
  String get actionTypeAttributesDeleted => 'Attributter slettet';

  @override
  String get actionTypeRpcCall => 'RPC-kall';

  @override
  String get actionTypeCredentialsUpdated => 'Legitimasjon oppdatert';

  @override
  String get actionTypeAssignedToCustomer => 'Tildelt kunde';

  @override
  String get actionTypeUnassignedFromCustomer => 'Fjernet fra kunde';

  @override
  String get actionTypeActivated => 'Aktivert';

  @override
  String get actionTypeSuspended => 'Suspendert';

  @override
  String get actionTypeCredentialsRead => 'Legitimasjon lest';

  @override
  String get actionTypeAttributesRead => 'Attributter lest';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relasjon oppdatert';

  @override
  String get actionTypeRelationDeleted => 'Relasjon slettet';

  @override
  String get actionTypeRelationsDeleted => 'Alle relasjoner slettet';

  @override
  String get actionTypeAlarmAck => 'Bekreftet';

  @override
  String get actionTypeAlarmClear => 'Fjernet';

  @override
  String get actionTypeAlarmDelete => 'Alarm slettet';

  @override
  String get actionTypeAlarmAssigned => 'Alarm tildelt';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm fjernet';

  @override
  String get actionTypeLogin => 'Innlogging';

  @override
  String get actionTypeLogout => 'Utlogging';

  @override
  String get actionTypeLockout => 'Låst ute';

  @override
  String get actionTypeAssignedFromTenant => 'Tildelt fra leietaker';

  @override
  String get actionTypeAssignedToTenant => 'Tildelt til leietaker';

  @override
  String get actionTypeProvisionSuccess => 'Enhet klargjort';

  @override
  String get actionTypeProvisionFailure => 'Enhetsklargjøring mislyktes';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetri oppdatert';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetri slettet';

  @override
  String get actionTypeAssignedToEdge => 'Tildelt Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Fjernet fra Edge';

  @override
  String get actionTypeAddedComment => 'Kommentar lagt til';

  @override
  String get actionTypeUpdatedComment => 'Kommentar oppdatert';

  @override
  String get actionTypeDeletedComment => 'Kommentar slettet';

  @override
  String get actionTypeSmsSent => 'SMS sendt';

  @override
  String get actionTypeAddedToEntityGroup => 'Lagt til i entitetsgruppe';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Fjernet fra entitetsgruppe';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API regelmotor-kall';

  @override
  String get actionTypeMadePublic => 'Gjort offentlig';

  @override
  String get actionTypeMadePrivate => 'Gjort privat';

  @override
  String get actionTypeChangeOwner => 'Eier endret';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Du har ikke tillatelser til å utføre denne operasjonen!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Det ser ut til at tillatelsene dine ikke er tilstrekkelige til å fullføre denne operasjonen';

  @override
  String get isRequiredText => 'er påkrevd.';

  @override
  String get no2faProvidersFound => 'Ingen 2FA-leverandører funnet';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Kontakt systemadministratoren din';

  @override
  String errorOccured(Object e) {
    return 'Feil oppstod: $e';
  }

  @override
  String get unsavedChanges => 'Ulagrede endringer';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Du har ulagrede endringer. Er du sikker på at du vil forlate denne siden?';

  @override
  String get deleteAccount => 'Slett konto';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Er du sikker? Du er i ferd med å slette $authority-kontoen din.';
  }

  @override
  String get language => 'Språk';

  @override
  String get metricUnitSystem => 'Metrisk';

  @override
  String get imperialUnitSystem => 'Imperisk';

  @override
  String get hybridUnitSystem => 'Hybrid';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Enhetssystem';

  @override
  String get selectCountry => 'Velg land';

  @override
  String get hideHomeDashboardToolbar => 'Skjul dashbord-verktøylinje';

  @override
  String get phoneNumberHelperText =>
      'Telefonnummer i E.164-format, f.eks. +1201550123';

  @override
  String get homeDashboard => 'Hjemme-dashbord';

  @override
  String get security => 'Sikkerhet';

  @override
  String get twofactorAuthentication => 'Tofaktorautentisering';

  @override
  String get verificationRequired => 'Verifisering kreves';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Tofaktorautentisering er påkrevd';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Sett opp en verifiseringsmetode for å fortsette innloggingen';

  @override
  String get setUpAVerificationMethod => 'Sett opp en verifiseringsmetode';

  @override
  String get totpSetupSuccessDescription =>
      'Neste gang du logger inn, må du oppgi en tofaktorautentiseringskode';

  @override
  String get smsSetupSuccessDescription =>
      'Neste gang du logger inn, vil du bli bedt om å taste inn sikkerhetskoden som sendes til telefonnummeret';

  @override
  String get emailSetupSuccessDescription =>
      'Neste gang du logger inn, vil du bli bedt om å taste inn sikkerhetskoden som sendes til e-postadressen din';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Neste gang du logger inn, kan du bruke reservekoder for tofaktorautentisering';

  @override
  String get loginToApp => 'Logg inn i appen';

  @override
  String get goBack => 'Gå tilbake';

  @override
  String get done => 'Ferdig';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Dette vil gjøre kontoen din mindre sikker';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Er du sikker på at du vil deaktivere $providerName?';
  }

  @override
  String get yesDeactivate => 'Ja, deaktiver';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Skriv inn en e-post som skal brukes som autentisering.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Skriv inn et telefonnummer som skal brukes som autentisering';

  @override
  String get sendCode => 'Send kode';

  @override
  String errorSendingCode(String error) {
    return 'Feil ved sending av kode: $error';
  }

  @override
  String get copy => 'Kopier';

  @override
  String get copiedToClipboard => 'Kopiert til utklippstavlen';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Skriv inn 6-sifret kode fra appen din her:';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sifret',
      one: 'sifret',
    );
    return '$count-$_temp0 kode';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopier 32-sifret nøkkel til autentiseringsappen din eller skann QR-koden nedenfor';

  @override
  String get applyChanges => 'Bruk endringer';

  @override
  String get discardChanges => 'Forkast endringer';

  @override
  String get yesDiscard => 'Ja, forkast';

  @override
  String get thisActionCannotBeUndone => 'Denne handlingen kan ikke angres';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Tofaktorautentisering beskytter kontoen din mot uautorisert tilgang. Du trenger bare å taste inn en sikkerhetskode når du logger inn.';

  @override
  String get calculatedField => 'Beregnet felt';

  @override
  String get apiKey => 'API-nøkkel';

  @override
  String get aiModel => 'AI-modell';

  @override
  String get adminSettings => 'Administratorinnstillinger';

  @override
  String get job => 'Jobb';

  @override
  String get mobileAppBundle => 'Mobilapppakke';

  @override
  String get mobileApp => 'Mobilapp';

  @override
  String get domain => 'Domene';

  @override
  String get oauth2Client => 'OAuth2-klient';

  @override
  String get queueStats => 'Køstatistikk';

  @override
  String get phoneIsRequired => 'Telefon er påkrevd';

  @override
  String get phoneIsInvalid => 'Telefonnummer er ugyldig';

  @override
  String get addVerificationMethod => 'Legg til verifiseringsmetode';

  @override
  String get imageSavedToGallery => 'Lagret i \'Bildegalleri\'';

  @override
  String get failedToSaveImage => 'Kunne ikke lagre bildet';

  @override
  String nSelected(int count) {
    return '$count valgt';
  }

  @override
  String get selectAll => 'Velg alle lastede';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count handlinger mislyktes',
      one: '1 handling mislyktes',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slette $count varslinger?',
      one: 'Slette 1 varsling?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Markere $count varslinger som lest?',
      one: 'Markere 1 varsling som lest?',
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
  String get liveTrackingActive => 'Sanntidssporing av posisjon';

  @override
  String get liveTrackingPaused => 'Sanntidssporing satt på pause';

  @override
  String get liveTrackingFixes => 'Posisjoner';

  @override
  String get liveTrackingSaved => 'Lagret';

  @override
  String get liveTrackingErrors => 'Feil';

  @override
  String get liveTrackingStop => 'Stopp';

  @override
  String get liveTrackingPause => 'Pause';

  @override
  String get liveTrackingResume => 'Fortsett';

  @override
  String get liveTrackingHide => 'Skjul';

  @override
  String get liveTrackingSessionTitle => 'Sanntidssporing av posisjon';

  @override
  String get liveTrackingTarget => 'Lagre posisjon på enhet';

  @override
  String get liveTrackingDashboard => 'Dashbord';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Starttid';

  @override
  String get liveTrackingLastFix => 'Siste posisjon';

  @override
  String get liveTrackingLastError => 'Siste feil';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Kan ikke lagre på denne enheten – den finnes ikke lenger. Sporingen fortsetter; oppdater målet i dashbordhandlingen.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Ingen tilkobling til serveren. Disse posisjonene ble ikke lagret – lagringen fortsetter når du er på nett igjen.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Økten din er avsluttet. Logg inn igjen for å fortsette å lagre posisjonen.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Kan ikke lagre på denne enheten – du har ikke tillatelse. Sporingen fortsetter; be administratoren om tilgang.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Kunne ikke lagre denne posisjonen på serveren. Lagringen prøves på nytt med neste posisjon.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Posisjonstjenester er slått av på denne enheten.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Tillatelse til posisjon ble avslått.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Tillatelse til posisjon er permanent avslått. Slå den på i appinnstillingene.';

  @override
  String get liveTrackingErrorLocation => 'Kunne ikke fastslå posisjonen.';

  @override
  String get liveTrackingMenuTitle => 'Sanntidssporing av posisjon';

  @override
  String get liveTrackingNoRecord => 'Ingen aktiv sporing og ingen nylig økt.';

  @override
  String get liveTrackingLastSession => 'Siste økt';

  @override
  String get liveTrackingStartAgain => 'Start på nytt';

  @override
  String get liveTrackingEnded => 'Sluttid';

  @override
  String get liveTrackingEndReason => 'Årsak til avslutning';

  @override
  String get liveTrackingEndReasonManual => 'Stoppet manuelt';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Maksimal varighet nådd';

  @override
  String get liveTrackingEndReasonInterrupted => 'Avbrutt';

  @override
  String get serverUpdateRequired => 'Serveroppdatering kreves';

  @override
  String get backToLogin => 'Tilbake til innlogging';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Denne appen fungerer med ThingsBoard $minVersion eller nyere.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Versjon';

  @override
  String get askAdminToUpdateServer =>
      'Be serveradministratoren om å oppdatere serveren.';

  @override
  String get deviceClaimFailed =>
      'Enheten kunne ikke gjøres krav på. Prøv igjen.';

  @override
  String get deviceToClaimNotFound =>
      'Fant ikke enheten. Kontakt leverandøren av enheten.';

  @override
  String get enableAuthenticatorApp => 'Aktiver autentiseringsapp';

  @override
  String get enableSmsAuthenticator => 'Aktiver SMS-autentisering';

  @override
  String get enableEmailAuthenticator => 'Aktiver e-postautentisering';

  @override
  String get getBackupCode => 'Hent reservekode';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class SNl extends S {
  SNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Startpagina';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Apparaten',
      one: 'Apparaat',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Meer';

  @override
  String get customers => 'Klanten';

  @override
  String get assets => 'Assets';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Auditlogboeken';

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
  String get logout => 'Uitloggen';

  @override
  String get login => 'Inloggen';

  @override
  String get logoDefaultValue => 'ThingsBoard-logo';

  @override
  String get loginToYourAccount => 'Log in op uw account';

  @override
  String get email => 'E-mail';

  @override
  String get emailRequireText => 'E-mail is verplicht.';

  @override
  String get emailInvalidText => 'Ongeldig e-mailformaat.';

  @override
  String get username => 'gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get passwordRequireText => 'Wachtwoord is verplicht.';

  @override
  String get passwordForgotText => 'Wachtwoord vergeten?';

  @override
  String get passwordReset => 'Wachtwoord herstellen';

  @override
  String get passwordResetText =>
      'Voer het e-mailadres in dat aan uw account is gekoppeld en we sturen een e-mail met een link om uw wachtwoord te herstellen';

  @override
  String get requestPasswordReset => 'Wachtwoordherstel aanvragen';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Wachtwoordherstellink is succesvol verzonden!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-mailverificatielink is succesvol verzonden!';

  @override
  String get or => 'OF';

  @override
  String get no => 'Nee';

  @override
  String get yes => 'Ja';

  @override
  String get title => 'Titel';

  @override
  String get country => 'Land';

  @override
  String get city => 'Stad';

  @override
  String get stateOrProvince => 'Staat / Provincie';

  @override
  String get postalCode => 'Postcode';

  @override
  String get address => 'Adres';

  @override
  String get address2 => 'Adresregel 2';

  @override
  String get phone => 'Telefoon';

  @override
  String get alarmClearTitle => 'Alarm wissen';

  @override
  String get alarmClearText => 'Weet u zeker dat u het alarm wilt wissen?';

  @override
  String get alarmAcknowledgeTitle => 'Alarm bevestigen';

  @override
  String get alarmAcknowledgeText =>
      'Weet u zeker dat u het alarm wilt bevestigen?';

  @override
  String get assetName => 'Assetnaam';

  @override
  String get type => 'Type';

  @override
  String get label => 'Label';

  @override
  String get assignedToCustomer => 'Toegewezen aan klant';

  @override
  String get auditLogDetails => 'Details auditlogboek';

  @override
  String get entityType => 'Entiteitstype';

  @override
  String get actionData => 'Actiegegevens';

  @override
  String get failureDetails => 'Foutdetails';

  @override
  String get allDevices => 'Alle apparaten';

  @override
  String get active => 'Actief';

  @override
  String get inactive => 'Inactief';

  @override
  String get systemAdministrator => 'Systeembeheerder';

  @override
  String get tenantAdministrator => 'Tenantbeheerder';

  @override
  String get customer => 'Klant';

  @override
  String get changePassword => 'Wachtwoord wijzigen';

  @override
  String get currentPasswordRequireText => 'Huidig wachtwoord is verplicht.';

  @override
  String get currentPassword => 'Huidig wachtwoord';

  @override
  String get newPasswordRequireText => 'Nieuw wachtwoord is verplicht.';

  @override
  String get newPassword => 'Nieuw wachtwoord';

  @override
  String get newPassword2RequireText =>
      'Nieuw wachtwoord opnieuw is verplicht.';

  @override
  String get newPassword2 => 'Bevestig nieuw wachtwoord';

  @override
  String get passwordErrorNotification =>
      'De ingevoerde wachtwoorden moeten hetzelfde zijn!';

  @override
  String get firstNameUpper => 'Voornaam';

  @override
  String get lastNameUpper => 'Achternaam';

  @override
  String get profileSuccessNotification => 'Profiel succesvol bijgewerkt';

  @override
  String get passwordSuccessNotification => 'Wachtwoord succesvol gewijzigd';

  @override
  String get notImplemented => 'Niet geïmplementeerd!';

  @override
  String get listIsEmptyText => 'De lijst is momenteel leeg.';

  @override
  String get tryAgain => 'Probeer opnieuw';

  @override
  String get verifyYourIdentity => 'Verifieer uw identiteit';

  @override
  String get continueText => 'Doorgaan';

  @override
  String get resendCode => 'Code opnieuw verzenden';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time seconden',
      one: '1 seconde',
    );
    return 'Code opnieuw verzenden in $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Voer de beveiligingscode in vanuit uw authenticator-app.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Er is een beveiligingscode verzonden naar uw telefoon op $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Er is een beveiligingscode verzonden naar uw e-mailadres op $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Voer een van uw back-upcodes in.';

  @override
  String get toptAuthPlaceholder => 'Code';

  @override
  String get smsAuthPlaceholder => 'SMS-code';

  @override
  String get emailAuthPlaceholder => 'E-mailcode';

  @override
  String get backupCodeAuthPlaceholder => 'Back-upcode';

  @override
  String get verificationCodeIncorrect => 'Verificatiecode is onjuist';

  @override
  String get verificationCodeManyRequest =>
      'Te veel verzoeken, controleer de verificatiecode';

  @override
  String get tryAnotherWay => 'Probeer een andere methode';

  @override
  String get selectWayToVerify => 'Selecteer een verificatiemethode';

  @override
  String get mfaProviderTopt => 'Authenticator-app';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Back-upcode';

  @override
  String get newUserText => 'Nieuwe gebruiker?';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get emailVerification => 'E-mailverificatie';

  @override
  String get emailVerificationSentText =>
      'Er is een e-mail met verificatiedetails verzonden naar het opgegeven e-mailadres';

  @override
  String get emailVerificationInstructionsText =>
      'Volg de instructies in de e-mail om uw registratie te voltooien. Let op: als u de e-mail niet ziet, controleer dan uw \'spam\'-map of probeer de e-mail opnieuw te verzenden door op de knop \'Opnieuw verzenden\' te klikken.';

  @override
  String get resend => 'Opnieuw verzenden';

  @override
  String get activatingAccount => 'Account activeren...';

  @override
  String get accountActivated => 'Account succesvol geactiveerd!';

  @override
  String get emailVerified => 'E-mail geverifieerd';

  @override
  String get activatingAccountText =>
      'Uw account wordt momenteel geactiveerd.\nEven geduld alstublieft...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Gefeliciteerd!\nUw $appTitle-account is geactiveerd.\nU kunt nu inloggen op uw $appTitle-omgeving.';
  }

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get cancel => 'Annuleren';

  @override
  String get accept => 'Accepteren';

  @override
  String get termsOfUse => 'Gebruiksvoorwaarden';

  @override
  String get firstName => 'Voornaam';

  @override
  String get firstNameRequireText => 'Voornaam is verplicht.';

  @override
  String get lastName => 'Achternaam';

  @override
  String get lastNameRequireText => 'Achternaam is verplicht.';

  @override
  String get createPassword => 'Maak een wachtwoord aan';

  @override
  String get repeatPassword => 'Herhaal uw wachtwoord';

  @override
  String get imNotARobot => 'Ik ben geen robot';

  @override
  String get signUp => 'Registreren';

  @override
  String get alreadyHaveAnAccount => 'Heeft u al een account?';

  @override
  String get signIn => 'Inloggen';

  @override
  String get inactiveUserAlreadyExists => 'Inactieve gebruiker bestaat al';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Er is al een geregistreerde gebruiker met een niet-geverifieerd e-mailadres.\nKlik op de knop \'Opnieuw verzenden\' als u de verificatie-e-mail opnieuw wilt verzenden.';

  @override
  String get assignee => 'Toegewezene';

  @override
  String get alarmTypes => 'Alarmtypes';

  @override
  String get details => 'Details';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Ernst';

  @override
  String get originator => 'Oorsprong';

  @override
  String get startTime => 'Starttijd';

  @override
  String get duration => 'Duur';

  @override
  String get days => 'dagen';

  @override
  String get hours => 'uren';

  @override
  String get minutes => 'minuten';

  @override
  String get seconds => 'seconden';

  @override
  String get viewDashboard => 'Dashboard bekijken';

  @override
  String get activity => 'Activiteit';

  @override
  String get addCommentMessage => 'Voeg een opmerking toe...';

  @override
  String get selectUser => 'Gebruikers selecteren';

  @override
  String get assignedToMe => 'Aan mij toegewezen';

  @override
  String get clear => 'Wissen';

  @override
  String get acknowledge => 'Bevestigen';

  @override
  String get edit => 'Bewerken';

  @override
  String get delete => 'Verwijderen';

  @override
  String get edited => 'Bewerkt';

  @override
  String get deleteComment => 'Opmerking verwijderen';

  @override
  String get areYouSure => 'Weet u het zeker?';

  @override
  String get noResultsFound => 'Geen resultaten gevonden';

  @override
  String get tryRefiningYourQuery => 'Probeer uw zoekopdracht te verfijnen';

  @override
  String get failedToLoadTheList => 'Laden van de lijst mislukt';

  @override
  String get tryRefreshing => 'Probeer te verversen';

  @override
  String get refresh => 'Verversen';

  @override
  String get users => 'Gebruikers';

  @override
  String get unassigned => 'Niet toegewezen';

  @override
  String get failedToLoadAlarmDetails => 'Details van alarm laden mislukt';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan';

  @override
  String get chooseRegion => 'Kies regio';

  @override
  String get selectRegion => 'Selecteer regio';

  @override
  String get northAmerica => 'Noord-Amerika';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Apparatenlijst';

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
  String get updateRequired => 'Update vereist';

  @override
  String updateTo(Object version) {
    return 'Updaten naar $version';
  }

  @override
  String get next => 'Volgende';

  @override
  String get confirmation => 'Bevestiging';

  @override
  String get wifiPassword => 'Wi-Fi-wachtwoord';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Om de installatie van uw apparaat $deviceName voort te zetten, geef de netwerkgegevens op.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Voer het wachtwoord in voor $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Apparaten niet gevonden. Zorg ervoor dat Bluetooth op uw telefoon is ingeschakeld en dat u zich binnen bereik van uw nieuwe apparaat bevindt.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'U heeft onvoldoende rechten voor \"$permissions\" om door te gaan. Verleen de vereiste rechten en tik op \"Opnieuw proberen\".';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi-inloggegevens verzenden';

  @override
  String get confirmingWifiConnection => 'Wi-Fi-verbinding bevestigen';

  @override
  String get provisionedSuccessfully => 'Apparaat is succesvol geprovisioneerd';

  @override
  String get returnToDashboard => 'Terug naar dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Kan geen sessie tot stand brengen met apparaat $deviceName. Probeer het opnieuw';
  }

  @override
  String get claimingDevice => 'Apparaat claimen';

  @override
  String get claimingDeviceDone => 'Claimen van apparaat voltooid';

  @override
  String get claimingMessageSuccess => 'Apparaat is\nsuccesvol geclaimd';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'U heeft onvoldoende rechten voor \"$permissions\" om door te gaan. Open de app-instellingen, verleen de rechten en tik op \"Opnieuw proberen\".';
  }

  @override
  String get scanACode => 'Scan een code';

  @override
  String get allowAccess => 'Toegang toestaan';

  @override
  String get toggleCamera => 'Camera wisselen';

  @override
  String get toggleFlash => 'Flitser schakelen';

  @override
  String get unableToUseCamera => 'Kan camera niet gebruiken';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Open instellingen en geef cameratoegang om door te gaan';

  @override
  String get notFound => 'Niet gevonden';

  @override
  String routeNotDefined(Object name) {
    return 'Route niet gedefinieerd: $name';
  }

  @override
  String get loginWith => 'Inloggen met';

  @override
  String get scanQrCode => 'QR-code scannen';

  @override
  String get anEmptyRequestDataReceived => 'Lege verzoekgegevens ontvangen.';

  @override
  String get somethingWentWrongRollback =>
      'Er is iets misgegaan ... Terugdraaien';

  @override
  String get searchResults => 'Zoekresultaten';

  @override
  String get viewAll => 'Alles bekijken';

  @override
  String get requestedEntityDoesNotExists =>
      'De gevraagde entiteit bestaat niet.';

  @override
  String get noAlarmsFound => 'Geen alarmen gevonden';

  @override
  String get filters => 'Filters';

  @override
  String get alarmStatusList => 'Alarmstatuslijst';

  @override
  String get alarmSeverityList => 'Alarm-ernstlijst';

  @override
  String get cleared => 'Gewist';

  @override
  String get acknowledged => 'Bevestigd';

  @override
  String get unacknowledged => 'Onbevestigd';

  @override
  String get critical => 'Kritiek';

  @override
  String get major => 'Ernstig';

  @override
  String get minor => 'Gering';

  @override
  String get warning => 'Waarschuwing';

  @override
  String get indeterminate => 'Onbepaald';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gebruikers zoeken',
      one: 'Gebruiker zoeken',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Herstellen';

  @override
  String get update => 'Bijwerken';

  @override
  String get alarmTypeList => 'Alarmtypelijst';

  @override
  String get anyType => 'Elk type';

  @override
  String get plusAlarmType => '+ Alarmtype';

  @override
  String get all => 'Alle';

  @override
  String get unread => 'Ongelezen';

  @override
  String get close => 'Sluiten';

  @override
  String get codeVerificationFailed => 'Codeverificatie mislukt!';

  @override
  String get fatalError => 'Fatale fout';

  @override
  String get unknownError => 'Onbekende fout.';

  @override
  String get sessionExpired => 'Sessie is verlopen';

  @override
  String get fatalApplicationErrorOccurred =>
      'Fatale applicatiefout opgetreden:';

  @override
  String get connectionError => 'Verbindingsfout';

  @override
  String get failedToConnectToServer =>
      'Kan geen verbinding maken met de server';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Het mobiele dashboard moet worden geconfigureerd in het apparaatprofiel!';

  @override
  String get openWifiSettings => 'Wi-Fi-instellingen openen';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Verbind met het Wi-Fi dat u normaal gebruikt';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Ga terug naar de app en tik op de knop Gereed';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Volg de volgende stappen om\nuw telefoon opnieuw te verbinden met uw Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-meldingen zijn niet geconfigureerd.\nNeem contact op met uw systeembeheerder.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase is niet geconfigureerd.\nRaadpleeg de officiële Firebase-documentatie\nvoor instructies.';

  @override
  String get markAllAsRead => 'Alles als gelezen markeren';

  @override
  String get profile => 'Profiel';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Kan url niet openen: $link';
  }

  @override
  String get noDashboardsFound => 'Geen dashboards gevonden';

  @override
  String get openAppSettings => 'App-instellingen openen';

  @override
  String get connectingToDevice => 'Verbinden met apparaat';

  @override
  String get connectToDevice => 'Verbinden met apparaat';

  @override
  String get selectWifiNetwork => 'Wi-Fi-netwerk selecteren';

  @override
  String get deviceProvisioning => 'Apparaatprovisioning';

  @override
  String get permissions => 'Rechten';

  @override
  String get unableConnectToDevice => 'Kan niet verbinden met apparaat';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Apparaat kan geen Wi-Fi vinden in de buurt';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Verbinding met het Wi-Fi-netwerk $name mislukt.\nZorg ervoor dat uw telefoon verbonden is met het Wi-Fi-netwerk van het apparaat en dat lokale netwerktoegang is ingeschakeld.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Kan niet verbinden met Wi-Fi omdat het apparaat $name geen netwerken heeft gevonden';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Volg de volgende stappen om uw telefoon met het apparaat te verbinden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Verbind met Wi-Fi vergelijkbaar met $wifiName';
  }

  @override
  String get ready => 'Gereed';

  @override
  String get exitDeviceProvisioning => 'Apparaatprovisioning verlaten';

  @override
  String get noNotificationsFound => 'Geen meldingen gevonden';

  @override
  String get markAsRead => 'Markeer als gelezen';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Scan de QR-code op uw apparaat';

  @override
  String get search => 'Zoeken';

  @override
  String get tenant => 'Tenant';

  @override
  String get tenantProfile => 'Tenantprofiel';

  @override
  String get user => 'Gebruiker';

  @override
  String get asset => 'Asset';

  @override
  String get deviceProfile => 'Apparaatprofiel';

  @override
  String get assetProfile => 'Assetprofiel';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmen',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Regelketen';

  @override
  String get ruleNode => 'Regelknooppunt';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entiteitsweergave';

  @override
  String get widgetsBundle => 'Widgetpakket';

  @override
  String get widgetType => 'Widgettype';

  @override
  String get apiUsageState => 'API-gebruiksstatus';

  @override
  String get tbResource => 'Bron';

  @override
  String get otaPackage => 'OTA-pakket';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Wachtrij';

  @override
  String get notificationTarget => 'Meldingsdoel';

  @override
  String get notificationTemplate => 'Meldingssjabloon';

  @override
  String get notificationRequest => 'Meldingsverzoek';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Meldingen',
      one: 'Melding',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Meldingsregel';

  @override
  String get entityGroup => 'Entiteitsgroep';

  @override
  String get converter => 'Converter';

  @override
  String get integration => 'Integratie';

  @override
  String get schedulerEvent => 'Planner-evenement';

  @override
  String get blobEntity => 'Blob-entiteit';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Groepstoestemming';

  @override
  String get actionStatusSuccess => 'Succes';

  @override
  String get actionStatusFailure => 'Mislukt';

  @override
  String get actionTypeAdded => 'Toegevoegd';

  @override
  String get actionTypeDeleted => 'Verwijderd';

  @override
  String get actionTypeUpdated => 'Bijgewerkt';

  @override
  String get actionTypeAttributesUpdated => 'Attributen bijgewerkt';

  @override
  String get actionTypeAttributesDeleted => 'Attributen verwijderd';

  @override
  String get actionTypeRpcCall => 'RPC-oproep';

  @override
  String get actionTypeCredentialsUpdated => 'Inloggegevens bijgewerkt';

  @override
  String get actionTypeAssignedToCustomer => 'Toegewezen aan klant';

  @override
  String get actionTypeUnassignedFromCustomer => 'Verwijderd van klant';

  @override
  String get actionTypeActivated => 'Geactiveerd';

  @override
  String get actionTypeSuspended => 'Opgeschort';

  @override
  String get actionTypeCredentialsRead => 'Inloggegevens gelezen';

  @override
  String get actionTypeAttributesRead => 'Attributen gelezen';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relatie bijgewerkt';

  @override
  String get actionTypeRelationDeleted => 'Relatie verwijderd';

  @override
  String get actionTypeRelationsDeleted => 'Alle relaties verwijderd';

  @override
  String get actionTypeAlarmAck => 'Bevestigd';

  @override
  String get actionTypeAlarmClear => 'Gewist';

  @override
  String get actionTypeAlarmDelete => 'Alarm verwijderd';

  @override
  String get actionTypeAlarmAssigned => 'Alarm toegewezen';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm niet toegewezen';

  @override
  String get actionTypeLogin => 'Inloggen';

  @override
  String get actionTypeLogout => 'Uitloggen';

  @override
  String get actionTypeLockout => 'Geblokkeerd';

  @override
  String get actionTypeAssignedFromTenant => 'Toegewezen door tenant';

  @override
  String get actionTypeAssignedToTenant => 'Toegewezen aan tenant';

  @override
  String get actionTypeProvisionSuccess => 'Apparaat geprovisioneerd';

  @override
  String get actionTypeProvisionFailure => 'Provisioning mislukt';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrie bijgewerkt';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrie verwijderd';

  @override
  String get actionTypeAssignedToEdge => 'Toegewezen aan Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Verwijderd van Edge';

  @override
  String get actionTypeAddedComment => 'Opmerking toegevoegd';

  @override
  String get actionTypeUpdatedComment => 'Opmerking bijgewerkt';

  @override
  String get actionTypeDeletedComment => 'Opmerking verwijderd';

  @override
  String get actionTypeSmsSent => 'SMS verzonden';

  @override
  String get actionTypeAddedToEntityGroup => 'Toegevoegd aan entiteitsgroep';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Verwijderd uit entiteitsgroep';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API regelengine-aanroep';

  @override
  String get actionTypeMadePublic => 'Openbaar gemaakt';

  @override
  String get actionTypeMadePrivate => 'Privé gemaakt';

  @override
  String get actionTypeChangeOwner => 'Eigenaar gewijzigd';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'U heeft geen machtigingen om deze bewerking uit te voeren!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Het lijkt erop dat uw machtigingen niet voldoende zijn om deze bewerking uit te voeren';

  @override
  String get isRequiredText => 'is verplicht.';

  @override
  String get no2faProvidersFound => 'Geen 2FA-providers gevonden';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Neem contact op met uw systeembeheerder';

  @override
  String errorOccured(Object e) {
    return 'Fout opgetreden: $e';
  }

  @override
  String get unsavedChanges => 'Niet-opgeslagen wijzigingen';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'U heeft niet-opgeslagen wijzigingen. Weet u zeker dat u deze pagina wilt verlaten?';

  @override
  String get deleteAccount => 'Account verwijderen';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Weet u het zeker? U gaat uw $authority-account verwijderen.';
  }

  @override
  String get language => 'Taal';

  @override
  String get metricUnitSystem => 'Metrisch';

  @override
  String get imperialUnitSystem => 'Imperiaal';

  @override
  String get hybridUnitSystem => 'Hybride';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Eenhedensysteem';

  @override
  String get selectCountry => 'Land selecteren';

  @override
  String get hideHomeDashboardToolbar => 'Dashboard-werkbalk verbergen';

  @override
  String get phoneNumberHelperText =>
      'Telefoonnummer in E.164-formaat, bijv. +1201550123';

  @override
  String get homeDashboard => 'Startdashboard';

  @override
  String get security => 'Beveiliging';

  @override
  String get twofactorAuthentication => 'Tweefactorauthenticatie';

  @override
  String get verificationRequired => 'Verificatie vereist';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Tweefactorauthenticatie is vereist';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Stel een verificatiemethode in om door te gaan met inloggen';

  @override
  String get setUpAVerificationMethod => 'Verificatiemethode instellen';

  @override
  String get totpSetupSuccessDescription =>
      'De volgende keer dat u inlogt, moet u een tweefactorauthenticatiecode opgeven';

  @override
  String get smsSetupSuccessDescription =>
      'De volgende keer dat u inlogt, wordt u gevraagd de beveiligingscode in te voeren die naar uw telefoonnummer wordt gestuurd';

  @override
  String get emailSetupSuccessDescription =>
      'De volgende keer dat u inlogt, wordt u gevraagd de beveiligingscode in te voeren die naar uw e-mailadres wordt gestuurd';

  @override
  String get backupCodeSetupSuccessDescription =>
      'De volgende keer dat u inlogt, kunt u back-upcodes gebruiken voor tweefactorauthenticatie';

  @override
  String get loginToApp => 'Inloggen in de app';

  @override
  String get goBack => 'Terug';

  @override
  String get done => 'Klaar';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Dit maakt uw account minder veilig';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Weet u zeker dat u $providerName wilt deactiveren?';
  }

  @override
  String get yesDeactivate => 'Ja, deactiveren';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Voer een e-mailadres in om als authenticator te gebruiken.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Voer een telefoonnummer in om als authenticator te gebruiken';

  @override
  String get sendCode => 'Code verzenden';

  @override
  String errorSendingCode(String error) {
    return 'Fout bij het verzenden van de code: $error';
  }

  @override
  String get copy => 'Kopiëren';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Vul hier de 6-cijferige code in';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'cijferige',
      one: 'cijferige',
    );
    return '$count-$_temp0 code';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopieer de 32-cijferige sleutel naar uw authenticator-app of scan de QR-code hieronder';

  @override
  String get applyChanges => 'Wijzigingen toepassen';

  @override
  String get discardChanges => 'Wijzigingen verwerpen';

  @override
  String get yesDiscard => 'Ja, verwerpen';

  @override
  String get thisActionCannotBeUndone =>
      'Deze actie kan niet ongedaan worden gemaakt';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Tweefactorauthenticatie beschermt uw account tegen ongeautoriseerde toegang. U hoeft alleen een beveiligingscode in te voeren bij het inloggen.';

  @override
  String get calculatedField => 'Berekend veld';

  @override
  String get apiKey => 'API-sleutel';

  @override
  String get aiModel => 'AI-model';

  @override
  String get adminSettings => 'Beheerdersinstellingen';

  @override
  String get job => 'Taak';

  @override
  String get mobileAppBundle => 'Mobiele app-bundel';

  @override
  String get mobileApp => 'Mobiele app';

  @override
  String get domain => 'Domein';

  @override
  String get oauth2Client => 'OAuth2-client';

  @override
  String get queueStats => 'Wachtrijstatistieken';

  @override
  String get phoneIsRequired => 'Telefoon is verplicht';

  @override
  String get phoneIsInvalid => 'Telefoonnummer is ongeldig';

  @override
  String get addVerificationMethod => 'Verificatiemethode toevoegen';

  @override
  String get imageSavedToGallery => 'Opgeslagen in \'Afbeeldingengalerij\'';

  @override
  String get failedToSaveImage => 'Kan afbeelding niet opslaan';

  @override
  String nSelected(int count) {
    return '$count geselecteerd';
  }

  @override
  String get selectAll => 'Alle geladen selecteren';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bewerkingen mislukt',
      one: '1 bewerking mislukt',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meldingen verwijderen?',
      one: '1 melding verwijderen?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meldingen als gelezen markeren?',
      one: '1 melding als gelezen markeren?',
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
  String get liveTrackingActive => 'Live locatietracking';

  @override
  String get liveTrackingPaused => 'Live tracking gepauzeerd';

  @override
  String get liveTrackingFixes => 'Posities';

  @override
  String get liveTrackingSaved => 'Opgeslagen';

  @override
  String get liveTrackingErrors => 'Fouten';

  @override
  String get liveTrackingStop => 'Stoppen';

  @override
  String get liveTrackingPause => 'Pauzeren';

  @override
  String get liveTrackingResume => 'Hervatten';

  @override
  String get liveTrackingHide => 'Verbergen';

  @override
  String get liveTrackingSessionTitle => 'Live locatietracking';

  @override
  String get liveTrackingTarget => 'Locatie opslaan bij entiteit';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Starttijd';

  @override
  String get liveTrackingLastFix => 'Laatste positie';

  @override
  String get liveTrackingLastError => 'Laatste fout';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Kan niet opslaan bij deze entiteit – ze bestaat niet meer. Tracking gaat door; werk het doel bij in de dashboardactie.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Geen verbinding met de server. Deze posities zijn niet opgeslagen – opslaan gaat verder zodra je weer online bent.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Je sessie is beëindigd. Meld je opnieuw aan om de locatie te blijven opslaan.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Kan niet opslaan bij deze entiteit – je hebt geen toestemming. Tracking gaat door; vraag je beheerder om toegang.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Deze positie kon niet op de server worden opgeslagen. Opslaan wordt opnieuw geprobeerd bij de volgende positie.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Locatievoorzieningen zijn uitgeschakeld op dit apparaat.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Toestemming voor locatie is geweigerd.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Toestemming voor locatie is permanent geweigerd. Schakel deze in via de app-instellingen.';

  @override
  String get liveTrackingErrorLocation => 'Kon de locatie niet bepalen.';

  @override
  String get liveTrackingMenuTitle => 'Live locatietracking';

  @override
  String get liveTrackingNoRecord =>
      'Geen actieve tracking en geen recente sessie.';

  @override
  String get liveTrackingLastSession => 'Laatste sessie';

  @override
  String get liveTrackingStartAgain => 'Opnieuw starten';

  @override
  String get liveTrackingEnded => 'Eindtijd';

  @override
  String get liveTrackingEndReason => 'Reden van beëindiging';

  @override
  String get liveTrackingEndReasonManual => 'Handmatig gestopt';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Maximale duur bereikt';

  @override
  String get liveTrackingEndReasonInterrupted => 'Onderbroken';

  @override
  String get serverUpdateRequired => 'Serverupdate vereist';

  @override
  String get backToLogin => 'Terug naar inloggen';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Deze app werkt met ThingsBoard $minVersion of nieuwer.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Versie';

  @override
  String get askAdminToUpdateServer =>
      'Vraag uw serverbeheerder om de server bij te werken.';

  @override
  String get deviceClaimFailed =>
      'Het apparaat kon niet worden geclaimd. Probeer het opnieuw.';

  @override
  String get deviceToClaimNotFound =>
      'Apparaat niet gevonden. Neem contact op met de leverancier van het apparaat.';

  @override
  String get enableAuthenticatorApp => 'Authenticator-app inschakelen';

  @override
  String get enableSmsAuthenticator => 'SMS-authenticatie inschakelen';

  @override
  String get enableEmailAuthenticator => 'E-mailauthenticatie inschakelen';

  @override
  String get getBackupCode => 'Back-upcode ophalen';

  @override
  String get twoFaTotpDescription =>
      'Gebruik apps zoals Google Authenticator, Authy of Duo op je telefoon om te verifiëren. Het genereert een beveiligingscode om in te loggen.';

  @override
  String get twoFaSmsDescription =>
      'Gebruik je telefoon om je te authenticeren. We sturen je een beveiligingscode via sms wanneer je inlogt.';

  @override
  String get twoFaEmailDescription =>
      'Gebruik een beveiligingscode die naar uw e-mailadres is verzonden om u te verifiëren.';

  @override
  String get twoFaBackupCodeDescription =>
      'Met deze afdrukbare eenmalige toegangscodes kunt u zich aanmelden wanneer u uw telefoon niet bij de hand hebt, bijvoorbeeld wanneer u op reis bent.';

  @override
  String get openInAuthenticatorApp => 'Openen in authenticator-app';

  @override
  String get noAuthenticatorAppFound =>
      'Geen authenticator-app gevonden. Kopieer de sleutel naar uw app.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider is ingeschakeld';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Uw beheerder vereist tweestapsverificatie voor $email.';
  }

  @override
  String get recommended => 'Aanbevolen';

  @override
  String get addBackupCodesHint =>
      'Voeg ook back-upcodes toe, zodat u kunt inloggen als u uw telefoon kwijtraakt.';

  @override
  String get totpSecretKey => 'Geheime sleutel';

  @override
  String get backupCodesDescription =>
      'Print de codes uit, zodat je ze bij de hand hebt wanneer je ze moet gebruiken om in te loggen op je account. U kunt elke back-upcode één keer gebruiken.';

  @override
  String get backupCodesWarning =>
      'Zodra u deze pagina verlaat, kunnen deze codes niet meer worden weergegeven. Bewaar ze veilig met behulp van de onderstaande opties.';

  @override
  String get downloadTxt => 'Downloaden (txt)';
}

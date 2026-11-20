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
  String get home => 'Home';

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
  String get auditLogs => 'Auditlogs';

  @override
  String get noCustomersFound => 'Geen klanten gevonden';

  @override
  String get noAssetsFound => 'Geen assets gevonden';

  @override
  String get noTenantsFound => 'Geen tenants gevonden';

  @override
  String get noDevicesFound => 'Geen apparaten gevonden';

  @override
  String get noAuditLogsFound => 'Geen auditlogs gevonden';

  @override
  String get logout => 'Uitloggen';

  @override
  String get login => 'Inloggen';

  @override
  String get loginToYourAccount => 'Inloggen op je account';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalidText => 'Ongeldig e-mailformaat.';

  @override
  String get username => 'gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get passwordForgotText => 'Wachtwoord vergeten?';

  @override
  String get passwordReset => 'Wachtwoord opnieuw instellen';

  @override
  String get passwordResetText =>
      'Voer het e-mailadres in dat aan je account is gekoppeld, dan sturen we je een e-mail met een link om je wachtwoord opnieuw in te stellen';

  @override
  String get requestPasswordReset => 'Wachtwoordreset aanvragen';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Link voor e-mailverificatie is verzonden!';

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
  String get address2 => 'Adres 2';

  @override
  String get phone => 'Telefoon';

  @override
  String get alarmClearTitle => 'Alarm opheffen';

  @override
  String get alarmClearText => 'Weet je zeker dat je dit alarm wilt opheffen?';

  @override
  String get alarmAcknowledgeTitle => 'Alarm bevestigen';

  @override
  String get alarmAcknowledgeText =>
      'Weet je zeker dat je dit alarm wilt bevestigen?';

  @override
  String get assetName => 'Assetnaam';

  @override
  String get type => 'Type';

  @override
  String get label => 'Label';

  @override
  String get auditLogDetails => 'Details auditlog';

  @override
  String get customerDetails => 'Klantdetails';

  @override
  String get assetDetails => 'Assetdetails';

  @override
  String get tenantDetails => 'Tenantgegevens';

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
  String get deviceActive => 'Actief';

  @override
  String get deviceInactive => 'Inactief';

  @override
  String get activeDevices => 'Actief';

  @override
  String get inactiveDevices => 'Inactief';

  @override
  String get alarmStatusActiveAcknowledged => 'Actief, bevestigd';

  @override
  String get alarmStatusActiveUnacknowledged => 'Actief, niet bevestigd';

  @override
  String get alarmStatusClearedAcknowledged => 'Opgeheven, bevestigd';

  @override
  String get alarmStatusClearedUnacknowledged => 'Opgeheven, niet bevestigd';

  @override
  String get alarmStatusFilterActive => 'Actief';

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
      'Nieuw wachtwoord herhalen is verplicht.';

  @override
  String get newPassword2 => 'Bevestig nieuw wachtwoord';

  @override
  String get passwordErrorNotification =>
      'Ingevoerde wachtwoorden moeten gelijk zijn!';

  @override
  String get profileSuccessNotification => 'Profiel succesvol bijgewerkt';

  @override
  String get passwordSuccessNotification => 'Wachtwoord succesvol gewijzigd';

  @override
  String get notImplemented => 'Niet geïmplementeerd!';

  @override
  String get listIsEmptyText => 'De lijst is momenteel leeg.';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get verifyYourIdentity => 'Verifieer je identiteit';

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
    return 'Code opnieuw verzenden over $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Voer de beveiligingscode in uit je authenticator-app.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Er is een beveiligingscode verzonden naar je telefoonnummer $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Er is een beveiligingscode verzonden naar je e-mailadres $contact.';
  }

  @override
  String get backupCodeAuthDescription => 'Voer een van je back-upcodes in.';

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
      'Te veel verzoeken om de verificatiecode te controleren';

  @override
  String get tryAnotherWay => 'Probeer een andere manier';

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
      'Er is een e-mail met verificatiegegevens verzonden naar het opgegeven e-mailadres ';

  @override
  String get emailVerificationInstructionsText =>
      'Volg de instructies in de e-mail om je registratie te voltooien. Let op: als je de e-mail na enige tijd nog niet hebt ontvangen, controleer dan je \'spam\'-map of probeer de e-mail opnieuw te verzenden door op de knop \'Opnieuw verzenden\' te tikken.';

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
      'Je account wordt momenteel geactiveerd.\nEven geduld...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Gefeliciteerd!\nJe $appTitle-account is geactiveerd.\nJe kunt nu inloggen op je $appTitle-omgeving.';
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
  String get lastName => 'Achternaam';

  @override
  String get imNotARobot => 'Ik ben geen robot';

  @override
  String get signUp => 'Registreren';

  @override
  String get alreadyHaveAnAccount => 'Heb je al een account?';

  @override
  String get signIn => 'Aanmelden';

  @override
  String get inactiveUserAlreadyExists => 'Inactieve gebruiker bestaat al';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Er is al een geregistreerde gebruiker met een niet-geverifieerd e-mailadres.\nKlik op de knop \'Opnieuw verzenden\' als je de verificatie-e-mail opnieuw wilt verzenden.';

  @override
  String get assignee => 'Toegewezen aan';

  @override
  String get alarmTypes => 'Alarmtypen';

  @override
  String get details => 'Details';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Ernst';

  @override
  String get originator => 'Afzender';

  @override
  String get startTime => 'Starttijd';

  @override
  String get duration => 'Duur';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dagen',
      one: '$value dag',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value uur',
      one: '$value uur',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minuten',
      one: '$value minuut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value seconden',
      one: '$value seconde',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Dashboard bekijken';

  @override
  String get activity => 'Activiteit';

  @override
  String get addCommentMessage => 'Voeg een opmerking toe...';

  @override
  String get clear => 'Opheffen';

  @override
  String get acknowledge => 'Bevestigen';

  @override
  String get edit => 'Bewerken';

  @override
  String get editProfile => 'Profiel bewerken';

  @override
  String get delete => 'Verwijderen';

  @override
  String get edited => 'Bewerkt';

  @override
  String get deleteComment => 'Opmerking verwijderen';

  @override
  String get areYouSure => 'Weet je het zeker?';

  @override
  String get noResultsFound => 'Geen resultaten gevonden';

  @override
  String get tryRefiningYourQuery => 'Probeer je zoekopdracht te verfijnen';

  @override
  String get failedToLoadTheList => 'Lijst laden mislukt';

  @override
  String get tryRefreshing => 'Probeer te vernieuwen';

  @override
  String get refresh => 'Vernieuwen';

  @override
  String get users => 'Gebruikers';

  @override
  String get unassigned => 'Niet toegewezen';

  @override
  String get failedToLoadAlarmDetails => 'Alarmdetails laden mislukt';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan';

  @override
  String get chooseRegion => 'Regio kiezen';

  @override
  String get regions => 'Regio\'s';

  @override
  String get selectRegion => 'Regio selecteren';

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
    return 'Bijwerken naar $version';
  }

  @override
  String get next => 'Volgende';

  @override
  String get confirmation => 'Bevestiging';

  @override
  String get wifiPassword => 'Wi-Fi-wachtwoord';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Geef de inloggegevens van je netwerk op om de installatie van je apparaat $deviceName te vervolgen.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Voer het wachtwoord voor $network in';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Je hebt onvoldoende rechten voor \"$permissions\" om door te gaan. Verleen de vereiste rechten en tik op \"Opnieuw proberen\".';
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
  String get claimingMessageSuccess => 'Apparaat is\nsuccesvol geclaimd';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Je hebt onvoldoende rechten voor \"$permissions\" om door te gaan. Open de app-instellingen, verleen de rechten en tik op \"Opnieuw proberen\".';
  }

  @override
  String get scanACode => 'Code scannen';

  @override
  String get allowAccess => 'Toegang toestaan';

  @override
  String get toggleCamera => 'Camera wisselen';

  @override
  String get toggleFlash => 'Flitser aan/uit';

  @override
  String get unableToUseCamera => 'Kan camera niet gebruiken';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Open instellingen en verleen toegang tot de camera om door te gaan';

  @override
  String get notFound => 'Niet gevonden';

  @override
  String routeNotDefined(Object name) {
    return 'Route niet gedefinieerd: $name';
  }

  @override
  String get loginWith => 'INLOGGEN MET';

  @override
  String get scanQrCode => 'QR-code scannen';

  @override
  String get searchResults => 'Zoekresultaten';

  @override
  String get viewAll => 'Alles bekijken';

  @override
  String get requestedEntityDoesNotExists =>
      'Opgevraagde entiteit bestaat niet.';

  @override
  String get noAlarmsFound => 'Geen alarmen gevonden';

  @override
  String get filters => 'Filters';

  @override
  String get alarmStatusList => 'Lijst van alarmstatussen';

  @override
  String get alarmSeverityList => 'Lijst van alarmernst';

  @override
  String get cleared => 'Opgeheven';

  @override
  String get acknowledged => 'Bevestigd';

  @override
  String get unacknowledged => 'Niet bevestigd';

  @override
  String get critical => 'Kritiek';

  @override
  String get major => 'Belangrijk';

  @override
  String get minor => 'Minder belangrijk';

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
  String get reset => 'Resetten';

  @override
  String get update => 'Bijwerken';

  @override
  String get alarmTypeList => 'Lijst met alarmtypen';

  @override
  String get anyType => 'Elk type';

  @override
  String get plusAlarmType => '+ Alarmtype';

  @override
  String get all => 'Alle';

  @override
  String get allNotifications => 'Alle';

  @override
  String get unread => 'Ongelezen';

  @override
  String get close => 'Sluiten';

  @override
  String get fatalError => 'Fatale fout';

  @override
  String get unknownError => 'Onbekende fout.';

  @override
  String get sessionExpired => 'Sessie is verlopen';

  @override
  String get fatalApplicationErrorOccurred =>
      'Er is een fatale applicatiefout opgetreden:';

  @override
  String get connectionError => 'Verbindingsfout';

  @override
  String get failedToConnectToServer => 'Verbinden met server mislukt';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Het mobiele dashboard moet worden geconfigureerd in het apparaatprofiel!';

  @override
  String get openWifiSettings => 'Wi-Fi-instellingen openen';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Maak verbinding met de Wi-Fi die je gewoonlijk gebruikt';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Keer terug naar de app en tik op de knop Klaar';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Volg de volgende stappen om je telefoon\nweer met je gebruikelijke Wi-Fi te verbinden';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Pushmeldingen zijn niet geconfigureerd.\nNeem contact op met je systeembeheerder.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase is niet geconfigureerd.\n Raadpleeg de officiële Firebase-documentatie voor\n instructies hierover.';

  @override
  String get markAllAsRead => 'Alles als gelezen markeren';

  @override
  String get profile => 'Profiel';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Kan URL niet openen: $link';
  }

  @override
  String get noDashboardsFound => 'Geen dashboards gevonden';

  @override
  String get openAppSettings => 'App-instellingen openen';

  @override
  String get connectingToDevice => 'Verbinden met apparaat';

  @override
  String get connectToDevice => 'Verbinding maken met apparaat';

  @override
  String get selectWifiNetwork => 'Wi-Fi-netwerk selecteren';

  @override
  String get deviceProvisioning => 'Provisioning van apparaten';

  @override
  String get permissions => 'Rechten';

  @override
  String get unableConnectToDevice => 'Kan geen verbinding maken met apparaat';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Apparaat kan geen Wi-Fi in de buurt vinden';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Verbinding met het Wi-Fi-netwerk $name mislukt.\nZorg ervoor dat je telefoon is verbonden met het Wi-Fi-netwerk van het apparaat en dat toegang tot het lokale netwerk is ingeschakeld voor deze app in de instellingen van je telefoon.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Kan geen verbinding maken met Wi-Fi omdat apparaat $name geen netwerken heeft gevonden';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Volg de volgende stappen om je telefoon met het apparaat te verbinden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Maak verbinding met een Wi-Fi-netwerk dat lijkt op $wifiName';
  }

  @override
  String get ready => 'Klaar';

  @override
  String get exitDeviceProvisioning => 'Apparaatprovisioning afsluiten';

  @override
  String get noNotificationsFound => 'Geen meldingen gevonden';

  @override
  String get markAsRead => 'Markeren als gelezen';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Scan de QR-code op je apparaat';

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
  String get ruleNode => 'Regelnode';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entiteitsweergave';

  @override
  String get widgetsBundle => 'Widgetbundel';

  @override
  String get widgetType => 'Widgettype';

  @override
  String get apiUsageState => 'API-gebruikstoestand';

  @override
  String get tbResource => 'Resource';

  @override
  String get otaPackage => 'OTA-pakket';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Wachtrij';

  @override
  String get notificationTarget => 'Meldingsontvanger';

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
  String get entityGroup => 'Entiteitengroep';

  @override
  String get converter => 'Converter';

  @override
  String get integration => 'Integratie';

  @override
  String get schedulerEvent => 'Plannergebeurtenis';

  @override
  String get blobEntity => 'Blob-entiteit';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Groepsmachtiging';

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
  String get actionTypeRpcCall => 'RPC-aanroep';

  @override
  String get actionTypeCredentialsUpdated => 'Inloggegevens bijgewerkt';

  @override
  String get actionTypeAssignedToCustomer => 'Toegewezen aan klant';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Toewijzing aan klant ingetrokken';

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
  String get actionTypeAlarmAck => 'Alarm bevestigd';

  @override
  String get actionTypeAlarmClear => 'Alarm opgeheven';

  @override
  String get actionTypeAlarmDelete => 'Alarm verwijderd';

  @override
  String get actionTypeAlarmAssigned => 'Alarm toegewezen';

  @override
  String get actionTypeAlarmUnassigned => 'Toewijzing van alarm ingetrokken';

  @override
  String get actionTypeLogin => 'Inloggen';

  @override
  String get actionTypeLogout => 'Uitloggen';

  @override
  String get actionTypeLockout => 'Geblokkeerd';

  @override
  String get actionTypeAssignedFromTenant => 'Toegewezen vanuit tenant';

  @override
  String get actionTypeAssignedToTenant => 'Toegewezen aan tenant';

  @override
  String get actionTypeProvisionSuccess => 'Apparaat geprovisioneerd';

  @override
  String get actionTypeProvisionFailure => 'Provisioning apparaat mislukt';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrie bijgewerkt';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrie verwijderd';

  @override
  String get actionTypeAssignedToEdge => 'Toegewezen aan Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Toewijzing aan Edge ingetrokken';

  @override
  String get actionTypeAddedComment => 'Opmerking toegevoegd';

  @override
  String get actionTypeUpdatedComment => 'Opmerking bijgewerkt';

  @override
  String get actionTypeDeletedComment => 'Opmerking verwijderd';

  @override
  String get actionTypeSmsSent => 'SMS verzonden';

  @override
  String get actionTypeAddedToEntityGroup => 'Toegevoegd aan entiteitengroep';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Verwijderd uit entiteitengroep';

  @override
  String get actionTypeRestApiRuleEngineCall => 'Rule Engine REST API-aanroep';

  @override
  String get actionTypeMadePublic => 'Openbaar gemaakt';

  @override
  String get actionTypeMadePrivate => 'Privé gemaakt';

  @override
  String get actionTypeChangeOwner => 'Eigenaar gewijzigd';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Je hebt geen rechten om deze bewerking uit te voeren!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Je rechten lijken niet toereikend om deze bewerking te voltooien';

  @override
  String fieldIsRequired(String field) {
    return '$field is verplicht.';
  }

  @override
  String get no2faProvidersFound => 'Geen 2FA-providers gevonden';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Neem contact op met je systeembeheerder';

  @override
  String errorOccured(Object e) {
    return 'Er is een fout opgetreden: $e';
  }

  @override
  String get unsavedChanges => 'Niet-opgeslagen wijzigingen';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Je hebt niet-opgeslagen wijzigingen. Weet je zeker dat je deze pagina wilt verlaten?';

  @override
  String get deleteAccount => 'Account verwijderen';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Weet je het zeker? Je gaat je $authority-account verwijderen.';
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
  String get autoUnitSystem => 'Automatisch';

  @override
  String get languageAuto => 'Automatisch';

  @override
  String get unitSystem => 'Eenheidssysteem';

  @override
  String get selectCountry => 'Land selecteren';

  @override
  String get hideHomeDashboardToolbar =>
      'Werkbalk van startdashboard verbergen';

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
      'Tweefactorauthenticatie is verplicht';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Stel een verificatiemethode in om door te gaan met inloggen';

  @override
  String get setUpAVerificationMethod => 'Verificatiemethode instellen';

  @override
  String get totpSetupSuccessDescription =>
      'De volgende keer dat je inlogt, moet je een tweefactorauthenticatiecode invoeren';

  @override
  String get smsSetupSuccessDescription =>
      'De volgende keer dat je inlogt, word je gevraagd de beveiligingscode in te voeren die naar het telefoonnummer wordt verzonden';

  @override
  String get emailSetupSuccessDescription =>
      'De volgende keer dat je inlogt, word je gevraagd de beveiligingscode in te voeren die naar je e-mailadres wordt verzonden';

  @override
  String get backupCodeSetupSuccessDescription =>
      'De volgende keer dat je inlogt, kun je back-upcodes gebruiken om de tweefactorauthenticatie te doorlopen';

  @override
  String get loginToApp => 'Inloggen in app';

  @override
  String get goBack => 'Terug';

  @override
  String get done => 'Gereed';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Hierdoor wordt je account minder veilig';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Weet je zeker dat je $providerName wilt deactiveren?';
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
  String get copy => 'Kopiëren';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Voer hier de 6-cijferige code in';

  @override
  String digitsCode(int count) {
    return 'Code van $count cijfers';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopieer de sleutel van 32 tekens naar je authenticator-app of scan de onderstaande QR-code';

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
      'Tweefactorauthenticatie beschermt je account tegen ongeautoriseerde toegang. Je hoeft alleen een beveiligingscode in te voeren bij het inloggen.';

  @override
  String get calculatedField => 'Berekend veld';

  @override
  String get apiKey => 'API-sleutel';

  @override
  String get aiModel => 'AI-model';

  @override
  String get adminSettings => 'Beheerinstellingen';

  @override
  String get job => 'Taak';

  @override
  String get mobileAppBundle => 'Mobiele bundel';

  @override
  String get mobileApp => 'Mobiele app';

  @override
  String get domain => 'Domein';

  @override
  String get oauth2Client => 'OAuth 2.0-client';

  @override
  String get queueStats => 'Wachtrijstatistieken';

  @override
  String get phoneIsRequired => 'Telefoonnummer is verplicht';

  @override
  String get phoneIsInvalid => 'Telefoonnummer is ongeldig';

  @override
  String get addVerificationMethod => 'Verificatiemethode toevoegen';

  @override
  String get imageSavedToGallery =>
      'Opgeslagen in de \'Afbeeldingengalerij\' van het platform';

  @override
  String get failedToSaveImage => 'Afbeelding opslaan mislukt';

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
    return 'Gegevens ophalen van je host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Inloggen bij host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Overschakelen naar de nieuwe host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Kan geen inlogtoken ophalen van $host. Scan een nieuwe QR-code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Verbinden met $host mislukt';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host is geen ThingsBoard-server';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'De QR-codesessie is niet meer geldig. Vernieuw de QR-code en scan opnieuw.';

  @override
  String get openThisLinkTitle => 'Deze link openen?';

  @override
  String get linkOpensSignInPage =>
      'Deze link opent de aanmeldpagina van deze server. Je wordt afgemeld bij je huidige server.';

  @override
  String get linkOpensSignInPageOnly =>
      'Deze link opent de aanmeldpagina van deze server.';

  @override
  String linkSignsInAs(Object email) {
    return 'Deze link meldt je aan bij deze server als $email.';
  }

  @override
  String get linkSignsIn => 'Deze link meldt je aan bij deze server.';

  @override
  String get serverConnectionNotSecure =>
      'Deze server gebruikt geen beveiligde verbinding.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Deze app werkt alleen met de eigen server en kan deze link niet openen.';

  @override
  String get liveTrackingActive => 'Live locatievolging';

  @override
  String get liveTrackingPaused => 'Live locatievolging gepauzeerd';

  @override
  String get liveTrackingFixes => 'Metingen';

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
  String get liveTrackingSessionTitle => 'Live locatievolging';

  @override
  String get liveTrackingTarget => 'Locatie opslaan in entiteit';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Starttijd';

  @override
  String get liveTrackingLastFix => 'Laatste meting';

  @override
  String get liveTrackingLastError => 'Laatste fout';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Kan niet opslaan in deze entiteit — deze bestaat niet meer. Volgen gaat door; werk het doel bij in de dashboardactie.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Geen verbinding met de server. Deze metingen zijn niet opgeslagen — opslaan wordt hervat zodra je weer online bent.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Je sessie is beëindigd. Meld je opnieuw aan om de locatie te blijven opslaan.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Kan niet opslaan in deze entiteit — je hebt geen rechten. Volgen gaat door; vraag je beheerder om toegang te verlenen.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Kan deze meting niet opslaan op de server. Opslaan wordt opnieuw geprobeerd bij de volgende meting.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Locatievoorzieningen zijn uitgeschakeld op dit apparaat.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Locatietoegang is geweigerd.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Locatietoegang is permanent geweigerd. Schakel deze in bij de app-instellingen.';

  @override
  String get liveTrackingErrorLocation => 'Kan geen locatie bepalen.';

  @override
  String get liveTrackingMenuTitle => 'Live locatievolging';

  @override
  String get liveTrackingNoRecord =>
      'Geen actieve locatievolging en geen recente sessie.';

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
  String get serverUpdateRequired => 'Server bijwerken vereist';

  @override
  String get backToLogin => 'Terug naar inloggen';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Deze app werkt met ThingsBoard $minVersion of hoger.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Versie';

  @override
  String get askAdminToUpdateServer =>
      'Vraag je serverbeheerder om de server bij te werken.';

  @override
  String get deviceClaimFailed =>
      'Het apparaat kon niet worden geclaimd. Probeer het opnieuw.';

  @override
  String get deviceToClaimNotFound =>
      'Apparaat niet gevonden. Neem contact op met de leverancier van het apparaat.';

  @override
  String get enableAuthenticatorApp => 'Authenticator-app inschakelen';

  @override
  String get enableSmsAuthenticator => 'SMS-authenticator inschakelen';

  @override
  String get enableEmailAuthenticator => 'E-mailauthenticator inschakelen';

  @override
  String get getBackupCode => 'Back-upcode ophalen';

  @override
  String get twoFaTotpDescription =>
      'Gebruik apps zoals Google Authenticator, Authy of Duo op je telefoon om te authenticeren. Hiermee wordt een beveiligingscode gegenereerd om in te loggen.';

  @override
  String get twoFaSmsDescription =>
      'Gebruik je telefoon om te authenticeren. We sturen je een beveiligingscode via SMS wanneer je inlogt.';

  @override
  String get twoFaEmailDescription =>
      'Gebruik een beveiligingscode die naar je e-mailadres wordt gestuurd om te authenticeren.';

  @override
  String get twoFaBackupCodeDescription =>
      'Met deze afdrukbare eenmalige codes kun je je aanmelden wanneer je je telefoon niet bij je hebt, bijvoorbeeld tijdens het reizen.';

  @override
  String get openInAuthenticatorApp => 'Openen in authenticator-app';

  @override
  String get noAuthenticatorAppFound =>
      'Geen authenticator-app gevonden. Kopieer de sleutel in plaats daarvan naar je app.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider is ingeschakeld';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Je beheerder vereist tweefactorauthenticatie voor $email.';
  }

  @override
  String get recommended => 'Aanbevolen';

  @override
  String get addBackupCodesHint =>
      'Voeg ook back-upcodes toe, zodat je je nog kunt aanmelden als je je telefoon kwijtraakt.';

  @override
  String get totpSecretKey => 'Geheime sleutel';

  @override
  String get backupCodesDescription =>
      'Druk de codes af zodat je ze bij de hand hebt wanneer je ze nodig hebt om in te loggen op je account. Je kunt elke back-upcode één keer gebruiken.';

  @override
  String get backupCodesWarning =>
      'Zodra je deze pagina verlaat, kunnen deze codes niet opnieuw worden weergegeven. Bewaar ze veilig met de onderstaande opties.';

  @override
  String get downloadTxt => 'Downloaden (txt)';
}

/// The translations for Dutch Flemish, as used in Belgium (`nl_BE`).
class SNlBe extends SNl {
  SNlBe() : super('nl_BE');
}

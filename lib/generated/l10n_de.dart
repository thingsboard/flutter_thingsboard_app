// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class SDe extends S {
  SDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Startseite';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Geräte',
      one: 'Gerät',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Mehr';

  @override
  String get customers => 'Kunden';

  @override
  String get assets => 'Assets';

  @override
  String get tenants => 'Mandanten';

  @override
  String get auditLogs => 'Audit-Logs';

  @override
  String get noCustomersFound => 'Keine Kunden gefunden';

  @override
  String get noAssetsFound => 'Keine Assets gefunden';

  @override
  String get noTenantsFound => 'Keine Mandanten gefunden';

  @override
  String get noDevicesFound => 'Keine Geräte gefunden';

  @override
  String get noAuditLogsFound => 'Keine Audit-Logs gefunden';

  @override
  String get logout => 'Abmelden';

  @override
  String get login => 'Anmelden';

  @override
  String get loginToYourAccount => 'Bei Ihrem Konto anmelden';

  @override
  String get email => 'E-Mail';

  @override
  String get emailInvalidText => 'Ungültiges E-Mail-Format.';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get passwordForgotText => 'Passwort vergessen?';

  @override
  String get passwordReset => 'Passwort zurücksetzen';

  @override
  String get passwordResetText =>
      'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein, und wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen des Passworts';

  @override
  String get requestPasswordReset => 'Passwort-Zurücksetzung anfordern';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Link zur E-Mail-Bestätigung wurde erfolgreich gesendet!';

  @override
  String get or => 'ODER';

  @override
  String get no => 'Nein';

  @override
  String get yes => 'Ja';

  @override
  String get title => 'Titel';

  @override
  String get country => 'Land';

  @override
  String get city => 'Stadt';

  @override
  String get stateOrProvince => 'Bundesland / Provinz';

  @override
  String get postalCode => 'PLZ / Postleitzahl';

  @override
  String get address => 'Adresse';

  @override
  String get address2 => 'Adresse 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Alarm zurücksetzen';

  @override
  String get alarmClearText => 'Möchten Sie den Alarm wirklich zurücksetzen?';

  @override
  String get alarmAcknowledgeTitle => 'Alarm bestätigen';

  @override
  String get alarmAcknowledgeText =>
      'Möchten Sie den Alarm wirklich bestätigen?';

  @override
  String get assetName => 'Asset-Name';

  @override
  String get type => 'Typ';

  @override
  String get label => 'Bezeichnung';

  @override
  String get auditLogDetails => 'Audit-Log-Details';

  @override
  String get customerDetails => 'Kundendetails';

  @override
  String get assetDetails => 'Asset-Details';

  @override
  String get tenantDetails => 'Mandantendetails';

  @override
  String get entityType => 'Entitätstyp';

  @override
  String get actionData => 'Aktionsdaten';

  @override
  String get failureDetails => 'Fehlerdetails';

  @override
  String get allDevices => 'Alle Geräte';

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
  String get alarmStatusActiveAcknowledged => 'Aktiv bestätigt';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktiv nicht bestätigt';

  @override
  String get alarmStatusClearedAcknowledged => 'Zurückgesetzt bestätigt';

  @override
  String get alarmStatusClearedUnacknowledged =>
      'Zurückgesetzt nicht bestätigt';

  @override
  String get alarmStatusFilterActive => 'Aktiv';

  @override
  String get systemAdministrator => 'Systemadministrator';

  @override
  String get tenantAdministrator => 'Mandantenadministrator';

  @override
  String get customer => 'Kunde';

  @override
  String get changePassword => 'Passwort ändern';

  @override
  String get currentPasswordRequireText =>
      'Aktuelles Passwort ist erforderlich.';

  @override
  String get currentPassword => 'Aktuelles Passwort';

  @override
  String get newPasswordRequireText => 'Neues Passwort ist erforderlich.';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get newPassword2RequireText =>
      'Wiederholung des neuen Passworts ist erforderlich.';

  @override
  String get newPassword2 => 'Neues Passwort bestätigen';

  @override
  String get passwordErrorNotification =>
      'Die eingegebenen Passwörter müssen übereinstimmen!';

  @override
  String get profileSuccessNotification => 'Profil erfolgreich aktualisiert';

  @override
  String get passwordSuccessNotification => 'Passwort erfolgreich geändert';

  @override
  String get notImplemented => 'Nicht implementiert!';

  @override
  String get listIsEmptyText => 'Die Liste ist derzeit leer.';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get verifyYourIdentity => 'Identität bestätigen';

  @override
  String get continueText => 'Weiter';

  @override
  String get resendCode => 'Code erneut senden';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time Sekunden',
      one: '1 Sekunde',
    );
    return 'Code erneut senden in $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Bitte geben Sie den Sicherheitscode aus Ihrer Authentifizierungs-App ein.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Ein Sicherheitscode wurde an Ihr Telefon unter $contact gesendet.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Ein Sicherheitscode wurde an Ihre E-Mail-Adresse unter $contact gesendet.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Bitte geben Sie einen Ihrer Backup-Codes ein.';

  @override
  String get toptAuthPlaceholder => 'Code';

  @override
  String get smsAuthPlaceholder => 'SMS-Code';

  @override
  String get emailAuthPlaceholder => 'E-Mail-Code';

  @override
  String get backupCodeAuthPlaceholder => 'Backup-Code';

  @override
  String get verificationCodeIncorrect => 'Verifizierungscode ist falsch';

  @override
  String get verificationCodeManyRequest =>
      'Zu viele Anfragen zur Überprüfung des Verifizierungscodes';

  @override
  String get tryAnotherWay => 'Andere Methode versuchen';

  @override
  String get selectWayToVerify => 'Wählen Sie eine Methode zur Verifizierung';

  @override
  String get mfaProviderTopt => 'Authentifizierungs-App';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-Mail';

  @override
  String get mfaProviderBackupCode => 'Backup-Code';

  @override
  String get newUserText => 'Neuer Benutzer?';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get emailVerification => 'E-Mail-Bestätigung';

  @override
  String get emailVerificationSentText =>
      'Eine E-Mail mit Bestätigungsdetails wurde an die angegebene E-Mail-Adresse gesendet ';

  @override
  String get emailVerificationInstructionsText =>
      'Bitte folgen Sie den Anweisungen in der E-Mail, um die Registrierung abzuschließen. Hinweis: Falls Sie die E-Mail längere Zeit nicht erhalten haben, prüfen Sie bitte Ihren Spam-Ordner oder versuchen Sie, die E-Mail über die Schaltfläche „Erneut senden“ erneut zu senden.';

  @override
  String get resend => 'Erneut senden';

  @override
  String get activatingAccount => 'Konto wird aktiviert...';

  @override
  String get accountActivated => 'Konto erfolgreich aktiviert!';

  @override
  String get emailVerified => 'E-Mail bestätigt';

  @override
  String get activatingAccountText =>
      'Ihr Konto wird derzeit aktiviert.\nBitte warten...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Herzlichen Glückwunsch!\nIhr $appTitle-Konto wurde aktiviert.\nSie können sich nun in Ihrem $appTitle-Bereich anmelden.';
  }

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get accept => 'Akzeptieren';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get firstName => 'Vorname';

  @override
  String get lastName => 'Nachname';

  @override
  String get imNotARobot => 'Ich bin kein Roboter';

  @override
  String get signUp => 'Registrieren';

  @override
  String get alreadyHaveAnAccount => 'Bereits ein Konto?';

  @override
  String get signIn => 'Anmelden';

  @override
  String get inactiveUserAlreadyExists =>
      'Inaktiver Benutzer existiert bereits';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Es ist bereits ein Benutzer mit nicht bestätigter E-Mail-Adresse registriert.\nKlicken Sie auf die Schaltfläche „Erneut senden“, wenn Sie die Bestätigungs-E-Mail erneut senden möchten.';

  @override
  String get assignee => 'Zuständiger';

  @override
  String get alarmTypes => 'Alarmtypen';

  @override
  String get details => 'Details';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Schweregrad';

  @override
  String get originator => 'Ursprung';

  @override
  String get startTime => 'Startzeit';

  @override
  String get duration => 'Dauer';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Tage',
      one: '$value Tag',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Stunden',
      one: '$value Stunde',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Minuten',
      one: '$value Minute',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value Sekunden',
      one: '$value Sekunde',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Dashboard anzeigen';

  @override
  String get activity => 'Aktivität';

  @override
  String get addCommentMessage => 'Kommentar hinzufügen...';

  @override
  String get clear => 'Zurücksetzen';

  @override
  String get acknowledge => 'Bestätigen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get delete => 'Löschen';

  @override
  String get edited => 'Bearbeitet';

  @override
  String get deleteComment => 'Kommentar löschen';

  @override
  String get areYouSure => 'Sind Sie sicher?';

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';

  @override
  String get tryRefiningYourQuery => 'Bitte verfeinern Sie Ihre Suchanfrage';

  @override
  String get failedToLoadTheList => 'Laden der Liste fehlgeschlagen';

  @override
  String get tryRefreshing => 'Bitte versuchen Sie es erneut';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get users => 'Benutzer';

  @override
  String get unassigned => 'Nicht zugewiesen';

  @override
  String get failedToLoadAlarmDetails =>
      'Laden der Alarmdetails fehlgeschlagen';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get chooseRegion => 'Region auswählen';

  @override
  String get regions => 'Regionen';

  @override
  String get selectRegion => 'Region auswählen';

  @override
  String get northAmerica => 'Nordamerika';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Geräteliste';

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
  String get updateRequired => 'Aktualisierung erforderlich';

  @override
  String updateTo(Object version) {
    return 'Auf $version aktualisieren';
  }

  @override
  String get next => 'Weiter';

  @override
  String get confirmation => 'Bestätigung';

  @override
  String get wifiPassword => 'Wi-Fi-Passwort';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Um die Einrichtung Ihres Geräts $deviceName fortzusetzen, geben Sie bitte Ihre Netzwerk-Zugangsdaten ein.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Passwort für $network eingeben';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Sie haben nicht genügend Berechtigungen für „$permissions“, um fortzufahren. Bitte erteilen Sie die erforderlichen Berechtigungen und tippen Sie auf „Erneut versuchen“.';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi-Zugangsdaten werden gesendet';

  @override
  String get confirmingWifiConnection => 'Wi-Fi-Verbindung wird bestätigt';

  @override
  String get provisionedSuccessfully =>
      'Gerät wurde erfolgreich bereitgestellt';

  @override
  String get returnToDashboard => 'Zurück zum Dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Sitzung mit Gerät $deviceName kann nicht hergestellt werden. Bitte versuchen Sie es erneut';
  }

  @override
  String get claimingDevice => 'Gerät wird beansprucht';

  @override
  String get claimingMessageSuccess => 'Gerät wurde\nerfolgreich beansprucht';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Sie haben nicht genügend Berechtigungen für „$permissions“, um fortzufahren. Bitte öffnen Sie die App-Einstellungen, erteilen Sie die Berechtigungen und tippen Sie auf „Erneut versuchen“.';
  }

  @override
  String get scanACode => 'Code scannen';

  @override
  String get allowAccess => 'Zugriff erlauben';

  @override
  String get toggleCamera => 'Kamera umschalten';

  @override
  String get toggleFlash => 'Blitz umschalten';

  @override
  String get unableToUseCamera => 'Kamera kann nicht verwendet werden';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Einstellungen öffnen und Kamerazugriff erteilen, um fortzufahren';

  @override
  String get notFound => 'Nicht gefunden';

  @override
  String routeNotDefined(Object name) {
    return 'Route nicht definiert: $name';
  }

  @override
  String get loginWith => 'ANMELDEN MIT';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String get searchResults => 'Suchergebnisse';

  @override
  String get viewAll => 'Alle anzeigen';

  @override
  String get requestedEntityDoesNotExists =>
      'Angeforderte Entität existiert nicht.';

  @override
  String get noAlarmsFound => 'Keine Alarme gefunden';

  @override
  String get filters => 'Filter';

  @override
  String get alarmStatusList => 'Liste der Alarmstatus';

  @override
  String get alarmSeverityList => 'Liste der Alarmschweregrade';

  @override
  String get cleared => 'Zurückgesetzt';

  @override
  String get acknowledged => 'Bestätigt';

  @override
  String get unacknowledged => 'Nicht bestätigt';

  @override
  String get critical => 'Kritisch';

  @override
  String get major => 'Hoch';

  @override
  String get minor => 'Niedrig';

  @override
  String get warning => 'Warnung';

  @override
  String get indeterminate => 'Unbestimmt';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Benutzer suchen',
      one: 'Benutzer suchen',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get update => 'Anwenden';

  @override
  String get alarmTypeList => 'Liste der Alarmtypen';

  @override
  String get anyType => 'Beliebiger Typ';

  @override
  String get plusAlarmType => '+ Alarmtyp';

  @override
  String get all => 'Alle';

  @override
  String get allNotifications => 'Alle';

  @override
  String get unread => 'Ungelesen';

  @override
  String get close => 'Schließen';

  @override
  String get fatalError => 'Schwerwiegender Fehler';

  @override
  String get unknownError => 'Unbekannter Fehler.';

  @override
  String get sessionExpired => 'Sitzung ist abgelaufen';

  @override
  String get fatalApplicationErrorOccurred =>
      'Schwerwiegender Anwendungsfehler aufgetreten:';

  @override
  String get connectionError => 'Verbindungsfehler';

  @override
  String get failedToConnectToServer => 'Verbindung zum Server fehlgeschlagen';

  @override
  String get retry => 'Wiederholen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobiles Dashboard muss im Geräteprofil konfiguriert werden!';

  @override
  String get openWifiSettings => 'Wi-Fi-Einstellungen öffnen';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Mit dem üblicherweise genutzten Wi-Fi verbinden';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Zur App zurückkehren und auf „Bereit“ tippen';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Bitte folgen Sie den nächsten Schritten, um Ihr Telefon\nwieder mit Ihrem gewohnten Wi-Fi zu verbinden';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-Benachrichtigungen sind nicht konfiguriert.\nBitte wenden Sie sich an Ihren Systemadministrator.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase ist nicht konfiguriert.\n Eine Anleitung zur Konfiguration finden Sie\n in der offiziellen Firebase-Dokumentation.';

  @override
  String get markAllAsRead => 'Alle als gelesen markieren';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'URL kann nicht geöffnet werden: $link';
  }

  @override
  String get noDashboardsFound => 'Keine Dashboards gefunden';

  @override
  String get openAppSettings => 'App-Einstellungen öffnen';

  @override
  String get connectingToDevice => 'Verbindung zum Gerät wird hergestellt';

  @override
  String get connectToDevice => 'Mit Gerät verbinden';

  @override
  String get selectWifiNetwork => 'Wi-Fi-Netzwerk auswählen';

  @override
  String get deviceProvisioning => 'Gerätebereitstellung';

  @override
  String get permissions => 'Berechtigungen';

  @override
  String get unableConnectToDevice => 'Verbindung zum Gerät nicht möglich';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Gerät kann kein Wi-Fi in der Nähe finden';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Verbindung zum Wi-Fi-Netzwerk $name fehlgeschlagen.\nBitte stellen Sie sicher, dass Ihr Telefon mit dem Wi-Fi-Netzwerk des Geräts verbunden ist und dass der Zugriff auf das lokale Netzwerk für diese App in den Einstellungen Ihres Telefons aktiviert ist.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Verbindung zum Wi-Fi nicht möglich, da das Gerät $name keine Netzwerke gefunden hat';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Bitte folgen Sie den nächsten Schritten, um Ihr Telefon mit dem Gerät zu verbinden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Mit einem Wi-Fi ähnlich $wifiName verbinden';
  }

  @override
  String get ready => 'Bereit';

  @override
  String get exitDeviceProvisioning => 'Gerätebereitstellung beenden';

  @override
  String get noNotificationsFound => 'Keine Benachrichtigungen gefunden';

  @override
  String get markAsRead => 'Als gelesen markieren';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Bitte scannen Sie den QR-Code auf Ihrem Gerät';

  @override
  String get search => 'Suchen';

  @override
  String get tenant => 'Mandant';

  @override
  String get tenantProfile => 'Mandantenprofil';

  @override
  String get user => 'Benutzer';

  @override
  String get asset => 'Asset';

  @override
  String get deviceProfile => 'Geräteprofil';

  @override
  String get assetProfile => 'Asset-Profil';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarme',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Regelkette';

  @override
  String get ruleNode => 'Regelknoten';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entitätsansicht';

  @override
  String get widgetsBundle => 'Widget-Bündel';

  @override
  String get widgetType => 'Widget-Typ';

  @override
  String get apiUsageState => 'API-Nutzungsstatus';

  @override
  String get tbResource => 'Ressource';

  @override
  String get otaPackage => 'OTA-Paket';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Warteschlange';

  @override
  String get notificationTarget => 'Benachrichtigungsempfänger';

  @override
  String get notificationTemplate => 'Benachrichtigungsvorlage';

  @override
  String get notificationRequest => 'Benachrichtigungsanfrage';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Benachrichtigungen',
      one: 'Benachrichtigung',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Benachrichtigungsregel';

  @override
  String get entityGroup => 'Entitätsgruppe';

  @override
  String get converter => 'Konverter';

  @override
  String get integration => 'Integration';

  @override
  String get schedulerEvent => 'Zeitplanereignis';

  @override
  String get blobEntity => 'Blob-Entität';

  @override
  String get role => 'Rolle';

  @override
  String get groupPermission => 'Gruppenberechtigung';

  @override
  String get actionStatusSuccess => 'Erfolgreich';

  @override
  String get actionStatusFailure => 'Fehlgeschlagen';

  @override
  String get actionTypeAdded => 'Hinzugefügt';

  @override
  String get actionTypeDeleted => 'Gelöscht';

  @override
  String get actionTypeUpdated => 'Aktualisiert';

  @override
  String get actionTypeAttributesUpdated => 'Attribute aktualisiert';

  @override
  String get actionTypeAttributesDeleted => 'Attribute gelöscht';

  @override
  String get actionTypeRpcCall => 'RPC-Aufruf';

  @override
  String get actionTypeCredentialsUpdated => 'Zugangsdaten aktualisiert';

  @override
  String get actionTypeAssignedToCustomer => 'Kunde zugewiesen';

  @override
  String get actionTypeUnassignedFromCustomer => 'Vom Kunden entfernt';

  @override
  String get actionTypeActivated => 'Aktiviert';

  @override
  String get actionTypeSuspended => 'Suspendiert';

  @override
  String get actionTypeCredentialsRead => 'Zugangsdaten gelesen';

  @override
  String get actionTypeAttributesRead => 'Attribute gelesen';

  @override
  String get actionTypeRelationAddOrUpdate => 'Beziehung aktualisiert';

  @override
  String get actionTypeRelationDeleted => 'Beziehung gelöscht';

  @override
  String get actionTypeRelationsDeleted => 'Alle Beziehungen gelöscht';

  @override
  String get actionTypeAlarmAck => 'Alarm bestätigt';

  @override
  String get actionTypeAlarmClear => 'Alarm zurückgesetzt';

  @override
  String get actionTypeAlarmDelete => 'Alarm gelöscht';

  @override
  String get actionTypeAlarmAssigned => 'Alarm zugewiesen';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm nicht mehr zugewiesen';

  @override
  String get actionTypeLogin => 'Login';

  @override
  String get actionTypeLogout => 'Logout';

  @override
  String get actionTypeLockout => 'Sperrung';

  @override
  String get actionTypeAssignedFromTenant => 'Vom Mandanten zugewiesen';

  @override
  String get actionTypeAssignedToTenant => 'Mandant zugewiesen';

  @override
  String get actionTypeProvisionSuccess => 'Gerät bereitgestellt';

  @override
  String get actionTypeProvisionFailure =>
      'Gerätebereitstellung fehlgeschlagen';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrie aktualisiert';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrie gelöscht';

  @override
  String get actionTypeAssignedToEdge => 'Edge zugewiesen';

  @override
  String get actionTypeUnassignedFromEdge => 'Von Edge entfernt';

  @override
  String get actionTypeAddedComment => 'Kommentar hinzugefügt';

  @override
  String get actionTypeUpdatedComment => 'Kommentar aktualisiert';

  @override
  String get actionTypeDeletedComment => 'Kommentar gelöscht';

  @override
  String get actionTypeSmsSent => 'SMS gesendet';

  @override
  String get actionTypeAddedToEntityGroup => 'Zur Entitätsgruppe hinzugefügt';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Aus Entitätsgruppe entfernt';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'REST-API-Aufruf der Regel-Engine';

  @override
  String get actionTypeMadePublic => 'Öffentlich gemacht';

  @override
  String get actionTypeMadePrivate => 'Privat gemacht';

  @override
  String get actionTypeChangeOwner => 'Besitzer geändert';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Sie haben keine Berechtigung, diese Aktion auszuführen!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Ihre Berechtigungen reichen offenbar nicht aus, um diese Aktion abzuschließen';

  @override
  String fieldIsRequired(String field) {
    return '$field ist erforderlich.';
  }

  @override
  String get no2faProvidersFound => 'Keine 2FA-Anbieter gefunden';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Bitte wenden Sie sich an Ihren Systemadministrator';

  @override
  String errorOccured(Object e) {
    return 'Fehler aufgetreten: $e';
  }

  @override
  String get unsavedChanges => 'Ungespeicherte Änderungen';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Sie haben ungespeicherte Änderungen. Möchten Sie diese Seite wirklich verlassen?';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Sind Sie sicher? Sie werden Ihr $authority-Konto löschen.';
  }

  @override
  String get language => 'Sprache';

  @override
  String get metricUnitSystem => 'Metrisch';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Hybrid';

  @override
  String get autoUnitSystem => 'Automatisch';

  @override
  String get languageAuto => 'Automatisch';

  @override
  String get unitSystem => 'Einheitensystem';

  @override
  String get selectCountry => 'Land auswählen';

  @override
  String get hideHomeDashboardToolbar =>
      'Werkzeugleiste im Start-Dashboard ausblenden';

  @override
  String get phoneNumberHelperText =>
      'Telefonnummer im E.164-Format, z. B. +1201550123';

  @override
  String get homeDashboard => 'Start-Dashboard';

  @override
  String get security => 'Sicherheit';

  @override
  String get twofactorAuthentication => 'Zwei-Faktor-Authentifizierung';

  @override
  String get verificationRequired => 'Verifizierung erforderlich';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Zwei-Faktor-Authentifizierung ist erforderlich';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Richten Sie eine Verifizierungsmethode ein, um die Anmeldung fortzusetzen';

  @override
  String get setUpAVerificationMethod => 'Verifizierungsmethode einrichten';

  @override
  String get totpSetupSuccessDescription =>
      'Beim nächsten Anmelden müssen Sie einen Code zur Zwei-Faktor-Authentifizierung angeben';

  @override
  String get smsSetupSuccessDescription =>
      'Beim nächsten Anmelden werden Sie aufgefordert, den Sicherheitscode einzugeben, der an die Telefonnummer gesendet wird';

  @override
  String get emailSetupSuccessDescription =>
      'Beim nächsten Anmelden werden Sie aufgefordert, den Sicherheitscode einzugeben, der an Ihre E-Mail-Adresse gesendet wird';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Bei der nächsten Anmeldung können Sie Backup-Codes zur Zwei-Faktor-Authentifizierung verwenden';

  @override
  String get loginToApp => 'Bei der App anmelden';

  @override
  String get goBack => 'Zurück';

  @override
  String get done => 'Fertig';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Dadurch wird Ihr Konto weniger sicher';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Möchten Sie $providerName wirklich deaktivieren?';
  }

  @override
  String get yesDeactivate => 'Ja, deaktivieren';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Geben Sie eine E-Mail-Adresse ein, die Sie als Authenticator verwenden möchten.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Geben Sie eine Telefonnummer ein, die Sie als Authenticator verwenden möchten';

  @override
  String get sendCode => 'Code senden';

  @override
  String get copy => 'Kopieren';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get enter6digitsKeyFromYourAppHere => '6-stelligen Code hier eingeben';

  @override
  String digitsCode(int count) {
    return '$count-stelliger Code';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopieren Sie den 32-stelligen Schlüssel in Ihre Authenticator-App oder scannen Sie den QR-Code unten';

  @override
  String get applyChanges => 'Änderungen übernehmen';

  @override
  String get discardChanges => 'Änderungen verwerfen';

  @override
  String get yesDiscard => 'Ja, verwerfen';

  @override
  String get thisActionCannotBeUndone =>
      'Diese Aktion kann nicht rückgängig gemacht werden';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Die Zwei-Faktor-Authentifizierung schützt Ihr Konto vor unbefugtem Zugriff. Sie müssen lediglich beim Login einen Sicherheitscode eingeben.';

  @override
  String get calculatedField => 'Berechnetes Feld';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get aiModel => 'KI-Modell';

  @override
  String get adminSettings => 'Administrator-Einstellungen';

  @override
  String get job => 'Job';

  @override
  String get mobileAppBundle => 'Mobile-Bundle';

  @override
  String get mobileApp => 'Mobile App';

  @override
  String get domain => 'Domain';

  @override
  String get oauth2Client => 'OAuth 2.0-Client';

  @override
  String get queueStats => 'Warteschlangenstatistiken';

  @override
  String get phoneIsRequired => 'Telefonnummer ist erforderlich';

  @override
  String get phoneIsInvalid => 'Telefonnummer ist ungültig';

  @override
  String get addVerificationMethod => 'Verifizierungsmethode hinzufügen';

  @override
  String get imageSavedToGallery =>
      'In der „Bildergalerie“ der Plattform gespeichert';

  @override
  String get failedToSaveImage => 'Bild konnte nicht gespeichert werden';

  @override
  String nSelected(int count) {
    return '$count ausgewählt';
  }

  @override
  String get selectAll => 'Alle geladenen auswählen';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vorgänge fehlgeschlagen',
      one: '1 Vorgang fehlgeschlagen',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Benachrichtigungen löschen?',
      one: '1 Benachrichtigung löschen?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Benachrichtigungen als gelesen markieren?',
      one: '1 Benachrichtigung als gelesen markieren?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Daten werden von Ihrem Host $host abgerufen';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Sie werden beim Host $host angemeldet';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Sie werden zum neuen Host $host weitergeleitet';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Anmelde-Token konnte nicht von $host abgerufen werden. Bitte scannen Sie einen neuen QR-Code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Verbindung zu $host fehlgeschlagen';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host ist kein ThingsBoard-Server';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Die QR-Code-Sitzung ist nicht mehr gültig. Bitte aktualisieren Sie den QR-Code und scannen Sie erneut.';

  @override
  String get openThisLinkTitle => 'Diesen Link öffnen?';

  @override
  String get linkOpensSignInPage =>
      'Dieser Link öffnet die Anmeldeseite dieses Servers. Sie werden von Ihrem aktuellen Server abgemeldet.';

  @override
  String get linkOpensSignInPageOnly =>
      'Dieser Link öffnet die Anmeldeseite dieses Servers.';

  @override
  String linkSignsInAs(Object email) {
    return 'Dieser Link meldet Sie als $email bei diesem Server an.';
  }

  @override
  String get linkSignsIn => 'Dieser Link meldet Sie bei diesem Server an.';

  @override
  String get serverConnectionNotSecure =>
      'Dieser Server verwendet keine sichere Verbindung.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Diese App funktioniert nur mit ihrem eigenen Server und kann diesen Link nicht öffnen.';

  @override
  String get liveTrackingActive => 'Live-Standortverfolgung';

  @override
  String get liveTrackingPaused => 'Live-Verfolgung pausiert';

  @override
  String get liveTrackingFixes => 'Positionen';

  @override
  String get liveTrackingSaved => 'Gespeichert';

  @override
  String get liveTrackingErrors => 'Fehler';

  @override
  String liveTrackingCount(String label, int value) {
    return '$label: $value';
  }

  @override
  String get liveTrackingStop => 'Stoppen';

  @override
  String get liveTrackingPause => 'Pausieren';

  @override
  String get liveTrackingResume => 'Fortsetzen';

  @override
  String get liveTrackingHide => 'Ausblenden';

  @override
  String get liveTrackingSessionTitle => 'Live-Standortverfolgung';

  @override
  String get liveTrackingTarget => 'Standort in Entität speichern';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Startzeit';

  @override
  String get liveTrackingLastFix => 'Letzte Position';

  @override
  String get liveTrackingLastError => 'Letzter Fehler';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Speichern in dieser Entität nicht möglich – sie existiert nicht mehr. Die Verfolgung läuft weiter; aktualisieren Sie das Ziel in der Dashboard-Aktion.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Keine Verbindung zum Server. Diese Positionen wurden nicht gespeichert – das Speichern wird fortgesetzt, sobald Sie wieder online sind.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Ihre Sitzung ist beendet. Melden Sie sich erneut an, um den Standort weiter zu speichern.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Speichern in dieser Entität nicht möglich – Sie haben keine Berechtigung. Die Verfolgung läuft weiter; bitten Sie Ihren Administrator um Zugriff.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Diese Position konnte nicht auf dem Server gespeichert werden. Das Speichern wird mit der nächsten Position erneut versucht.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Die Ortungsdienste sind auf diesem Gerät deaktiviert.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Die Standortberechtigung wurde verweigert.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Die Standortberechtigung ist dauerhaft verweigert. Aktivieren Sie sie in den App-Einstellungen.';

  @override
  String get liveTrackingErrorLocation =>
      'Die Position konnte nicht ermittelt werden.';

  @override
  String get liveTrackingMenuTitle => 'Live-Standortverfolgung';

  @override
  String get liveTrackingNoRecord =>
      'Keine aktive Verfolgung und keine kürzlich beendete Sitzung.';

  @override
  String get liveTrackingLastSession => 'Letzte Sitzung';

  @override
  String get liveTrackingStartAgain => 'Erneut starten';

  @override
  String get liveTrackingEnded => 'Endzeit';

  @override
  String get liveTrackingEndReason => 'Beendigungsgrund';

  @override
  String get liveTrackingEndReasonManual => 'Manuell gestoppt';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Max. Dauer erreicht';

  @override
  String get liveTrackingEndReasonInterrupted => 'Unterbrochen';

  @override
  String get serverUpdateRequired => 'Server-Update erforderlich';

  @override
  String get backToLogin => 'Zurück zur Anmeldung';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Diese App funktioniert mit ThingsBoard $minVersion oder höher.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Bitten Sie Ihren Serveradministrator, den Server zu aktualisieren.';

  @override
  String get deviceClaimFailed =>
      'Das Gerät konnte nicht beansprucht werden. Bitte versuchen Sie es erneut.';

  @override
  String get deviceToClaimNotFound =>
      'Gerät nicht gefunden. Bitte wenden Sie sich an den Geräteanbieter.';

  @override
  String get enableAuthenticatorApp => 'Authenticator-App aktivieren';

  @override
  String get enableSmsAuthenticator => 'SMS-Authenticator aktivieren';

  @override
  String get enableEmailAuthenticator => 'E-Mail-Authenticator aktivieren';

  @override
  String get getBackupCode => 'Backup-Code abrufen';

  @override
  String get twoFaTotpDescription =>
      'Verwenden Sie Apps wie Google Authenticator, Authy oder Duo auf Ihrem Telefon zur Authentifizierung. Diese generieren einen Sicherheitscode für die Anmeldung.';

  @override
  String get twoFaSmsDescription =>
      'Verwenden Sie Ihr Telefon zur Authentifizierung. Wir senden Ihnen beim Login einen Sicherheitscode per SMS.';

  @override
  String get twoFaEmailDescription =>
      'Verwenden Sie einen Sicherheitscode, der an Ihre E-Mail-Adresse gesendet wird, um sich zu authentifizieren.';

  @override
  String get twoFaBackupCodeDescription =>
      'Diese druckbaren Einmalcodes ermöglichen die Anmeldung, wenn Sie nicht auf Ihr Telefon zugreifen können, z. B. auf Reisen.';

  @override
  String get openInAuthenticatorApp => 'In Authenticator-App öffnen';

  @override
  String get noAuthenticatorAppFound =>
      'Keine Authenticator-App gefunden. Kopieren Sie stattdessen den Schlüssel in Ihre App.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider ist aktiviert';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Ihr Administrator verlangt eine Zwei-Faktor-Authentifizierung für $email.';
  }

  @override
  String get recommended => 'Empfohlen';

  @override
  String get addBackupCodesHint =>
      'Fügen Sie auch Backup-Codes hinzu, damit Sie sich weiterhin anmelden können, falls Sie Ihr Telefon verlieren.';

  @override
  String get totpSecretKey => 'Geheimer Schlüssel';

  @override
  String get backupCodesDescription =>
      'Drucken Sie die Codes aus, um sie griffbereit zu haben, wenn Sie sich bei Ihrem Konto anmelden. Jeder Backup-Code kann einmal verwendet werden.';

  @override
  String get backupCodesWarning =>
      'Sobald Sie diese Seite verlassen, können diese Codes nicht erneut angezeigt werden. Bewahren Sie sie sicher auf, indem Sie die folgenden Optionen verwenden.';

  @override
  String get downloadTxt => 'Herunterladen (txt)';
}

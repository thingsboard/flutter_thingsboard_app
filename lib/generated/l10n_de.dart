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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Prüfprotokolle';

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
  String get logout => 'Abmelden';

  @override
  String get login => 'Anmelden';

  @override
  String get logoDefaultValue => 'ThingsBoard-Logo';

  @override
  String get loginToYourAccount => 'Melden Sie sich bei Ihrem Konto an';

  @override
  String get email => 'E-Mail';

  @override
  String get emailRequireText => 'E-Mail ist erforderlich.';

  @override
  String get emailInvalidText => 'Ungültiges E-Mail-Format.';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get passwordRequireText => 'Passwort ist erforderlich.';

  @override
  String get passwordForgotText => 'Passwort vergessen?';

  @override
  String get passwordReset => 'Passwort zurücksetzen';

  @override
  String get passwordResetText =>
      'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen des Passworts';

  @override
  String get requestPasswordReset => 'Passwortzurücksetzung anfordern';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Link zum Zurücksetzen des Passworts wurde erfolgreich gesendet!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-Mail-Bestätigungslink wurde erfolgreich gesendet!';

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
  String get alarmClearTitle => 'Alarm löschen';

  @override
  String get alarmClearText =>
      'Sind Sie sicher, dass Sie den Alarm löschen möchten?';

  @override
  String get alarmAcknowledgeTitle => 'Alarm bestätigen';

  @override
  String get alarmAcknowledgeText =>
      'Sind Sie sicher, dass Sie den Alarm bestätigen möchten?';

  @override
  String get assetName => 'Asset-Name';

  @override
  String get type => 'Typ';

  @override
  String get label => 'Bezeichnung';

  @override
  String get assignedToCustomer => 'Dem Kunden zugewiesen';

  @override
  String get auditLogDetails => 'Details des Prüfprotokolls';

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
  String get systemAdministrator => 'Systemadministrator';

  @override
  String get tenantAdministrator => 'Mieteradministrator';

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
      'Neues Passwort (erneut) ist erforderlich.';

  @override
  String get newPassword2 => 'Neues Passwort bestätigen';

  @override
  String get passwordErrorNotification =>
      'Die eingegebenen Passwörter müssen übereinstimmen!';

  @override
  String get firstNameUpper => 'Vorname';

  @override
  String get lastNameUpper => 'Nachname';

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
  String get verifyYourIdentity => 'Bestätigen Sie Ihre Identität';

  @override
  String get continueText => 'Fortfahren';

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
  String get verificationCodeInvalid =>
      'Ungültiges Format des Verifizierungscodes';

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
      'Zu viele Anfragen. Verifizierungscode überprüfen';

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
  String get emailVerification => 'E-Mail-Verifizierung';

  @override
  String get emailVerificationSentText =>
      'Eine E-Mail mit Verifizierungsinformationen wurde an die angegebene E-Mail-Adresse gesendet';

  @override
  String get emailVerificationInstructionsText =>
      'Bitte folgen Sie den Anweisungen in der E-Mail, um die Registrierung abzuschließen. Hinweis: Wenn Sie die E-Mail nicht finden können, überprüfen Sie bitte Ihren Spam-Ordner oder klicken Sie auf \'Erneut senden\', um die E-Mail erneut zu versenden.';

  @override
  String get resend => 'Erneut senden';

  @override
  String get activatingAccount => 'Konto wird aktiviert...';

  @override
  String get accountActivated => 'Konto erfolgreich aktiviert!';

  @override
  String get emailVerified => 'E-Mail verifiziert';

  @override
  String get activatingAccountText =>
      'Ihr Konto wird derzeit aktiviert.\nBitte warten...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Herzlichen Glückwunsch!\nIhr $appTitle-Konto wurde aktiviert.\nSie können sich jetzt in Ihrem $appTitle-Bereich anmelden.';
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
  String get firstNameRequireText => 'Vorname ist erforderlich.';

  @override
  String get lastName => 'Nachname';

  @override
  String get lastNameRequireText => 'Nachname ist erforderlich.';

  @override
  String get createPassword => 'Passwort erstellen';

  @override
  String get repeatPassword => 'Passwort wiederholen';

  @override
  String get imNotARobot => 'Ich bin kein Roboter';

  @override
  String get signUp => 'Registrieren';

  @override
  String get alreadyHaveAnAccount => 'Sie haben bereits ein Konto?';

  @override
  String get signIn => 'Anmelden';

  @override
  String get invalidPasswordLengthMessage =>
      'Ihr Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get confirmNotRobotMessage =>
      'Sie müssen bestätigen, dass Sie kein Roboter sind';

  @override
  String get acceptPrivacyPolicyMessage =>
      'Sie müssen unsere Datenschutzerklärung akzeptieren';

  @override
  String get acceptTermsOfUseMessage =>
      'Sie müssen unsere Nutzungsbedingungen akzeptieren';

  @override
  String get inactiveUserAlreadyExists =>
      'Ein inaktiver Benutzer existiert bereits';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Ein Benutzer mit einer nicht verifizierten E-Mail-Adresse ist bereits registriert.\nKlicken Sie auf \'Erneut senden\', um die Verifizierungs-E-Mail erneut zu senden.';

  @override
  String get assignee => 'Zugewiesene Person';

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
  String get days => 'Tage';

  @override
  String get hours => 'Stunden';

  @override
  String get minutes => 'Minuten';

  @override
  String get seconds => 'Sekunden';

  @override
  String get viewDashboard => 'Dashboard anzeigen';

  @override
  String get activity => 'Aktivität';

  @override
  String get addCommentMessage => 'Einen Kommentar hinzufügen...';

  @override
  String get selectUser => 'Benutzer auswählen';

  @override
  String get assignedToMe => 'Mir zugewiesen';

  @override
  String get clear => 'Löschen';

  @override
  String get acknowledge => 'Bestätigen';

  @override
  String get edit => 'Bearbeiten';

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
  String get tryRefiningYourQuery => 'Bitte verfeinern Sie Ihre Suche';

  @override
  String get failedToLoadTheList => 'Liste konnte nicht geladen werden';

  @override
  String get tryRefreshing => 'Bitte versuchen Sie es mit Aktualisieren';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get users => 'Benutzer';

  @override
  String get unassigned => 'Nicht zugewiesen';

  @override
  String get failedToLoadAlarmDetails =>
      'Alarmdetails konnten nicht geladen werden';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get chooseRegion => 'Region auswählen';

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
    return 'Aktualisieren auf $version';
  }

  @override
  String popTitle(Object deviceName) {
    return 'Geben Sie die PIN von $deviceName ein, um den Besitznachweis zu bestätigen';
  }

  @override
  String get next => 'Weiter';

  @override
  String get confirmation => 'Bestätigung';

  @override
  String get bleHelpMessage =>
      'Um Ihr neues Gerät bereitzustellen, stellen Sie bitte sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet';

  @override
  String get wifiPassword => 'WLAN-Passwort';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Um die Einrichtung Ihres Geräts $deviceName fortzusetzen, geben Sie bitte die Zugangsdaten Ihres Netzwerks ein.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Passwort für $network eingeben';
  }

  @override
  String get deviceNotFoundMessage =>
      'Keine Geräte gefunden. Stellen Sie sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Sie haben nicht genügend Berechtigungen für \"$permissions\". Bitte erteilen Sie die erforderlichen Berechtigungen und tippen Sie auf \"Erneut versuchen\".';
  }

  @override
  String get sendingWifiCredentials => 'WLAN-Zugangsdaten werden gesendet';

  @override
  String get confirmingWifiConnection => 'WLAN-Verbindung wird bestätigt';

  @override
  String get provisionedSuccessfully =>
      'Gerät wurde erfolgreich bereitgestellt';

  @override
  String get returnToDashboard => 'Zurück zum Dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Sitzung mit Gerät $deviceName konnte nicht hergestellt werden. Bitte versuchen Sie es erneut';
  }

  @override
  String get claimingDevice => 'Gerät wird beansprucht';

  @override
  String get claimingDeviceDone => 'Gerätebeanspruchung abgeschlossen';

  @override
  String get claimingMessageSuccess => 'Gerät wurde\nerfolgreich beansprucht';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Sie haben nicht genügend Berechtigungen für \"$permissions\". Bitte öffnen Sie die App-Einstellungen, erteilen Sie die Berechtigungen und tippen Sie auf \"Erneut versuchen\".';
  }

  @override
  String get scanACode => 'Code scannen';

  @override
  String get allowAccess => 'Zugriff erlauben';

  @override
  String get toggleCamera => 'Kamera wechseln';

  @override
  String get toggleFlash => 'Blitz umschalten';

  @override
  String get unableToUseCamera => 'Kamera kann nicht verwendet werden';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Öffnen Sie die Einstellungen und gewähren Sie Kamerazugriff, um fortzufahren';

  @override
  String get notFound => 'Nicht gefunden';

  @override
  String routeNotDefined(Object name) {
    return 'Route nicht definiert: $name';
  }

  @override
  String get loginWith => 'Anmelden mit';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String get anEmptyRequestDataReceived => 'Leere Anfragedaten empfangen.';

  @override
  String get somethingWentWrongRollback =>
      'Etwas ist schiefgelaufen ... Zurücksetzen';

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
  String get alarmStatusList => 'Alarmstatusliste';

  @override
  String get alarmSeverityList => 'Alarm-Schweregradliste';

  @override
  String get cleared => 'Gelöscht';

  @override
  String get acknowledged => 'Bestätigt';

  @override
  String get unacknowledged => 'Unbestätigt';

  @override
  String get critical => 'Kritisch';

  @override
  String get major => 'Schwerwiegend';

  @override
  String get minor => 'Gering';

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
  String get update => 'Aktualisieren';

  @override
  String get alarmTypeList => 'Alarmtypenliste';

  @override
  String get anyType => 'Beliebiger Typ';

  @override
  String get plusAlarmType => '+ Alarmtyp';

  @override
  String get all => 'Alle';

  @override
  String get unread => 'Ungelesen';

  @override
  String get close => 'Schließen';

  @override
  String get codeVerificationFailed => 'Code-Verifizierung fehlgeschlagen!';

  @override
  String get fatalError => 'Schwerwiegender Fehler';

  @override
  String get unknownError => 'Unbekannter Fehler.';

  @override
  String get fatalApplicationErrorOccurred =>
      'Schwerwiegender Anwendungsfehler aufgetreten:';

  @override
  String get connectionError => 'Verbindungsfehler';

  @override
  String get failedToConnectToServer => 'Verbindung zum Server fehlgeschlagen';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Das mobile Dashboard sollte im Geräteprofil konfiguriert werden!';

  @override
  String get openWifiSettings => 'WLAN-Einstellungen öffnen';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Verbinden Sie sich mit dem WLAN, das Sie normalerweise verwenden';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Kehren Sie zur App zurück und tippen Sie auf Bereit';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Bitte folgen Sie den nächsten Schritten, um\nIhr Telefon wieder mit Ihrem WLAN zu verbinden';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-Benachrichtigungen sind nicht konfiguriert.\nBitte kontaktieren Sie Ihren Systemadministrator.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase ist nicht konfiguriert.\nBitte lesen Sie die offizielle Firebase-Dokumentation\nfür Anleitungen.';

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
  String get connectingToDevice => 'Verbinde mit Gerät';

  @override
  String get connectToDevice => 'Mit Gerät verbinden';

  @override
  String get selectWifiNetwork => 'WLAN-Netzwerk auswählen';

  @override
  String get deviceProvisioning => 'Gerätebereitstellung';

  @override
  String get permissions => 'Berechtigungen';

  @override
  String get unableConnectToDevice => 'Verbindung zum Gerät nicht möglich';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Gerät kann kein WLAN in der Nähe finden';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Verbindung zum WLAN-Netzwerk $name fehlgeschlagen.\nBitte stellen Sie sicher, dass Ihr Telefon mit dem Geräte-WLAN verbunden ist und der lokale Netzwerkzugriff für diese App aktiviert ist.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'WLAN-Verbindung nicht möglich, da das Gerät $name keine Netzwerke gefunden hat';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Bitte folgen Sie den nächsten Schritten, um Ihr Telefon mit dem Gerät zu verbinden';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Verbinden Sie sich mit einem WLAN ähnlich wie $wifiName';
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
  String get tenant => 'Mieter';

  @override
  String get tenantProfile => 'Mieterprofil';

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
  String get widgetsBundle => 'Widget-Paket';

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
  String get notificationTarget => 'Benachrichtigungsziel';

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
  String get schedulerEvent => 'Planer-Ereignis';

  @override
  String get blobEntity => 'Blob-Entität';

  @override
  String get role => 'Rolle';

  @override
  String get groupPermission => 'Gruppenberechtigung';

  @override
  String get actionStatusSuccess => 'Erfolg';

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
  String get actionTypeCredentialsUpdated => 'Anmeldedaten aktualisiert';

  @override
  String get actionTypeAssignedToCustomer => 'Kunde zugewiesen';

  @override
  String get actionTypeUnassignedFromCustomer => 'Kundenzuweisung aufgehoben';

  @override
  String get actionTypeActivated => 'Aktiviert';

  @override
  String get actionTypeSuspended => 'Gesperrt';

  @override
  String get actionTypeCredentialsRead => 'Anmeldedaten gelesen';

  @override
  String get actionTypeAttributesRead => 'Attribute gelesen';

  @override
  String get actionTypeRelationAddOrUpdate => 'Beziehung aktualisiert';

  @override
  String get actionTypeRelationDeleted => 'Beziehung gelöscht';

  @override
  String get actionTypeRelationsDeleted => 'Alle Beziehungen gelöscht';

  @override
  String get actionTypeAlarmAck => 'Bestätigt';

  @override
  String get actionTypeAlarmClear => 'Gelöscht';

  @override
  String get actionTypeAlarmDelete => 'Alarm gelöscht';

  @override
  String get actionTypeAlarmAssigned => 'Alarm zugewiesen';

  @override
  String get actionTypeAlarmUnassigned => 'Alarmzuweisung aufgehoben';

  @override
  String get actionTypeLogin => 'Anmeldung';

  @override
  String get actionTypeLogout => 'Abmeldung';

  @override
  String get actionTypeLockout => 'Gesperrt';

  @override
  String get actionTypeAssignedFromTenant => 'Vom Mieter zugewiesen';

  @override
  String get actionTypeAssignedToTenant => 'Dem Mieter zugewiesen';

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
  String get actionTypeUnassignedFromEdge => 'Edge-Zuweisung aufgehoben';

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
  String get actionTypeRestApiRuleEngineCall => 'REST-API-Regelengine-Aufruf';

  @override
  String get actionTypeMadePublic => 'Öffentlich gemacht';

  @override
  String get actionTypeMadePrivate => 'Privat gemacht';

  @override
  String get actionTypeChangeOwner => 'Eigentümer geändert';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Sie haben keine Berechtigungen, um diesen Vorgang auszuführen!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Es sieht so aus, als ob Ihre Berechtigungen nicht ausreichen, um diesen Vorgang abzuschließen';

  @override
  String get isRequiredText => 'ist erforderlich.';

  @override
  String get no2faProvidersFound => 'Keine 2FA-Anbieter gefunden';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Bitte kontaktieren Sie Ihren Systemadministrator';

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
  String get autoUnitSystem => 'Auto';

  @override
  String get unitSystem => 'Einheitensystem';

  @override
  String get selectCountry => 'Land auswählen';

  @override
  String get hideHomeDashboardToolbar =>
      'Home-Dashboard-Symbolleiste ausblenden';

  @override
  String get phoneNumberHelperText =>
      'Telefonnummer im E.164-Format, z.B. +1201550123';

  @override
  String get homeDashboard => 'Home-Dashboard';

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
      'Richten Sie eine Verifizierungsmethode ein, um mit Ihrer Anmeldung fortzufahren';

  @override
  String get setUpAVerificationMethod => 'Verifizierungsmethode einrichten';

  @override
  String get totpSetupSuccessDescription =>
      'Bei der nächsten Anmeldung müssen Sie einen Zwei-Faktor-Authentifizierungscode eingeben';

  @override
  String get smsSetupSuccessDescription =>
      'Bei der nächsten Anmeldung werden Sie aufgefordert, den Sicherheitscode einzugeben, der an die Telefonnummer gesendet wird';

  @override
  String get emailSetupSuccessDescription =>
      'Bei der nächsten Anmeldung werden Sie aufgefordert, den Sicherheitscode einzugeben, der an Ihre E-Mail-Adresse gesendet wird';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Bei der nächsten Anmeldung können Sie Backup-Codes für die Zwei-Faktor-Authentifizierung verwenden';

  @override
  String get loginToApp => 'In App anmelden';

  @override
  String get goBack => 'Zurück';

  @override
  String get done => 'Fertig';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Dies macht Ihr Konto weniger sicher';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Möchten Sie $providerName wirklich deaktivieren?';
  }

  @override
  String get yesDeactivate => 'Ja, deaktivieren';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Geben Sie eine E-Mail-Adresse als Authentifikator ein.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Geben Sie eine Telefonnummer als Authentifikator ein';

  @override
  String get sendCode => 'Code senden';

  @override
  String errorSendingCode(String error) {
    return 'Fehler beim Senden des Codes: $error';
  }

  @override
  String get copy => 'Kopieren';

  @override
  String get copiedToClipboard => 'In Zwischenablage kopiert';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Geben Sie den 6-stelligen Code aus Ihrer App ein:';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'stelliger',
      one: 'stelliger',
    );
    return '$count-$_temp0 Code';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Kopieren Sie den 32-stelligen Schlüssel in Ihre Authentifizierungs-App oder scannen Sie den QR-Code unten';

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
      'Die Zwei-Faktor-Authentifizierung schützt Ihr Konto vor unbefugtem Zugriff. Sie müssen nur einen Sicherheitscode eingeben, wenn Sie sich anmelden.';

  @override
  String get cantDeleteUserAccount => 'Can\\\'t delete user account';

  @override
  String get calculatedField => 'Berechnetes Feld';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get aiModel => 'KI-Modell';

  @override
  String get adminSettings => 'Admin-Einstellungen';

  @override
  String get job => 'Job';

  @override
  String get mobileAppBundle => 'Mobile App-Paket';

  @override
  String get mobileApp => 'Mobile App';

  @override
  String get domain => 'Domäne';

  @override
  String get oauth2Client => 'OAuth2-Client';

  @override
  String get queueStats => 'Warteschlangenstatistik';

  @override
  String get phoneIsRequired => 'Telefon ist erforderlich';

  @override
  String get phoneIsInvalid => 'Telefonnummer ist ungültig';

  @override
  String get addVerificationMethod => 'Verifizierungsmethode hinzufügen';

  @override
  String get imageSavedToGallery => 'In \'Bildergalerie\' gespeichert';

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
  String get liveTrackingActive => 'Live location tracking';

  @override
  String get liveTrackingPaused => 'Live tracking paused';

  @override
  String get liveTrackingFixes => 'Fixes';

  @override
  String get liveTrackingSaved => 'Saved';

  @override
  String get liveTrackingErrors => 'Errors';

  @override
  String get liveTrackingStop => 'Stop';

  @override
  String get liveTrackingPause => 'Pause';

  @override
  String get liveTrackingResume => 'Resume';

  @override
  String get liveTrackingHide => 'Hide';

  @override
  String get liveTrackingSessionTitle => 'Live location tracking';

  @override
  String get liveTrackingTarget => 'Save location to entity';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Start time';

  @override
  String get liveTrackingLastFix => 'Last fix';

  @override
  String get liveTrackingLastError => 'Last error';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Can\'t save to this entity — it no longer exists. Tracking continues; update the target in the dashboard action.';

  @override
  String get liveTrackingErrorNoConnection =>
      'No connection to the server. These fixes weren\'t saved — saving resumes when you\'re back online.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Your session ended. Sign in again to keep saving location.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Can\'t save to this entity — you don\'t have permission. Tracking continues; ask your administrator to grant access.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Couldn\'t save this fix to the server. Saving retries with the next fix.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Location services are turned off on this device.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Location permission was denied.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Location permission is permanently denied. Enable it in the app settings.';

  @override
  String get liveTrackingErrorLocation => 'Couldn\'t get a location fix.';

  @override
  String get liveTrackingMenuTitle => 'Live location tracking';

  @override
  String get liveTrackingNoRecord =>
      'No active tracking and no recent session.';

  @override
  String get liveTrackingLastSession => 'Last session';

  @override
  String get liveTrackingStartAgain => 'Start again';

  @override
  String get liveTrackingEnded => 'End time';

  @override
  String get liveTrackingEndReason => 'End reason';

  @override
  String get liveTrackingEndReasonManual => 'Stopped manually';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Reached max duration';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrupted';

  @override
  String get serverUpdateRequired => 'Server-Update erforderlich';

  @override
  String get backToLogin => 'Zurück zur Anmeldung';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Diese App funktioniert mit ThingsBoard $minVersion oder neuer.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Bitten Sie Ihren Serveradministrator, den Server zu aktualisieren.';
}

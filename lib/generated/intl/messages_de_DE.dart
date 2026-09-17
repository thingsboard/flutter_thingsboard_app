// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de_DE';

  static String m0(appTitle) =>
      "Herzlichen Glückwunsch!\nIhr ${appTitle}-Konto wurde aktiviert.\nSie können sich jetzt in Ihrem ${appTitle}-Bereich anmelden.";

  static String m1(authority) =>
      "Sind Sie sicher? Sie werden Ihr ${authority}-Konto löschen.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarme')}";

  static String m3(providerName) =>
      "Möchten Sie ${providerName} wirklich deaktivieren?";

  static String m4(deviceName) =>
      "Sitzung mit Gerät ${deviceName} konnte nicht hergestellt werden. Bitte versuchen Sie es erneut";

  static String m5(link) => "URL kann nicht geöffnet werden: ${link}";

  static String m6(wifiName) =>
      "Verbinden Sie sich mit einem WLAN ähnlich wie ${wifiName}";

  static String m7(name) =>
      "Verbindung zum WLAN-Netzwerk ${name} fehlgeschlagen.\nBitte stellen Sie sicher, dass Ihr Telefon mit dem Geräte-WLAN verbunden ist und der lokale Netzwerkzugriff für diese App aktiviert ist.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '1 Benachrichtigung löschen?', other: '${count} Benachrichtigungen löschen?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Gerät', other: 'Geräte')}";

  static String m11(count) =>
      "${count}-${Intl.plural(count, one: 'stelliger', other: 'stelliger')} Code";

  static String m12(contact) =>
      "Ein Sicherheitscode wurde an Ihre E-Mail-Adresse unter ${contact} gesendet.";

  static String m13(e) => "Fehler aufgetreten: ${e}";

  static String m14(error) => "Fehler beim Senden des Codes: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 Vorgang fehlgeschlagen', other: '${count} Vorgänge fehlgeschlagen')}";

  static String m16(count) =>
      "${Intl.plural(count, one: '1 Benachrichtigung als gelesen markieren?', other: '${count} Benachrichtigungen als gelesen markieren?')}";

  static String m17(count) => "${count} ausgewählt";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Benachrichtigung', other: 'Benachrichtigungen')}";

  static String m19(permissions) =>
      "Sie haben nicht genügend Berechtigungen für \"${permissions}\". Bitte öffnen Sie die App-Einstellungen, erteilen Sie die Berechtigungen und tippen Sie auf \"Erneut versuchen\".";

  static String m20(permissions) =>
      "Sie haben nicht genügend Berechtigungen für \"${permissions}\". Bitte erteilen Sie die erforderlichen Berechtigungen und tippen Sie auf \"Erneut versuchen\".";

  static String m21(deviceName) =>
      "Geben Sie die PIN von ${deviceName} ein, um den Besitznachweis zu bestätigen";

  static String m22(time) =>
      "Code erneut senden in ${Intl.plural(time, one: '1 Sekunde', other: '${time} Sekunden')}";

  static String m23(name) => "Route nicht definiert: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Benutzer suchen', other: 'Benutzer suchen')}";

  static String m25(contact) =>
      "Ein Sicherheitscode wurde an Ihr Telefon unter ${contact} gesendet.";

  static String m26(name) =>
      "WLAN-Verbindung nicht möglich, da das Gerät ${name} keine Netzwerke gefunden hat";

  static String m27(version) => "Aktualisieren auf ${version}";

  static String m28(deviceName) =>
      "Um die Einrichtung Ihres Geräts ${deviceName} fortzusetzen, geben Sie bitte die Zugangsdaten Ihres Netzwerks ein.";

  static String m29(network) => "Passwort für ${network} eingeben";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Akzeptieren"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Sie müssen unsere Datenschutzerklärung akzeptieren",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Sie müssen unsere Nutzungsbedingungen akzeptieren",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Konto erfolgreich aktiviert!",
    ),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bestätigen"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Bestätigt"),
    "actionData": MessageLookupByLibrary.simpleMessage("Aktionsdaten"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage(
      "Fehlgeschlagen",
    ),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Erfolg"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Aktiviert"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Hinzugefügt"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar hinzugefügt",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Bestätigt"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm zugewiesen",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Gelöscht"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm gelöscht",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarmzuweisung aufgehoben",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Vom Mieter zugewiesen",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Kunde zugewiesen",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Edge zugewiesen",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Dem Mieter zugewiesen",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attribute gelöscht",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attribute gelesen",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attribute aktualisiert",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Anmeldedaten gelesen",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Anmeldedaten aktualisiert",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Gelöscht"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar gelöscht",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Gesperrt"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Anmeldung"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Abmeldung"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Gerätebereitstellung fehlgeschlagen",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Gerät bereitgestellt",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Beziehung aktualisiert",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Beziehung gelöscht",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Alle Beziehungen gelöscht",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC-Aufruf"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS gesendet"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Gesperrt"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetrie gelöscht",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetrie aktualisiert",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Kundenzuweisung aufgehoben",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Edge-Zuweisung aufgehoben",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Aktualisiert"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar aktualisiert",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Konto wird aktiviert...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Ihr Konto wird derzeit aktiviert.\nBitte warten...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Aktiv"),
    "activity": MessageLookupByLibrary.simpleMessage("Aktivität"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Einen Kommentar hinzufügen...",
    ),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Verifizierungsmethode hinzufügen",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Admin-Einstellungen",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("KI-Modell"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Sind Sie sicher, dass Sie den Alarm bestätigen möchten?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Alarm bestätigen",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Sind Sie sicher, dass Sie den Alarm löschen möchten?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Alarm löschen"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Alarm-Schweregradliste",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("Alarmstatusliste"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarmtypenliste"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtypen"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Alle"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle Geräte"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Zugriff erlauben"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Sie haben bereits ein Konto?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Leere Anfragedaten empfangen.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Beliebiger Typ"),
    "apiKey": MessageLookupByLibrary.simpleMessage("API-Schlüssel"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API-Nutzungsstatus"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage(
      "Änderungen übernehmen",
    ),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Sind Sie sicher?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("Asset-Name"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Asset-Profil"),
    "assets": MessageLookupByLibrary.simpleMessage("Assets"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Dem Kunden zugewiesen",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Mir zugewiesen"),
    "assignee": MessageLookupByLibrary.simpleMessage("Zugewiesene Person"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Details des Prüfprotokolls",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Prüfprotokolle"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie einen Ihrer Backup-Codes ein.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Backup-Code",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Bei der nächsten Anmeldung können Sie Backup-Codes für die Zwei-Faktor-Authentifizierung verwenden",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Um Ihr neues Gerät bereitzustellen, stellen Sie bitte sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Berechnetes Feld"),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("Passwort ändern"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Region auswählen"),
    "city": MessageLookupByLibrary.simpleMessage("Stadt"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage(
      "Gerät wird beansprucht",
    ),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Gerätebeanspruchung abgeschlossen",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Gerät wurde\nerfolgreich beansprucht",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Löschen"),
    "cleared": MessageLookupByLibrary.simpleMessage("Gelöscht"),
    "close": MessageLookupByLibrary.simpleMessage("Schließen"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Code-Verifizierung fehlgeschlagen!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Sie müssen bestätigen, dass Sie kein Roboter sind",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bestätigung"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "WLAN-Verbindung wird bestätigt",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Mit Gerät verbinden",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Verbinden Sie sich mit dem WLAN, das Sie normalerweise verwenden",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Verbinde mit Gerät",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Verbindungsfehler",
    ),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Fortfahren"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "In Zwischenablage kopiert",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Kopieren"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Kopieren Sie den 32-stelligen Schlüssel in Ihre Authentifizierungs-App oder scannen Sie den QR-Code unten",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Konto erstellen"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Passwort erstellen",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Kritisch"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Aktuelles Passwort",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Aktuelles Passwort ist erforderlich.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Kunde"),
    "customers": MessageLookupByLibrary.simpleMessage("Kunden"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("Tage"),
    "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Konto löschen"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Kommentar löschen"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Geräteliste"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Gerät kann kein WLAN in der Nähe finden",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Keine Geräte gefunden. Stellen Sie sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Geräteprofil"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Gerätebereitstellung",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage(
      "Änderungen verwerfen",
    ),
    "domain": MessageLookupByLibrary.simpleMessage("Domäne"),
    "done": MessageLookupByLibrary.simpleMessage("Fertig"),
    "duration": MessageLookupByLibrary.simpleMessage("Dauer"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Bearbeiten"),
    "edited": MessageLookupByLibrary.simpleMessage("Bearbeitet"),
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-Mail-Code"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ungültiges E-Mail-Format.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-Mail ist erforderlich.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Bei der nächsten Anmeldung werden Sie aufgefordert, den Sicherheitscode einzugeben, der an Ihre E-Mail-Adresse gesendet wird",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "E-Mail-Verifizierung",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Bitte folgen Sie den Anweisungen in der E-Mail, um die Registrierung abzuschließen. Hinweis: Wenn Sie die E-Mail nicht finden können, überprüfen Sie bitte Ihren Spam-Ordner oder klicken Sie auf \'Erneut senden\', um die E-Mail erneut zu versenden.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Eine E-Mail mit Verifizierungsinformationen wurde an die angegebene E-Mail-Adresse gesendet",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("E-Mail verifiziert"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Geben Sie den 6-stelligen Code aus Ihrer App ein:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Geben Sie eine Telefonnummer als Authentifikator ein",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Geben Sie eine E-Mail-Adresse als Authentifikator ein.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Entitätstyp"),
    "entityView": MessageLookupByLibrary.simpleMessage("Entitätsansicht"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Gerätebereitstellung beenden",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Verbindung zum Server fehlgeschlagen",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Alarmdetails konnten nicht geladen werden",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Liste konnte nicht geladen werden",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("Fehlerdetails"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Schwerwiegender Anwendungsfehler aufgetreten:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage(
      "Schwerwiegender Fehler",
    ),
    "filters": MessageLookupByLibrary.simpleMessage("Filter"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase ist nicht konfiguriert.\nBitte lesen Sie die offizielle Firebase-Dokumentation\nfür Anleitungen.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Vorname"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Vorname ist erforderlich.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Vorname"),
    "goBack": MessageLookupByLibrary.simpleMessage("Zurück"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Home-Dashboard-Symbolleiste ausblenden",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Startseite"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Home-Dashboard"),
    "hours": MessageLookupByLibrary.simpleMessage("Stunden"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybrid"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Ich bin kein Roboter"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperial"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Ein inaktiver Benutzer existiert bereits",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Ein Benutzer mit einer nicht verifizierten E-Mail-Adresse ist bereits registriert.\nKlicken Sie auf \'Erneut senden\', um die Verifizierungs-E-Mail erneut zu senden.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Unbestimmt"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Ihr Passwort muss mindestens 6 Zeichen lang sein",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("ist erforderlich."),
    "job": MessageLookupByLibrary.simpleMessage("Job"),
    "label": MessageLookupByLibrary.simpleMessage("Bezeichnung"),
    "language": MessageLookupByLibrary.simpleMessage("Sprache"),
    "lastName": MessageLookupByLibrary.simpleMessage("Nachname"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Nachname ist erforderlich.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Nachname"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Die Liste ist derzeit leer.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("In App anmelden"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Melden Sie sich bei Ihrem Konto an",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Anmelden mit"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Abmelden"),
    "major": MessageLookupByLibrary.simpleMessage("Schwerwiegend"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Alle als gelesen markieren",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Als gelesen markieren"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metrisch"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Backup-Code",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authentifizierungs-App",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Gering"),
    "minutes": MessageLookupByLibrary.simpleMessage("Minuten"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobile App"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage("Mobile App-Paket"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Das mobile Dashboard sollte im Geräteprofil konfiguriert werden!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Mehr"),
    "nSelected": m17,
    "newPassword": MessageLookupByLibrary.simpleMessage("Neues Passwort"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Neues Passwort bestätigen",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Neues Passwort (erneut) ist erforderlich.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Neues Passwort ist erforderlich.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Neuer Benutzer?"),
    "next": MessageLookupByLibrary.simpleMessage("Weiter"),
    "no": MessageLookupByLibrary.simpleMessage("Nein"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Keine 2FA-Anbieter gefunden",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Alarme gefunden",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Dashboards gefunden",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Benachrichtigungen gefunden",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Ergebnisse gefunden",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nordamerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Nicht gefunden"),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Nicht implementiert!",
    ),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungsanfrage",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungsregel",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungsziel",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Benachrichtigungsvorlage",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("OAuth2-Client"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "App-Einstellungen öffnen",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Öffnen Sie die Einstellungen und gewähren Sie Kamerazugriff, um fortzufahren",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "WLAN-Einstellungen öffnen",
    ),
    "or": MessageLookupByLibrary.simpleMessage("ODER"),
    "originator": MessageLookupByLibrary.simpleMessage("Ursprung"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA-Paket"),
    "password": MessageLookupByLibrary.simpleMessage("Passwort"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Die eingegebenen Passwörter müssen übereinstimmen!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Passwort vergessen?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Passwort ist erforderlich.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Passwort zurücksetzen",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Link zum Zurücksetzen des Passworts wurde erfolgreich gesendet!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen des Passworts",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Passwort erfolgreich geändert",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Berechtigungen"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer ist ungültig",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Telefon ist erforderlich",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer im E.164-Format, z.B. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Bitte kontaktieren Sie Ihren Systemadministrator",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Bitte folgen Sie den nächsten Schritten, um Ihr Telefon mit dem Gerät zu verbinden",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Bitte folgen Sie den nächsten Schritten, um\nIhr Telefon wieder mit Ihrem WLAN zu verbinden",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Bitte scannen Sie den QR-Code auf Ihrem Gerät",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarmtyp"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("PLZ / Postleitzahl"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Datenschutzerklärung",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profil erfolgreich aktualisiert",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Gerät wurde erfolgreich bereitgestellt",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push-Benachrichtigungen sind nicht konfiguriert.\nBitte kontaktieren Sie Ihren Systemadministrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Warteschlange"),
    "queueStats": MessageLookupByLibrary.simpleMessage(
      "Warteschlangenstatistik",
    ),
    "ready": MessageLookupByLibrary.simpleMessage("Bereit"),
    "refresh": MessageLookupByLibrary.simpleMessage("Aktualisieren"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Passwort wiederholen",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Passwortzurücksetzung anfordern",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "Angeforderte Entität existiert nicht.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Erneut senden"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Code erneut senden"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
    "retry": MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Zurück zum Dashboard",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Kehren Sie zur App zurück und tippen Sie auf Bereit",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Regelkette"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Regelknoten"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Code scannen"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("QR-Code scannen"),
    "search": MessageLookupByLibrary.simpleMessage("Suchen"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Suchergebnisse"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("Sekunden"),
    "security": MessageLookupByLibrary.simpleMessage("Sicherheit"),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "Alle geladenen auswählen",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Land auswählen"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Region auswählen"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Benutzer auswählen"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Wählen Sie eine Methode zur Verifizierung",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "WLAN-Netzwerk auswählen",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Code senden"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "WLAN-Zugangsdaten werden gesendet",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Verifizierungsmethode einrichten",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Richten Sie eine Verifizierungsmethode ein, um mit Ihrer Anmeldung fortzufahren",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Schweregrad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrieren"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-Code"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Bei der nächsten Anmeldung werden Sie aufgefordert, den Sicherheitscode einzugeben, der an die Telefonnummer gesendet wird",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Etwas ist schiefgelaufen",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Etwas ist schiefgelaufen ... Zurücksetzen",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Startzeit"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Bundesland / Provinz",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Ressource"),
    "tenant": MessageLookupByLibrary.simpleMessage("Mieter"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Mieteradministrator",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Mieterprofil"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Nutzungsbedingungen"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Diese Aktion kann nicht rückgängig gemacht werden",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Dies macht Ihr Konto weniger sicher",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Kamera wechseln"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Blitz umschalten"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie den Sicherheitscode aus Ihrer Authentifizierungs-App ein.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Bei der nächsten Anmeldung müssen Sie einen Zwei-Faktor-Authentifizierungscode eingeben",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Andere Methode versuchen",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Bitte verfeinern Sie Ihre Suche",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Bitte versuchen Sie es mit Aktualisieren",
    ),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Zwei-Faktor-Authentifizierung",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Zwei-Faktor-Authentifizierung ist erforderlich",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "Die Zwei-Faktor-Authentifizierung schützt Ihr Konto vor unbefugtem Zugriff. Sie müssen nur einen Sicherheitscode eingeben, wenn Sie sich anmelden.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Typ"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Verbindung zum Gerät nicht möglich",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Kamera kann nicht verwendet werden",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Unbestätigt"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Nicht zugewiesen"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Einheitensystem"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unbekannter Fehler."),
    "unread": MessageLookupByLibrary.simpleMessage("Ungelesen"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Ungespeicherte Änderungen",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Aktualisieren"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Aktualisierung erforderlich",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Benutzer"),
    "username": MessageLookupByLibrary.simpleMessage("Benutzername"),
    "users": MessageLookupByLibrary.simpleMessage("Benutzer"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Verifizierungscode ist falsch",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Ungültiges Format des Verifizierungscodes",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Zu viele Anfragen. Verifizierungscode überprüfen",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verifizierung erforderlich",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bestätigen Sie Ihre Identität",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Alle anzeigen"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Dashboard anzeigen"),
    "warning": MessageLookupByLibrary.simpleMessage("Warnung"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widget-Typ"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widget-Paket"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("WLAN-Passwort"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Ja, deaktivieren"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Ja, verwerfen"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Sie haben ungespeicherte Änderungen. Möchten Sie diese Seite wirklich verlassen?",
        ),
  };
}

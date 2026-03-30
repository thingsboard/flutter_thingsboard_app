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

  static String m2(count) => "Alarme";

  static String m4(deviceName) =>
      "Sitzung mit Gerät ${deviceName} konnte nicht hergestellt werden. Bitte versuchen Sie es erneut";

  static String m8(count) => "Dashboards";

  static String m9(count) => "Geräte";

  static String m11(contact) =>
      "Ein Sicherheitscode wurde an Ihre E-Mail-Adresse unter ${contact} gesendet.";

  static String m13(count) => "Benachrichtigungen";

  static String m14(permissions) =>
      "Sie haben nicht genügend Berechtigungen für \"${permissions}\". Bitte öffnen Sie die App-Einstellungen, erteilen Sie die Berechtigungen und tippen Sie auf \"Erneut versuchen\".";

  static String m15(permissions) =>
      "Sie haben nicht genügend Berechtigungen für \"${permissions}\". Bitte erteilen Sie die erforderlichen Berechtigungen und tippen Sie auf \"Erneut versuchen\".";

  static String m16(deviceName) =>
      "Geben Sie die PIN von ${deviceName} ein, um den Besitznachweis zu bestätigen";

  static String m17(time) =>
      "Code erneut senden in ${Intl.plural(time, one: '1 Sekunde', other: '${time} Sekunden')}";

  static String m20(contact) =>
      "Ein Sicherheitscode wurde an Ihr Telefon unter ${contact} gesendet.";

  static String m22(version) => "Aktualisieren auf ${version}";

  static String m23(deviceName) =>
      "Um die Einrichtung Ihres Geräts ${deviceName} fortzusetzen, geben Sie bitte die Zugangsdaten Ihres Netzwerks ein.";

  static String m24(network) => "Passwort für ${network} eingeben";

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
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bestätigen"),
    "actionData": MessageLookupByLibrary.simpleMessage("Aktionsdaten"),
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
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
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
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtypen"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle Geräte"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Sie haben bereits ein Konto?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Sind Sie sicher?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Asset-Name"),
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
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie einen Ihrer Backup-Codes ein.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Backup-Code",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Um Ihr neues Gerät bereitzustellen, stellen Sie bitte sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "cannotEstablishSession": m4,
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
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Sie müssen bestätigen, dass Sie kein Roboter sind",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bestätigung"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "WLAN-Verbindung wird bestätigt",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Fortfahren"),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Konto erstellen"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Passwort erstellen",
    ),
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
    "deleteComment": MessageLookupByLibrary.simpleMessage("Kommentar löschen"),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Geräteliste"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Keine Geräte gefunden. Stellen Sie sicher, dass das Bluetooth Ihres Telefons eingeschaltet ist und sich in Reichweite Ihres neuen Geräts befindet.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Dauer"),
    "edit": MessageLookupByLibrary.simpleMessage("Bearbeiten"),
    "edited": MessageLookupByLibrary.simpleMessage("Bearbeitet"),
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-Mail-Code"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ungültiges E-Mail-Format.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-Mail ist erforderlich.",
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
    "entityType": MessageLookupByLibrary.simpleMessage("Entitätstyp"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Alarmdetails konnten nicht geladen werden",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Liste konnte nicht geladen werden",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Fehlerdetails"),
    "firstName": MessageLookupByLibrary.simpleMessage("Vorname"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Vorname ist erforderlich.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Vorname"),
    "home": MessageLookupByLibrary.simpleMessage("Startseite"),
    "hours": MessageLookupByLibrary.simpleMessage("Stunden"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Ich bin kein Roboter"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Ein inaktiver Benutzer existiert bereits",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Ein Benutzer mit einer nicht verifizierten E-Mail-Adresse ist bereits registriert.\nKlicken Sie auf \'Erneut senden\', um die Verifizierungs-E-Mail erneut zu senden.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Ihr Passwort muss mindestens 6 Zeichen lang sein",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Bezeichnung"),
    "lastName": MessageLookupByLibrary.simpleMessage("Nachname"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Nachname ist erforderlich.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Nachname"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Die Liste ist derzeit leer.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Abmelden"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Backup-Code",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authentifizierungs-App",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("Minuten"),
    "more": MessageLookupByLibrary.simpleMessage("Mehr"),
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
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Keine Ergebnisse gefunden",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nordamerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Nicht implementiert!",
    ),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("ODER"),
    "originator": MessageLookupByLibrary.simpleMessage("Ursprung"),
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
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("PLZ / Postleitzahl"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Datenschutzerklärung",
    ),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profil erfolgreich aktualisiert",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Gerät wurde erfolgreich bereitgestellt",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Aktualisieren"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Passwort wiederholen",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Passwortzurücksetzung anfordern",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Erneut senden"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Code erneut senden"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Zurück zum Dashboard",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("Sekunden"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Region auswählen"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Benutzer auswählen"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Wählen Sie eine Methode zur Verifizierung",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "WLAN-Zugangsdaten werden gesendet",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Schweregrad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrieren"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-Code"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Etwas ist schiefgelaufen",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Startzeit"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Bundesland / Provinz",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Mieteradministrator",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Nutzungsbedingungen"),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie den Sicherheitscode aus Ihrer Authentifizierungs-App ein.",
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
    "type": MessageLookupByLibrary.simpleMessage("Typ"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Nicht zugewiesen"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Aktualisierung erforderlich",
    ),
    "updateTo": m22,
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
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bestätigen Sie Ihre Identität",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Dashboard anzeigen"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("WLAN-Passwort"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
  };
}

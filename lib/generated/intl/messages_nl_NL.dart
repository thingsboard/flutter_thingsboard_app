// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl_NL locale. All the
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
  String get localeName => 'nl_NL';

  static String m0(appTitle) =>
      "Gefeliciteerd!\nUw ${appTitle}-account is geactiveerd.\nU kunt nu inloggen op uw ${appTitle}-omgeving.";

  static String m2(count) => "Alarmen";

  static String m4(deviceName) =>
      "Kan geen sessie tot stand brengen met apparaat ${deviceName}. Probeer het opnieuw";

  static String m8(count) => "Dashboards";

  static String m9(count) => "Apparaten";

  static String m11(contact) =>
      "Er is een beveiligingscode verzonden naar uw e-mailadres op ${contact}.";

  static String m13(count) => "Meldingen";

  static String m14(permissions) =>
      "U heeft onvoldoende rechten voor \"${permissions}\" om door te gaan. Open de app-instellingen, verleen de rechten en tik op \"Opnieuw proberen\".";

  static String m15(permissions) =>
      "U heeft onvoldoende rechten voor \"${permissions}\" om door te gaan. Verleen de vereiste rechten en tik op \"Opnieuw proberen\".";

  static String m16(deviceName) =>
      "Voer de pincode van ${deviceName} in om eigendomsbewijs te bevestigen";

  static String m17(time) =>
      "Code opnieuw verzenden in ${Intl.plural(time, one: '1 seconde', other: '${time} seconden')}";

  static String m20(contact) =>
      "Er is een beveiligingscode verzonden naar uw telefoon op ${contact}.";

  static String m22(version) => "Updaten naar ${version}";

  static String m23(deviceName) =>
      "Om de installatie van uw apparaat ${deviceName} voort te zetten, geef de netwerkgegevens op.";

  static String m24(network) => "Voer het wachtwoord in voor ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accepteren"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "U moet ons privacybeleid accepteren",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "U moet onze gebruiksvoorwaarden accepteren",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Account succesvol geactiveerd!",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bevestigen"),
    "actionData": MessageLookupByLibrary.simpleMessage("Actiegegevens"),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Account activeren...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Uw account wordt momenteel geactiveerd.\nEven geduld alstublieft...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Actief"),
    "activity": MessageLookupByLibrary.simpleMessage("Activiteit"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Voeg een opmerking toe...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adres"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresregel 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Weet u zeker dat u het alarm wilt bevestigen?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Alarm bevestigen",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Weet u zeker dat u het alarm wilt wissen?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Alarm wissen"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtypes"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle apparaten"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Heeft u al een account?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Weet u het zeker?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Assetnaam"),
    "assets": MessageLookupByLibrary.simpleMessage("Assets"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Toegewezen aan klant",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Aan mij toegewezen"),
    "assignee": MessageLookupByLibrary.simpleMessage("Toegewezene"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Details auditlogboek",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Auditlogboeken"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Voer een van uw back-upcodes in.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Back-upcode",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Om uw nieuwe apparaat te provisioneren, zorg ervoor dat Bluetooth op uw telefoon is ingeschakeld en dat u zich binnen bereik van uw nieuwe apparaat bevindt",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuleren"),
    "cannotEstablishSession": m4,
    "changePassword": MessageLookupByLibrary.simpleMessage(
      "Wachtwoord wijzigen",
    ),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Kies regio"),
    "city": MessageLookupByLibrary.simpleMessage("Stad"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("Apparaat claimen"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Claimen van apparaat voltooid",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Apparaat is\nsuccesvol geclaimd",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Wissen"),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "U moet bevestigen dat u geen robot bent",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bevestiging"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-verbinding bevestigen",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Doorgaan"),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Account aanmaken"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Maak een wachtwoord aan",
    ),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Huidig wachtwoord",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Huidig wachtwoord is verplicht.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Klant"),
    "customers": MessageLookupByLibrary.simpleMessage("Klanten"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("dagen"),
    "delete": MessageLookupByLibrary.simpleMessage("Verwijderen"),
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Opmerking verwijderen",
    ),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Apparatenlijst"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Apparaten niet gevonden. Zorg ervoor dat Bluetooth op uw telefoon is ingeschakeld en dat u zich binnen bereik van uw nieuwe apparaat bevindt.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Duur"),
    "edit": MessageLookupByLibrary.simpleMessage("Bewerken"),
    "edited": MessageLookupByLibrary.simpleMessage("Bewerkt"),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-mailcode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ongeldig e-mailformaat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-mail is verplicht.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "E-mailverificatie",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Volg de instructies in de e-mail om uw registratie te voltooien. Let op: als u de e-mail niet ziet, controleer dan uw \'spam\'-map of probeer de e-mail opnieuw te verzenden door op de knop \'Opnieuw verzenden\' te klikken.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Er is een e-mail met verificatiedetails verzonden naar het opgegeven e-mailadres",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage(
      "E-mail geverifieerd",
    ),
    "entityType": MessageLookupByLibrary.simpleMessage("Entiteitstype"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Details van alarm laden mislukt",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Laden van de lijst mislukt",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Foutdetails"),
    "firstName": MessageLookupByLibrary.simpleMessage("Voornaam"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Voornaam is verplicht.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Voornaam"),
    "home": MessageLookupByLibrary.simpleMessage("Startpagina"),
    "hours": MessageLookupByLibrary.simpleMessage("uren"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Ik ben geen robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactief"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inactieve gebruiker bestaat al",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Er is al een geregistreerde gebruiker met een niet-geverifieerd e-mailadres.\nKlik op de knop \'Opnieuw verzenden\' als u de verificatie-e-mail opnieuw wilt verzenden.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Uw wachtwoord moet minimaal 6 tekens lang zijn",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Label"),
    "lastName": MessageLookupByLibrary.simpleMessage("Achternaam"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Achternaam is verplicht.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Achternaam"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "De lijst is momenteel leeg.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Inloggen"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Uitloggen"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Back-upcode",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-mail"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authenticator-app",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minuten"),
    "more": MessageLookupByLibrary.simpleMessage("Meer"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nieuw wachtwoord"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Bevestig nieuw wachtwoord",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Nieuw wachtwoord opnieuw is verplicht.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Nieuw wachtwoord is verplicht.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Nieuwe gebruiker?"),
    "next": MessageLookupByLibrary.simpleMessage("Volgende"),
    "no": MessageLookupByLibrary.simpleMessage("Nee"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Geen resultaten gevonden",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Noord-Amerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Niet geïmplementeerd!",
    ),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("OF"),
    "originator": MessageLookupByLibrary.simpleMessage("Oorsprong"),
    "password": MessageLookupByLibrary.simpleMessage("Wachtwoord"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "De ingevoerde wachtwoorden moeten hetzelfde zijn!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Wachtwoord vergeten?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Wachtwoord is verplicht.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Wachtwoord herstellen",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Wachtwoordherstellink is succesvol verzonden!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Voer het e-mailadres in dat aan uw account is gekoppeld en we sturen een e-mail met een link om uw wachtwoord te herstellen",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Wachtwoord succesvol gewijzigd",
    ),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Telefoon"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postcode"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacybeleid"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profiel succesvol bijgewerkt",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Apparaat is succesvol geprovisioneerd",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Verversen"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Herhaal uw wachtwoord",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Wachtwoordherstel aanvragen",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Opnieuw verzenden"),
    "resendCode": MessageLookupByLibrary.simpleMessage(
      "Code opnieuw verzenden",
    ),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Terug naar dashboard",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("seconden"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Selecteer regio"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Gebruikers selecteren"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Selecteer een verificatiemethode",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-inloggegevens verzenden",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Ernst"),
    "signIn": MessageLookupByLibrary.simpleMessage("Inloggen"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registreren"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-code"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Er is iets misgegaan",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttijd"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Staat / Provincie",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systeembeheerder",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Tenantbeheerder",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Gebruiksvoorwaarden"),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Voer de beveiligingscode in vanuit uw authenticator-app.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Probeer opnieuw"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Probeer een andere methode",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Probeer uw zoekopdracht te verfijnen",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Probeer te verversen",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Niet toegewezen"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("Update vereist"),
    "updateTo": m22,
    "username": MessageLookupByLibrary.simpleMessage("gebruikersnaam"),
    "users": MessageLookupByLibrary.simpleMessage("Gebruikers"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Verificatiecode is onjuist",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Ongeldig formaat van verificatiecode",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Te veel verzoeken, controleer de verificatiecode",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifieer uw identiteit",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Dashboard bekijken"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi-wachtwoord"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
  };
}

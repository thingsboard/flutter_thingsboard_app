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

  static String m1(authority) =>
      "Weet u het zeker? U gaat uw ${authority}-account verwijderen.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarmen')}";

  static String m3(providerName) =>
      "Weet u zeker dat u ${providerName} wilt deactiveren?";

  static String m4(deviceName) =>
      "Kan geen sessie tot stand brengen met apparaat ${deviceName}. Probeer het opnieuw";

  static String m5(link) => "Kan url niet openen: ${link}";

  static String m6(wifiName) =>
      "Verbind met Wi-Fi vergelijkbaar met ${wifiName}";

  static String m7(name) =>
      "Verbinding met het Wi-Fi-netwerk ${name} mislukt.\nZorg ervoor dat uw telefoon verbonden is met het Wi-Fi-netwerk van het apparaat en dat lokale netwerktoegang is ingeschakeld.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '1 melding verwijderen?', other: '${count} meldingen verwijderen?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Apparaat', other: 'Apparaten')}";

  static String m11(count) =>
      "${count}-${Intl.plural(count, one: 'cijferige', other: 'cijferige')} code";

  static String m12(contact) =>
      "Er is een beveiligingscode verzonden naar uw e-mailadres op ${contact}.";

  static String m13(e) => "Fout opgetreden: ${e}";

  static String m14(error) => "Fout bij het verzenden van de code: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 bewerking mislukt', other: '${count} bewerkingen mislukt')}";

  static String m16(count) =>
      "${Intl.plural(count, one: '1 melding als gelezen markeren?', other: '${count} meldingen als gelezen markeren?')}";

  static String m17(count) => "${count} geselecteerd";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Melding', other: 'Meldingen')}";

  static String m19(permissions) =>
      "U heeft onvoldoende rechten voor \"${permissions}\" om door te gaan. Open de app-instellingen, verleen de rechten en tik op \"Opnieuw proberen\".";

  static String m20(permissions) =>
      "U heeft onvoldoende rechten voor \"${permissions}\" om door te gaan. Verleen de vereiste rechten en tik op \"Opnieuw proberen\".";

  static String m21(deviceName) =>
      "Voer de pincode van ${deviceName} in om eigendomsbewijs te bevestigen";

  static String m22(time) =>
      "Code opnieuw verzenden in ${Intl.plural(time, one: '1 seconde', other: '${time} seconden')}";

  static String m23(name) => "Route niet gedefinieerd: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Gebruiker zoeken', other: 'Gebruikers zoeken')}";

  static String m25(contact) =>
      "Er is een beveiligingscode verzonden naar uw telefoon op ${contact}.";

  static String m26(name) =>
      "Kan niet verbinden met Wi-Fi omdat het apparaat ${name} geen netwerken heeft gevonden";

  static String m27(version) => "Updaten naar ${version}";

  static String m28(deviceName) =>
      "Om de installatie van uw apparaat ${deviceName} voort te zetten, geef de netwerkgegevens op.";

  static String m29(network) => "Voer het wachtwoord in voor ${network}";

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
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bevestigen"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Bevestigd"),
    "actionData": MessageLookupByLibrary.simpleMessage("Actiegegevens"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Mislukt"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Succes"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Geactiveerd"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Toegevoegd"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Opmerking toegevoegd",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Bevestigd"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm toegewezen",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Gewist"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm verwijderd",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarm niet toegewezen",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Toegewezen door tenant",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Toegewezen aan klant",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Toegewezen aan Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Toegewezen aan tenant",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributen verwijderd",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributen gelezen",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributen bijgewerkt",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Inloggegevens gelezen",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Inloggegevens bijgewerkt",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Verwijderd"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Opmerking verwijderd",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Geblokkeerd"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Inloggen"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Uitloggen"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Provisioning mislukt",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Apparaat geprovisioneerd",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relatie bijgewerkt",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relatie verwijderd",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Alle relaties verwijderd",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC-oproep"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS verzonden"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Opgeschort"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetrie verwijderd",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetrie bijgewerkt",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Verwijderd van klant",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Verwijderd van Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Bijgewerkt"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Opmerking bijgewerkt",
    ),
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
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Verificatiemethode toevoegen",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adres"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresregel 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Beheerdersinstellingen",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("AI-model"),
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
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Alarm-ernstlijst",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("Alarmstatuslijst"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarmtypelijst"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtypes"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Alle"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle apparaten"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Toegang toestaan"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Heeft u al een account?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Lege verzoekgegevens ontvangen.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Elk type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("API-sleutel"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API-gebruiksstatus"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage(
      "Wijzigingen toepassen",
    ),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Weet u het zeker?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("Assetnaam"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Assetprofiel"),
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
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Voer een van uw back-upcodes in.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Back-upcode",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "De volgende keer dat u inlogt, kunt u back-upcodes gebruiken voor tweefactorauthenticatie",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Om uw nieuwe apparaat te provisioneren, zorg ervoor dat Bluetooth op uw telefoon is ingeschakeld en dat u zich binnen bereik van uw nieuwe apparaat bevindt",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Berekend veld"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuleren"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
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
    "cleared": MessageLookupByLibrary.simpleMessage("Gewist"),
    "close": MessageLookupByLibrary.simpleMessage("Sluiten"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Codeverificatie mislukt!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "U moet bevestigen dat u geen robot bent",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bevestiging"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-verbinding bevestigen",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Verbinden met apparaat",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Verbind met het Wi-Fi dat u normaal gebruikt",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Verbinden met apparaat",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Verbindingsfout"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Doorgaan"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Gekopieerd naar klembord",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Kopiëren"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Kopieer de 32-cijferige sleutel naar uw authenticator-app of scan de QR-code hieronder",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Account aanmaken"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Maak een wachtwoord aan",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Kritiek"),
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
    "deleteAccount": MessageLookupByLibrary.simpleMessage(
      "Account verwijderen",
    ),
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Opmerking verwijderen",
    ),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Apparatenlijst"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Apparaat kan geen Wi-Fi vinden in de buurt",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Apparaten niet gevonden. Zorg ervoor dat Bluetooth op uw telefoon is ingeschakeld en dat u zich binnen bereik van uw nieuwe apparaat bevindt.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Apparaatprofiel"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Apparaatprovisioning",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage(
      "Wijzigingen verwerpen",
    ),
    "domain": MessageLookupByLibrary.simpleMessage("Domein"),
    "done": MessageLookupByLibrary.simpleMessage("Klaar"),
    "duration": MessageLookupByLibrary.simpleMessage("Duur"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Bewerken"),
    "edited": MessageLookupByLibrary.simpleMessage("Bewerkt"),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-mailcode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ongeldig e-mailformaat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-mail is verplicht.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "De volgende keer dat u inlogt, wordt u gevraagd de beveiligingscode in te voeren die naar uw e-mailadres wordt gestuurd",
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
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Voer de 6-cijferige code uit uw app hier in:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Voer een telefoonnummer in om als authenticator te gebruiken",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Voer een e-mailadres in om als authenticator te gebruiken.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Entiteitstype"),
    "entityView": MessageLookupByLibrary.simpleMessage("Entiteitsweergave"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Apparaatprovisioning verlaten",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Kan geen verbinding maken met de server",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Details van alarm laden mislukt",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Laden van de lijst mislukt",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("Foutdetails"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatale applicatiefout opgetreden:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatale fout"),
    "filters": MessageLookupByLibrary.simpleMessage("Filters"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase is niet geconfigureerd.\nRaadpleeg de officiële Firebase-documentatie\nvoor instructies.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Voornaam"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Voornaam is verplicht.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Voornaam"),
    "goBack": MessageLookupByLibrary.simpleMessage("Terug"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Dashboard-werkbalk verbergen",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Startpagina"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Startdashboard"),
    "hours": MessageLookupByLibrary.simpleMessage("uren"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybride"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Ik ben geen robot"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperiaal"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactief"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inactieve gebruiker bestaat al",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Er is al een geregistreerde gebruiker met een niet-geverifieerd e-mailadres.\nKlik op de knop \'Opnieuw verzenden\' als u de verificatie-e-mail opnieuw wilt verzenden.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Onbepaald"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Uw wachtwoord moet minimaal 6 tekens lang zijn",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("is verplicht."),
    "job": MessageLookupByLibrary.simpleMessage("Taak"),
    "label": MessageLookupByLibrary.simpleMessage("Label"),
    "language": MessageLookupByLibrary.simpleMessage("Taal"),
    "lastName": MessageLookupByLibrary.simpleMessage("Achternaam"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Achternaam is verplicht.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Achternaam"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "De lijst is momenteel leeg.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Inloggen"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Inloggen in de app"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Log in op uw account",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Inloggen met"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Uitloggen"),
    "major": MessageLookupByLibrary.simpleMessage("Ernstig"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Alles als gelezen markeren",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Markeer als gelezen"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metrisch"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Back-upcode",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-mail"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authenticator-app",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Gering"),
    "minutes": MessageLookupByLibrary.simpleMessage("minuten"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobiele app"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Mobiele app-bundel",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Het mobiele dashboard moet worden geconfigureerd in het apparaatprofiel!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Meer"),
    "nSelected": m17,
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
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Geen 2FA-providers gevonden",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Geen alarmen gevonden",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Geen dashboards gevonden",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Geen meldingen gevonden",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Geen resultaten gevonden",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Noord-Amerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Niet gevonden"),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Niet geïmplementeerd!",
    ),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Meldingsverzoek",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage("Meldingsregel"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("Meldingsdoel"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Meldingssjabloon",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("OAuth2-client"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "App-instellingen openen",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Open instellingen en geef cameratoegang om door te gaan",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-instellingen openen",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OF"),
    "originator": MessageLookupByLibrary.simpleMessage("Oorsprong"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA-pakket"),
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
    "permissions": MessageLookupByLibrary.simpleMessage("Rechten"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Telefoon"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Telefoonnummer is ongeldig",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Telefoon is verplicht",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Telefoonnummer in E.164-formaat, bijv. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Neem contact op met uw systeembeheerder",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Volg de volgende stappen om uw telefoon met het apparaat te verbinden",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Volg de volgende stappen om\nuw telefoon opnieuw te verbinden met uw Wi-Fi",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Scan de QR-code op uw apparaat",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarmtype"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postcode"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacybeleid"),
    "profile": MessageLookupByLibrary.simpleMessage("Profiel"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profiel succesvol bijgewerkt",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Apparaat is succesvol geprovisioneerd",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push-meldingen zijn niet geconfigureerd.\nNeem contact op met uw systeembeheerder.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Wachtrij"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Wachtrijstatistieken"),
    "ready": MessageLookupByLibrary.simpleMessage("Gereed"),
    "refresh": MessageLookupByLibrary.simpleMessage("Verversen"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Herhaal uw wachtwoord",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Wachtwoordherstel aanvragen",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "De gevraagde entiteit bestaat niet.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Opnieuw verzenden"),
    "resendCode": MessageLookupByLibrary.simpleMessage(
      "Code opnieuw verzenden",
    ),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Herstellen"),
    "retry": MessageLookupByLibrary.simpleMessage("Opnieuw proberen"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Terug naar dashboard",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Ga terug naar de app en tik op de knop Gereed",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Regelketen"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Regelknooppunt"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Scan een code"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("QR-code scannen"),
    "search": MessageLookupByLibrary.simpleMessage("Zoeken"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Zoekresultaten"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("seconden"),
    "security": MessageLookupByLibrary.simpleMessage("Beveiliging"),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "Alle geladen selecteren",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Land selecteren"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Selecteer regio"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Gebruikers selecteren"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Selecteer een verificatiemethode",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-netwerk selecteren",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Code verzenden"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi-inloggegevens verzenden",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Verificatiemethode instellen",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Stel een verificatiemethode in om door te gaan met inloggen",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Ernst"),
    "signIn": MessageLookupByLibrary.simpleMessage("Inloggen"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registreren"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-code"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "De volgende keer dat u inlogt, wordt u gevraagd de beveiligingscode in te voeren die naar uw telefoonnummer wordt gestuurd",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Er is iets misgegaan",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Er is iets misgegaan ... Terugdraaien",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttijd"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Staat / Provincie",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systeembeheerder",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Bron"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Tenantbeheerder",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Tenantprofiel"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Gebruiksvoorwaarden"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Deze actie kan niet ongedaan worden gemaakt",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Dit maakt uw account minder veilig",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Camera wisselen"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Flitser schakelen"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Voer de beveiligingscode in vanuit uw authenticator-app.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "De volgende keer dat u inlogt, moet u een tweefactorauthenticatiecode opgeven",
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
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Tweefactorauthenticatie",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Tweefactorauthenticatie is vereist",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "Tweefactorauthenticatie beschermt uw account tegen ongeautoriseerde toegang. U hoeft alleen een beveiligingscode in te voeren bij het inloggen.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Kan niet verbinden met apparaat",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Kan camera niet gebruiken",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Onbevestigd"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Niet toegewezen"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Eenhedensysteem"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Onbekende fout."),
    "unread": MessageLookupByLibrary.simpleMessage("Ongelezen"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Niet-opgeslagen wijzigingen",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Bijwerken"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("Update vereist"),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Gebruiker"),
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
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verificatie vereist",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifieer uw identiteit",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Alles bekijken"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Dashboard bekijken"),
    "warning": MessageLookupByLibrary.simpleMessage("Waarschuwing"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widgettype"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widgetpakket"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi-wachtwoord"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Ja, deactiveren"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Ja, verwerpen"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "U heeft niet-opgeslagen wijzigingen. Weet u zeker dat u deze pagina wilt verlaten?",
        ),
  };
}

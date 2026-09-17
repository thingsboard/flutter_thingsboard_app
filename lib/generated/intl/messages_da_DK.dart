// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a da_DK locale. All the
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
  String get localeName => 'da_DK';

  static String m0(appTitle) =>
      "Tillykke!\nDin ${appTitle}-konto er blevet aktiveret.\nDu kan nu logge ind på din ${appTitle}-platform.";

  static String m1(authority) =>
      "Er du sikker? Du er ved at slette din ${authority}-konto.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarmer')}";

  static String m3(providerName) =>
      "Er du sikker på, at du vil deaktivere ${providerName}?";

  static String m4(deviceName) =>
      "Kan ikke oprette session med enheden ${deviceName}. Prøv igen";

  static String m5(link) => "Kan ikke åbne url: ${link}";

  static String m6(wifiName) =>
      "Opret forbindelse til Wi-Fi lignende ${wifiName}";

  static String m7(name) =>
      "Forbindelse til Wi-Fi-netværket ${name} mislykkedes.\nSørg venligst for, at din telefon er tilsluttet enhedens Wi-Fi-netværk, og at lokal netværksadgang er aktiveret for denne app i enhedsindstillingerne.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Slet 1 notifikation?', other: 'Slet ${count} notifikationer?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Enhed', other: 'Enheder')}";

  static String m11(count) =>
      "${count}-${Intl.plural(count, one: 'cifret', other: 'cifre')} kode";

  static String m12(contact) =>
      "En sikkerhedskode er blevet sendt til din emailadresse på ${contact}.";

  static String m13(e) => "Fejl opstod: ${e}";

  static String m14(error) => "Fejl ved afsendelse af kode: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 handling mislykkedes', other: '${count} handlinger mislykkedes')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'Markér 1 notifikation som læst?', other: 'Markér ${count} notifikationer som læst?')}";

  static String m17(count) => "${count} valgt";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Notifikation', other: 'Notifikationer')}";

  static String m19(permissions) =>
      "Du har ikke tilstrækkelige tilladelser til \"${permissions}\" for at fortsætte. Åbn app-indstillingerne, giv tilladelser og tryk på \"Prøv igen\".";

  static String m20(permissions) =>
      "Du har ikke tilstrækkelige tilladelser til \"${permissions}\" for at fortsætte. Giv de nødvendige tilladelser og tryk på \"Prøv igen\".";

  static String m21(deviceName) =>
      "Indtast PIN-kode for ${deviceName} for at bekræfte ejerskab";

  static String m22(time) =>
      "Send kode igen om ${Intl.plural(time, one: '1 sekund', other: '${time} sekunder')}";

  static String m23(name) => "Rute ikke defineret: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Søg bruger', other: 'Søg brugere')}";

  static String m25(contact) =>
      "En sikkerhedskode er blevet sendt til din telefon på ${contact}.";

  static String m26(name) =>
      "Kan ikke oprette forbindelse til Wi-Fi, fordi netværk ikke blev fundet af enheden ${name}";

  static String m27(version) => "Opdater til ${version}";

  static String m28(deviceName) =>
      "For at fortsætte opsætningen af din enhed ${deviceName}, skal du angive netværkets legitimationsoplysninger.";

  static String m29(network) => "Indtast adgangskode til ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Acceptér"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Du skal acceptere vores privatlivspolitik",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Du skal acceptere vores brugsbetingelser",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Kontoen blev aktiveret!",
    ),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bekræft"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Bekræftet"),
    "actionData": MessageLookupByLibrary.simpleMessage("Handlingsdata"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Fejl"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Succes"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Aktiveret"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Tilføjet"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar tilføjet",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Bekræftet"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm tildelt",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Ryddet"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm slettet",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarm fjernet",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Tildelt fra lejer",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Tildelt kunde",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Tildelt til Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Tildelt til lejer",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributter slettet",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributter læst",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributter opdateret",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Legitimationsoplysninger læst",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Legitimationsoplysninger opdateret",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Slettet"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar slettet",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Låst ude"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Login"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Enhedsklargøring mislykkedes",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Enhed klargjort",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relation opdateret",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relation slettet",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Alle relationer slettet",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC-kald"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS sendt"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspenderet"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetri slettet",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetri opdateret",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Fjernet fra kunde",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Fjernet fra Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Opdateret"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar opdateret",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Aktiverer konto...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Din konto aktiveres i øjeblikket.\nVent venligst...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Aktiv"),
    "activity": MessageLookupByLibrary.simpleMessage("Aktivitet"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Tilføj en kommentar...",
    ),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Tilføj verifikationsmetode",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Administratorindstillinger",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("AI-model"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Er du sikker på, at du vil bekræfte alarmen?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Bekræft alarm",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Er du sikker på, at du vil rydde alarmen?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Ryd alarm"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Alarm alvorlighedsliste",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("Alarmstatusliste"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarmtypeliste"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtyper"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Alle"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle enheder"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Tillad adgang"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Har du allerede en konto?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Tomme forespørgselsdata modtaget.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Enhver type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("API-nøgle"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API-brugstilstand"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Anvend ændringer"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Er du sikker?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Aktiv"),
    "assetName": MessageLookupByLibrary.simpleMessage("Aktivnavn"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Aktivprofil"),
    "assets": MessageLookupByLibrary.simpleMessage("Aktiver"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("Tildelt kunde"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Tildelt mig"),
    "assignee": MessageLookupByLibrary.simpleMessage("Tildelt"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Revisionslogdetaljer",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Revisionslogfiler"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Indtast en af dine backupkoder.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Backupkode",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Næste gang du logger ind, kan du bruge backupkoder til at gennemføre to-faktor-godkendelse",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "For at klargøre din nye enhed, skal du sikre dig, at telefonens Bluetooth er slået til og inden for rækkevidde af den nye enhed",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Beregnet felt"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuller"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("Skift adgangskode"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Vælg region"),
    "city": MessageLookupByLibrary.simpleMessage("By"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("Tilknytter enhed"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Enhedstilknytning fuldført",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Enheden blev\ntilknyttet med succes",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Ryd"),
    "cleared": MessageLookupByLibrary.simpleMessage("Ryddet"),
    "close": MessageLookupByLibrary.simpleMessage("Luk"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Kodeverifikation mislykkedes!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Du skal bekræfte, at du ikke er en robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bekræftelse"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Bekræfter Wi-Fi-forbindelse",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Opret forbindelse til enhed",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Opret forbindelse til det Wi-Fi, du normalt bruger",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Opretter forbindelse til enhed",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Forbindelsesfejl"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Fortsæt"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Kopieret til udklipsholder",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Kopiér"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Kopiér 32-cifret nøgle til din autentifikatorapp eller scan QR-koden nedenfor",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Opret konto"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Opret en adgangskode",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Kritisk"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Nuværende adgangskode",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Nuværende adgangskode er påkrævet.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Kunde"),
    "customers": MessageLookupByLibrary.simpleMessage("Kunder"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("dage"),
    "delete": MessageLookupByLibrary.simpleMessage("Slet"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Slet konto"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Slet kommentar"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Detaljer"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Enhedsliste"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Enheden kan ikke finde Wi-Fi i nærheden",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Enheder blev ikke fundet. Sørg for, at telefonens Bluetooth er slået til og inden for rækkevidde af den nye enhed.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Enhedsprofil"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Enhedsklargøring",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Kassér ændringer"),
    "domain": MessageLookupByLibrary.simpleMessage("Domæne"),
    "done": MessageLookupByLibrary.simpleMessage("Færdig"),
    "duration": MessageLookupByLibrary.simpleMessage("Varighed"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Rediger"),
    "edited": MessageLookupByLibrary.simpleMessage("Redigeret"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Email-kode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ugyldigt emailformat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "Email er påkrævet.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Næste gang du logger ind, vil du blive bedt om at indtaste sikkerhedskoden, der sendes til din emailadresse",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "Email-verifikation",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Følg venligst instruktionerne i emailen for at fuldføre din registrering. Bemærk: Hvis du ikke har set emailen i et stykke tid, så tjek din \'spam\'-mappe eller prøv at gensende emailen ved at klikke på \'Gensend\'-knappen.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "En email med verifikationsdetaljer er sendt til den angivne emailadresse",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Email verificeret"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Indtast 6-cifret kode fra din app her:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Indtast et telefonnummer til brug som din autentifikator",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Indtast en email til brug som din autentifikator.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Enhedstype"),
    "entityView": MessageLookupByLibrary.simpleMessage("Entitetsvisning"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Afslut enhedsklargøring",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke oprette forbindelse til serveren",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke indlæse alarmdetaljer",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke indlæse listen",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("Fejldetaljer"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal applikationsfejl opstod:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal fejl"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtre"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase er ikke konfigureret.\nSe venligst den officielle Firebase-dokumentation\nfor vejledning.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Fornavn er påkrævet.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "goBack": MessageLookupByLibrary.simpleMessage("Gå tilbage"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Skjul hjemmeside-dashboard værktøjslinje",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Hjem"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage(
      "Hjemmeside-dashboard",
    ),
    "hours": MessageLookupByLibrary.simpleMessage("timer"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybrid"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Jeg er ikke en robot"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperial"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inaktiv bruger findes allerede",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Der er allerede en registreret bruger med en ikke-verificeret emailadresse.\nKlik på \'Gensend\'-knappen, hvis du ønsker at gensende verifikationsmailen.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Ubestemt"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Din adgangskode skal være mindst 6 tegn lang",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("er påkrævet."),
    "job": MessageLookupByLibrary.simpleMessage("Job"),
    "label": MessageLookupByLibrary.simpleMessage("Etiket"),
    "language": MessageLookupByLibrary.simpleMessage("Sprog"),
    "lastName": MessageLookupByLibrary.simpleMessage("Efternavn"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Efternavn er påkrævet.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Efternavn"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Listen er i øjeblikket tom.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Log ind"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Log ind i appen"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Log ind på din konto",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Log ind med"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log ud"),
    "major": MessageLookupByLibrary.simpleMessage("Alvorlig"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Markér alle som læst",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Markér som læst"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metrisk"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("Backupkode"),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Autentifikatorapp",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Mindre"),
    "minutes": MessageLookupByLibrary.simpleMessage("minutter"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobil app"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage("Mobil app-pakke"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobilt dashboard skal konfigureres i enhedsprofilen!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Mere"),
    "nSelected": m17,
    "newPassword": MessageLookupByLibrary.simpleMessage("Ny adgangskode"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Bekræft ny adgangskode",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Bekræft ny adgangskode er påkrævet.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Ny adgangskode er påkrævet.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Ny bruger?"),
    "next": MessageLookupByLibrary.simpleMessage("Næste"),
    "no": MessageLookupByLibrary.simpleMessage("Nej"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Ingen 2FA-udbydere fundet",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen alarmer fundet",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen dashboards fundet",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen notifikationer fundet",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen resultater fundet",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nordamerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Ikke fundet"),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Ikke implementeret!",
    ),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Notifikationsforespørgsel",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Notifikationsregel",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Notifikationsmål",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Notifikationsskabelon",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("OAuth2-klient"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Åbn app-indstillinger",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Åbn indstillinger og giv adgang til kameraet for at fortsætte",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Åbn Wi-Fi-indstillinger",
    ),
    "or": MessageLookupByLibrary.simpleMessage("ELLER"),
    "originator": MessageLookupByLibrary.simpleMessage("Oprindelse"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA-pakke"),
    "password": MessageLookupByLibrary.simpleMessage("Adgangskode"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Indtastede adgangskoder skal være ens!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Glemt adgangskode?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Adgangskode er påkrævet.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Nulstil adgangskode",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Link til nulstilling af adgangskode blev sendt med succes!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Indtast den email, der er tilknyttet din konto, og vi sender en email med link til nulstilling af adgangskode",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Adgangskoden blev ændret",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Tilladelser"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer er ugyldigt",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Telefon er påkrævet",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer i E.164-format, f.eks. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Kontakt venligst din systemadministrator",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Følg venligst de næste trin for at tilslutte din telefon til enheden",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Følg venligst de næste trin for at genoprette\nforbindelsen til dit normale Wi-Fi",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Scan venligst QR-koden på din enhed",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarmtype"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postnummer"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privatlivspolitik"),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilen blev opdateret",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Enheden blev konfigureret med succes",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push-meddelelser er ikke konfigureret.\nKontakt venligst din systemadministrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Kø"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Køstatistik"),
    "ready": MessageLookupByLibrary.simpleMessage("Klar"),
    "refresh": MessageLookupByLibrary.simpleMessage("Opdater"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Gentag din adgangskode",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Anmod om nulstilling af adgangskode",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "Den anmodede entitet eksisterer ikke.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Gensend"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Send kode igen"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Nulstil"),
    "retry": MessageLookupByLibrary.simpleMessage("Prøv igen"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Vend tilbage til dashboard",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Vend tilbage til appen og tryk på Klar-knappen",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Regelkæde"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Regelknude"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Scan en kode"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Scan QR-kode"),
    "search": MessageLookupByLibrary.simpleMessage("Søg"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Søgeresultater"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("sekunder"),
    "security": MessageLookupByLibrary.simpleMessage("Sikkerhed"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Vælg alle indlæste"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Vælg land"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Vælg region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Vælg brugere"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Vælg en metode til verifikation",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Vælg Wi-Fi-netværk",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send kode"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sender Wi-Fi-legitimationsoplysninger",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Opsæt en verifikationsmetode",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Opsæt en verifikationsmetode for at fortsætte med dit login",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Alvorlighed"),
    "signIn": MessageLookupByLibrary.simpleMessage("Log ind"),
    "signUp": MessageLookupByLibrary.simpleMessage("Tilmeld"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-kode"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Næste gang du logger ind, vil du blive bedt om at indtaste sikkerhedskoden, der sendes til telefonnummeret",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Noget gik galt",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Noget gik galt ... Ruller tilbage",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttidspunkt"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("Stat / Provins"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Ressource"),
    "tenant": MessageLookupByLibrary.simpleMessage("Lejer"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Lejeradministrator",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Lejerprofil"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Brugsbetingelser"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Denne handling kan ikke fortrydes",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Dette vil gøre din konto mindre sikker",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Skift kamera"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Skift blitz"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Kode"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Indtast sikkerhedskoden fra din autentifikatorapp.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Næste gang du logger ind, skal du angive en to-faktor-godkendelseskode",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Prøv igen"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Prøv en anden metode",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Prøv venligst at forfine din søgning",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Prøv venligst at opdatere",
    ),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "To-faktor-godkendelse",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "To-faktor-godkendelse er påkrævet",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "To-faktor-godkendelse beskytter din konto mod uautoriseret adgang. Alt du skal gøre er at indtaste en sikkerhedskode, når du logger ind.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Kan ikke oprette forbindelse til enhed",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Kan ikke bruge kameraet",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Ubekræftet"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Ikke tildelt"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Enhedssystem"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Ukendt fejl."),
    "unread": MessageLookupByLibrary.simpleMessage("Ulæst"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Ikke-gemte ændringer",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Opdater"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Opdatering påkrævet",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("Url"),
    "user": MessageLookupByLibrary.simpleMessage("Bruger"),
    "username": MessageLookupByLibrary.simpleMessage("brugernavn"),
    "users": MessageLookupByLibrary.simpleMessage("Brugere"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Verifikationskoden er forkert",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Ugyldigt format for verificeringskode",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "For mange forespørgsler, kontroller verifikationskoden",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verifikation påkrævet",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bekræft din identitet",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Vis alle"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Vis Dashboard"),
    "warning": MessageLookupByLibrary.simpleMessage("Advarsel"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widget-type"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widget-pakke"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi adgangskode"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Ja, deaktiver"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Ja, kassér"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Du har ikke-gemte ændringer. Er du sikker på, at du vil forlade denne side?",
        ),
  };
}

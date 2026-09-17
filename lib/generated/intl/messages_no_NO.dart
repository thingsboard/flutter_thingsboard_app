// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a no_NO locale. All the
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
  String get localeName => 'no_NO';

  static String m0(appTitle) =>
      "Gratulerer!\nDin ${appTitle}-konto har blitt aktivert.\nDu kan nå logge inn på ditt ${appTitle}-område.";

  static String m1(authority) =>
      "Er du sikker? Du er i ferd med å slette ${authority}-kontoen din.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarmer')}";

  static String m3(providerName) =>
      "Er du sikker på at du vil deaktivere ${providerName}?";

  static String m4(deviceName) =>
      "Kan ikke opprette økt med enheten ${deviceName}. Vennligst prøv igjen";

  static String m5(link) => "Kan ikke åpne url: ${link}";

  static String m6(wifiName) => "Koble til Wi-Fi lignende ${wifiName}";

  static String m7(name) =>
      "Tilkobling til Wi-Fi-nettverket ${name} mislyktes.\nSørg for at telefonen er koblet til enhetens Wi-Fi-nettverk og at lokal nettverkstilgang er aktivert.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashbord', other: 'Dashbord')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Slette 1 varsling?', other: 'Slette ${count} varslinger?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Enhet', other: 'Enheter')}";

  static String m11(count) =>
      "${count}-${Intl.plural(count, one: 'sifret', other: 'sifret')} kode";

  static String m12(contact) =>
      "En sikkerhetskode har blitt sendt til e-postadressen din på ${contact}.";

  static String m13(e) => "Feil oppstod: ${e}";

  static String m14(error) => "Feil ved sending av kode: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 handling mislyktes', other: '${count} handlinger mislyktes')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'Markere 1 varsling som lest?', other: 'Markere ${count} varslinger som lest?')}";

  static String m17(count) => "${count} valgt";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Varsel', other: 'Varsler')}";

  static String m19(permissions) =>
      "Du har ikke tilstrekkelige tillatelser for \"${permissions}\" til å fortsette. Åpne appinnstillingene, gi nødvendige tillatelser og trykk \"Prøv igjen\".";

  static String m20(permissions) =>
      "Du har ikke tilstrekkelige tillatelser for \"${permissions}\" til å fortsette. Gi nødvendige tillatelser og trykk \"Prøv igjen\".";

  static String m21(deviceName) =>
      "Skriv inn PIN for ${deviceName} for å bekrefte eierskapsbevis";

  static String m22(time) =>
      "Send koden på nytt om ${Intl.plural(time, one: '1 sekund', other: '${time} sekunder')}";

  static String m23(name) => "Rute ikke definert: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Søk bruker', other: 'Søk brukere')}";

  static String m25(contact) =>
      "En sikkerhetskode har blitt sendt til telefonen din på ${contact}.";

  static String m26(name) =>
      "Kan ikke koble til Wi-Fi fordi enheten ${name} ikke fant nettverk";

  static String m27(version) => "Oppdater til ${version}";

  static String m28(deviceName) =>
      "For å fortsette oppsettet av enheten din ${deviceName}, vennligst oppgi nettverksinformasjonen din.";

  static String m29(network) => "Skriv inn passordet for ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Godta"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Du må godta vår personvernerklæring",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Du må godta våre vilkår for bruk",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Kontoen ble aktivert!",
    ),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bekreft"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Bekreftet"),
    "actionData": MessageLookupByLibrary.simpleMessage("Handlingsdata"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Mislykket"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Suksess"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Aktivert"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Lagt til"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar lagt til",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Bekreftet"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm tildelt",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Fjernet"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm slettet",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarm fjernet",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Tildelt fra leietaker",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Tildelt kunde",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Tildelt Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Tildelt til leietaker",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributter slettet",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributter lest",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributter oppdatert",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Legitimasjon lest",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Legitimasjon oppdatert",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Slettet"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar slettet",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Låst ute"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Innlogging"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Utlogging"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Enhetsklargjøring mislyktes",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Enhet klargjort",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relasjon oppdatert",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relasjon slettet",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Alle relasjoner slettet",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC-kall"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS sendt"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspendert"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetri slettet",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetri oppdatert",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Fjernet fra kunde",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Fjernet fra Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Oppdatert"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Kommentar oppdatert",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Aktiverer konto...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Kontoen din aktiveres for øyeblikket.\nVennligst vent...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Aktiv"),
    "activity": MessageLookupByLibrary.simpleMessage("Aktivitet"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Legg til en kommentar...",
    ),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Legg til verifiseringsmetode",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Administratorinnstillinger",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("AI-modell"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Er du sikker på at du vil bekrefte alarmen?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Bekreft alarm",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Er du sikker på at du vil fjerne alarmen?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Fjern alarm"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Alarm alvorlighetsliste",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage("Alarmstatusliste"),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarmtypeliste"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtyper"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Alle"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle enheter"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Tillat tilgang"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Har du allerede en konto?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Tomme forespørselsdata mottatt.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Enhver type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("API-nøkkel"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API-bruksstatus"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Bruk endringer"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Er du sikker?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Eiendel"),
    "assetName": MessageLookupByLibrary.simpleMessage("Eiendelsnavn"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Eiendelsprofil"),
    "assets": MessageLookupByLibrary.simpleMessage("Eiendeler"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("Tildelt kunde"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Tildelt meg"),
    "assignee": MessageLookupByLibrary.simpleMessage("Tildelt person"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Detaljer for revisjonslogg",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Revisjonslogger"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Vennligst skriv inn en av dine reservekoder.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Reservekode",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Neste gang du logger inn, kan du bruke reservekoder for tofaktorautentisering",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "For å klargjøre den nye enheten din, sørg for at telefonens Bluetooth er slått på og innenfor rekkevidde av enheten.",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Beregnet felt"),
    "cancel": MessageLookupByLibrary.simpleMessage("Avbryt"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage("Endre passord"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Velg region"),
    "city": MessageLookupByLibrary.simpleMessage("By"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage(
      "Krever eierskap til enhet",
    ),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Eierskapskrav fullført",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Enheten ble\nregistrert med suksess",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Fjern"),
    "cleared": MessageLookupByLibrary.simpleMessage("Fjernet"),
    "close": MessageLookupByLibrary.simpleMessage("Lukk"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Kodeverifisering mislyktes!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Du må bekrefte at du ikke er en robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bekreftelse"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Bekrefter Wi-Fi-tilkobling",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage("Koble til enhet"),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Koble til Wi-Fi du vanligvis bruker",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Kobler til enhet",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Tilkoblingsfeil"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Fortsett"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Kopiert til utklippstavlen",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Kopier"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Kopier 32-sifret nøkkel til autentiseringsappen din eller skann QR-koden nedenfor",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Opprett konto"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Opprett et passord",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Kritisk"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Nåværende passord",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Nåværende passord er påkrevd.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Kunde"),
    "customers": MessageLookupByLibrary.simpleMessage("Kunder"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("dager"),
    "delete": MessageLookupByLibrary.simpleMessage("Slett"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Slett konto"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Slett kommentar"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Detaljer"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Enhetsliste"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Enheten finner ikke Wi-Fi i nærheten",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Enheter ble ikke funnet. Sørg for at telefonens Bluetooth er slått på og at du er innenfor rekkevidde av enheten.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Enhetsprofil"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Enhetsklargjøring",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Forkast endringer"),
    "domain": MessageLookupByLibrary.simpleMessage("Domene"),
    "done": MessageLookupByLibrary.simpleMessage("Ferdig"),
    "duration": MessageLookupByLibrary.simpleMessage("Varighet"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Rediger"),
    "edited": MessageLookupByLibrary.simpleMessage("Redigert"),
    "email": MessageLookupByLibrary.simpleMessage("E-post"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-postkode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ugyldig e-postformat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-post er påkrevd.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Neste gang du logger inn, vil du bli bedt om å taste inn sikkerhetskoden som sendes til e-postadressen din",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "E-postverifisering",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Vennligst følg instruksjonene i e-posten for å fullføre registreringen. Merk: hvis du ikke har sett e-posten etter en stund, sjekk \'søppelpost\'-mappen eller prøv å sende e-posten på nytt ved å klikke på \'Send på nytt\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "En e-post med verifiseringsdetaljer ble sendt til den angitte e-postadressen",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("E-post bekreftet"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Skriv inn 6-sifret kode fra appen din her:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Skriv inn et telefonnummer som skal brukes som autentisering",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Skriv inn en e-post som skal brukes som autentisering.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Enhetstype"),
    "entityView": MessageLookupByLibrary.simpleMessage("Enhetsvisning"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Avslutt enhetsklargjøring",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke koble til serveren",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke laste alarmdetaljer",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke laste listen",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage("Feildetaljer"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal applikasjonsfeil oppstod:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal feil"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtre"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase er ikke konfigurert.\nSe den offisielle Firebase-dokumentasjonen\nfor veiledning.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Fornavn er påkrevd.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "goBack": MessageLookupByLibrary.simpleMessage("Gå tilbake"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Skjul dashbord-verktøylinje",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Hjem"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Hjemme-dashbord"),
    "hours": MessageLookupByLibrary.simpleMessage("timer"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybrid"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Jeg er ikke en robot"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperisk"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inaktiv bruker finnes allerede",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Det finnes allerede en registrert bruker med en ubekreftet e-postadresse.\nKlikk på \'Send på nytt\'-knappen hvis du ønsker å sende verifiseringsmailen på nytt.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Ubestemt"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Passordet må være minst 6 tegn langt",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("er påkrevd."),
    "job": MessageLookupByLibrary.simpleMessage("Jobb"),
    "label": MessageLookupByLibrary.simpleMessage("Etikett"),
    "language": MessageLookupByLibrary.simpleMessage("Språk"),
    "lastName": MessageLookupByLibrary.simpleMessage("Etternavn"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Etternavn er påkrevd.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Etternavn"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Listen er for øyeblikket tom.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Logg inn"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Logg inn i appen"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Logg inn på kontoen din",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Logg inn med"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logg ut"),
    "major": MessageLookupByLibrary.simpleMessage("Alvorlig"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Merk alle som lest"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Merk som lest"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metrisk"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Reservekode",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-post"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Autentiseringsapp",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Mindre"),
    "minutes": MessageLookupByLibrary.simpleMessage("minutter"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Mobilapp"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage("Mobilapppakke"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobilt dashbord må konfigureres i enhetsprofilen!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Mer"),
    "nSelected": m17,
    "newPassword": MessageLookupByLibrary.simpleMessage("Nytt passord"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Bekreft nytt passord",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Bekreft nytt passord er påkrevd.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Nytt passord er påkrevd.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Ny bruker?"),
    "next": MessageLookupByLibrary.simpleMessage("Neste"),
    "no": MessageLookupByLibrary.simpleMessage("Nei"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Ingen 2FA-leverandører funnet",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen alarmer funnet",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen dashbord funnet",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen varsler funnet",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen resultater funnet",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nord-Amerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Ikke funnet"),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Ikke implementert!",
    ),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Varslingsforespørsel",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage("Varslingsregel"),
    "notificationTarget": MessageLookupByLibrary.simpleMessage("Varslingsmål"),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Varslingsmal",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("OAuth2-klient"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Åpne appinnstillinger",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Åpne innstillinger og gi tilgang til kameraet for å fortsette",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Åpne Wi-Fi-innstillinger",
    ),
    "or": MessageLookupByLibrary.simpleMessage("ELLER"),
    "originator": MessageLookupByLibrary.simpleMessage("Opprinnelse"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA-pakke"),
    "password": MessageLookupByLibrary.simpleMessage("Passord"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Passordene må være like!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Glemt passord?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Passord er påkrevd.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Tilbakestill passord",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Lenken for tilbakestilling av passord ble sendt!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Skriv inn e-posten som er knyttet til kontoen din, så sender vi en lenke for tilbakestilling av passord",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Passordet ble endret",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Tillatelser"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer er ugyldig",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Telefon er påkrevd",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Telefonnummer i E.164-format, f.eks. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Kontakt systemadministratoren din",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Følg de neste trinnene for å koble telefonen din til enheten",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Følg de neste trinnene for å koble\ntelefonen din til vanlig Wi-Fi igjen",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Skann QR-koden på enheten din",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarmtype"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postnummer"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Personvernerklæring",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilen ble oppdatert",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Enheten ble klargjort",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push-varsler er ikke konfigurert.\nKontakt systemadministratoren din.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Kø"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Køstatistikk"),
    "ready": MessageLookupByLibrary.simpleMessage("Klar"),
    "refresh": MessageLookupByLibrary.simpleMessage("Oppdater"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Gjenta passordet ditt",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Be om tilbakestilling av passord",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "Den forespurte enheten eksisterer ikke.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Send på nytt"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Send koden på nytt"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Tilbakestill"),
    "retry": MessageLookupByLibrary.simpleMessage("Prøv igjen"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Gå tilbake til dashbordet",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Gå tilbake til appen og trykk Klar-knappen",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Regelkjede"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Regelnode"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Skann en kode"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Skann QR-kode"),
    "search": MessageLookupByLibrary.simpleMessage("Søk"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Søkeresultater"),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("sekunder"),
    "security": MessageLookupByLibrary.simpleMessage("Sikkerhet"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Velg alle lastede"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Velg land"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Velg region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Velg brukere"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Velg en verifiseringsmetode",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Velg Wi-Fi-nettverk",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send kode"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sender Wi-Fi-opplysninger",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Sett opp en verifiseringsmetode",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Sett opp en verifiseringsmetode for å fortsette innloggingen",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Alvorlighetsgrad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Logg inn"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrer deg"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-kode"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Neste gang du logger inn, vil du bli bedt om å taste inn sikkerhetskoden som sendes til telefonnummeret",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("Noe gikk galt"),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Noe gikk galt ... Ruller tilbake",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttid"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("Stat / Provins"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Ressurs"),
    "tenant": MessageLookupByLibrary.simpleMessage("Leietaker"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Leietakeradministrator",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Leietakerprofil"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Vilkår for bruk"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Denne handlingen kan ikke angres",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Dette vil gjøre kontoen din mindre sikker",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Tittel"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Bytt kamera"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Slå av/på blits"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Kode"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Vennligst skriv inn sikkerhetskoden fra autentiseringsappen din.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Neste gang du logger inn, må du oppgi en tofaktorautentiseringskode",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Prøv igjen"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("Prøv en annen måte"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Prøv å forbedre søket ditt",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage("Prøv å oppdatere"),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Tofaktorautentisering",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Tofaktorautentisering er påkrevd",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "Tofaktorautentisering beskytter kontoen din mot uautorisert tilgang. Du trenger bare å taste inn en sikkerhetskode når du logger inn.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Kan ikke koble til enhet",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Kan ikke bruke kameraet",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Ubekreftet"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Ikke tildelt"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Enhetssystem"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Ukjent feil."),
    "unread": MessageLookupByLibrary.simpleMessage("Ulest"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Ulagrede endringer",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Oppdater"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Oppdatering kreves",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Bruker"),
    "username": MessageLookupByLibrary.simpleMessage("brukernavn"),
    "users": MessageLookupByLibrary.simpleMessage("Brukere"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Verifiseringskoden er feil",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Ugyldig format på verifiseringskode",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "For mange forespørsler, sjekk verifiseringskoden",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verifisering kreves",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bekreft identiteten din",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Vis alle"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Vis dashbord"),
    "warning": MessageLookupByLibrary.simpleMessage("Advarsel"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widgettype"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widgetpakke"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi-passord"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Ja, deaktiver"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Ja, forkast"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Du har ulagrede endringer. Er du sikker på at du vil forlate denne siden?",
        ),
  };
}

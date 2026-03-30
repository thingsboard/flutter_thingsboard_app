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

  static String m2(count) => "Alarmer";

  static String m4(deviceName) =>
      "Kan ikke opprette økt med enheten ${deviceName}. Vennligst prøv igjen";

  static String m8(count) => "Dashbord";

  static String m9(count) => "Enheter";

  static String m11(contact) =>
      "En sikkerhetskode har blitt sendt til e-postadressen din på ${contact}.";

  static String m13(count) => "Varsler";

  static String m14(permissions) =>
      "Du har ikke tilstrekkelige tillatelser for \"${permissions}\" til å fortsette. Åpne appinnstillingene, gi nødvendige tillatelser og trykk \"Prøv igjen\".";

  static String m15(permissions) =>
      "Du har ikke tilstrekkelige tillatelser for \"${permissions}\" til å fortsette. Gi nødvendige tillatelser og trykk \"Prøv igjen\".";

  static String m16(deviceName) =>
      "Skriv inn PIN for ${deviceName} for å bekrefte eierskapsbevis";

  static String m17(time) =>
      "Send koden på nytt om ${Intl.plural(time, one: '1 sekund', other: '${time} sekunder')}";

  static String m20(contact) =>
      "En sikkerhetskode har blitt sendt til telefonen din på ${contact}.";

  static String m22(version) => "Oppdater til ${version}";

  static String m23(deviceName) =>
      "For å fortsette oppsettet av enheten din ${deviceName}, vennligst oppgi nettverksinformasjonen din.";

  static String m24(network) => "Skriv inn passordet for ${network}";

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
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bekreft"),
    "actionData": MessageLookupByLibrary.simpleMessage("Handlingsdata"),
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
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
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
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtyper"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle enheter"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Har du allerede en konto?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Er du sikker?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Eiendelsnavn"),
    "assets": MessageLookupByLibrary.simpleMessage("Eiendeler"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("Tildelt kunde"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Tildelt meg"),
    "assignee": MessageLookupByLibrary.simpleMessage("Tildelt person"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Detaljer for revisjonslogg",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Revisjonslogger"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Vennligst skriv inn en av dine reservekoder.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Reservekode",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "For å klargjøre den nye enheten din, sørg for at telefonens Bluetooth er slått på og innenfor rekkevidde av enheten.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Avbryt"),
    "cannotEstablishSession": m4,
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
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Du må bekrefte at du ikke er en robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bekreftelse"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Bekrefter Wi-Fi-tilkobling",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Fortsett"),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Opprett konto"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Opprett et passord",
    ),
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
    "deleteComment": MessageLookupByLibrary.simpleMessage("Slett kommentar"),
    "details": MessageLookupByLibrary.simpleMessage("Detaljer"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Enhetsliste"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Enheter ble ikke funnet. Sørg for at telefonens Bluetooth er slått på og at du er innenfor rekkevidde av enheten.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Varighet"),
    "edit": MessageLookupByLibrary.simpleMessage("Rediger"),
    "edited": MessageLookupByLibrary.simpleMessage("Redigert"),
    "email": MessageLookupByLibrary.simpleMessage("E-post"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("E-postkode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ugyldig e-postformat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "E-post er påkrevd.",
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
    "entityType": MessageLookupByLibrary.simpleMessage("Enhetstype"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke laste alarmdetaljer",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke laste listen",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Feildetaljer"),
    "firstName": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Fornavn er påkrevd.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "home": MessageLookupByLibrary.simpleMessage("Hjem"),
    "hours": MessageLookupByLibrary.simpleMessage("timer"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Jeg er ikke en robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inaktiv bruker finnes allerede",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Det finnes allerede en registrert bruker med en ubekreftet e-postadresse.\nKlikk på \'Send på nytt\'-knappen hvis du ønsker å sende verifiseringsmailen på nytt.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Passordet må være minst 6 tegn langt",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Etikett"),
    "lastName": MessageLookupByLibrary.simpleMessage("Etternavn"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Etternavn er påkrevd.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Etternavn"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Listen er for øyeblikket tom.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Logg inn"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logg ut"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Reservekode",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("E-post"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Autentiseringsapp",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minutter"),
    "more": MessageLookupByLibrary.simpleMessage("Mer"),
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
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen resultater funnet",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nord-Amerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Ikke implementert!",
    ),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("ELLER"),
    "originator": MessageLookupByLibrary.simpleMessage("Opprinnelse"),
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
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postnummer"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Personvernerklæring",
    ),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilen ble oppdatert",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Enheten ble klargjort",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Oppdater"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Gjenta passordet ditt",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Be om tilbakestilling av passord",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Send på nytt"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Send koden på nytt"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Gå tilbake til dashbordet",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("sekunder"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Velg region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Velg brukere"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Velg en verifiseringsmetode",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sender Wi-Fi-opplysninger",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Alvorlighetsgrad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Logg inn"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrer deg"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-kode"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("Noe gikk galt"),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttid"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("Stat / Provins"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Leietakeradministrator",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Vilkår for bruk"),
    "title": MessageLookupByLibrary.simpleMessage("Tittel"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Kode"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Vennligst skriv inn sikkerhetskoden fra autentiseringsappen din.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Prøv igjen"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("Prøv en annen måte"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Prøv å forbedre søket ditt",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage("Prøv å oppdatere"),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Ikke tildelt"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Oppdatering kreves",
    ),
    "updateTo": m22,
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
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bekreft identiteten din",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Vis dashbord"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi-passord"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
  };
}

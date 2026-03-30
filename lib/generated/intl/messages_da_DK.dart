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

  static String m2(count) => "Alarmer";

  static String m4(deviceName) =>
      "Kan ikke oprette session med enheden ${deviceName}. Prøv igen";

  static String m8(count) => "Dashboards";

  static String m9(count) => "Enheder";

  static String m11(contact) =>
      "En sikkerhedskode er blevet sendt til din emailadresse på ${contact}.";

  static String m13(count) => "Notifikationer";

  static String m14(permissions) =>
      "Du har ikke tilstrækkelige tilladelser til \"${permissions}\" for at fortsætte. Åbn app-indstillingerne, giv tilladelser og tryk på \"Prøv igen\".";

  static String m15(permissions) =>
      "Du har ikke tilstrækkelige tilladelser til \"${permissions}\" for at fortsætte. Giv de nødvendige tilladelser og tryk på \"Prøv igen\".";

  static String m16(deviceName) =>
      "Indtast PIN-kode for ${deviceName} for at bekræfte ejerskab";

  static String m17(time) =>
      "Send kode igen om ${Intl.plural(time, one: '1 sekund', other: '${time} sekunder')}";

  static String m20(contact) =>
      "En sikkerhedskode er blevet sendt til din telefon på ${contact}.";

  static String m22(version) => "Opdater til ${version}";

  static String m23(deviceName) =>
      "For at fortsætte opsætningen af din enhed ${deviceName}, skal du angive netværkets legitimationsoplysninger.";

  static String m24(network) => "Indtast adgangskode til ${network}";

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
    "acknowledge": MessageLookupByLibrary.simpleMessage("Bekræft"),
    "actionData": MessageLookupByLibrary.simpleMessage("Handlingsdata"),
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
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Adresse 2"),
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
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarmtyper"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Alle enheder"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Har du allerede en konto?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Er du sikker?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Aktivnavn"),
    "assets": MessageLookupByLibrary.simpleMessage("Aktiver"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage("Tildelt kunde"),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Tildelt mig"),
    "assignee": MessageLookupByLibrary.simpleMessage("Tildelt"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Revisionslogdetaljer",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Revisionslogfiler"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Indtast en af dine backupkoder.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Backupkode",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "For at klargøre din nye enhed, skal du sikre dig, at telefonens Bluetooth er slået til og inden for rækkevidde af den nye enhed",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuller"),
    "cannotEstablishSession": m4,
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
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Du skal bekræfte, at du ikke er en robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Bekræftelse"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Bekræfter Wi-Fi-forbindelse",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Fortsæt"),
    "country": MessageLookupByLibrary.simpleMessage("Land"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Opret konto"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Opret en adgangskode",
    ),
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
    "deleteComment": MessageLookupByLibrary.simpleMessage("Slet kommentar"),
    "details": MessageLookupByLibrary.simpleMessage("Detaljer"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Enhedsliste"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Enheder blev ikke fundet. Sørg for, at telefonens Bluetooth er slået til og inden for rækkevidde af den nye enhed.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Varighed"),
    "edit": MessageLookupByLibrary.simpleMessage("Rediger"),
    "edited": MessageLookupByLibrary.simpleMessage("Redigeret"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Email-kode"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Ugyldigt emailformat.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "Email er påkrævet.",
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
    "entityType": MessageLookupByLibrary.simpleMessage("Enhedstype"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke indlæse alarmdetaljer",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Kunne ikke indlæse listen",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Fejldetaljer"),
    "firstName": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Fornavn er påkrævet.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Fornavn"),
    "home": MessageLookupByLibrary.simpleMessage("Hjem"),
    "hours": MessageLookupByLibrary.simpleMessage("timer"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Jeg er ikke en robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inaktiv"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inaktiv bruger findes allerede",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Der er allerede en registreret bruger med en ikke-verificeret emailadresse.\nKlik på \'Gensend\'-knappen, hvis du ønsker at gensende verifikationsmailen.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Din adgangskode skal være mindst 6 tegn lang",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Etiket"),
    "lastName": MessageLookupByLibrary.simpleMessage("Efternavn"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Efternavn er påkrævet.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Efternavn"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Listen er i øjeblikket tom.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Log ind"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard-logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log ud"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage("Backupkode"),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Autentifikatorapp",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minutter"),
    "more": MessageLookupByLibrary.simpleMessage("Mere"),
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
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Ingen resultater fundet",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Nordamerika"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Ikke implementeret!",
    ),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("ELLER"),
    "originator": MessageLookupByLibrary.simpleMessage("Oprindelse"),
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
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Postnummer"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privatlivspolitik"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilen blev opdateret",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Enheden blev konfigureret med succes",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Opdater"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Gentag din adgangskode",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Anmod om nulstilling af adgangskode",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Gensend"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Send kode igen"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Vend tilbage til dashboard",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("sekunder"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Vælg region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Vælg brugere"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Vælg en metode til verifikation",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sender Wi-Fi-legitimationsoplysninger",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Alvorlighed"),
    "signIn": MessageLookupByLibrary.simpleMessage("Log ind"),
    "signUp": MessageLookupByLibrary.simpleMessage("Tilmeld"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS-kode"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Noget gik galt",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Starttidspunkt"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("Stat / Provins"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Systemadministrator",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Lejeradministrator",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Brugsbetingelser"),
    "title": MessageLookupByLibrary.simpleMessage("Titel"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Kode"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Indtast sikkerhedskoden fra din autentifikatorapp.",
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
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Ikke tildelt"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Opdatering påkrævet",
    ),
    "updateTo": m22,
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
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Bekræft din identitet",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Vis Dashboard"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi adgangskode"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Ja"),
  };
}

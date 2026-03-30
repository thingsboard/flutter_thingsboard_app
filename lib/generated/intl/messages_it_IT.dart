// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it_IT locale. All the
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
  String get localeName => 'it_IT';

  static String m0(appTitle) =>
      "Congratulazioni!\nIl tuo account ${appTitle} è stato attivato.\nOra puoi accedere al tuo spazio ${appTitle}.";

  static String m2(count) => "Allarmi";

  static String m4(deviceName) =>
      "Impossibile stabilire una sessione con il dispositivo ${deviceName}. Riprova";

  static String m8(count) => "Dashboard";

  static String m9(count) => "Dispositivi";

  static String m11(contact) =>
      "Un codice di sicurezza è stato inviato alla tua email all\'indirizzo ${contact}.";

  static String m13(count) => "Notifiche";

  static String m14(permissions) =>
      "Non hai i permessi necessari per \"${permissions}\" per procedere. Apri le impostazioni dell\'app, concedi i permessi e tocca \"Riprova\".";

  static String m15(permissions) =>
      "Non hai i permessi necessari per \"${permissions}\" per procedere. Concedi i permessi richiesti e tocca \"Riprova\".";

  static String m16(deviceName) =>
      "Inserisci il PIN di ${deviceName} per confermare la prova di possesso";

  static String m17(time) =>
      "Reinvia codice tra ${Intl.plural(time, one: '1 secondo', other: '${time} secondi')}";

  static String m20(contact) =>
      "Un codice di sicurezza è stato inviato al tuo telefono al numero ${contact}.";

  static String m22(version) => "Aggiorna a ${version}";

  static String m23(deviceName) =>
      "Per continuare la configurazione del dispositivo ${deviceName}, fornisci le credenziali della tua rete.";

  static String m24(network) => "Inserisci la password per ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accetta"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Devi accettare la nostra Informativa sulla privacy",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Devi accettare i nostri Termini di utilizzo",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Account attivato con successo!",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Conferma"),
    "actionData": MessageLookupByLibrary.simpleMessage("Dati azione"),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Attivazione account in corso...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Il tuo account è in fase di attivazione.\nAttendere...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Attivo"),
    "activity": MessageLookupByLibrary.simpleMessage("Attività"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Aggiungi un commento...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Indirizzo"),
    "address2": MessageLookupByLibrary.simpleMessage("Indirizzo 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Sei sicuro di voler confermare l\'allarme?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Conferma Allarme",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Sei sicuro di voler cancellare l\'allarme?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Cancella Allarme"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Tipi di allarme"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Tutti i dispositivi"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Hai già un account?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Sei sicuro?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nome asset"),
    "assets": MessageLookupByLibrary.simpleMessage("Asset"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Assegnato al cliente",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Assegnato a me"),
    "assignee": MessageLookupByLibrary.simpleMessage("Assegnatario"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Dettagli log di controllo",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Log di controllo"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Inserisci uno dei tuoi codici di backup.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Codice di backup",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Per eseguire il provisioning del tuo nuovo dispositivo, assicurati che il Bluetooth del telefono sia attivo e che il dispositivo sia nel raggio d\'azione",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "cannotEstablishSession": m4,
    "changePassword": MessageLookupByLibrary.simpleMessage("Cambia password"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Scegli una regione"),
    "city": MessageLookupByLibrary.simpleMessage("Città"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage(
      "Richiesta dispositivo in corso",
    ),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Richiesta del dispositivo completata",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Il dispositivo è stato\nrichiesto con successo",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Cancella"),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Devi confermare di non essere un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Conferma"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Conferma connessione Wi-Fi",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continua"),
    "country": MessageLookupByLibrary.simpleMessage("Paese"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Crea account"),
    "createPassword": MessageLookupByLibrary.simpleMessage("Crea una password"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Password attuale"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "La password attuale è obbligatoria.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
    "customers": MessageLookupByLibrary.simpleMessage("Clienti"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("giorni"),
    "delete": MessageLookupByLibrary.simpleMessage("Elimina"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Elimina commento"),
    "details": MessageLookupByLibrary.simpleMessage("Dettagli"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Elenco dispositivi"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Dispositivi non trovati. Assicurati che il Bluetooth del telefono sia attivo e che il dispositivo sia nel raggio d\'azione.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Durata"),
    "edit": MessageLookupByLibrary.simpleMessage("Modifica"),
    "edited": MessageLookupByLibrary.simpleMessage("Modificato"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Codice email",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Formato email non valido.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "L\'email è obbligatoria.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage("Verifica email"),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Segui le istruzioni contenute nell\'email per completare la procedura di registrazione. Nota: se non trovi l\'email, controlla la cartella \'spam\' o prova a reinviarla cliccando sul pulsante \'Reinvia\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Una email con i dettagli per la verifica è stata inviata all\'indirizzo email specificato",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Email verificata"),
    "entityType": MessageLookupByLibrary.simpleMessage("Tipo di entità"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Francoforte"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare i dettagli dell\'allarme",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare l\'elenco",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Dettagli dell\'errore",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nome"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Il nome è obbligatorio.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Nome"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hours": MessageLookupByLibrary.simpleMessage("ore"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Non sono un robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inattivo"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Utente inattivo già esistente",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Esiste già un utente registrato con un indirizzo email non verificato.\nClicca sul pulsante \'Reinvia\' se desideri ricevere nuovamente l\'email di verifica.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "La password deve contenere almeno 6 caratteri",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Etichetta"),
    "lastName": MessageLookupByLibrary.simpleMessage("Cognome"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Il cognome è obbligatorio.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Cognome"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "L\'elenco è attualmente vuoto.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Accedi"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logo ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Disconnetti"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Codice di backup",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "App di autenticazione",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minuti"),
    "more": MessageLookupByLibrary.simpleMessage("Altro"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nuova password"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Conferma nuova password",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "La conferma della nuova password è obbligatoria.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "La nuova password è obbligatoria.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Nuovo utente?"),
    "next": MessageLookupByLibrary.simpleMessage("Avanti"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Nessun risultato trovato",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("America del Nord"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Non implementato!"),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("OPPURE"),
    "originator": MessageLookupByLibrary.simpleMessage("Origine"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Le password inserite devono coincidere!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Password dimenticata?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "La password è obbligatoria.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage("Reimposta password"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Il link per reimpostare la password è stato inviato con successo!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Inserisci l\'email associata al tuo account e ti invieremo un\'email con il link per reimpostare la password",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Password cambiata con successo",
    ),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Telefono"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("CAP / Codice postale"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Informativa sulla privacy",
    ),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilo aggiornato con successo",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Dispositivo configurato con successo",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Aggiorna"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Ripeti la password",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Richiedi reimpostazione della password",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Reinvia"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reinvia codice"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Torna alla dashboard",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("secondi"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Seleziona regione"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Seleziona utenti"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Seleziona un metodo di verifica",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Invio credenziali Wi-Fi",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Gravità"),
    "signIn": MessageLookupByLibrary.simpleMessage("Accedi"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrati"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Codice SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Qualcosa è andato storto",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Ora di inizio"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Stato / Provincia",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Stato"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Amministratore di sistema",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Amministratore tenant",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Termini di utilizzo"),
    "title": MessageLookupByLibrary.simpleMessage("Titolo"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Codice"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Inserisci il codice di sicurezza dalla tua app di autenticazione.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Riprova"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Prova un altro metodo",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Prova a raffinare la tua ricerca",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Prova ad aggiornare",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Tipo"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Non assegnato"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Aggiornamento richiesto",
    ),
    "updateTo": m22,
    "username": MessageLookupByLibrary.simpleMessage("nome utente"),
    "users": MessageLookupByLibrary.simpleMessage("Utenti"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Il codice di verifica è errato",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Formato del codice di verifica non valido",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Troppe richieste, controlla il codice di verifica",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifica la tua identità",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage(
      "Visualizza dashboard",
    ),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Password Wi-Fi"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Sì"),
  };
}

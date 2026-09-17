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

  static String m1(authority) =>
      "Sei sicuro? Stai per eliminare il tuo account ${authority}.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Allarme', other: 'Allarmi')}";

  static String m3(providerName) =>
      "Sei sicuro di voler disattivare ${providerName}?";

  static String m4(deviceName) =>
      "Impossibile stabilire una sessione con il dispositivo ${deviceName}. Riprova";

  static String m5(link) => "Impossibile aprire l\'url: ${link}";

  static String m6(wifiName) => "Connettiti al Wi-Fi simile a ${wifiName}";

  static String m7(name) =>
      "Connessione alla rete Wi-Fi ${name} fallita.\nAssicurati che il telefono sia connesso alla rete Wi-Fi del dispositivo e che l\'accesso alla rete locale sia abilitato per questa app.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboard')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Eliminare 1 notifica?', other: 'Eliminare ${count} notifiche?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Dispositivo', other: 'Dispositivi')}";

  static String m11(count) =>
      "Codice a ${count} ${Intl.plural(count, one: 'cifra', other: 'cifre')}";

  static String m12(contact) =>
      "Un codice di sicurezza è stato inviato alla tua email all\'indirizzo ${contact}.";

  static String m13(e) => "Errore verificatosi: ${e}";

  static String m14(error) => "Errore nell\'invio del codice: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 operazione non riuscita', other: '${count} operazioni non riuscite')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'Segnare 1 notifica come letta?', other: 'Segnare ${count} notifiche come lette?')}";

  static String m17(count) => "${count} selezionati";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Notifica', other: 'Notifiche')}";

  static String m19(permissions) =>
      "Non hai i permessi necessari per \"${permissions}\" per procedere. Apri le impostazioni dell\'app, concedi i permessi e tocca \"Riprova\".";

  static String m20(permissions) =>
      "Non hai i permessi necessari per \"${permissions}\" per procedere. Concedi i permessi richiesti e tocca \"Riprova\".";

  static String m21(deviceName) =>
      "Inserisci il PIN di ${deviceName} per confermare la prova di possesso";

  static String m22(time) =>
      "Reinvia codice tra ${Intl.plural(time, one: '1 secondo', other: '${time} secondi')}";

  static String m23(name) => "Percorso non definito: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Cerca utente', other: 'Cerca utenti')}";

  static String m25(contact) =>
      "Un codice di sicurezza è stato inviato al tuo telefono al numero ${contact}.";

  static String m26(name) =>
      "Impossibile connettersi al Wi-Fi perché il dispositivo ${name} non ha trovato reti";

  static String m27(version) => "Aggiorna a ${version}";

  static String m28(deviceName) =>
      "Per continuare la configurazione del dispositivo ${deviceName}, fornisci le credenziali della tua rete.";

  static String m29(network) => "Inserisci la password per ${network}";

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
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Conferma"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Confermato"),
    "actionData": MessageLookupByLibrary.simpleMessage("Dati azione"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Fallimento"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Successo"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Attivato"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Aggiunto"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Commento aggiunto",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Confermato"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Allarme assegnato",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Cancellato"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Allarme eliminato",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Allarme non assegnato",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Assegnato dal tenant",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Assegnato al cliente",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Assegnato a Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Assegnato al tenant",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributi eliminati",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributi letti",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributi aggiornati",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Credenziali lette",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Credenziali aggiornate",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Eliminato"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Commento eliminato",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Bloccato"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Accesso"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Disconnessione"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Provisioning fallito",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Dispositivo fornito",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relazione aggiornata",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relazione eliminata",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Tutte le relazioni eliminate",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("Chiamata RPC"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS inviato"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Sospeso"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetria eliminata",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetria aggiornata",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Rimosso dal cliente",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Rimosso da Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Aggiornato"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Commento aggiornato",
    ),
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
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Aggiungi metodo di verifica",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Indirizzo"),
    "address2": MessageLookupByLibrary.simpleMessage("Indirizzo 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Impostazioni amministratore",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("Modello IA"),
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
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Lista gravità allarme",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage(
      "Lista stati allarme",
    ),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage(
      "Lista tipi di allarme",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Tipi di allarme"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Tutti"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Tutti i dispositivi"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Consenti accesso"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Hai già un account?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Ricevuti dati di richiesta vuoti.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Qualsiasi tipo"),
    "apiKey": MessageLookupByLibrary.simpleMessage("Chiave API"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("Stato utilizzo API"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Applica modifiche"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Sei sicuro?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nome asset"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Profilo asset"),
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
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Inserisci uno dei tuoi codici di backup.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Codice di backup",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Al prossimo accesso potrai usare i codici di backup per l\'autenticazione a due fattori",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Per eseguire il provisioning del tuo nuovo dispositivo, assicurati che il Bluetooth del telefono sia attivo e che il dispositivo sia nel raggio d\'azione",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Campo calcolato"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
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
    "cleared": MessageLookupByLibrary.simpleMessage("Cancellato"),
    "close": MessageLookupByLibrary.simpleMessage("Chiudi"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Verifica del codice fallita!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Devi confermare di non essere un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Conferma"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Conferma connessione Wi-Fi",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Connetti al dispositivo",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Connettiti al Wi-Fi che usi abitualmente",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Connessione al dispositivo",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Errore di connessione",
    ),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Continua"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copiato negli appunti",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copia"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Copia la chiave a 32 cifre nella tua app di autenticazione o scansiona il codice QR qui sotto",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Paese"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Crea account"),
    "createPassword": MessageLookupByLibrary.simpleMessage("Crea una password"),
    "critical": MessageLookupByLibrary.simpleMessage("Critico"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Password attuale"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "La password attuale è obbligatoria.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
    "customers": MessageLookupByLibrary.simpleMessage("Clienti"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("giorni"),
    "delete": MessageLookupByLibrary.simpleMessage("Elimina"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Elimina account"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Elimina commento"),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Dettagli"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Elenco dispositivi"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Il dispositivo non riesce a trovare Wi-Fi nelle vicinanze",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Dispositivi non trovati. Assicurati che il Bluetooth del telefono sia attivo e che il dispositivo sia nel raggio d\'azione.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage(
      "Profilo dispositivo",
    ),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Provisioning del dispositivo",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Annulla modifiche"),
    "domain": MessageLookupByLibrary.simpleMessage("Dominio"),
    "done": MessageLookupByLibrary.simpleMessage("Fatto"),
    "duration": MessageLookupByLibrary.simpleMessage("Durata"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Modifica"),
    "edited": MessageLookupByLibrary.simpleMessage("Modificato"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Codice email",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Formato email non valido.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "L\'email è obbligatoria.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Al prossimo accesso ti verrà chiesto di inserire il codice di sicurezza inviato al tuo indirizzo email",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage("Verifica email"),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Segui le istruzioni contenute nell\'email per completare la procedura di registrazione. Nota: se non trovi l\'email, controlla la cartella \'spam\' o prova a reinviarla cliccando sul pulsante \'Reinvia\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Una email con i dettagli per la verifica è stata inviata all\'indirizzo email specificato",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Email verificata"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Inserisci il codice a 6 cifre dalla tua app qui:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Inserisci un numero di telefono da usare come autenticatore",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Inserisci un\'email da usare come autenticatore.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Tipo di entità"),
    "entityView": MessageLookupByLibrary.simpleMessage("Vista entità"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Francoforte"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Esci dal provisioning",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Connessione al server fallita",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare i dettagli dell\'allarme",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare l\'elenco",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Dettagli dell\'errore",
    ),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Si è verificato un errore fatale dell\'applicazione:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Errore fatale"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtri"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase non è configurato.\nConsulta la documentazione ufficiale di Firebase\nper le istruzioni.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nome"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Il nome è obbligatorio.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Nome"),
    "goBack": MessageLookupByLibrary.simpleMessage("Indietro"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Nascondi barra degli strumenti della dashboard",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage(
      "Dashboard principale",
    ),
    "hours": MessageLookupByLibrary.simpleMessage("ore"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Ibrido"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Non sono un robot"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperiale"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inattivo"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Utente inattivo già esistente",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Esiste già un utente registrato con un indirizzo email non verificato.\nClicca sul pulsante \'Reinvia\' se desideri ricevere nuovamente l\'email di verifica.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Indeterminato"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "La password deve contenere almeno 6 caratteri",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("è obbligatorio."),
    "job": MessageLookupByLibrary.simpleMessage("Lavoro"),
    "label": MessageLookupByLibrary.simpleMessage("Etichetta"),
    "language": MessageLookupByLibrary.simpleMessage("Lingua"),
    "lastName": MessageLookupByLibrary.simpleMessage("Cognome"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Il cognome è obbligatorio.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Cognome"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "L\'elenco è attualmente vuoto.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Accedi"),
    "loginToApp": MessageLookupByLibrary.simpleMessage("Accedi all\'app"),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Accedi al tuo account",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Accedi con"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logo ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Disconnetti"),
    "major": MessageLookupByLibrary.simpleMessage("Grave"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Segna tutto come letto",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Segna come letto"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Metrico"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Codice di backup",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "App di autenticazione",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Minore"),
    "minutes": MessageLookupByLibrary.simpleMessage("minuti"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("App mobile"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Pacchetto app mobile",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "La dashboard mobile deve essere configurata nel profilo del dispositivo!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Altro"),
    "nSelected": m17,
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
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Nessun provider 2FA trovato",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Nessun allarme trovato",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Nessuna dashboard trovata",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Nessuna notifica trovata",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Nessun risultato trovato",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("America del Nord"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Non trovato"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Non implementato!"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Richiesta di notifica",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Regola di notifica",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Destinatario notifica",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Modello di notifica",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("Client OAuth2"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Apri impostazioni app",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Apri le impostazioni e concedi l\'accesso alla fotocamera per continuare",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Apri impostazioni Wi-Fi",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OPPURE"),
    "originator": MessageLookupByLibrary.simpleMessage("Origine"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("Pacchetto OTA"),
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
    "permissions": MessageLookupByLibrary.simpleMessage("Permessi"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Telefono"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Il numero di telefono non è valido",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Il telefono è obbligatorio",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Numero di telefono in formato E.164, es. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Contatta il tuo amministratore di sistema",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Segui i prossimi passaggi per connettere il tuo telefono al dispositivo",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Segui i prossimi passaggi per riconnettere\nil tuo telefono al Wi-Fi abituale",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Scansiona il codice QR sul tuo dispositivo",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Tipo di allarme"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("CAP / Codice postale"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Informativa sulla privacy",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profilo"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profilo aggiornato con successo",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Dispositivo configurato con successo",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Le notifiche push non sono configurate.\nContatta il tuo amministratore di sistema.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Coda"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Statistiche coda"),
    "ready": MessageLookupByLibrary.simpleMessage("Pronto"),
    "refresh": MessageLookupByLibrary.simpleMessage("Aggiorna"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Ripeti la password",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Richiedi reimpostazione della password",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "L\'entità richiesta non esiste.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Reinvia"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reinvia codice"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Reimposta"),
    "retry": MessageLookupByLibrary.simpleMessage("Riprova"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Torna alla dashboard",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Torna all\'app e tocca il pulsante Pronto",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Catena di regole"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Nodo di regole"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Scansiona un codice"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Scansiona codice QR"),
    "search": MessageLookupByLibrary.simpleMessage("Cerca"),
    "searchResults": MessageLookupByLibrary.simpleMessage(
      "Risultati della ricerca",
    ),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("secondi"),
    "security": MessageLookupByLibrary.simpleMessage("Sicurezza"),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "Seleziona tutti i caricati",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Seleziona paese"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Seleziona regione"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Seleziona utenti"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Seleziona un metodo di verifica",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Seleziona rete Wi-Fi",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Invia codice"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Invio credenziali Wi-Fi",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Configura un metodo di verifica",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Configura un metodo di verifica per continuare con l\'accesso",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Gravità"),
    "signIn": MessageLookupByLibrary.simpleMessage("Accedi"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrati"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Codice SMS"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Al prossimo accesso ti verrà chiesto di inserire il codice di sicurezza inviato al numero di telefono",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Qualcosa è andato storto",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Qualcosa è andato storto ... Ripristino",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Ora di inizio"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Stato / Provincia",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Stato"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Amministratore di sistema",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Risorsa"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Amministratore tenant",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Profilo tenant"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Termini di utilizzo"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Questa azione non può essere annullata",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Questo renderà il tuo account meno sicuro",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titolo"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Cambia fotocamera"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage(
      "Attiva/disattiva flash",
    ),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Codice"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Inserisci il codice di sicurezza dalla tua app di autenticazione.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Al prossimo accesso dovrai fornire un codice di autenticazione a due fattori",
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
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Autenticazione a due fattori",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "L\'autenticazione a due fattori è richiesta",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "L\'autenticazione a due fattori protegge il tuo account da accessi non autorizzati. Devi solo inserire un codice di sicurezza quando accedi.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Tipo"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Impossibile connettersi al dispositivo",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Impossibile usare la fotocamera",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Non confermato"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Non assegnato"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Sistema di unità"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Errore sconosciuto."),
    "unread": MessageLookupByLibrary.simpleMessage("Non letto"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Modifiche non salvate",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Aggiorna"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Aggiornamento richiesto",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Utente"),
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
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verifica richiesta",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifica la tua identità",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Visualizza tutto"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage(
      "Visualizza dashboard",
    ),
    "warning": MessageLookupByLibrary.simpleMessage("Avviso"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Tipo di widget"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Pacchetto widget"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Password Wi-Fi"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Sì"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Sì, disattiva"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Sì, annulla"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Hai modifiche non salvate. Sei sicuro di voler lasciare questa pagina?",
        ),
  };
}

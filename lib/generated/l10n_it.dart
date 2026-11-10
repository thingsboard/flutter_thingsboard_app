// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class SIt extends S {
  SIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Home';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivi',
      one: 'Dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Altro';

  @override
  String get customers => 'Clienti';

  @override
  String get assets => 'Asset';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Log di controllo';

  @override
  String get noCustomersFound => 'No customers found';

  @override
  String get noAssetsFound => 'No assets found';

  @override
  String get noTenantsFound => 'No tenants found';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get noAuditLogsFound => 'No audit logs found';

  @override
  String get logout => 'Disconnetti';

  @override
  String get login => 'Accedi';

  @override
  String get logoDefaultValue => 'Logo ThingsBoard';

  @override
  String get loginToYourAccount => 'Accedi al tuo account';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'L\'email è obbligatoria.';

  @override
  String get emailInvalidText => 'Formato email non valido.';

  @override
  String get username => 'nome utente';

  @override
  String get password => 'Password';

  @override
  String get passwordRequireText => 'La password è obbligatoria.';

  @override
  String get passwordForgotText => 'Password dimenticata?';

  @override
  String get passwordReset => 'Reimposta password';

  @override
  String get passwordResetText =>
      'Inserisci l\'email associata al tuo account e ti invieremo un\'email con il link per reimpostare la password';

  @override
  String get requestPasswordReset => 'Richiedi reimpostazione della password';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Il link per reimpostare la password è stato inviato con successo!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Il link di verifica email è stato inviato con successo!';

  @override
  String get or => 'OPPURE';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sì';

  @override
  String get title => 'Titolo';

  @override
  String get country => 'Paese';

  @override
  String get city => 'Città';

  @override
  String get stateOrProvince => 'Stato / Provincia';

  @override
  String get postalCode => 'CAP / Codice postale';

  @override
  String get address => 'Indirizzo';

  @override
  String get address2 => 'Indirizzo 2';

  @override
  String get phone => 'Telefono';

  @override
  String get alarmClearTitle => 'Cancella Allarme';

  @override
  String get alarmClearText => 'Sei sicuro di voler cancellare l\'allarme?';

  @override
  String get alarmAcknowledgeTitle => 'Conferma Allarme';

  @override
  String get alarmAcknowledgeText =>
      'Sei sicuro di voler confermare l\'allarme?';

  @override
  String get assetName => 'Nome asset';

  @override
  String get type => 'Tipo';

  @override
  String get label => 'Etichetta';

  @override
  String get assignedToCustomer => 'Assegnato al cliente';

  @override
  String get auditLogDetails => 'Dettagli log di controllo';

  @override
  String get entityType => 'Tipo di entità';

  @override
  String get actionData => 'Dati azione';

  @override
  String get failureDetails => 'Dettagli dell\'errore';

  @override
  String get allDevices => 'Tutti i dispositivi';

  @override
  String get active => 'Attivo';

  @override
  String get inactive => 'Inattivo';

  @override
  String get systemAdministrator => 'Amministratore di sistema';

  @override
  String get tenantAdministrator => 'Amministratore tenant';

  @override
  String get customer => 'Cliente';

  @override
  String get changePassword => 'Cambia password';

  @override
  String get currentPasswordRequireText =>
      'La password attuale è obbligatoria.';

  @override
  String get currentPassword => 'Password attuale';

  @override
  String get newPasswordRequireText => 'La nuova password è obbligatoria.';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get newPassword2RequireText =>
      'La conferma della nuova password è obbligatoria.';

  @override
  String get newPassword2 => 'Conferma nuova password';

  @override
  String get passwordErrorNotification =>
      'Le password inserite devono coincidere!';

  @override
  String get firstNameUpper => 'Nome';

  @override
  String get lastNameUpper => 'Cognome';

  @override
  String get profileSuccessNotification => 'Profilo aggiornato con successo';

  @override
  String get passwordSuccessNotification => 'Password cambiata con successo';

  @override
  String get notImplemented => 'Non implementato!';

  @override
  String get listIsEmptyText => 'L\'elenco è attualmente vuoto.';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get verifyYourIdentity => 'Verifica la tua identità';

  @override
  String get continueText => 'Continua';

  @override
  String get resendCode => 'Reinvia codice';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time secondi',
      one: '1 secondo',
    );
    return 'Reinvia codice tra $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Inserisci il codice di sicurezza dalla tua app di autenticazione.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Un codice di sicurezza è stato inviato al tuo telefono al numero $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Un codice di sicurezza è stato inviato alla tua email all\'indirizzo $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Inserisci uno dei tuoi codici di backup.';

  @override
  String get verificationCodeInvalid =>
      'Formato del codice di verifica non valido';

  @override
  String get toptAuthPlaceholder => 'Codice';

  @override
  String get smsAuthPlaceholder => 'Codice SMS';

  @override
  String get emailAuthPlaceholder => 'Codice email';

  @override
  String get backupCodeAuthPlaceholder => 'Codice di backup';

  @override
  String get verificationCodeIncorrect => 'Il codice di verifica è errato';

  @override
  String get verificationCodeManyRequest =>
      'Troppe richieste, controlla il codice di verifica';

  @override
  String get tryAnotherWay => 'Prova un altro metodo';

  @override
  String get selectWayToVerify => 'Seleziona un metodo di verifica';

  @override
  String get mfaProviderTopt => 'App di autenticazione';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Codice di backup';

  @override
  String get newUserText => 'Nuovo utente?';

  @override
  String get createAccount => 'Crea account';

  @override
  String get emailVerification => 'Verifica email';

  @override
  String get emailVerificationSentText =>
      'Una email con i dettagli per la verifica è stata inviata all\'indirizzo email specificato';

  @override
  String get emailVerificationInstructionsText =>
      'Segui le istruzioni contenute nell\'email per completare la procedura di registrazione. Nota: se non trovi l\'email, controlla la cartella \'spam\' o prova a reinviarla cliccando sul pulsante \'Reinvia\'.';

  @override
  String get resend => 'Reinvia';

  @override
  String get activatingAccount => 'Attivazione account in corso...';

  @override
  String get accountActivated => 'Account attivato con successo!';

  @override
  String get emailVerified => 'Email verificata';

  @override
  String get activatingAccountText =>
      'Il tuo account è in fase di attivazione.\nAttendere...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Congratulazioni!\nIl tuo account $appTitle è stato attivato.\nOra puoi accedere al tuo spazio $appTitle.';
  }

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get cancel => 'Annulla';

  @override
  String get accept => 'Accetta';

  @override
  String get termsOfUse => 'Termini di utilizzo';

  @override
  String get firstName => 'Nome';

  @override
  String get firstNameRequireText => 'Il nome è obbligatorio.';

  @override
  String get lastName => 'Cognome';

  @override
  String get lastNameRequireText => 'Il cognome è obbligatorio.';

  @override
  String get createPassword => 'Crea una password';

  @override
  String get repeatPassword => 'Ripeti la password';

  @override
  String get imNotARobot => 'Non sono un robot';

  @override
  String get signUp => 'Registrati';

  @override
  String get alreadyHaveAnAccount => 'Hai già un account?';

  @override
  String get signIn => 'Accedi';

  @override
  String get inactiveUserAlreadyExists => 'Utente inattivo già esistente';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Esiste già un utente registrato con un indirizzo email non verificato.\nClicca sul pulsante \'Reinvia\' se desideri ricevere nuovamente l\'email di verifica.';

  @override
  String get assignee => 'Assegnatario';

  @override
  String get alarmTypes => 'Tipi di allarme';

  @override
  String get details => 'Dettagli';

  @override
  String get status => 'Stato';

  @override
  String get severity => 'Gravità';

  @override
  String get originator => 'Origine';

  @override
  String get startTime => 'Ora di inizio';

  @override
  String get duration => 'Durata';

  @override
  String get days => 'giorni';

  @override
  String get hours => 'ore';

  @override
  String get minutes => 'minuti';

  @override
  String get seconds => 'secondi';

  @override
  String get viewDashboard => 'Visualizza dashboard';

  @override
  String get activity => 'Attività';

  @override
  String get addCommentMessage => 'Aggiungi un commento...';

  @override
  String get selectUser => 'Seleziona utenti';

  @override
  String get assignedToMe => 'Assegnato a me';

  @override
  String get clear => 'Cancella';

  @override
  String get acknowledge => 'Conferma';

  @override
  String get edit => 'Modifica';

  @override
  String get delete => 'Elimina';

  @override
  String get edited => 'Modificato';

  @override
  String get deleteComment => 'Elimina commento';

  @override
  String get areYouSure => 'Sei sicuro?';

  @override
  String get noResultsFound => 'Nessun risultato trovato';

  @override
  String get tryRefiningYourQuery => 'Prova a raffinare la tua ricerca';

  @override
  String get failedToLoadTheList => 'Impossibile caricare l\'elenco';

  @override
  String get tryRefreshing => 'Prova ad aggiornare';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get users => 'Utenti';

  @override
  String get unassigned => 'Non assegnato';

  @override
  String get failedToLoadAlarmDetails =>
      'Impossibile caricare i dettagli dell\'allarme';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto';

  @override
  String get chooseRegion => 'Scegli una regione';

  @override
  String get selectRegion => 'Seleziona regione';

  @override
  String get northAmerica => 'America del Nord';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Francoforte';

  @override
  String get deviceList => 'Elenco dispositivi';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dashboard',
      one: 'Dashboard',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Aggiornamento richiesto';

  @override
  String updateTo(Object version) {
    return 'Aggiorna a $version';
  }

  @override
  String get next => 'Avanti';

  @override
  String get confirmation => 'Conferma';

  @override
  String get wifiPassword => 'Password Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Per continuare la configurazione del dispositivo $deviceName, fornisci le credenziali della tua rete.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Inserisci la password per $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Dispositivi non trovati. Assicurati che il Bluetooth del telefono sia attivo e che il dispositivo sia nel raggio d\'azione.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Non hai i permessi necessari per \"$permissions\" per procedere. Concedi i permessi richiesti e tocca \"Riprova\".';
  }

  @override
  String get sendingWifiCredentials => 'Invio credenziali Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Conferma connessione Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Dispositivo configurato con successo';

  @override
  String get returnToDashboard => 'Torna alla dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Impossibile stabilire una sessione con il dispositivo $deviceName. Riprova';
  }

  @override
  String get claimingDevice => 'Richiesta dispositivo in corso';

  @override
  String get claimingDeviceDone => 'Richiesta del dispositivo completata';

  @override
  String get claimingMessageSuccess =>
      'Il dispositivo è stato\nrichiesto con successo';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Non hai i permessi necessari per \"$permissions\" per procedere. Apri le impostazioni dell\'app, concedi i permessi e tocca \"Riprova\".';
  }

  @override
  String get scanACode => 'Scansiona un codice';

  @override
  String get allowAccess => 'Consenti accesso';

  @override
  String get toggleCamera => 'Cambia fotocamera';

  @override
  String get toggleFlash => 'Attiva/disattiva flash';

  @override
  String get unableToUseCamera => 'Impossibile usare la fotocamera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Apri le impostazioni e concedi l\'accesso alla fotocamera per continuare';

  @override
  String get notFound => 'Non trovato';

  @override
  String routeNotDefined(Object name) {
    return 'Percorso non definito: $name';
  }

  @override
  String get loginWith => 'Accedi con';

  @override
  String get scanQrCode => 'Scansiona codice QR';

  @override
  String get anEmptyRequestDataReceived => 'Ricevuti dati di richiesta vuoti.';

  @override
  String get somethingWentWrongRollback =>
      'Qualcosa è andato storto ... Ripristino';

  @override
  String get searchResults => 'Risultati della ricerca';

  @override
  String get viewAll => 'Visualizza tutto';

  @override
  String get requestedEntityDoesNotExists => 'L\'entità richiesta non esiste.';

  @override
  String get noAlarmsFound => 'Nessun allarme trovato';

  @override
  String get filters => 'Filtri';

  @override
  String get alarmStatusList => 'Lista stati allarme';

  @override
  String get alarmSeverityList => 'Lista gravità allarme';

  @override
  String get cleared => 'Cancellato';

  @override
  String get acknowledged => 'Confermato';

  @override
  String get unacknowledged => 'Non confermato';

  @override
  String get critical => 'Critico';

  @override
  String get major => 'Grave';

  @override
  String get minor => 'Minore';

  @override
  String get warning => 'Avviso';

  @override
  String get indeterminate => 'Indeterminato';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca utenti',
      one: 'Cerca utente',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Reimposta';

  @override
  String get update => 'Aggiorna';

  @override
  String get alarmTypeList => 'Lista tipi di allarme';

  @override
  String get anyType => 'Qualsiasi tipo';

  @override
  String get plusAlarmType => '+ Tipo di allarme';

  @override
  String get all => 'Tutti';

  @override
  String get unread => 'Non letto';

  @override
  String get close => 'Chiudi';

  @override
  String get codeVerificationFailed => 'Verifica del codice fallita!';

  @override
  String get fatalError => 'Errore fatale';

  @override
  String get unknownError => 'Errore sconosciuto.';

  @override
  String get sessionExpired => 'La sessione è scaduta';

  @override
  String get fatalApplicationErrorOccurred =>
      'Si è verificato un errore fatale dell\'applicazione:';

  @override
  String get connectionError => 'Errore di connessione';

  @override
  String get failedToConnectToServer => 'Connessione al server fallita';

  @override
  String get retry => 'Riprova';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'La dashboard mobile deve essere configurata nel profilo del dispositivo!';

  @override
  String get openWifiSettings => 'Apri impostazioni Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Connettiti al Wi-Fi che usi abitualmente';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Torna all\'app e tocca il pulsante Pronto';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Segui i prossimi passaggi per riconnettere\nil tuo telefono al Wi-Fi abituale';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Le notifiche push non sono configurate.\nContatta il tuo amministratore di sistema.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase non è configurato.\nConsulta la documentazione ufficiale di Firebase\nper le istruzioni.';

  @override
  String get markAllAsRead => 'Segna tutto come letto';

  @override
  String get profile => 'Profilo';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Impossibile aprire l\'url: $link';
  }

  @override
  String get noDashboardsFound => 'Nessuna dashboard trovata';

  @override
  String get openAppSettings => 'Apri impostazioni app';

  @override
  String get connectingToDevice => 'Connessione al dispositivo';

  @override
  String get connectToDevice => 'Connetti al dispositivo';

  @override
  String get selectWifiNetwork => 'Seleziona rete Wi-Fi';

  @override
  String get deviceProvisioning => 'Provisioning del dispositivo';

  @override
  String get permissions => 'Permessi';

  @override
  String get unableConnectToDevice => 'Impossibile connettersi al dispositivo';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Il dispositivo non riesce a trovare Wi-Fi nelle vicinanze';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Connessione alla rete Wi-Fi $name fallita.\nAssicurati che il telefono sia connesso alla rete Wi-Fi del dispositivo e che l\'accesso alla rete locale sia abilitato per questa app.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Impossibile connettersi al Wi-Fi perché il dispositivo $name non ha trovato reti';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Segui i prossimi passaggi per connettere il tuo telefono al dispositivo';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Connettiti al Wi-Fi simile a $wifiName';
  }

  @override
  String get ready => 'Pronto';

  @override
  String get exitDeviceProvisioning => 'Esci dal provisioning';

  @override
  String get noNotificationsFound => 'Nessuna notifica trovata';

  @override
  String get markAsRead => 'Segna come letto';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Scansiona il codice QR sul tuo dispositivo';

  @override
  String get search => 'Cerca';

  @override
  String get tenant => 'Tenant';

  @override
  String get tenantProfile => 'Profilo tenant';

  @override
  String get user => 'Utente';

  @override
  String get asset => 'Asset';

  @override
  String get deviceProfile => 'Profilo dispositivo';

  @override
  String get assetProfile => 'Profilo asset';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Allarmi',
      one: 'Allarme',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Catena di regole';

  @override
  String get ruleNode => 'Nodo di regole';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Vista entità';

  @override
  String get widgetsBundle => 'Pacchetto widget';

  @override
  String get widgetType => 'Tipo di widget';

  @override
  String get apiUsageState => 'Stato utilizzo API';

  @override
  String get tbResource => 'Risorsa';

  @override
  String get otaPackage => 'Pacchetto OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Coda';

  @override
  String get notificationTarget => 'Destinatario notifica';

  @override
  String get notificationTemplate => 'Modello di notifica';

  @override
  String get notificationRequest => 'Richiesta di notifica';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notifiche',
      one: 'Notifica',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Regola di notifica';

  @override
  String get entityGroup => 'Gruppo di entità';

  @override
  String get converter => 'Convertitore';

  @override
  String get integration => 'Integrazione';

  @override
  String get schedulerEvent => 'Evento dello scheduler';

  @override
  String get blobEntity => 'Entità Blob';

  @override
  String get role => 'Ruolo';

  @override
  String get groupPermission => 'Permesso di gruppo';

  @override
  String get actionStatusSuccess => 'Successo';

  @override
  String get actionStatusFailure => 'Fallimento';

  @override
  String get actionTypeAdded => 'Aggiunto';

  @override
  String get actionTypeDeleted => 'Eliminato';

  @override
  String get actionTypeUpdated => 'Aggiornato';

  @override
  String get actionTypeAttributesUpdated => 'Attributi aggiornati';

  @override
  String get actionTypeAttributesDeleted => 'Attributi eliminati';

  @override
  String get actionTypeRpcCall => 'Chiamata RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Credenziali aggiornate';

  @override
  String get actionTypeAssignedToCustomer => 'Assegnato al cliente';

  @override
  String get actionTypeUnassignedFromCustomer => 'Rimosso dal cliente';

  @override
  String get actionTypeActivated => 'Attivato';

  @override
  String get actionTypeSuspended => 'Sospeso';

  @override
  String get actionTypeCredentialsRead => 'Credenziali lette';

  @override
  String get actionTypeAttributesRead => 'Attributi letti';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relazione aggiornata';

  @override
  String get actionTypeRelationDeleted => 'Relazione eliminata';

  @override
  String get actionTypeRelationsDeleted => 'Tutte le relazioni eliminate';

  @override
  String get actionTypeAlarmAck => 'Confermato';

  @override
  String get actionTypeAlarmClear => 'Cancellato';

  @override
  String get actionTypeAlarmDelete => 'Allarme eliminato';

  @override
  String get actionTypeAlarmAssigned => 'Allarme assegnato';

  @override
  String get actionTypeAlarmUnassigned => 'Allarme non assegnato';

  @override
  String get actionTypeLogin => 'Accesso';

  @override
  String get actionTypeLogout => 'Disconnessione';

  @override
  String get actionTypeLockout => 'Bloccato';

  @override
  String get actionTypeAssignedFromTenant => 'Assegnato dal tenant';

  @override
  String get actionTypeAssignedToTenant => 'Assegnato al tenant';

  @override
  String get actionTypeProvisionSuccess => 'Dispositivo fornito';

  @override
  String get actionTypeProvisionFailure => 'Provisioning fallito';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetria aggiornata';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetria eliminata';

  @override
  String get actionTypeAssignedToEdge => 'Assegnato a Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Rimosso da Edge';

  @override
  String get actionTypeAddedComment => 'Commento aggiunto';

  @override
  String get actionTypeUpdatedComment => 'Commento aggiornato';

  @override
  String get actionTypeDeletedComment => 'Commento eliminato';

  @override
  String get actionTypeSmsSent => 'SMS inviato';

  @override
  String get actionTypeAddedToEntityGroup => 'Aggiunto al gruppo di entità';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Rimosso dal gruppo di entità';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Chiamata al motore di regole REST API';

  @override
  String get actionTypeMadePublic => 'Reso pubblico';

  @override
  String get actionTypeMadePrivate => 'Reso privato';

  @override
  String get actionTypeChangeOwner => 'Proprietario cambiato';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Non hai i permessi per eseguire questa operazione!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Sembra che i tuoi permessi non siano sufficienti per completare questa operazione';

  @override
  String get isRequiredText => 'è obbligatorio.';

  @override
  String get no2faProvidersFound => 'Nessun provider 2FA trovato';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Contatta il tuo amministratore di sistema';

  @override
  String errorOccured(Object e) {
    return 'Errore verificatosi: $e';
  }

  @override
  String get unsavedChanges => 'Modifiche non salvate';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Hai modifiche non salvate. Sei sicuro di voler lasciare questa pagina?';

  @override
  String get deleteAccount => 'Elimina account';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Sei sicuro? Stai per eliminare il tuo account $authority.';
  }

  @override
  String get language => 'Lingua';

  @override
  String get metricUnitSystem => 'Metrico';

  @override
  String get imperialUnitSystem => 'Imperiale';

  @override
  String get hybridUnitSystem => 'Ibrido';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Sistema di unità';

  @override
  String get selectCountry => 'Seleziona paese';

  @override
  String get hideHomeDashboardToolbar =>
      'Nascondi barra degli strumenti della dashboard';

  @override
  String get phoneNumberHelperText =>
      'Numero di telefono in formato E.164, es. +1201550123';

  @override
  String get homeDashboard => 'Dashboard principale';

  @override
  String get security => 'Sicurezza';

  @override
  String get twofactorAuthentication => 'Autenticazione a due fattori';

  @override
  String get verificationRequired => 'Verifica richiesta';

  @override
  String get twofactorAuthenticationIsRequired =>
      'L\'autenticazione a due fattori è richiesta';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configura un metodo di verifica per continuare con l\'accesso';

  @override
  String get setUpAVerificationMethod => 'Configura un metodo di verifica';

  @override
  String get totpSetupSuccessDescription =>
      'Al prossimo accesso dovrai fornire un codice di autenticazione a due fattori';

  @override
  String get smsSetupSuccessDescription =>
      'Al prossimo accesso ti verrà chiesto di inserire il codice di sicurezza inviato al numero di telefono';

  @override
  String get emailSetupSuccessDescription =>
      'Al prossimo accesso ti verrà chiesto di inserire il codice di sicurezza inviato al tuo indirizzo email';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Al prossimo accesso potrai usare i codici di backup per l\'autenticazione a due fattori';

  @override
  String get loginToApp => 'Accedi all\'app';

  @override
  String get goBack => 'Indietro';

  @override
  String get done => 'Fatto';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Questo renderà il tuo account meno sicuro';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Sei sicuro di voler disattivare $providerName?';
  }

  @override
  String get yesDeactivate => 'Sì, disattiva';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Inserisci un\'email da usare come autenticatore.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Inserisci un numero di telefono da usare come autenticatore';

  @override
  String get sendCode => 'Invia codice';

  @override
  String errorSendingCode(String error) {
    return 'Errore nell\'invio del codice: $error';
  }

  @override
  String get copy => 'Copia';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Inserisci il codice a 6 cifre dalla tua app qui:';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'cifre',
      one: 'cifra',
    );
    return 'Codice a $count $_temp0';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copia la chiave a 32 cifre nella tua app di autenticazione o scansiona il codice QR qui sotto';

  @override
  String get applyChanges => 'Applica modifiche';

  @override
  String get discardChanges => 'Annulla modifiche';

  @override
  String get yesDiscard => 'Sì, annulla';

  @override
  String get thisActionCannotBeUndone =>
      'Questa azione non può essere annullata';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'L\'autenticazione a due fattori protegge il tuo account da accessi non autorizzati. Devi solo inserire un codice di sicurezza quando accedi.';

  @override
  String get calculatedField => 'Campo calcolato';

  @override
  String get apiKey => 'Chiave API';

  @override
  String get aiModel => 'Modello IA';

  @override
  String get adminSettings => 'Impostazioni amministratore';

  @override
  String get job => 'Lavoro';

  @override
  String get mobileAppBundle => 'Pacchetto app mobile';

  @override
  String get mobileApp => 'App mobile';

  @override
  String get domain => 'Dominio';

  @override
  String get oauth2Client => 'Client OAuth2';

  @override
  String get queueStats => 'Statistiche coda';

  @override
  String get phoneIsRequired => 'Il telefono è obbligatorio';

  @override
  String get phoneIsInvalid => 'Il numero di telefono non è valido';

  @override
  String get addVerificationMethod => 'Aggiungi metodo di verifica';

  @override
  String get imageSavedToGallery => 'Salvato nella \'Galleria immagini\'';

  @override
  String get failedToSaveImage => 'Impossibile salvare l\'immagine';

  @override
  String nSelected(int count) {
    return '$count selezionati';
  }

  @override
  String get selectAll => 'Seleziona tutti i caricati';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operazioni non riuscite',
      one: '1 operazione non riuscita',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminare $count notifiche?',
      one: 'Eliminare 1 notifica?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Segnare $count notifiche come lette?',
      one: 'Segnare 1 notifica come letta?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Getting data from your host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Logging you into the host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Switching you to the new host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Failed to obtain a login token from $host. Please scan a new QR code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Failed to connect to $host';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'The QR code session is no longer valid. Please refresh the QR code and scan again.';

  @override
  String get liveTrackingActive =>
      'Tracciamento della posizione in tempo reale';

  @override
  String get liveTrackingPaused => 'Tracciamento in tempo reale in pausa';

  @override
  String get liveTrackingFixes => 'Posizioni';

  @override
  String get liveTrackingSaved => 'Salvate';

  @override
  String get liveTrackingErrors => 'Errori';

  @override
  String get liveTrackingStop => 'Interrompi';

  @override
  String get liveTrackingPause => 'Pausa';

  @override
  String get liveTrackingResume => 'Riprendi';

  @override
  String get liveTrackingHide => 'Nascondi';

  @override
  String get liveTrackingSessionTitle =>
      'Tracciamento della posizione in tempo reale';

  @override
  String get liveTrackingTarget => 'Salva la posizione nell\'entità';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Stato';

  @override
  String get liveTrackingStarted => 'Ora di inizio';

  @override
  String get liveTrackingLastFix => 'Ultima posizione';

  @override
  String get liveTrackingLastError => 'Ultimo errore';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Impossibile salvare in questa entità: non esiste più. Il tracciamento continua; aggiorna la destinazione nell\'azione della dashboard.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Nessuna connessione al server. Queste posizioni non sono state salvate; il salvataggio riprenderà quando sarai di nuovo online.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'La sessione è terminata. Accedi di nuovo per continuare a salvare la posizione.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Impossibile salvare in questa entità: non hai l\'autorizzazione. Il tracciamento continua; chiedi l\'accesso all\'amministratore.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Impossibile salvare questa posizione sul server. Il salvataggio verrà ritentato con la posizione successiva.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'I servizi di localizzazione sono disattivati su questo dispositivo.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'L\'autorizzazione alla posizione è stata negata.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'L\'autorizzazione alla posizione è negata in modo permanente. Attivala nelle impostazioni dell\'app.';

  @override
  String get liveTrackingErrorLocation => 'Impossibile ottenere la posizione.';

  @override
  String get liveTrackingMenuTitle =>
      'Tracciamento della posizione in tempo reale';

  @override
  String get liveTrackingNoRecord =>
      'Nessun tracciamento attivo e nessuna sessione recente.';

  @override
  String get liveTrackingLastSession => 'Ultima sessione';

  @override
  String get liveTrackingStartAgain => 'Riavvia';

  @override
  String get liveTrackingEnded => 'Ora di fine';

  @override
  String get liveTrackingEndReason => 'Motivo della fine';

  @override
  String get liveTrackingEndReasonManual => 'Interrotto manualmente';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Durata massima raggiunta';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrotto';

  @override
  String get serverUpdateRequired => 'Aggiornamento del server richiesto';

  @override
  String get backToLogin => 'Torna all\'accesso';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Questa app funziona con ThingsBoard $minVersion o versioni successive.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Versione';

  @override
  String get askAdminToUpdateServer =>
      'Chiedi all\'amministratore del server di aggiornarlo.';

  @override
  String get deviceClaimFailed =>
      'Impossibile rivendicare il dispositivo. Riprova.';

  @override
  String get deviceToClaimNotFound =>
      'Dispositivo non trovato. Contatta il fornitore del dispositivo.';
}

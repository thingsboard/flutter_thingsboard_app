// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class SCa extends S {
  SCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Inici';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositius',
      one: 'Dispositiu',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Més';

  @override
  String get customers => 'Clients';

  @override
  String get assets => 'Actius';

  @override
  String get tenants => 'Inquilins';

  @override
  String get auditLogs => 'Registres d\'auditoria';

  @override
  String get noCustomersFound => 'No s\'han trobat clients';

  @override
  String get noAssetsFound => 'No s\'han trobat actius';

  @override
  String get noTenantsFound => 'No s\'han trobat inquilins';

  @override
  String get noDevicesFound => 'No s\'ha trobat cap dispositiu';

  @override
  String get noAuditLogsFound => 'No s\'ha trobat cap registre d\'auditoria';

  @override
  String get logout => 'Tanca la sessió';

  @override
  String get login => 'Inicia la sessió';

  @override
  String get logoDefaultValue => 'Logotip de ThingsBoard';

  @override
  String get loginToYourAccount => 'Inicieu la sessió al vostre compte';

  @override
  String get email => 'Correu electrònic';

  @override
  String get emailRequireText => 'El correu electrònic és obligatori.';

  @override
  String get emailInvalidText => 'El format del correu electrònic no és vàlid.';

  @override
  String get username => 'nom d\'usuari';

  @override
  String get password => 'Contrasenya';

  @override
  String get passwordRequireText => 'La contrasenya és obligatòria.';

  @override
  String get passwordForgotText => 'Heu oblidat la contrasenya?';

  @override
  String get passwordReset => 'Restableix la contrasenya';

  @override
  String get passwordResetText =>
      'Introduïu el correu electrònic associat al vostre compte i us enviarem un correu amb l\'enllaç per restablir la contrasenya';

  @override
  String get requestPasswordReset =>
      'Sol·licita el restabliment de la contrasenya';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'L\'enllaç per restablir la contrasenya s\'ha enviat correctament!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'L\'enllaç de verificació del correu electrònic s\'ha enviat correctament!';

  @override
  String get or => 'O';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sí';

  @override
  String get title => 'Títol';

  @override
  String get country => 'País';

  @override
  String get city => 'Ciutat';

  @override
  String get stateOrProvince => 'Estat / Província';

  @override
  String get postalCode => 'Codi postal';

  @override
  String get address => 'Adreça';

  @override
  String get address2 => 'Adreça 2';

  @override
  String get phone => 'Telèfon';

  @override
  String get alarmClearTitle => 'Resol l\'alarma';

  @override
  String get alarmClearText => 'Esteu segur que voleu resoldre l\'alarma?';

  @override
  String get alarmAcknowledgeTitle => 'Reconeix l\'alarma';

  @override
  String get alarmAcknowledgeText =>
      'Esteu segur que voleu reconèixer l\'alarma?';

  @override
  String get assetName => 'Nom de l\'actiu';

  @override
  String get type => 'Tipus';

  @override
  String get label => 'Etiqueta';

  @override
  String get assignedToCustomer => 'Assignat al client';

  @override
  String get auditLogDetails => 'Detalls del registre d\'auditoria';

  @override
  String get customerDetails => 'Detalls del client';

  @override
  String get assetDetails => 'Detalls d\'actiu';

  @override
  String get tenantDetails => 'Detalls de l\'inquilí';

  @override
  String get entityType => 'Tipus d\'entitat';

  @override
  String get actionData => 'Dades d\'acció';

  @override
  String get failureDetails => 'Detalls de l\'error';

  @override
  String get allDevices => 'Tots els dispositius';

  @override
  String get active => 'Actiu';

  @override
  String get inactive => 'Inactiu';

  @override
  String get activeDevices => 'Actius';

  @override
  String get inactiveDevices => 'Inactius';

  @override
  String get alarmStatusActiveAcknowledged => 'Activa reconeguda';

  @override
  String get alarmStatusActiveUnacknowledged => 'Activa no reconeguda';

  @override
  String get alarmStatusClearedAcknowledged => 'Resolta reconeguda';

  @override
  String get alarmStatusClearedUnacknowledged => 'Resolta no reconeguda';

  @override
  String get alarmStatusFilterActive => 'Actives';

  @override
  String get systemAdministrator => 'Administrador del sistema';

  @override
  String get tenantAdministrator => 'Administrador de l\'inquilí';

  @override
  String get customer => 'Client';

  @override
  String get changePassword => 'Canvia la contrasenya';

  @override
  String get currentPasswordRequireText =>
      'La contrasenya actual és obligatòria.';

  @override
  String get currentPassword => 'Contrasenya actual';

  @override
  String get newPasswordRequireText => 'La contrasenya nova és obligatòria.';

  @override
  String get newPassword => 'Nova contrasenya';

  @override
  String get newPassword2RequireText => 'Cal confirmar la contrasenya nova.';

  @override
  String get newPassword2 => 'Repetiu la nova contrasenya';

  @override
  String get passwordErrorNotification =>
      'Les contrasenyes introduïdes han de coincidir!';

  @override
  String get firstNameUpper => 'Nom';

  @override
  String get lastNameUpper => 'Cognom';

  @override
  String get profileSuccessNotification => 'Perfil actualitzat correctament';

  @override
  String get passwordSuccessNotification => 'Contrasenya canviada correctament';

  @override
  String get notImplemented => 'No implementat!';

  @override
  String get listIsEmptyText => 'La llista és buida.';

  @override
  String get tryAgain => 'Torna-ho a provar';

  @override
  String get verifyYourIdentity => 'Verifiqueu la vostra identitat';

  @override
  String get continueText => 'Continua';

  @override
  String get resendCode => 'Torna a enviar el codi';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time segons',
      one: '1 segon',
    );
    return 'Torna a enviar el codi d\'aquí a $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Introduïu el codi de seguretat de la vostra aplicació d\'autenticació.';

  @override
  String smsAuthDescription(Object contact) {
    return 'S\'ha enviat un codi de seguretat al vostre número de telèfon $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'S\'ha enviat un codi de seguretat a la vostra adreça de correu electrònic $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Introduïu un dels vostres codis de reserva.';

  @override
  String get toptAuthPlaceholder => 'Codi';

  @override
  String get smsAuthPlaceholder => 'Codi SMS';

  @override
  String get emailAuthPlaceholder => 'Codi de correu electrònic';

  @override
  String get backupCodeAuthPlaceholder => 'Codi de reserva';

  @override
  String get verificationCodeIncorrect =>
      'El codi de verificació és incorrecte';

  @override
  String get verificationCodeManyRequest =>
      'Massa sol·licituds per comprovar el codi de verificació';

  @override
  String get tryAnotherWay => 'Altres modes de verificació';

  @override
  String get selectWayToVerify => 'Seleccioneu el mode de verificació';

  @override
  String get mfaProviderTopt => 'Aplicació d\'autenticació';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Correu electrònic';

  @override
  String get mfaProviderBackupCode => 'Codi de reserva';

  @override
  String get newUserText => 'Sou un usuari nou?';

  @override
  String get createAccount => 'Crea un compte';

  @override
  String get emailVerification => 'Verificació del correu electrònic';

  @override
  String get emailVerificationSentText =>
      'S\'ha enviat un correu electrònic amb els detalls de verificació a l\'adreça indicada ';

  @override
  String get emailVerificationInstructionsText =>
      'Seguiu les instruccions del correu electrònic per completar el procés de registre. Nota: si no veieu el correu al cap d\'una estona, comproveu la carpeta \'correu brossa\' o torneu a enviar-lo prement el botó \'Torna a enviar\'.';

  @override
  String get resend => 'Torna a enviar';

  @override
  String get activatingAccount => 'S\'està activant el compte...';

  @override
  String get accountActivated => 'El compte s\'ha activat correctament!';

  @override
  String get emailVerified => 'Correu electrònic verificat';

  @override
  String get activatingAccountText =>
      'S\'està activant el vostre compte.\nEspereu…';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Enhorabona!\nEl vostre compte de $appTitle s\'ha activat.\nAra ja podeu iniciar la sessió al vostre espai de $appTitle.';
  }

  @override
  String get privacyPolicy => 'Política de privadesa';

  @override
  String get cancel => 'Cancel·la';

  @override
  String get accept => 'Accepta';

  @override
  String get termsOfUse => 'Condicions d\'ús';

  @override
  String get firstName => 'Nom';

  @override
  String get firstNameRequireText => 'El nom és obligatori.';

  @override
  String get lastName => 'Cognom';

  @override
  String get lastNameRequireText => 'El cognom és obligatori.';

  @override
  String get createPassword => 'Creeu una contrasenya';

  @override
  String get repeatPassword => 'Repetiu la vostra contrasenya';

  @override
  String get imNotARobot => 'No soc un robot';

  @override
  String get signUp => 'Registra\'t';

  @override
  String get alreadyHaveAnAccount => 'Ja teniu un compte?';

  @override
  String get signIn => 'Inicia la sessió';

  @override
  String get inactiveUserAlreadyExists => 'L\'usuari inactiu ja existeix';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Ja hi ha un usuari registrat amb una adreça de correu electrònic no verificada.\nPremeu el botó \'Torna a enviar\' si voleu reenviar el correu de verificació.';

  @override
  String get assignee => 'Persona assignada';

  @override
  String get alarmTypes => 'Tipus d\'alarma';

  @override
  String get details => 'Detalls';

  @override
  String get status => 'Estat';

  @override
  String get severity => 'Gravetat';

  @override
  String get originator => 'Originador';

  @override
  String get startTime => 'Hora d\'inici';

  @override
  String get duration => 'Durada';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dies',
      one: '$value dia',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value hores',
      one: '$value hora',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minuts',
      one: '$value minut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value segons',
      one: '$value segon',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Mostra el tauler';

  @override
  String get activity => 'Activitat';

  @override
  String get addCommentMessage => 'Afegiu un comentari...';

  @override
  String get selectUser => 'Selecciona els usuaris';

  @override
  String get assignedToMe => 'Assignades a mi';

  @override
  String get clear => 'Resol';

  @override
  String get acknowledge => 'Reconeix';

  @override
  String get edit => 'Edita';

  @override
  String get editProfile => 'Edita el perfil';

  @override
  String get delete => 'Suprimeix';

  @override
  String get edited => 'Editat';

  @override
  String get deleteComment => 'Suprimeix el comentari';

  @override
  String get areYouSure => 'Esteu segur?';

  @override
  String get noResultsFound => 'No s\'han trobat resultats';

  @override
  String get tryRefiningYourQuery => 'Proveu d\'afinar la cerca';

  @override
  String get failedToLoadTheList => 'No s\'ha pogut carregar la llista';

  @override
  String get tryRefreshing => 'Proveu d\'actualitzar';

  @override
  String get refresh => 'Actualitza';

  @override
  String get users => 'Usuaris';

  @override
  String get unassigned => 'Sense assignar';

  @override
  String get failedToLoadAlarmDetails =>
      'No s\'han pogut carregar els detalls de l\'alarma';

  @override
  String get somethingWentWrong => 'Alguna cosa ha anat malament';

  @override
  String get chooseRegion => 'Trieu una regió';

  @override
  String get selectRegion => 'Seleccioneu una regió';

  @override
  String get northAmerica => 'Amèrica del Nord';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'Virgínia del Nord';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Llista de dispositius';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Taulers',
      one: 'Tauler',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Cal actualitzar';

  @override
  String updateTo(Object version) {
    return 'Actualitza a $version';
  }

  @override
  String get next => 'Següent';

  @override
  String get confirmation => 'Confirmació';

  @override
  String get wifiPassword => 'Contrasenya de la Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Per continuar la configuració del dispositiu $deviceName, introduïu les credencials de la vostra xarxa.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Introduïu la contrasenya de $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'No s\'ha trobat cap dispositiu. Assegureu-vos que el Bluetooth del telèfon estigui activat i a l\'abast del nou dispositiu.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'No teniu prou permisos (\"$permissions\") per continuar. Concediu els permisos necessaris i toqueu \"Torna-ho a provar\".';
  }

  @override
  String get sendingWifiCredentials => 'S\'estan enviant les credencials Wi-Fi';

  @override
  String get confirmingWifiConnection => 'S\'està confirmant la connexió Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'El dispositiu s\'ha aprovisionat correctament';

  @override
  String get returnToDashboard => 'Torna al tauler';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'No s\'ha pogut establir la sessió amb el dispositiu $deviceName. Torneu-ho a provar';
  }

  @override
  String get claimingDevice => 'S\'està reclamant el dispositiu';

  @override
  String get claimingDeviceDone => 'Reclamació del dispositiu completada';

  @override
  String get claimingMessageSuccess =>
      'El dispositiu s\'ha\nreclamat correctament';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'No teniu prou permisos (\"$permissions\") per continuar. Obriu la configuració de l\'aplicació, concediu els permisos i toqueu \"Torna-ho a provar\".';
  }

  @override
  String get scanACode => 'Escaneja un codi';

  @override
  String get allowAccess => 'Permet l\'accés';

  @override
  String get toggleCamera => 'Commuta la càmera';

  @override
  String get toggleFlash => 'Commuta el flaix';

  @override
  String get unableToUseCamera => 'No es pot utilitzar la càmera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Obriu la configuració i concediu accés a la càmera per continuar';

  @override
  String get notFound => 'No s\'ha trobat';

  @override
  String routeNotDefined(Object name) {
    return 'Ruta no definida: $name';
  }

  @override
  String get loginWith => 'Inicia la sessió amb';

  @override
  String get scanQrCode => 'Escaneja el codi QR';

  @override
  String get anEmptyRequestDataReceived =>
      'S\'han rebut dades de sol·licitud buides.';

  @override
  String get somethingWentWrongRollback =>
      'Alguna cosa ha anat malament... S\'està revertint';

  @override
  String get searchResults => 'Resultats de la cerca';

  @override
  String get viewAll => 'Mostra-ho tot';

  @override
  String get requestedEntityDoesNotExists =>
      'L\'entitat sol·licitada no existeix.';

  @override
  String get noAlarmsFound => 'No s\'han trobat alarmes';

  @override
  String get filters => 'Filtres';

  @override
  String get alarmStatusList => 'Llista d\'estats d\'alarmes';

  @override
  String get alarmSeverityList => 'Llista de gravetat d\'alarmes';

  @override
  String get cleared => 'Resoltes';

  @override
  String get acknowledged => 'Reconegudes';

  @override
  String get unacknowledged => 'No reconegudes';

  @override
  String get critical => 'Crítica';

  @override
  String get major => 'Greu';

  @override
  String get minor => 'Lleu';

  @override
  String get warning => 'Avís';

  @override
  String get indeterminate => 'Indeterminada';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cerca usuaris',
      one: 'Cerca usuari',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Restableix';

  @override
  String get update => 'Actualitza';

  @override
  String get alarmTypeList => 'Llista de tipus d\'alarma';

  @override
  String get anyType => 'Qualsevol tipus';

  @override
  String get plusAlarmType => '+ Tipus d\'alarma';

  @override
  String get all => 'Tots';

  @override
  String get allNotifications => 'Totes';

  @override
  String get unread => 'No llegides';

  @override
  String get close => 'Tanca';

  @override
  String get codeVerificationFailed => 'La verificació del codi ha fallat!';

  @override
  String get fatalError => 'Error fatal';

  @override
  String get unknownError => 'Error desconegut.';

  @override
  String get sessionExpired => 'La sessió ha expirat';

  @override
  String get fatalApplicationErrorOccurred =>
      'S\'ha produït un error fatal de l\'aplicació:';

  @override
  String get connectionError => 'Error de connexió';

  @override
  String get failedToConnectToServer => 'No s\'ha pogut connectar al servidor';

  @override
  String get retry => 'Reintenta';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Cal configurar el tauler mòbil al perfil de dispositiu!';

  @override
  String get openWifiSettings => 'Obre la configuració de Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Connecteu-vos a la Wi-Fi que utilitzeu habitualment';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Torneu a l\'aplicació i toqueu el botó \'A punt\'';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Seguiu els passos següents per tornar a connectar\nel telèfon a la vostra Wi-Fi habitual';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Les notificacions push no estan configurades.\nContacteu amb l\'administrador del sistema.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase no està configurat.\n Consulteu la documentació oficial de Firebase per\n saber com fer-ho.';

  @override
  String get markAllAsRead => 'Marca-ho tot com a llegit';

  @override
  String get profile => 'Perfil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'No es pot obrir l\'URL: $link';
  }

  @override
  String get noDashboardsFound => 'No s\'ha trobat cap tauler';

  @override
  String get openAppSettings => 'Obre la configuració de l\'aplicació';

  @override
  String get connectingToDevice => 'S\'està connectant al dispositiu';

  @override
  String get connectToDevice => 'Connecta\'t al dispositiu';

  @override
  String get selectWifiNetwork => 'Selecciona la xarxa Wi-Fi';

  @override
  String get deviceProvisioning => 'Aprovisionament de dispositius';

  @override
  String get permissions => 'Permisos';

  @override
  String get unableConnectToDevice => 'No s\'ha pogut connectar al dispositiu';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'El dispositiu no pot trobar cap Wi-Fi a prop';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Ha fallat la connexió a la xarxa Wi-Fi $name.\nAssegureu-vos que el telèfon està connectat a la xarxa Wi-Fi del dispositiu i que l\'accés a la xarxa local està activat per a aquesta aplicació a la configuració del telèfon.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'No s\'ha pogut connectar a la Wi-Fi perquè el dispositiu $name no ha trobat cap xarxa';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Seguiu els passos següents per connectar el telèfon al dispositiu';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Connecteu-vos a una Wi-Fi semblant a $wifiName';
  }

  @override
  String get ready => 'A punt';

  @override
  String get exitDeviceProvisioning =>
      'Surt de l\'aprovisionament del dispositiu';

  @override
  String get noNotificationsFound => 'No s\'ha trobat cap notificació';

  @override
  String get markAsRead => 'Marca com a llegida';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Escanegeu el codi QR del dispositiu';

  @override
  String get search => 'Cerca';

  @override
  String get tenant => 'Inquilí';

  @override
  String get tenantProfile => 'Perfil d\'inquilí';

  @override
  String get user => 'Usuari';

  @override
  String get asset => 'Actiu';

  @override
  String get deviceProfile => 'Perfil de dispositiu';

  @override
  String get assetProfile => 'Perfil d\'actiu';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmes',
      one: 'Alarma',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Cadena de regles';

  @override
  String get ruleNode => 'Node de regla';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Vista d\'entitat';

  @override
  String get widgetsBundle => 'Paquet de ginys';

  @override
  String get widgetType => 'Tipus de giny';

  @override
  String get apiUsageState => 'Estat d\'ús de l\'API';

  @override
  String get tbResource => 'Recurs';

  @override
  String get otaPackage => 'Paquet OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Cua';

  @override
  String get notificationTarget => 'Destinatari de notificació';

  @override
  String get notificationTemplate => 'Plantilla de notificació';

  @override
  String get notificationRequest => 'Sol·licitud de notificació';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notificacions',
      one: 'Notificació',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Regla de notificació';

  @override
  String get entityGroup => 'Grup d\'entitats';

  @override
  String get converter => 'Convertidor';

  @override
  String get integration => 'Integració';

  @override
  String get schedulerEvent => 'Esdeveniment del planificador';

  @override
  String get blobEntity => 'Entitat Blob';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Permís de grup';

  @override
  String get actionStatusSuccess => 'Èxit';

  @override
  String get actionStatusFailure => 'Fallada';

  @override
  String get actionTypeAdded => 'Afegit';

  @override
  String get actionTypeDeleted => 'Suprimit';

  @override
  String get actionTypeUpdated => 'Actualitzat';

  @override
  String get actionTypeAttributesUpdated => 'Atributs actualitzats';

  @override
  String get actionTypeAttributesDeleted => 'Atributs suprimits';

  @override
  String get actionTypeRpcCall => 'Trucada RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Credencials actualitzades';

  @override
  String get actionTypeAssignedToCustomer => 'Assignat al client';

  @override
  String get actionTypeUnassignedFromCustomer => 'Desassignat del client';

  @override
  String get actionTypeActivated => 'Activat';

  @override
  String get actionTypeSuspended => 'Suspès';

  @override
  String get actionTypeCredentialsRead => 'Lectura de credencials';

  @override
  String get actionTypeAttributesRead => 'Lectura d\'atributs';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relació actualitzada';

  @override
  String get actionTypeRelationDeleted => 'Relació suprimida';

  @override
  String get actionTypeRelationsDeleted => 'Totes les relacions suprimides';

  @override
  String get actionTypeAlarmAck => 'Alarma reconeguda';

  @override
  String get actionTypeAlarmClear => 'Alarma resolta';

  @override
  String get actionTypeAlarmDelete => 'Alarma suprimida';

  @override
  String get actionTypeAlarmAssigned => 'Alarma assignada';

  @override
  String get actionTypeAlarmUnassigned => 'Alarma desassignada';

  @override
  String get actionTypeLogin => 'Inici de sessió';

  @override
  String get actionTypeLogout => 'Tancament de sessió';

  @override
  String get actionTypeLockout => 'Tancament per bloqueig';

  @override
  String get actionTypeAssignedFromTenant => 'Assignat des de l\'inquilí';

  @override
  String get actionTypeAssignedToTenant => 'Assignat a l\'inquilí';

  @override
  String get actionTypeProvisionSuccess => 'Dispositiu aprovisionat';

  @override
  String get actionTypeProvisionFailure =>
      'Ha fallat l\'aprovisionament del dispositiu';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetria actualitzada';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetria esborrada';

  @override
  String get actionTypeAssignedToEdge => 'Assignat a l\'Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Desassignat de l\'Edge';

  @override
  String get actionTypeAddedComment => 'Comentari afegit';

  @override
  String get actionTypeUpdatedComment => 'Comentari actualitzat';

  @override
  String get actionTypeDeletedComment => 'Comentari suprimit';

  @override
  String get actionTypeSmsSent => 'SMS enviat';

  @override
  String get actionTypeAddedToEntityGroup => 'S\'ha afegit al grup d\'entitats';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'S\'ha eliminat del grup d\'entitats';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Trucada a l\'API REST del motor de regles';

  @override
  String get actionTypeMadePublic => 'Fet públic';

  @override
  String get actionTypeMadePrivate => 'Fet privat';

  @override
  String get actionTypeChangeOwner => 'Propietari canviat';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'No teniu permisos per realitzar aquesta operació.';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Sembla que els vostres permisos no són suficients per completar aquesta operació';

  @override
  String get isRequiredText => 'és un camp obligatori.';

  @override
  String get no2faProvidersFound => 'No s\'han trobat proveïdors de 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Contacteu amb l\'administrador del sistema';

  @override
  String errorOccured(Object e) {
    return 'S\'ha produït un error: $e';
  }

  @override
  String get unsavedChanges => 'Canvis sense desar';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Teniu canvis sense desar. Esteu segur que voleu sortir d\'aquesta pàgina?';

  @override
  String get deleteAccount => 'Suprimeix el compte';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'N\'esteu segur? Se suprimirà el vostre compte ($authority).';
  }

  @override
  String get language => 'Idioma';

  @override
  String get metricUnitSystem => 'Mètric';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Híbrid';

  @override
  String get autoUnitSystem => 'Automàtic';

  @override
  String get languageAuto => 'Automàtic';

  @override
  String get unitSystem => 'Sistema d\'unitats';

  @override
  String get selectCountry => 'Seleccioneu un país';

  @override
  String get hideHomeDashboardToolbar =>
      'Amaga la barra d\'eines del tauler d\'inici';

  @override
  String get phoneNumberHelperText =>
      'Número de telèfon en format E.164, p. ex. +1201550123';

  @override
  String get homeDashboard => 'Tauler d\'inici';

  @override
  String get security => 'Seguretat';

  @override
  String get twofactorAuthentication => 'Autenticació de dos factors';

  @override
  String get verificationRequired => 'Cal verificació';

  @override
  String get twofactorAuthenticationIsRequired =>
      'L\'autenticació de dos factors és obligatòria';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configureu un mètode de verificació per continuar amb l\'inici de sessió';

  @override
  String get setUpAVerificationMethod => 'Configura un mètode de verificació';

  @override
  String get totpSetupSuccessDescription =>
      'La propera vegada que inicieu la sessió, haureu de proporcionar un codi d\'autenticació de dos factors';

  @override
  String get smsSetupSuccessDescription =>
      'La propera vegada que inicieu la sessió, se us demanarà que introduïu el codi de seguretat que s\'enviarà al número de telèfon';

  @override
  String get emailSetupSuccessDescription =>
      'La propera vegada que inicieu la sessió, se us demanarà que introduïu el codi de seguretat que s\'enviarà a la vostra adreça de correu electrònic';

  @override
  String get backupCodeSetupSuccessDescription =>
      'La propera vegada que inicieu la sessió, podreu utilitzar codis de reserva per passar l\'autenticació de dos factors';

  @override
  String get loginToApp => 'Inicia la sessió a l\'aplicació';

  @override
  String get goBack => 'Torna enrere';

  @override
  String get done => 'Fet';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Això farà que el vostre compte sigui menys segur';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Esteu segur que voleu desactivar \'$providerName\'?';
  }

  @override
  String get yesDeactivate => 'Sí, desactiva';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Introduïu una adreça de correu electrònic per utilitzar-la com a autenticador.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Introduïu un número de telèfon per utilitzar-lo com a autenticador';

  @override
  String get sendCode => 'Envia el codi';

  @override
  String errorSendingCode(String error) {
    return 'Error en enviar el codi: $error';
  }

  @override
  String get copy => 'Copia';

  @override
  String get copiedToClipboard => 'S\'ha copiat al porta-retalls';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Introduïu aquí el codi de 6 dígits';

  @override
  String digitsCode(int count) {
    return 'Codi de $count dígits';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copieu la clau de 32 caràcters a l\'aplicació d\'autenticació o escanegeu el codi QR de sota';

  @override
  String get applyChanges => 'Aplica els canvis';

  @override
  String get discardChanges => 'Descarta els canvis';

  @override
  String get yesDiscard => 'Sí, descarta';

  @override
  String get thisActionCannotBeUndone => 'Aquesta acció no es pot desfer';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'L\'autenticació de dos factors protegeix el vostre compte de l\'accés no autoritzat. Tot el que heu de fer és introduir un codi de seguretat en iniciar sessió.';

  @override
  String get calculatedField => 'Camp calculat';

  @override
  String get apiKey => 'Clau de l\'API';

  @override
  String get aiModel => 'Model d\'IA';

  @override
  String get adminSettings => 'Configuració d\'administració';

  @override
  String get job => 'Tasca';

  @override
  String get mobileAppBundle => 'Paquet mòbil';

  @override
  String get mobileApp => 'Aplicació mòbil';

  @override
  String get domain => 'Domini';

  @override
  String get oauth2Client => 'Client OAuth 2.0';

  @override
  String get queueStats => 'Estadístiques de la cua';

  @override
  String get phoneIsRequired => 'El telèfon és obligatori';

  @override
  String get phoneIsInvalid => 'El telèfon no és vàlid';

  @override
  String get addVerificationMethod => 'Afegeix un mètode de verificació';

  @override
  String get imageSavedToGallery =>
      'S\'ha desat a la \'Galeria d\'imatges\' de la plataforma';

  @override
  String get failedToSaveImage => 'No s\'ha pogut desar la imatge';

  @override
  String nSelected(int count) {
    return 'Seleccionades: $count';
  }

  @override
  String get selectAll => 'Selecciona totes les carregades';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Han fallat $count operacions',
      one: 'Ha fallat 1 operació',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Voleu suprimir $count notificacions?',
      one: 'Voleu suprimir 1 notificació?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Voleu marcar $count notificacions com a llegides?',
      one: 'Voleu marcar 1 notificació com a llegida?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'S\'estan obtenint dades del host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'S\'està iniciant la sessió al host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'S\'està canviant al nou host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'No s\'ha pogut obtenir un token d\'inici de sessió de $host. Escanegeu un codi QR nou.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'No s\'ha pogut connectar a $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host no és un servidor ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'La sessió del codi QR ja no és vàlida. Actualitzeu el codi QR i torneu a escanejar.';

  @override
  String get openThisLinkTitle => 'Voleu obrir aquest enllaç?';

  @override
  String get linkOpensSignInPage =>
      'Aquest enllaç obre la pàgina d\'inici de sessió d\'aquest servidor. Es tancarà la sessió del servidor actual.';

  @override
  String get linkOpensSignInPageOnly =>
      'Aquest enllaç obre la pàgina d\'inici de sessió d\'aquest servidor.';

  @override
  String linkSignsInAs(Object email) {
    return 'Aquest enllaç inicia la sessió en aquest servidor com a $email.';
  }

  @override
  String get linkSignsIn =>
      'Aquest enllaç inicia la sessió en aquest servidor.';

  @override
  String get serverConnectionNotSecure =>
      'Aquest servidor no utilitza una connexió segura.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Aquesta aplicació només funciona amb el seu propi servidor i no pot obrir aquest enllaç.';

  @override
  String get liveTrackingActive => 'Seguiment d\'ubicació en directe';

  @override
  String get liveTrackingPaused => 'Seguiment en directe en pausa';

  @override
  String get liveTrackingFixes => 'Posicions';

  @override
  String get liveTrackingSaved => 'Desades';

  @override
  String get liveTrackingErrors => 'Errors';

  @override
  String get liveTrackingStop => 'Atura';

  @override
  String get liveTrackingPause => 'Posa en pausa';

  @override
  String get liveTrackingResume => 'Reprèn';

  @override
  String get liveTrackingHide => 'Amaga';

  @override
  String get liveTrackingSessionTitle => 'Seguiment d\'ubicació en directe';

  @override
  String get liveTrackingTarget => 'Desa la ubicació a l\'entitat';

  @override
  String get liveTrackingDashboard => 'Tauler';

  @override
  String get liveTrackingStatus => 'Estat';

  @override
  String get liveTrackingStarted => 'Hora d\'inici';

  @override
  String get liveTrackingLastFix => 'Última posició';

  @override
  String get liveTrackingLastError => 'Últim error';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'No es pot desar en aquesta entitat, ja no existeix. El seguiment continua; actualitzeu l\'objectiu a l\'acció del tauler.';

  @override
  String get liveTrackingErrorNoConnection =>
      'No hi ha connexió amb el servidor. Aquestes posicions no s\'han desat; el desament es reprendrà quan torneu a estar en línia.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'La sessió ha finalitzat. Torneu a iniciar la sessió per continuar desant la ubicació.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'No es pot desar en aquesta entitat — no teniu permís. El seguiment continua; demaneu a l\'administrador que us hi doni accés.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'No s\'ha pogut desar aquesta posició al servidor. El desament es reintentarà amb la posició següent.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Els serveis d\'ubicació estan desactivats en aquest dispositiu.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'S\'ha denegat el permís d\'ubicació.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'El permís d\'ubicació està denegat permanentment. Activeu-lo a la configuració de l\'aplicació.';

  @override
  String get liveTrackingErrorLocation => 'No s\'ha pogut obtenir cap posició.';

  @override
  String get liveTrackingMenuTitle => 'Seguiment d\'ubicació en directe';

  @override
  String get liveTrackingNoRecord =>
      'No hi ha cap seguiment actiu ni cap sessió recent.';

  @override
  String get liveTrackingLastSession => 'Última sessió';

  @override
  String get liveTrackingStartAgain => 'Torna a començar';

  @override
  String get liveTrackingEnded => 'Hora de fi';

  @override
  String get liveTrackingEndReason => 'Motiu de finalització';

  @override
  String get liveTrackingEndReasonManual => 'Aturat manualment';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'S\'ha arribat a la durada màx.';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interromput';

  @override
  String get serverUpdateRequired => 'Cal actualitzar el servidor';

  @override
  String get backToLogin => 'Torna a l\'inici de sessió';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Aquesta aplicació funciona amb ThingsBoard $minVersion o posterior.';
  }

  @override
  String get serverLabel => 'Servidor';

  @override
  String get versionLabel => 'Versió';

  @override
  String get askAdminToUpdateServer =>
      'Demaneu a l\'administrador del servidor que actualitzi el servidor.';

  @override
  String get deviceClaimFailed =>
      'No s\'ha pogut reclamar el dispositiu. Torneu-ho a provar.';

  @override
  String get deviceToClaimNotFound =>
      'No s\'ha trobat el dispositiu. Contacteu amb el proveïdor del dispositiu.';

  @override
  String get enableAuthenticatorApp => 'Activa l\'aplicació d\'autenticació';

  @override
  String get enableSmsAuthenticator => 'Activa l\'autenticador per SMS';

  @override
  String get enableEmailAuthenticator =>
      'Activa l\'autenticador per correu electrònic';

  @override
  String get getBackupCode => 'Obtén el codi de reserva';

  @override
  String get twoFaTotpDescription =>
      'Utilitzeu aplicacions com Google Authenticator, Authy o Duo al vostre telèfon per autenticar-vos. Es generarà un codi de seguretat per iniciar sessió.';

  @override
  String get twoFaSmsDescription =>
      'Utilitzeu el vostre telèfon per autenticar-vos. Us enviarem un codi de seguretat per SMS quan inicieu la sessió.';

  @override
  String get twoFaEmailDescription =>
      'Utilitzeu un codi de seguretat enviat a la vostra adreça de correu electrònic per autenticar-vos.';

  @override
  String get twoFaBackupCodeDescription =>
      'Aquests codis d\'un sol ús imprimibles us permeten iniciar la sessió quan no teniu el telèfon a mà, per exemple quan viatgeu.';

  @override
  String get openInAuthenticatorApp => 'Obre a l\'aplicació d\'autenticació';

  @override
  String get noAuthenticatorAppFound =>
      'No s\'ha trobat cap aplicació d\'autenticació. Copieu la clau a la vostra aplicació.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'S\'ha activat: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'L\'administrador requereix l\'autenticació de dos factors per a $email.';
  }

  @override
  String get recommended => 'Recomanat';

  @override
  String get addBackupCodesHint =>
      'Afegiu també codis de reserva, així podreu iniciar la sessió si perdeu el telèfon.';

  @override
  String get totpSecretKey => 'Clau secreta';

  @override
  String get backupCodesDescription =>
      'Imprimiu els codis per tenir-los a mà quan els necessiteu per iniciar la sessió al vostre compte. Podeu utilitzar cada codi de reserva una sola vegada.';

  @override
  String get backupCodesWarning =>
      'Un cop sortiu d\'aquesta pàgina, aquests codis no es podran tornar a mostrar. Deseu-los de manera segura amb les opcions següents.';

  @override
  String get downloadTxt => 'Baixa (txt)';
}

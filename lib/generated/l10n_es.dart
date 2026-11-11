// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SEs extends S {
  SEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Inicio';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispositivos',
      one: 'Dispositivo',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Más';

  @override
  String get customers => 'Clientes';

  @override
  String get assets => 'Activos';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Registros de auditoría';

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
  String get logout => 'Cerrar sesión';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logoDefaultValue => 'Logotipo de ThingsBoard';

  @override
  String get loginToYourAccount => 'Inicia sesión en tu cuenta';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailRequireText => 'El correo electrónico es obligatorio.';

  @override
  String get emailInvalidText => 'Formato de correo electrónico inválido.';

  @override
  String get username => 'nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get passwordRequireText => 'La contraseña es obligatoria.';

  @override
  String get passwordForgotText => '¿Olvidaste tu contraseña?';

  @override
  String get passwordReset => 'Restablecer contraseña';

  @override
  String get passwordResetText =>
      'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer la contraseña';

  @override
  String get requestPasswordReset => 'Solicitar restablecimiento de contraseña';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      '¡El enlace para restablecer la contraseña se envió correctamente!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      '¡El enlace de verificación de correo electrónico se envió correctamente!';

  @override
  String get or => 'O';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sí';

  @override
  String get title => 'Título';

  @override
  String get country => 'País';

  @override
  String get city => 'Ciudad';

  @override
  String get stateOrProvince => 'Estado / Provincia';

  @override
  String get postalCode => 'Código postal';

  @override
  String get address => 'Dirección';

  @override
  String get address2 => 'Dirección 2';

  @override
  String get phone => 'Teléfono';

  @override
  String get alarmClearTitle => 'Borrar alarma';

  @override
  String get alarmClearText => '¿Estás seguro de que deseas borrar la alarma?';

  @override
  String get alarmAcknowledgeTitle => 'Reconocer alarma';

  @override
  String get alarmAcknowledgeText =>
      '¿Estás seguro de que deseas reconocer la alarma?';

  @override
  String get assetName => 'Nombre del activo';

  @override
  String get type => 'Tipo';

  @override
  String get label => 'Etiqueta';

  @override
  String get assignedToCustomer => 'Asignado al cliente';

  @override
  String get auditLogDetails => 'Detalles del registro de auditoría';

  @override
  String get customerDetails => 'Detalles del cliente';

  @override
  String get assetDetails => 'Detalles del activo';

  @override
  String get tenantDetails => 'Detalles del inquilino';

  @override
  String get entityType => 'Tipo de entidad';

  @override
  String get actionData => 'Datos de la acción';

  @override
  String get failureDetails => 'Detalles del fallo';

  @override
  String get allDevices => 'Todos los dispositivos';

  @override
  String get active => 'Activo';

  @override
  String get inactive => 'Inactivo';

  @override
  String get systemAdministrator => 'Administrador del sistema';

  @override
  String get tenantAdministrator => 'Administrador del inquilino';

  @override
  String get customer => 'Cliente';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get currentPasswordRequireText =>
      'La contraseña actual es obligatoria.';

  @override
  String get currentPassword => 'Contraseña actual';

  @override
  String get newPasswordRequireText => 'La nueva contraseña es obligatoria.';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get newPassword2RequireText => 'Debes confirmar la nueva contraseña.';

  @override
  String get newPassword2 => 'Confirmar nueva contraseña';

  @override
  String get passwordErrorNotification =>
      '¡Las contraseñas ingresadas deben coincidir!';

  @override
  String get firstNameUpper => 'Nombre';

  @override
  String get lastNameUpper => 'Apellido';

  @override
  String get profileSuccessNotification => 'Perfil actualizado exitosamente';

  @override
  String get passwordSuccessNotification => 'Contraseña cambiada exitosamente';

  @override
  String get notImplemented => '¡No implementado!';

  @override
  String get listIsEmptyText => 'La lista está vacía actualmente.';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get verifyYourIdentity => 'Verifica tu identidad';

  @override
  String get continueText => 'Continuar';

  @override
  String get resendCode => 'Reenviar código';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time segundos',
      one: '1 segundo',
    );
    return 'Reenviar código en $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Por favor, ingresa el código de seguridad de tu aplicación de autenticación.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Se ha enviado un código de seguridad a tu teléfono en $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Se ha enviado un código de seguridad a tu correo electrónico en $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Por favor, ingresa uno de tus códigos de respaldo.';

  @override
  String get toptAuthPlaceholder => 'Código';

  @override
  String get smsAuthPlaceholder => 'Código SMS';

  @override
  String get emailAuthPlaceholder => 'Código de correo';

  @override
  String get backupCodeAuthPlaceholder => 'Código de respaldo';

  @override
  String get verificationCodeIncorrect =>
      'El código de verificación es incorrecto';

  @override
  String get verificationCodeManyRequest =>
      'Demasiadas solicitudes, verifica el código de verificación';

  @override
  String get tryAnotherWay => 'Probar otra forma';

  @override
  String get selectWayToVerify => 'Selecciona una forma de verificación';

  @override
  String get mfaProviderTopt => 'Aplicación de autenticación';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Correo electrónico';

  @override
  String get mfaProviderBackupCode => 'Código de respaldo';

  @override
  String get newUserText => '¿Nuevo usuario?';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get emailVerification => 'Verificación de correo electrónico';

  @override
  String get emailVerificationSentText =>
      'Se ha enviado un correo electrónico con los detalles de verificación a la dirección especificada';

  @override
  String get emailVerificationInstructionsText =>
      'Por favor, sigue las instrucciones proporcionadas en el correo para completar el proceso de registro. Nota: si no ves el correo, revisa tu carpeta de \'spam\' o intenta reenviarlo haciendo clic en el botón \'Reenviar\'.';

  @override
  String get resend => 'Reenviar';

  @override
  String get activatingAccount => 'Activando cuenta...';

  @override
  String get accountActivated => '¡Cuenta activada exitosamente!';

  @override
  String get emailVerified => 'Correo verificado';

  @override
  String get activatingAccountText =>
      'Tu cuenta se está activando.\nPor favor espera...';

  @override
  String accountActivatedText(Object appTitle) {
    return '¡Felicidades!\nTu cuenta de $appTitle ha sido activada.\nAhora puedes iniciar sesión en tu espacio de $appTitle.';
  }

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get cancel => 'Cancelar';

  @override
  String get accept => 'Aceptar';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get firstName => 'Nombre';

  @override
  String get firstNameRequireText => 'El nombre es obligatorio.';

  @override
  String get lastName => 'Apellido';

  @override
  String get lastNameRequireText => 'El apellido es obligatorio.';

  @override
  String get createPassword => 'Crear una contraseña';

  @override
  String get repeatPassword => 'Repetir la contraseña';

  @override
  String get imNotARobot => 'No soy un robot';

  @override
  String get signUp => 'Registrarse';

  @override
  String get alreadyHaveAnAccount => '¿Ya tienes una cuenta?';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get inactiveUserAlreadyExists => 'Ya existe un usuario inactivo';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Ya hay un usuario registrado con una dirección de correo sin verificar.\nHaz clic en \'Reenviar\' si deseas reenviar el correo de verificación.';

  @override
  String get assignee => 'Asignado a';

  @override
  String get alarmTypes => 'Tipos de alarma';

  @override
  String get details => 'Detalles';

  @override
  String get status => 'Estado';

  @override
  String get severity => 'Severidad';

  @override
  String get originator => 'Originador';

  @override
  String get startTime => 'Hora de inicio';

  @override
  String get duration => 'Duración';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value días',
      one: '$value día',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value horas',
      one: '$value hora',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minutos',
      one: '$value minuto',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value segundos',
      one: '$value segundo',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Ver tablero';

  @override
  String get activity => 'Actividad';

  @override
  String get addCommentMessage => 'Agregar un comentario...';

  @override
  String get selectUser => 'Seleccionar usuarios';

  @override
  String get assignedToMe => 'Asignado a mí';

  @override
  String get clear => 'Borrar';

  @override
  String get acknowledge => 'Reconocer';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edited => 'Editado';

  @override
  String get deleteComment => 'Eliminar comentario';

  @override
  String get areYouSure => '¿Estás seguro?';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get tryRefiningYourQuery => 'Por favor, intenta refinar tu consulta';

  @override
  String get failedToLoadTheList => 'No se pudo cargar la lista';

  @override
  String get tryRefreshing => 'Por favor, intenta actualizar';

  @override
  String get refresh => 'Actualizar';

  @override
  String get users => 'Usuarios';

  @override
  String get unassigned => 'Sin asignar';

  @override
  String get failedToLoadAlarmDetails =>
      'No se pudieron cargar los detalles de la alarma';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get chooseRegion => 'Elegir región';

  @override
  String get selectRegion => 'Seleccionar región';

  @override
  String get northAmerica => 'América del Norte';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Lista de dispositivos';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tableros',
      one: 'Tablero',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Actualización requerida';

  @override
  String updateTo(Object version) {
    return 'Actualizar a $version';
  }

  @override
  String get next => 'Siguiente';

  @override
  String get confirmation => 'Confirmación';

  @override
  String get wifiPassword => 'Contraseña de Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Para continuar con la configuración de tu dispositivo $deviceName, proporciona las credenciales de tu red.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Ingresa la contraseña de $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'No se encontraron dispositivos. Asegúrate de que el Bluetooth de tu teléfono esté activado y dentro del alcance de tu nuevo dispositivo.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'No tienes suficientes permisos para \"$permissions\" para continuar. Otorga los permisos necesarios y toca \"Intentar de nuevo\".';
  }

  @override
  String get sendingWifiCredentials => 'Enviando credenciales de Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Confirmando conexión Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'El dispositivo ha sido aprovisionado exitosamente';

  @override
  String get returnToDashboard => 'Volver al tablero';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'No se puede establecer sesión con el dispositivo $deviceName. Por favor, inténtalo de nuevo';
  }

  @override
  String get claimingDevice => 'Reclamando dispositivo';

  @override
  String get claimingDeviceDone => 'Reclamación del dispositivo completada';

  @override
  String get claimingMessageSuccess =>
      'El dispositivo ha sido\nreclamado exitosamente';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'No tienes suficientes permisos para \"$permissions\" para continuar. Abre la configuración de la app, otorga los permisos y toca \"Intentar de nuevo\".';
  }

  @override
  String get scanACode => 'Escanear un código';

  @override
  String get allowAccess => 'Permitir acceso';

  @override
  String get toggleCamera => 'Cambiar cámara';

  @override
  String get toggleFlash => 'Alternar flash';

  @override
  String get unableToUseCamera => 'No se puede usar la cámara';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Abre la configuración y concede acceso a la cámara para continuar';

  @override
  String get notFound => 'No encontrado';

  @override
  String routeNotDefined(Object name) {
    return 'Ruta no definida: $name';
  }

  @override
  String get loginWith => 'Iniciar sesión con';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get anEmptyRequestDataReceived =>
      'Se recibieron datos de solicitud vacíos.';

  @override
  String get somethingWentWrongRollback => 'Algo salió mal ... Revirtiendo';

  @override
  String get searchResults => 'Resultados de búsqueda';

  @override
  String get viewAll => 'Ver todo';

  @override
  String get requestedEntityDoesNotExists => 'La entidad solicitada no existe.';

  @override
  String get noAlarmsFound => 'No se encontraron alarmas';

  @override
  String get filters => 'Filtros';

  @override
  String get alarmStatusList => 'Lista de estados de alarma';

  @override
  String get alarmSeverityList => 'Lista de severidad de alarma';

  @override
  String get cleared => 'Borrado';

  @override
  String get acknowledged => 'Reconocido';

  @override
  String get unacknowledged => 'No reconocido';

  @override
  String get critical => 'Crítico';

  @override
  String get major => 'Mayor';

  @override
  String get minor => 'Menor';

  @override
  String get warning => 'Advertencia';

  @override
  String get indeterminate => 'Indeterminado';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Buscar usuarios',
      one: 'Buscar usuario',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Restablecer';

  @override
  String get update => 'Actualizar';

  @override
  String get alarmTypeList => 'Lista de tipos de alarma';

  @override
  String get anyType => 'Cualquier tipo';

  @override
  String get plusAlarmType => '+ Tipo de alarma';

  @override
  String get all => 'Todo';

  @override
  String get unread => 'No leído';

  @override
  String get close => 'Cerrar';

  @override
  String get codeVerificationFailed => '¡Verificación de código fallida!';

  @override
  String get fatalError => 'Error fatal';

  @override
  String get unknownError => 'Error desconocido.';

  @override
  String get sessionExpired => 'La sesión ha expirado';

  @override
  String get fatalApplicationErrorOccurred => 'Error fatal de la aplicación:';

  @override
  String get connectionError => 'Error de conexión';

  @override
  String get failedToConnectToServer => 'No se pudo conectar al servidor';

  @override
  String get retry => 'Reintentar';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '¡El tablero móvil debe configurarse en el perfil del dispositivo!';

  @override
  String get openWifiSettings => 'Abrir configuración de Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Conéctate al Wi-Fi que usas habitualmente';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Vuelve a la aplicación y toca el botón Listo';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Sigue los siguientes pasos para reconectar\ntu teléfono a tu Wi-Fi habitual';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Las notificaciones push no están configuradas.\nContacta a tu administrador del sistema.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase no está configurado.\nConsulta la documentación oficial de Firebase\npara obtener instrucciones.';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get profile => 'Perfil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'No se puede abrir la url: $link';
  }

  @override
  String get noDashboardsFound => 'No se encontraron tableros';

  @override
  String get openAppSettings => 'Abrir configuración de la app';

  @override
  String get connectingToDevice => 'Conectando al dispositivo';

  @override
  String get connectToDevice => 'Conectar al dispositivo';

  @override
  String get selectWifiNetwork => 'Seleccionar red Wi-Fi';

  @override
  String get deviceProvisioning => 'Aprovisionamiento de dispositivo';

  @override
  String get permissions => 'Permisos';

  @override
  String get unableConnectToDevice => 'No se puede conectar al dispositivo';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'El dispositivo no puede encontrar Wi-Fi cercano';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'La conexión a la red Wi-Fi $name falló.\nAsegúrate de que tu teléfono esté conectado a la red Wi-Fi del dispositivo y que el acceso a la red local esté habilitado para esta app.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'No se puede conectar al Wi-Fi porque el dispositivo $name no encontró redes';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Sigue los siguientes pasos para conectar tu teléfono al dispositivo';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Conéctate al Wi-Fi similar a $wifiName';
  }

  @override
  String get ready => 'Listo';

  @override
  String get exitDeviceProvisioning => 'Salir del aprovisionamiento';

  @override
  String get noNotificationsFound => 'No se encontraron notificaciones';

  @override
  String get markAsRead => 'Marcar como leído';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Escanea el código QR en tu dispositivo';

  @override
  String get search => 'Buscar';

  @override
  String get tenant => 'Inquilino';

  @override
  String get tenantProfile => 'Perfil del inquilino';

  @override
  String get user => 'Usuario';

  @override
  String get asset => 'Activo';

  @override
  String get deviceProfile => 'Perfil del dispositivo';

  @override
  String get assetProfile => 'Perfil del activo';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmas',
      one: 'Alarma',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Cadena de reglas';

  @override
  String get ruleNode => 'Nodo de regla';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Vista de entidad';

  @override
  String get widgetsBundle => 'Paquete de widgets';

  @override
  String get widgetType => 'Tipo de widget';

  @override
  String get apiUsageState => 'Estado de uso de API';

  @override
  String get tbResource => 'Recurso';

  @override
  String get otaPackage => 'Paquete OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Cola';

  @override
  String get notificationTarget => 'Destino de notificación';

  @override
  String get notificationTemplate => 'Plantilla de notificación';

  @override
  String get notificationRequest => 'Solicitud de notificación';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notificaciones',
      one: 'Notificación',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Regla de notificación';

  @override
  String get entityGroup => 'Grupo de entidades';

  @override
  String get converter => 'Convertidor';

  @override
  String get integration => 'Integración';

  @override
  String get schedulerEvent => 'Evento del planificador';

  @override
  String get blobEntity => 'Entidad Blob';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Permiso de grupo';

  @override
  String get actionStatusSuccess => 'Éxito';

  @override
  String get actionStatusFailure => 'Fallo';

  @override
  String get actionTypeAdded => 'Añadido';

  @override
  String get actionTypeDeleted => 'Eliminado';

  @override
  String get actionTypeUpdated => 'Actualizado';

  @override
  String get actionTypeAttributesUpdated => 'Atributos actualizados';

  @override
  String get actionTypeAttributesDeleted => 'Atributos eliminados';

  @override
  String get actionTypeRpcCall => 'Llamada RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Credenciales actualizadas';

  @override
  String get actionTypeAssignedToCustomer => 'Asignado al cliente';

  @override
  String get actionTypeUnassignedFromCustomer => 'Desasignado del cliente';

  @override
  String get actionTypeActivated => 'Activado';

  @override
  String get actionTypeSuspended => 'Suspendido';

  @override
  String get actionTypeCredentialsRead => 'Credenciales leídas';

  @override
  String get actionTypeAttributesRead => 'Atributos leídos';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relación actualizada';

  @override
  String get actionTypeRelationDeleted => 'Relación eliminada';

  @override
  String get actionTypeRelationsDeleted => 'Todas las relaciones eliminadas';

  @override
  String get actionTypeAlarmAck => 'Reconocido';

  @override
  String get actionTypeAlarmClear => 'Borrado';

  @override
  String get actionTypeAlarmDelete => 'Alarma eliminada';

  @override
  String get actionTypeAlarmAssigned => 'Alarma asignada';

  @override
  String get actionTypeAlarmUnassigned => 'Alarma desasignada';

  @override
  String get actionTypeLogin => 'Inicio de sesión';

  @override
  String get actionTypeLogout => 'Cierre de sesión';

  @override
  String get actionTypeLockout => 'Bloqueado';

  @override
  String get actionTypeAssignedFromTenant => 'Asignado desde el inquilino';

  @override
  String get actionTypeAssignedToTenant => 'Asignado al inquilino';

  @override
  String get actionTypeProvisionSuccess => 'Dispositivo aprovisionado';

  @override
  String get actionTypeProvisionFailure => 'Aprovisionamiento fallido';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetría actualizada';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetría eliminada';

  @override
  String get actionTypeAssignedToEdge => 'Asignado a Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Desasignado de Edge';

  @override
  String get actionTypeAddedComment => 'Comentario añadido';

  @override
  String get actionTypeUpdatedComment => 'Comentario actualizado';

  @override
  String get actionTypeDeletedComment => 'Comentario eliminado';

  @override
  String get actionTypeSmsSent => 'SMS enviado';

  @override
  String get actionTypeAddedToEntityGroup => 'Añadido al grupo de entidades';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Eliminado del grupo de entidades';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Llamada al motor de reglas REST API';

  @override
  String get actionTypeMadePublic => 'Hecho público';

  @override
  String get actionTypeMadePrivate => 'Hecho privado';

  @override
  String get actionTypeChangeOwner => 'Propietario cambiado';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      '¡No tiene permisos para realizar esta operación!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Parece que sus permisos no son suficientes para completar esta operación';

  @override
  String get isRequiredText => 'es obligatorio.';

  @override
  String get no2faProvidersFound => 'No se encontraron proveedores 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Contacta a tu administrador del sistema';

  @override
  String errorOccured(Object e) {
    return 'Error ocurrido: $e';
  }

  @override
  String get unsavedChanges => 'Cambios sin guardar';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Tienes cambios sin guardar. ¿Estás seguro de que quieres abandonar esta página?';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String accountDeletionDialogBody(Object authority) {
    return '¿Estás seguro? Vas a eliminar tu cuenta de $authority.';
  }

  @override
  String get language => 'Idioma';

  @override
  String get metricUnitSystem => 'Métrico';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Híbrido';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get selectCountry => 'Seleccionar país';

  @override
  String get hideHomeDashboardToolbar =>
      'Ocultar barra de herramientas del tablero';

  @override
  String get phoneNumberHelperText =>
      'Número de teléfono en formato E.164, ej. +1201550123';

  @override
  String get homeDashboard => 'Tablero de inicio';

  @override
  String get security => 'Seguridad';

  @override
  String get twofactorAuthentication => 'Autenticación de dos factores';

  @override
  String get verificationRequired => 'Verificación requerida';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Se requiere autenticación de dos factores';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configura un método de verificación para continuar con tu inicio de sesión';

  @override
  String get setUpAVerificationMethod => 'Configurar un método de verificación';

  @override
  String get totpSetupSuccessDescription =>
      'La próxima vez que inicies sesión, deberás proporcionar un código de autenticación de dos factores';

  @override
  String get smsSetupSuccessDescription =>
      'La próxima vez que inicies sesión, se te pedirá que ingreses el código de seguridad enviado al número de teléfono';

  @override
  String get emailSetupSuccessDescription =>
      'La próxima vez que inicies sesión, se te pedirá que ingreses el código de seguridad enviado a tu correo electrónico';

  @override
  String get backupCodeSetupSuccessDescription =>
      'La próxima vez que inicies sesión, podrás usar códigos de respaldo para la autenticación de dos factores';

  @override
  String get loginToApp => 'Iniciar sesión en la app';

  @override
  String get goBack => 'Volver';

  @override
  String get done => 'Hecho';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Esto hará que tu cuenta sea menos segura';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '¿Estás seguro de que quieres desactivar $providerName?';
  }

  @override
  String get yesDeactivate => 'Sí, desactivar';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Ingresa un correo electrónico para usar como autenticador.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Ingresa un número de teléfono para usar como autenticador';

  @override
  String get sendCode => 'Enviar código';

  @override
  String errorSendingCode(String error) {
    return 'Error al enviar el código: $error';
  }

  @override
  String get copy => 'Copiar';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Introduce aquí el código de 6 dígitos';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dígitos',
      one: 'dígito',
    );
    return 'Código de $count $_temp0';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copia la clave de 32 dígitos en tu aplicación de autenticación o escanea el código QR a continuación';

  @override
  String get applyChanges => 'Aplicar cambios';

  @override
  String get discardChanges => 'Descartar cambios';

  @override
  String get yesDiscard => 'Sí, descartar';

  @override
  String get thisActionCannotBeUndone => 'Esta acción no se puede deshacer';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'La autenticación de dos factores protege tu cuenta del acceso no autorizado. Solo necesitas ingresar un código de seguridad al iniciar sesión.';

  @override
  String get calculatedField => 'Campo calculado';

  @override
  String get apiKey => 'Clave API';

  @override
  String get aiModel => 'Modelo de IA';

  @override
  String get adminSettings => 'Configuración de administrador';

  @override
  String get job => 'Trabajo';

  @override
  String get mobileAppBundle => 'Paquete de app móvil';

  @override
  String get mobileApp => 'App móvil';

  @override
  String get domain => 'Dominio';

  @override
  String get oauth2Client => 'Cliente OAuth2';

  @override
  String get queueStats => 'Estadísticas de cola';

  @override
  String get phoneIsRequired => 'El teléfono es obligatorio';

  @override
  String get phoneIsInvalid => 'El número de teléfono no es válido';

  @override
  String get addVerificationMethod => 'Añadir método de verificación';

  @override
  String get imageSavedToGallery => 'Guardado en \'Galería de imágenes\'';

  @override
  String get failedToSaveImage => 'Error al guardar la imagen';

  @override
  String nSelected(int count) {
    return '$count seleccionados';
  }

  @override
  String get selectAll => 'Seleccionar todo lo cargado';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operaciones fallaron',
      one: '1 operación falló',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count notificaciones?',
      one: '¿Eliminar 1 notificación?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Marcar $count notificaciones como leídas?',
      one: '¿Marcar 1 notificación como leída?',
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
  String get liveTrackingActive => 'Seguimiento de ubicación en tiempo real';

  @override
  String get liveTrackingPaused => 'Seguimiento en tiempo real en pausa';

  @override
  String get liveTrackingFixes => 'Posiciones';

  @override
  String get liveTrackingSaved => 'Guardadas';

  @override
  String get liveTrackingErrors => 'Errores';

  @override
  String get liveTrackingStop => 'Detener';

  @override
  String get liveTrackingPause => 'Pausar';

  @override
  String get liveTrackingResume => 'Reanudar';

  @override
  String get liveTrackingHide => 'Ocultar';

  @override
  String get liveTrackingSessionTitle =>
      'Seguimiento de ubicación en tiempo real';

  @override
  String get liveTrackingTarget => 'Guardar ubicación en la entidad';

  @override
  String get liveTrackingDashboard => 'Panel';

  @override
  String get liveTrackingStatus => 'Estado';

  @override
  String get liveTrackingStarted => 'Hora de inicio';

  @override
  String get liveTrackingLastFix => 'Última posición';

  @override
  String get liveTrackingLastError => 'Último error';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'No se puede guardar en esta entidad: ya no existe. El seguimiento continúa; actualiza el destino en la acción del panel.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Sin conexión con el servidor. Estas posiciones no se guardaron; el guardado se reanudará cuando vuelvas a estar en línea.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Tu sesión ha finalizado. Inicia sesión de nuevo para seguir guardando la ubicación.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'No se puede guardar en esta entidad: no tienes permiso. El seguimiento continúa; pide acceso a tu administrador.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'No se pudo guardar esta posición en el servidor. Se volverá a intentar con la siguiente posición.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Los servicios de ubicación están desactivados en este dispositivo.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Se denegó el permiso de ubicación.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'El permiso de ubicación está denegado permanentemente. Actívalo en los ajustes de la aplicación.';

  @override
  String get liveTrackingErrorLocation => 'No se pudo obtener la ubicación.';

  @override
  String get liveTrackingMenuTitle => 'Seguimiento de ubicación en tiempo real';

  @override
  String get liveTrackingNoRecord =>
      'No hay seguimiento activo ni sesiones recientes.';

  @override
  String get liveTrackingLastSession => 'Última sesión';

  @override
  String get liveTrackingStartAgain => 'Iniciar de nuevo';

  @override
  String get liveTrackingEnded => 'Hora de fin';

  @override
  String get liveTrackingEndReason => 'Motivo de finalización';

  @override
  String get liveTrackingEndReasonManual => 'Detenido manualmente';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'Se alcanzó la duración máxima';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrumpido';

  @override
  String get serverUpdateRequired => 'Se requiere actualizar el servidor';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Esta aplicación funciona con ThingsBoard $minVersion o posterior.';
  }

  @override
  String get serverLabel => 'Servidor';

  @override
  String get versionLabel => 'Versión';

  @override
  String get askAdminToUpdateServer =>
      'Pida al administrador del servidor que lo actualice.';

  @override
  String get deviceClaimFailed =>
      'No se pudo reclamar el dispositivo. Inténtelo de nuevo.';

  @override
  String get deviceToClaimNotFound =>
      'Dispositivo no encontrado. Póngase en contacto con el proveedor del dispositivo.';

  @override
  String get enableAuthenticatorApp => 'Activar aplicación de autenticación';

  @override
  String get enableSmsAuthenticator => 'Activar autenticación por SMS';

  @override
  String get enableEmailAuthenticator => 'Activar autenticación por Email';

  @override
  String get getBackupCode => 'Obtener código de respaldo';

  @override
  String get twoFaTotpDescription =>
      'Usa aplicaciones como Google Authenticator, Authy o Duo en tu teléfono para autenticarte. Generará un código de seguridad para iniciar sesión.';

  @override
  String get twoFaSmsDescription =>
      'Usa tu teléfono para autenticarte. Te enviaremos un código de seguridad por mensaje SMS al iniciar sesión.';

  @override
  String get twoFaEmailDescription =>
      'Usa un código de seguridad enviado a tu dirección de correo electrónico para autenticarte.';

  @override
  String get twoFaBackupCodeDescription =>
      'Estos códigos de un solo uso e imprimibles te permiten iniciar sesión cuando no tienes acceso a tu teléfono, como cuando estás viajando.';

  @override
  String get openInAuthenticatorApp =>
      'Abrir en la aplicación de autenticación';

  @override
  String get noAuthenticatorAppFound =>
      'No se encontró ninguna aplicación de autenticación. Copie la clave en su aplicación.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider está activado';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Su administrador requiere la autenticación de dos factores para $email.';
  }

  @override
  String get recommended => 'Recomendado';

  @override
  String get addBackupCodesHint =>
      'Añada también códigos de respaldo para poder iniciar sesión si pierde su teléfono.';

  @override
  String get totpSecretKey => 'Clave secreta';

  @override
  String get backupCodesDescription =>
      'Imprime los códigos para tenerlos a mano cuando necesites usarlos para iniciar sesión en tu cuenta. Puedes usar cada código de respaldo una sola vez.';

  @override
  String get backupCodesWarning =>
      'Una vez que salgas de esta página, estos códigos no podrán mostrarse de nuevo. Guárdalos de forma segura usando las opciones de abajo.';

  @override
  String get downloadTxt => 'Descargar (txt)';
}

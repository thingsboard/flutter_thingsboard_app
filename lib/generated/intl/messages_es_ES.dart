// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es_ES locale. All the
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
  String get localeName => 'es_ES';

  static String m0(appTitle) =>
      "¡Felicidades!\nTu cuenta de ${appTitle} ha sido activada.\nAhora puedes iniciar sesión en tu espacio de ${appTitle}.";

  static String m1(authority) =>
      "¿Estás seguro? Vas a eliminar tu cuenta de ${authority}.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarma', other: 'Alarmas')}";

  static String m3(providerName) =>
      "¿Estás seguro de que quieres desactivar ${providerName}?";

  static String m4(deviceName) =>
      "No se puede establecer sesión con el dispositivo ${deviceName}. Por favor, inténtalo de nuevo";

  static String m5(link) => "No se puede abrir la url: ${link}";

  static String m6(wifiName) => "Conéctate al Wi-Fi similar a ${wifiName}";

  static String m7(name) =>
      "La conexión a la red Wi-Fi ${name} falló.\nAsegúrate de que tu teléfono esté conectado a la red Wi-Fi del dispositivo y que el acceso a la red local esté habilitado para esta app.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Tablero', other: 'Tableros')}";

  static String m9(count) =>
      "${Intl.plural(count, one: '¿Eliminar 1 notificación?', other: '¿Eliminar ${count} notificaciones?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Dispositivo', other: 'Dispositivos')}";

  static String m11(count) =>
      "Código de ${count} ${Intl.plural(count, one: 'dígito', other: 'dígitos')}";

  static String m12(contact) =>
      "Se ha enviado un código de seguridad a tu correo electrónico en ${contact}.";

  static String m13(e) => "Error ocurrido: ${e}";

  static String m14(error) => "Error al enviar el código: ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 operación falló', other: '${count} operaciones fallaron')}";

  static String m16(count) =>
      "${Intl.plural(count, one: '¿Marcar 1 notificación como leída?', other: '¿Marcar ${count} notificaciones como leídas?')}";

  static String m17(count) => "${count} seleccionados";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Notificación', other: 'Notificaciones')}";

  static String m19(permissions) =>
      "No tienes suficientes permisos para \"${permissions}\" para continuar. Abre la configuración de la app, otorga los permisos y toca \"Intentar de nuevo\".";

  static String m20(permissions) =>
      "No tienes suficientes permisos para \"${permissions}\" para continuar. Otorga los permisos necesarios y toca \"Intentar de nuevo\".";

  static String m21(deviceName) =>
      "Ingresa el PIN de ${deviceName} para confirmar la prueba de posesión";

  static String m22(time) =>
      "Reenviar código en ${Intl.plural(time, one: '1 segundo', other: '${time} segundos')}";

  static String m23(name) => "Ruta no definida: ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Buscar usuario', other: 'Buscar usuarios')}";

  static String m25(contact) =>
      "Se ha enviado un código de seguridad a tu teléfono en ${contact}.";

  static String m26(name) =>
      "No se puede conectar al Wi-Fi porque el dispositivo ${name} no encontró redes";

  static String m27(version) => "Actualizar a ${version}";

  static String m28(deviceName) =>
      "Para continuar con la configuración de tu dispositivo ${deviceName}, proporciona las credenciales de tu red.";

  static String m29(network) => "Ingresa la contraseña de ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Aceptar"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Debes aceptar nuestra Política de privacidad",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Debes aceptar nuestros Términos de uso",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "¡Cuenta activada exitosamente!",
    ),
    "accountActivatedText": m0,
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Reconocer"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Reconocido"),
    "actionData": MessageLookupByLibrary.simpleMessage("Datos de la acción"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Fallo"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Éxito"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Activado"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Añadido"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Comentario añadido",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Reconocido"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarma asignada",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Borrado"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarma eliminada",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarma desasignada",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Asignado desde el inquilino",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Asignado al cliente",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Asignado a Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Asignado al inquilino",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Atributos eliminados",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Atributos leídos",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Atributos actualizados",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Credenciales leídas",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Credenciales actualizadas",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Eliminado"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Comentario eliminado",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Bloqueado"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Inicio de sesión"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage(
      "Cierre de sesión",
    ),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Aprovisionamiento fallido",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Dispositivo aprovisionado",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relación actualizada",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relación eliminada",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Todas las relaciones eliminadas",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("Llamada RPC"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS enviado"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspendido"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetría eliminada",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetría actualizada",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Desasignado del cliente",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Desasignado de Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Actualizado"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Comentario actualizado",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Activando cuenta...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Tu cuenta se está activando.\nPor favor espera...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Activo"),
    "activity": MessageLookupByLibrary.simpleMessage("Actividad"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Agregar un comentario...",
    ),
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Añadir método de verificación",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Dirección"),
    "address2": MessageLookupByLibrary.simpleMessage("Dirección 2"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Configuración de administrador",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("Modelo de IA"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que deseas reconocer la alarma?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Reconocer alarma",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que deseas borrar la alarma?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Borrar alarma"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Lista de severidad de alarma",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage(
      "Lista de estados de alarma",
    ),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage(
      "Lista de tipos de alarma",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Tipos de alarma"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Todo"),
    "allDevices": MessageLookupByLibrary.simpleMessage(
      "Todos los dispositivos",
    ),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Permitir acceso"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "¿Ya tienes una cuenta?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Se recibieron datos de solicitud vacíos.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Cualquier tipo"),
    "apiKey": MessageLookupByLibrary.simpleMessage("Clave API"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage(
      "Estado de uso de API",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage("Aplicar cambios"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("¿Estás seguro?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Activo"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nombre del activo"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Perfil del activo"),
    "assets": MessageLookupByLibrary.simpleMessage("Activos"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Asignado al cliente",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Asignado a mí"),
    "assignee": MessageLookupByLibrary.simpleMessage("Asignado a"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Detalles del registro de auditoría",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Registros de auditoría"),
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa uno de tus códigos de respaldo.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Código de respaldo",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "La próxima vez que inicies sesión, podrás usar códigos de respaldo para la autenticación de dos factores",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Para aprovisionar tu nuevo dispositivo, asegúrate de que el Bluetooth de tu teléfono esté activado y dentro del alcance de tu nuevo dispositivo",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Campo calculado"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
    "changePassword": MessageLookupByLibrary.simpleMessage(
      "Cambiar contraseña",
    ),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Elegir región"),
    "city": MessageLookupByLibrary.simpleMessage("Ciudad"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage(
      "Reclamando dispositivo",
    ),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Reclamación del dispositivo completada",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "El dispositivo ha sido\nreclamado exitosamente",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Borrar"),
    "cleared": MessageLookupByLibrary.simpleMessage("Borrado"),
    "close": MessageLookupByLibrary.simpleMessage("Cerrar"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "¡Verificación de código fallida!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Debes confirmar que no eres un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmación"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirmando conexión Wi-Fi",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Conectar al dispositivo",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Conéctate al Wi-Fi que usas habitualmente",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Conectando al dispositivo",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Error de conexión",
    ),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Continuar"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copiado al portapapeles",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copiar"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Copia la clave de 32 dígitos en tu aplicación de autenticación o escanea el código QR a continuación",
        ),
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Crear cuenta"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Crear una contraseña",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Crítico"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Contraseña actual",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "La contraseña actual es obligatoria.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Cliente"),
    "customers": MessageLookupByLibrary.simpleMessage("Clientes"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("días"),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Eliminar cuenta"),
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Eliminar comentario",
    ),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Detalles"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Lista de dispositivos"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "El dispositivo no puede encontrar Wi-Fi cercano",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "No se encontraron dispositivos. Asegúrate de que el Bluetooth de tu teléfono esté activado y dentro del alcance de tu nuevo dispositivo.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage(
      "Perfil del dispositivo",
    ),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Aprovisionamiento de dispositivo",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage("Descartar cambios"),
    "domain": MessageLookupByLibrary.simpleMessage("Dominio"),
    "done": MessageLookupByLibrary.simpleMessage("Hecho"),
    "duration": MessageLookupByLibrary.simpleMessage("Duración"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "edited": MessageLookupByLibrary.simpleMessage("Editado"),
    "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Código de correo",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Formato de correo electrónico inválido.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "El correo electrónico es obligatorio.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "La próxima vez que inicies sesión, se te pedirá que ingreses el código de seguridad enviado a tu correo electrónico",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "Verificación de correo electrónico",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Por favor, sigue las instrucciones proporcionadas en el correo para completar el proceso de registro. Nota: si no ves el correo, revisa tu carpeta de \'spam\' o intenta reenviarlo haciendo clic en el botón \'Reenviar\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Se ha enviado un correo electrónico con los detalles de verificación a la dirección especificada",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Correo verificado"),
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Ingresa el código de 6 dígitos de tu aplicación aquí:",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Ingresa un número de teléfono para usar como autenticador",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Ingresa un correo electrónico para usar como autenticador.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Tipo de entidad"),
    "entityView": MessageLookupByLibrary.simpleMessage("Vista de entidad"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Salir del aprovisionamiento",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "No se pudo conectar al servidor",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar los detalles de la alarma",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "No se pudo cargar la lista",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Detalles del fallo",
    ),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Error fatal de la aplicación:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Error fatal"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtros"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase no está configurado.\nConsulta la documentación oficial de Firebase\npara obtener instrucciones.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nombre"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "El nombre es obligatorio.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Nombre"),
    "goBack": MessageLookupByLibrary.simpleMessage("Volver"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Ocultar barra de herramientas del tablero",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Inicio"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage("Tablero de inicio"),
    "hours": MessageLookupByLibrary.simpleMessage("horas"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Híbrido"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("No soy un robot"),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Imperial"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactivo"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Ya existe un usuario inactivo",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Ya hay un usuario registrado con una dirección de correo sin verificar.\nHaz clic en \'Reenviar\' si deseas reenviar el correo de verificación.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Indeterminado"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Tu contraseña debe tener al menos 6 caracteres",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("es obligatorio."),
    "job": MessageLookupByLibrary.simpleMessage("Trabajo"),
    "label": MessageLookupByLibrary.simpleMessage("Etiqueta"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "lastName": MessageLookupByLibrary.simpleMessage("Apellido"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "El apellido es obligatorio.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Apellido"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "La lista está vacía actualmente.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "loginToApp": MessageLookupByLibrary.simpleMessage(
      "Iniciar sesión en la app",
    ),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión en tu cuenta",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Iniciar sesión con"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logotipo de ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
    "major": MessageLookupByLibrary.simpleMessage("Mayor"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como leído",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Marcar como leído"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Métrico"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Código de respaldo",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage(
      "Correo electrónico",
    ),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Aplicación de autenticación",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Menor"),
    "minutes": MessageLookupByLibrary.simpleMessage("minutos"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("App móvil"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Paquete de app móvil",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "¡El tablero móvil debe configurarse en el perfil del dispositivo!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Más"),
    "nSelected": m17,
    "newPassword": MessageLookupByLibrary.simpleMessage("Nueva contraseña"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Confirmar nueva contraseña",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Debes confirmar la nueva contraseña.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "La nueva contraseña es obligatoria.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("¿Nuevo usuario?"),
    "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron proveedores 2FA",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron alarmas",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron tableros",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron notificaciones",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron resultados",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("América del Norte"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("No encontrado"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("¡No implementado!"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Solicitud de notificación",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Regla de notificación",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Destino de notificación",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Plantilla de notificación",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("Cliente OAuth2"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Abrir configuración de la app",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Abre la configuración y concede acceso a la cámara para continuar",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Abrir configuración de Wi-Fi",
    ),
    "or": MessageLookupByLibrary.simpleMessage("O"),
    "originator": MessageLookupByLibrary.simpleMessage("Originador"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("Paquete OTA"),
    "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "¡Las contraseñas ingresadas deben coincidir!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "¿Olvidaste tu contraseña?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "La contraseña es obligatoria.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Restablecer contraseña",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "¡El enlace para restablecer la contraseña se envió correctamente!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer la contraseña",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Contraseña cambiada exitosamente",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Permisos"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Teléfono"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "El número de teléfono no es válido",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "El teléfono es obligatorio",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Número de teléfono en formato E.164, ej. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Contacta a tu administrador del sistema",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Sigue los siguientes pasos para conectar tu teléfono al dispositivo",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Sigue los siguientes pasos para reconectar\ntu teléfono a tu Wi-Fi habitual",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Escanea el código QR en tu dispositivo",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Tipo de alarma"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("Código postal"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de privacidad",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Perfil actualizado exitosamente",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "El dispositivo ha sido aprovisionado exitosamente",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Las notificaciones push no están configuradas.\nContacta a tu administrador del sistema.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Cola"),
    "queueStats": MessageLookupByLibrary.simpleMessage("Estadísticas de cola"),
    "ready": MessageLookupByLibrary.simpleMessage("Listo"),
    "refresh": MessageLookupByLibrary.simpleMessage("Actualizar"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Repetir la contraseña",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Solicitar restablecimiento de contraseña",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "La entidad solicitada no existe.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Reenviar"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reenviar código"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Restablecer"),
    "retry": MessageLookupByLibrary.simpleMessage("Reintentar"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Volver al tablero",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Vuelve a la aplicación y toca el botón Listo",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Cadena de reglas"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Nodo de regla"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Escanear un código"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Escanear código QR"),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "searchResults": MessageLookupByLibrary.simpleMessage(
      "Resultados de búsqueda",
    ),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("segundos"),
    "security": MessageLookupByLibrary.simpleMessage("Seguridad"),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "Seleccionar todo lo cargado",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("Seleccionar país"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Seleccionar región"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Seleccionar usuarios"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Selecciona una forma de verificación",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Seleccionar red Wi-Fi",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Enviar código"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Enviando credenciales de Wi-Fi",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Configurar un método de verificación",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Configura un método de verificación para continuar con tu inicio de sesión",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Severidad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Código SMS"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "La próxima vez que inicies sesión, se te pedirá que ingreses el código de seguridad enviado al número de teléfono",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Algo salió mal",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Algo salió mal ... Revirtiendo",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Hora de inicio"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Estado / Provincia",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Estado"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrador del sistema",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Recurso"),
    "tenant": MessageLookupByLibrary.simpleMessage("Inquilino"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrador del inquilino",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage(
      "Perfil del inquilino",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Términos de uso"),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Esta acción no se puede deshacer",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Esto hará que tu cuenta sea menos segura",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Título"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Cambiar cámara"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Alternar flash"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Código"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa el código de seguridad de tu aplicación de autenticación.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "La próxima vez que inicies sesión, deberás proporcionar un código de autenticación de dos factores",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Intentar de nuevo"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("Probar otra forma"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Por favor, intenta refinar tu consulta",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Por favor, intenta actualizar",
    ),
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Autenticación de dos factores",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "Se requiere autenticación de dos factores",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "La autenticación de dos factores protege tu cuenta del acceso no autorizado. Solo necesitas ingresar un código de seguridad al iniciar sesión.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Tipo"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "No se puede conectar al dispositivo",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "No se puede usar la cámara",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("No reconocido"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Sin asignar"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Sistema de unidades"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Error desconocido."),
    "unread": MessageLookupByLibrary.simpleMessage("No leído"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Cambios sin guardar",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Actualizar"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Actualización requerida",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Usuario"),
    "username": MessageLookupByLibrary.simpleMessage("nombre de usuario"),
    "users": MessageLookupByLibrary.simpleMessage("Usuarios"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "El código de verificación es incorrecto",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Formato de código de verificación inválido",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Demasiadas solicitudes, verifica el código de verificación",
    ),
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Verificación requerida",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifica tu identidad",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Ver todo"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Ver tablero"),
    "warning": MessageLookupByLibrary.simpleMessage("Advertencia"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Tipo de widget"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Paquete de widgets"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Contraseña de Wi-Fi"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Sí"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Sí, desactivar"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Sí, descartar"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Tienes cambios sin guardar. ¿Estás seguro de que quieres abandonar esta página?",
        ),
  };
}

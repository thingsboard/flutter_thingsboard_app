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

  static String m2(count) => "Alarmas";

  static String m4(deviceName) =>
      "No se puede establecer sesión con el dispositivo ${deviceName}. Por favor, inténtalo de nuevo";

  static String m8(count) => "Tableros";

  static String m9(count) => "Dispositivos";

  static String m11(contact) =>
      "Se ha enviado un código de seguridad a tu correo electrónico en ${contact}.";

  static String m13(count) => "Notificaciones";

  static String m14(permissions) =>
      "No tienes suficientes permisos para \"${permissions}\" para continuar. Abre la configuración de la app, otorga los permisos y toca \"Intentar de nuevo\".";

  static String m15(permissions) =>
      "No tienes suficientes permisos para \"${permissions}\" para continuar. Otorga los permisos necesarios y toca \"Intentar de nuevo\".";

  static String m16(deviceName) =>
      "Ingresa el PIN de ${deviceName} para confirmar la prueba de posesión";

  static String m17(time) =>
      "Reenviar código en ${Intl.plural(time, one: '1 segundo', other: '${time} segundos')}";

  static String m20(contact) =>
      "Se ha enviado un código de seguridad a tu teléfono en ${contact}.";

  static String m22(version) => "Actualizar a ${version}";

  static String m23(deviceName) =>
      "Para continuar con la configuración de tu dispositivo ${deviceName}, proporciona las credenciales de tu red.";

  static String m24(network) => "Ingresa la contraseña de ${network}";

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
    "acknowledge": MessageLookupByLibrary.simpleMessage("Reconocer"),
    "actionData": MessageLookupByLibrary.simpleMessage("Datos de la acción"),
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
    "address": MessageLookupByLibrary.simpleMessage("Dirección"),
    "address2": MessageLookupByLibrary.simpleMessage("Dirección 2"),
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
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Tipos de alarma"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage(
      "Todos los dispositivos",
    ),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "¿Ya tienes una cuenta?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("¿Estás seguro?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nombre del activo"),
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
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa uno de tus códigos de respaldo.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Código de respaldo",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Para aprovisionar tu nuevo dispositivo, asegúrate de que el Bluetooth de tu teléfono esté activado y dentro del alcance de tu nuevo dispositivo",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cannotEstablishSession": m4,
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
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Debes confirmar que no eres un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmación"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirmando conexión Wi-Fi",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continuar"),
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Crear cuenta"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Crear una contraseña",
    ),
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
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Eliminar comentario",
    ),
    "details": MessageLookupByLibrary.simpleMessage("Detalles"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Lista de dispositivos"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "No se encontraron dispositivos. Asegúrate de que el Bluetooth de tu teléfono esté activado y dentro del alcance de tu nuevo dispositivo.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Duración"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "edited": MessageLookupByLibrary.simpleMessage("Editado"),
    "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Código de correo",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Formato de correo electrónico inválido.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "El correo electrónico es obligatorio.",
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
    "entityType": MessageLookupByLibrary.simpleMessage("Tipo de entidad"),
    "europe": MessageLookupByLibrary.simpleMessage("Europa"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar los detalles de la alarma",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "No se pudo cargar la lista",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Detalles del fallo",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Nombre"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "El nombre es obligatorio.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Nombre"),
    "home": MessageLookupByLibrary.simpleMessage("Inicio"),
    "hours": MessageLookupByLibrary.simpleMessage("horas"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("No soy un robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactivo"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Ya existe un usuario inactivo",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Ya hay un usuario registrado con una dirección de correo sin verificar.\nHaz clic en \'Reenviar\' si deseas reenviar el correo de verificación.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Tu contraseña debe tener al menos 6 caracteres",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Etiqueta"),
    "lastName": MessageLookupByLibrary.simpleMessage("Apellido"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "El apellido es obligatorio.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Apellido"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "La lista está vacía actualmente.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logotipo de ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
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
    "minutes": MessageLookupByLibrary.simpleMessage("minutos"),
    "more": MessageLookupByLibrary.simpleMessage("Más"),
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
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron resultados",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("América del Norte"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage("¡No implementado!"),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("O"),
    "originator": MessageLookupByLibrary.simpleMessage("Originador"),
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
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Teléfono"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Código postal"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Política de privacidad",
    ),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Perfil actualizado exitosamente",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "El dispositivo ha sido aprovisionado exitosamente",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Actualizar"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Repetir la contraseña",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Solicitar restablecimiento de contraseña",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Reenviar"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Reenviar código"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Volver al tablero",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("segundos"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Seleccionar región"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Seleccionar usuarios"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Selecciona una forma de verificación",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Enviando credenciales de Wi-Fi",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Severidad"),
    "signIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Código SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Algo salió mal",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Hora de inicio"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Estado / Provincia",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Estado"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrador del sistema",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrador del inquilino",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Términos de uso"),
    "title": MessageLookupByLibrary.simpleMessage("Título"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Código"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa el código de seguridad de tu aplicación de autenticación.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Intentar de nuevo"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("Probar otra forma"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Por favor, intenta refinar tu consulta",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Por favor, intenta actualizar",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Tipo"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Sin asignar"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Actualización requerida",
    ),
    "updateTo": m22,
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
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verifica tu identidad",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("Ver tablero"),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Contraseña de Wi-Fi"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Sí"),
  };
}

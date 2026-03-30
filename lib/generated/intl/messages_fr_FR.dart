// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
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
  String get localeName => 'fr_FR';

  static String m0(appTitle) =>
      "Félicitations !\nVotre compte ${appTitle} a été activé.\nVous pouvez maintenant vous connecter à votre espace ${appTitle}.";

  static String m2(count) => "Alarmes";

  static String m4(deviceName) =>
      "Impossible d\'établir une session avec l\'appareil ${deviceName}. Veuillez réessayer";

  static String m8(count) => "Tableaux de bord";

  static String m9(count) => "Appareils";

  static String m11(contact) =>
      "Un code de sécurité a été envoyé à votre adresse email à ${contact}.";

  static String m13(count) => "Notifications";

  static String m14(permissions) =>
      "Vous n\'avez pas les autorisations nécessaires pour \"${permissions}\". Veuillez ouvrir les paramètres de l\'application, accorder les autorisations, puis appuyez sur \"Réessayer\".";

  static String m15(permissions) =>
      "Vous n\'avez pas les autorisations nécessaires pour \"${permissions}\". Veuillez accorder les autorisations requises et appuyez sur \"Réessayer\".";

  static String m16(deviceName) =>
      "Saisissez le code PIN de ${deviceName} pour confirmer la preuve de possession";

  static String m17(time) =>
      "Renvoyer le code dans ${Intl.plural(time, one: '1 seconde', other: '${time} secondes')}";

  static String m20(contact) =>
      "Un code de sécurité a été envoyé à votre téléphone au ${contact}.";

  static String m22(version) => "Mettre à jour vers ${version}";

  static String m23(deviceName) =>
      "Pour continuer la configuration de votre appareil ${deviceName}, veuillez fournir les identifiants de votre réseau.";

  static String m24(network) => "Saisir le mot de passe pour ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accepter"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Vous devez accepter notre politique de confidentialité",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Vous devez accepter nos conditions d\'utilisation",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Compte activé avec succès !",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Accuser réception"),
    "actionData": MessageLookupByLibrary.simpleMessage("Données d\'action"),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Activation du compte...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Votre compte est en cours d\'activation.\nVeuillez patienter...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Actif"),
    "activity": MessageLookupByLibrary.simpleMessage("Activité"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Ajouter un commentaire...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Complément d\'adresse"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir accuser réception de l\'alarme ?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Accuser réception de l\'alarme",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir effacer l\'alarme ?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage(
      "Effacer l\'alarme",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Types d\'alarme"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Tous les appareils"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Vous avez déjà un compte ?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Êtes-vous sûr ?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nom de l\'actif"),
    "assets": MessageLookupByLibrary.simpleMessage("Actifs"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Attribué au client",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Attribué à moi"),
    "assignee": MessageLookupByLibrary.simpleMessage("Attribué à"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Détails du journal d\'audit",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Journaux d\'audit"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Veuillez saisir l’un de vos codes de secours.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Code de secours",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Pour provisionner votre nouvel appareil, assurez-vous que le Bluetooth de votre téléphone est activé et que vous êtes à portée de l\'appareil",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cannotEstablishSession": m4,
    "changePassword": MessageLookupByLibrary.simpleMessage(
      "Changer le mot de passe",
    ),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Choisir une région"),
    "city": MessageLookupByLibrary.simpleMessage("Ville"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage(
      "Réclamation de l\'appareil",
    ),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Réclamation de l\'appareil terminée",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "L\'appareil a été\nréclamé avec succès",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Effacer"),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Vous devez confirmer que vous n\'êtes pas un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirmation de la connexion Wi-Fi",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continuer"),
    "country": MessageLookupByLibrary.simpleMessage("Pays"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Créer un mot de passe",
    ),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Mot de passe actuel",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe actuel est requis.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Client"),
    "customers": MessageLookupByLibrary.simpleMessage("Clients"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("jours"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Supprimer le commentaire",
    ),
    "details": MessageLookupByLibrary.simpleMessage("Détails"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Liste des appareils"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Aucun appareil trouvé. Veuillez vous assurer que le Bluetooth de votre téléphone est activé et que vous êtes à portée de l\'appareil.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Durée"),
    "edit": MessageLookupByLibrary.simpleMessage("Éditer"),
    "edited": MessageLookupByLibrary.simpleMessage("Édité"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code email"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Format d\'email invalide.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "L\'email est requis.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "Vérification de l\'email",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Veuillez suivre les instructions fournies dans l\'email pour finaliser votre inscription. Remarque : si vous ne voyez pas l\'email, vérifiez votre dossier \'spam\' ou cliquez sur le bouton \'Renvoyer\' pour le renvoyer.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Un email contenant les détails de vérification a été envoyé à l\'adresse spécifiée",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Email vérifié"),
    "entityType": MessageLookupByLibrary.simpleMessage("Type d\'entité"),
    "europe": MessageLookupByLibrary.simpleMessage("Europe"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Francfort"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement des détails de l\'alarme",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement de la liste",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Détails de l\'échec",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Prénom"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Le prénom est requis.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Prénom"),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "hours": MessageLookupByLibrary.simpleMessage("heures"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage(
      "Je ne suis pas un robot",
    ),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactif"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Un utilisateur inactif existe déjà",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Un utilisateur avec une adresse email non vérifiée est déjà enregistré.\nCliquez sur le bouton \'Renvoyer\' si vous souhaitez renvoyer l\'email de vérification.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Votre mot de passe doit contenir au moins 6 caractères",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Étiquette"),
    "lastName": MessageLookupByLibrary.simpleMessage("Nom de famille"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Le nom de famille est requis.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Nom de famille"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "La liste est actuellement vide.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Connexion"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logo ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Code de secours",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Application d\'authentification",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
    "more": MessageLookupByLibrary.simpleMessage("Plus"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nouveau mot de passe"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Confirmer le nouveau mot de passe",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "La confirmation du nouveau mot de passe est requise.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Le nouveau mot de passe est requis.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Nouvel utilisateur ?"),
    "next": MessageLookupByLibrary.simpleMessage("Suivant"),
    "no": MessageLookupByLibrary.simpleMessage("Non"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun résultat trouvé",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Amérique du Nord"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginie",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Non implémenté !"),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("OU"),
    "originator": MessageLookupByLibrary.simpleMessage("Initiateur"),
    "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Les mots de passe saisis doivent être identiques !",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Mot de passe oublié ?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe est requis.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser le mot de passe",
    ),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Le lien de réinitialisation du mot de passe a été envoyé avec succès !",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Saisissez l\'adresse email associée à votre compte et nous vous enverrons un lien de réinitialisation de mot de passe",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Mot de passe changé avec succès",
    ),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Téléphone"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Code postal"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Politique de confidentialité",
    ),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profil mis à jour avec succès",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "L\'appareil a été provisionné avec succès",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Actualiser"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Répétez votre mot de passe",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Demander la réinitialisation du mot de passe",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Renvoyer"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Renvoyer le code"),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Retour au tableau de bord",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("secondes"),
    "selectRegion": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une région",
    ),
    "selectUser": MessageLookupByLibrary.simpleMessage(
      "Sélectionner des utilisateurs",
    ),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez une méthode de vérification",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Envoi des identifiants Wi-Fi",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Gravité"),
    "signIn": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "signUp": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Heure de début"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("État / Province"),
    "status": MessageLookupByLibrary.simpleMessage("Statut"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrateur système",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrateur de locataire",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage(
      "Conditions d\'utilisation",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titre"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Veuillez saisir le code de sécurité depuis votre application d\'authentification.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Essayer une autre méthode",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Veuillez affiner votre requête",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Veuillez actualiser",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Non attribué"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Mise à jour requise",
    ),
    "updateTo": m22,
    "username": MessageLookupByLibrary.simpleMessage("nom d\'utilisateur"),
    "users": MessageLookupByLibrary.simpleMessage("Utilisateurs"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Le code de vérification est incorrect",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Format du code de vérification invalide",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Trop de demandes, vérifiez le code de vérification",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Vérifiez votre identité",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage(
      "Voir le tableau de bord",
    ),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Mot de passe Wi-Fi"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Oui"),
  };
}

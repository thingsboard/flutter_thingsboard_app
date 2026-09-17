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

  static String m1(authority) =>
      "Êtes-vous sûr ? Vous allez supprimer votre compte ${authority}.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Alarme', other: 'Alarmes')}";

  static String m3(providerName) =>
      "Êtes-vous sûr de vouloir désactiver ${providerName} ?";

  static String m4(deviceName) =>
      "Impossible d\'établir une session avec l\'appareil ${deviceName}. Veuillez réessayer";

  static String m5(link) => "Impossible d\'ouvrir l\'url : ${link}";

  static String m6(wifiName) =>
      "Connectez-vous au Wi-Fi similaire à ${wifiName}";

  static String m7(name) =>
      "La connexion au réseau Wi-Fi ${name} a échoué.\nVeuillez vous assurer que votre téléphone est connecté au réseau Wi-Fi de l\'appareil et que l\'accès au réseau local est activé pour cette application.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Tableau de bord', other: 'Tableaux de bord')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Supprimer 1 notification ?', other: 'Supprimer ${count} notifications ?')}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Appareil', other: 'Appareils')}";

  static String m11(count) =>
      "Code à ${count} ${Intl.plural(count, one: 'chiffre', other: 'chiffres')}";

  static String m12(contact) =>
      "Un code de sécurité a été envoyé à votre adresse email à ${contact}.";

  static String m13(e) => "Erreur survenue : ${e}";

  static String m14(error) => "Erreur lors de l\'envoi du code : ${error}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 opération a échoué', other: '${count} opérations ont échoué')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'Marquer 1 notification comme lue ?', other: 'Marquer ${count} notifications comme lues ?')}";

  static String m17(count) => "${count} sélectionnés";

  static String m18(count) =>
      "${Intl.plural(count, one: 'Notification', other: 'Notifications')}";

  static String m19(permissions) =>
      "Vous n\'avez pas les autorisations nécessaires pour \"${permissions}\". Veuillez ouvrir les paramètres de l\'application, accorder les autorisations, puis appuyez sur \"Réessayer\".";

  static String m20(permissions) =>
      "Vous n\'avez pas les autorisations nécessaires pour \"${permissions}\". Veuillez accorder les autorisations requises et appuyez sur \"Réessayer\".";

  static String m21(deviceName) =>
      "Saisissez le code PIN de ${deviceName} pour confirmer la preuve de possession";

  static String m22(time) =>
      "Renvoyer le code dans ${Intl.plural(time, one: '1 seconde', other: '${time} secondes')}";

  static String m23(name) => "Route non définie : ${name}";

  static String m24(count) =>
      "${Intl.plural(count, one: 'Rechercher un utilisateur', other: 'Rechercher des utilisateurs')}";

  static String m25(contact) =>
      "Un code de sécurité a été envoyé à votre téléphone au ${contact}.";

  static String m26(name) =>
      "Impossible de se connecter au Wi-Fi car aucun réseau n\'a été trouvé par l\'appareil ${name}";

  static String m27(version) => "Mettre à jour vers ${version}";

  static String m28(deviceName) =>
      "Pour continuer la configuration de votre appareil ${deviceName}, veuillez fournir les identifiants de votre réseau.";

  static String m29(network) => "Saisir le mot de passe pour ${network}";

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
    "accountDeletionDialogBody": m1,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Accuser réception"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Acquitté"),
    "actionData": MessageLookupByLibrary.simpleMessage("Données d\'action"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Échec"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Succès"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Activé"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Ajouté"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Commentaire ajouté",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Acquitté"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarme attribuée",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Effacé"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarme supprimée",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarme non attribuée",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Attribué depuis le locataire",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Attribué au client",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Attribué à Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Attribué au locataire",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributs supprimés",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributs lus",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributs mis à jour",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Identifiants lus",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Identifiants mis à jour",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Supprimé"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Commentaire supprimé",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Verrouillé"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Connexion"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Échec du provisionnement",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Appareil provisionné",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relation mise à jour",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relation supprimée",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "Toutes les relations supprimées",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("Appel RPC"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS envoyé"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspendu"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Télémétrie supprimée",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Télémétrie mise à jour",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Retiré du client",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Retiré d\'Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Mis à jour"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Commentaire mis à jour",
    ),
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
    "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Ajouter une méthode de vérification",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "address2": MessageLookupByLibrary.simpleMessage("Complément d\'adresse"),
    "adminSettings": MessageLookupByLibrary.simpleMessage(
      "Paramètres administrateur",
    ),
    "aiModel": MessageLookupByLibrary.simpleMessage("Modèle IA"),
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
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Liste des gravités d\'alarme",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage(
      "Liste des statuts d\'alarme",
    ),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage(
      "Liste des types d\'alarme",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Types d\'alarme"),
    "alarms": m2,
    "all": MessageLookupByLibrary.simpleMessage("Tout"),
    "allDevices": MessageLookupByLibrary.simpleMessage("Tous les appareils"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Autoriser l\'accès"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Vous avez déjà un compte ?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "Données de requête vides reçues.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Tout type"),
    "apiKey": MessageLookupByLibrary.simpleMessage("Clé API"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage(
      "État d\'utilisation de l\'API",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "applyChanges": MessageLookupByLibrary.simpleMessage(
      "Appliquer les modifications",
    ),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Êtes-vous sûr ?"),
    "areYouSureYouWantToDeactivate": m3,
    "asset": MessageLookupByLibrary.simpleMessage("Actif"),
    "assetName": MessageLookupByLibrary.simpleMessage("Nom de l\'actif"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Profil de l\'actif"),
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
    "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Auto"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Veuillez saisir l’un de vos codes de secours.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Code de secours",
    ),
    "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Lors de votre prochaine connexion, vous pourrez utiliser des codes de secours pour l\'authentification à deux facteurs",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Pour provisionner votre nouvel appareil, assurez-vous que le Bluetooth de votre téléphone est activé et que vous êtes à portée de l\'appareil",
    ),
    "calculatedField": MessageLookupByLibrary.simpleMessage("Champ calculé"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cannotEstablishSession": m4,
    "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
      "Can\\\'t delete user account",
    ),
    "cantLaunchUrlLink": m5,
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
    "cleared": MessageLookupByLibrary.simpleMessage("Effacé"),
    "close": MessageLookupByLibrary.simpleMessage("Fermer"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Échec de la vérification du code !",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Vous devez confirmer que vous n\'êtes pas un robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirmation de la connexion Wi-Fi",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Se connecter à l\'appareil",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Connectez-vous au Wi-Fi que vous utilisez habituellement",
    ),
    "connectToWifiSimilarToWifiname": m6,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Connexion à l\'appareil",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Erreur de connexion",
    ),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
    "continueText": MessageLookupByLibrary.simpleMessage("Continuer"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copié dans le presse-papiers",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copier"),
    "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
        MessageLookupByLibrary.simpleMessage(
          "Copiez la clé à 32 chiffres dans votre application d\'authentification ou scannez le code QR ci-dessous",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Pays"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Créer un mot de passe",
    ),
    "critical": MessageLookupByLibrary.simpleMessage("Critique"),
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
    "deleteAccount": MessageLookupByLibrary.simpleMessage(
      "Supprimer le compte",
    ),
    "deleteComment": MessageLookupByLibrary.simpleMessage(
      "Supprimer le commentaire",
    ),
    "deleteSelectedNotifications": m9,
    "details": MessageLookupByLibrary.simpleMessage("Détails"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Liste des appareils"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "L\'appareil ne trouve pas de Wi-Fi à proximité",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Aucun appareil trouvé. Veuillez vous assurer que le Bluetooth de votre téléphone est activé et que vous êtes à portée de l\'appareil.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage(
      "Profil de l\'appareil",
    ),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Provisionnement de l\'appareil",
    ),
    "devices": m10,
    "digitsCode": m11,
    "discardChanges": MessageLookupByLibrary.simpleMessage(
      "Annuler les modifications",
    ),
    "domain": MessageLookupByLibrary.simpleMessage("Domaine"),
    "done": MessageLookupByLibrary.simpleMessage("Terminé"),
    "duration": MessageLookupByLibrary.simpleMessage("Durée"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Éditer"),
    "edited": MessageLookupByLibrary.simpleMessage("Édité"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m12,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code email"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Format d\'email invalide.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "L\'email est requis.",
    ),
    "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Lors de votre prochaine connexion, vous devrez saisir le code de sécurité envoyé à votre adresse email",
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
    "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
      "Entrez le code à 6 chiffres de votre application ici :",
    ),
    "enterAPhoneNumberToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Entrez un numéro de téléphone à utiliser comme authentificateur",
        ),
    "enterAnEmailToUseAsYourAuthenticator":
        MessageLookupByLibrary.simpleMessage(
          "Entrez un email à utiliser comme authentificateur.",
        ),
    "entityType": MessageLookupByLibrary.simpleMessage("Type d\'entité"),
    "entityView": MessageLookupByLibrary.simpleMessage("Vue d\'entité"),
    "errorOccured": m13,
    "errorSendingCode": m14,
    "europe": MessageLookupByLibrary.simpleMessage("Europe"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Francfort"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Quitter le provisionnement",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Échec de la connexion au serveur",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement des détails de l\'alarme",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement de la liste",
    ),
    "failedToPerformOperation": m15,
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Détails de l\'échec",
    ),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Erreur fatale de l\'application :",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Erreur fatale"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtres"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase n\'est pas configuré.\nVeuillez consulter la documentation officielle de Firebase\npour les instructions.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("Prénom"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Le prénom est requis.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Prénom"),
    "goBack": MessageLookupByLibrary.simpleMessage("Retour"),
    "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
      "Masquer la barre d\'outils du tableau de bord",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "homeDashboard": MessageLookupByLibrary.simpleMessage(
      "Tableau de bord d\'accueil",
    ),
    "hours": MessageLookupByLibrary.simpleMessage("heures"),
    "hybridUnitSystem": MessageLookupByLibrary.simpleMessage("Hybride"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage(
      "Je ne suis pas un robot",
    ),
    "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("Impérial"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactif"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Un utilisateur inactif existe déjà",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Un utilisateur avec une adresse email non vérifiée est déjà enregistré.\nCliquez sur le bouton \'Renvoyer\' si vous souhaitez renvoyer l\'email de vérification.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Indéterminé"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Votre mot de passe doit contenir au moins 6 caractères",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("est requis."),
    "job": MessageLookupByLibrary.simpleMessage("Tâche"),
    "label": MessageLookupByLibrary.simpleMessage("Étiquette"),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "lastName": MessageLookupByLibrary.simpleMessage("Nom de famille"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Le nom de famille est requis.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Nom de famille"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "La liste est actuellement vide.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Connexion"),
    "loginToApp": MessageLookupByLibrary.simpleMessage(
      "Se connecter à l\'application",
    ),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Connectez-vous à votre compte",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Se connecter avec"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Logo ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "major": MessageLookupByLibrary.simpleMessage("Majeur"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Tout marquer comme lu",
    ),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Marquer comme lu"),
    "markSelectedNotificationsAsRead": m16,
    "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Métrique"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Code de secours",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Application d\'authentification",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Mineur"),
    "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
    "mobileApp": MessageLookupByLibrary.simpleMessage("Application mobile"),
    "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
      "Pack application mobile",
    ),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Le tableau de bord mobile doit être configuré dans le profil de l\'appareil !",
        ),
    "more": MessageLookupByLibrary.simpleMessage("Plus"),
    "nSelected": m17,
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
    "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
      "Aucun fournisseur 2FA trouvé",
    ),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
      "Aucune alarme trouvée",
    ),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun tableau de bord trouvé",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "Aucune notification trouvée",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun résultat trouvé",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Amérique du Nord"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginie",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Non trouvé"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Non implémenté !"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Demande de notification",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Règle de notification",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Cible de notification",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Modèle de notification",
    ),
    "notifications": m18,
    "oauth2Client": MessageLookupByLibrary.simpleMessage("Client OAuth2"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les paramètres de l\'application",
    ),
    "openAppSettingsToGrantPermissionMessage": m19,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Ouvrez les paramètres et accordez l\'accès à la caméra pour continuer",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les paramètres Wi-Fi",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OU"),
    "originator": MessageLookupByLibrary.simpleMessage("Initiateur"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("Paquet OTA"),
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
    "permissions": MessageLookupByLibrary.simpleMessage("Autorisations"),
    "permissionsNotEnoughMessage": m20,
    "phone": MessageLookupByLibrary.simpleMessage("Téléphone"),
    "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
      "Le numéro de téléphone est invalide",
    ),
    "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
      "Le téléphone est requis",
    ),
    "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
      "Numéro de téléphone au format E.164, ex. +1201550123",
    ),
    "pleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Veuillez contacter votre administrateur système",
        ),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Veuillez suivre les étapes suivantes pour connecter votre téléphone à l\'appareil",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Veuillez suivre les étapes suivantes pour reconnecter\nvotre téléphone à votre Wi-Fi habituel",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Veuillez scanner le code QR sur votre appareil",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Type d\'alarme"),
    "popTitle": m21,
    "postalCode": MessageLookupByLibrary.simpleMessage("Code postal"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Politique de confidentialité",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profil mis à jour avec succès",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "L\'appareil a été provisionné avec succès",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Les notifications push ne sont pas configurées.\nVeuillez contacter votre administrateur système.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("File d\'attente"),
    "queueStats": MessageLookupByLibrary.simpleMessage(
      "Statistiques de file d\'attente",
    ),
    "ready": MessageLookupByLibrary.simpleMessage("Prêt"),
    "refresh": MessageLookupByLibrary.simpleMessage("Actualiser"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Répétez votre mot de passe",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Demander la réinitialisation du mot de passe",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "L\'entité demandée n\'existe pas.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Renvoyer"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Renvoyer le code"),
    "resendCodeWait": m22,
    "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
    "retry": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Retour au tableau de bord",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Revenez à l\'application et appuyez sur le bouton Prêt",
    ),
    "routeNotDefined": m23,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Chaîne de règles"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Nœud de règle"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Scanner un code"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Scanner le code QR"),
    "search": MessageLookupByLibrary.simpleMessage("Rechercher"),
    "searchResults": MessageLookupByLibrary.simpleMessage(
      "Résultats de recherche",
    ),
    "searchUsers": m24,
    "seconds": MessageLookupByLibrary.simpleMessage("secondes"),
    "security": MessageLookupByLibrary.simpleMessage("Sécurité"),
    "selectAll": MessageLookupByLibrary.simpleMessage(
      "Sélectionner tout le chargé",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Sélectionner le pays",
    ),
    "selectRegion": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une région",
    ),
    "selectUser": MessageLookupByLibrary.simpleMessage(
      "Sélectionner des utilisateurs",
    ),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez une méthode de vérification",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Sélectionner le réseau Wi-Fi",
    ),
    "sendCode": MessageLookupByLibrary.simpleMessage("Envoyer le code"),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Envoi des identifiants Wi-Fi",
    ),
    "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
      "Configurer une méthode de vérification",
    ),
    "setUpAVerificationMethodToContinueWithYourLogin":
        MessageLookupByLibrary.simpleMessage(
          "Configurez une méthode de vérification pour continuer votre connexion",
        ),
    "severity": MessageLookupByLibrary.simpleMessage("Gravité"),
    "signIn": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "signUp": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "smsAuthDescription": m25,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code SMS"),
    "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Lors de votre prochaine connexion, vous devrez saisir le code de sécurité envoyé au numéro de téléphone",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite ... Annulation",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Heure de début"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("État / Province"),
    "status": MessageLookupByLibrary.simpleMessage("Statut"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrateur système",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Ressource"),
    "tenant": MessageLookupByLibrary.simpleMessage("Locataire"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Administrateur de locataire",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage(
      "Profil du locataire",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage(
      "Conditions d\'utilisation",
    ),
    "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
      "Cette action ne peut pas être annulée",
    ),
    "thisWillMakeYourAccountLessSecure": MessageLookupByLibrary.simpleMessage(
      "Cela rendra votre compte moins sécurisé",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titre"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Changer de caméra"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage(
      "Activer/désactiver le flash",
    ),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Veuillez saisir le code de sécurité depuis votre application d\'authentification.",
    ),
    "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Lors de votre prochaine connexion, vous devrez fournir un code d\'authentification à deux facteurs",
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
    "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Authentification à deux facteurs",
    ),
    "twofactorAuthenticationIsRequired": MessageLookupByLibrary.simpleMessage(
      "L\'authentification à deux facteurs est requise",
    ),
    "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
        MessageLookupByLibrary.simpleMessage(
          "L\'authentification à deux facteurs protège votre compte contre les accès non autorisés. Il vous suffit de saisir un code de sécurité lors de la connexion.",
        ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Impossible de se connecter à l\'appareil",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m26,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Impossible d\'utiliser la caméra",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Non acquitté"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Non attribué"),
    "unitSystem": MessageLookupByLibrary.simpleMessage("Système d\'unités"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Erreur inconnue."),
    "unread": MessageLookupByLibrary.simpleMessage("Non lu"),
    "unsavedChanges": MessageLookupByLibrary.simpleMessage(
      "Modifications non enregistrées",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Mettre à jour"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Mise à jour requise",
    ),
    "updateTo": m27,
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "user": MessageLookupByLibrary.simpleMessage("Utilisateur"),
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
    "verificationRequired": MessageLookupByLibrary.simpleMessage(
      "Vérification requise",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Vérifiez votre identité",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("Tout afficher"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage(
      "Voir le tableau de bord",
    ),
    "warning": MessageLookupByLibrary.simpleMessage("Avertissement"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Type de widget"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Pack de widgets"),
    "wifiHelpMessage": m28,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Mot de passe Wi-Fi"),
    "wifiPasswordMessage": m29,
    "yes": MessageLookupByLibrary.simpleMessage("Oui"),
    "yesDeactivate": MessageLookupByLibrary.simpleMessage("Oui, désactiver"),
    "yesDiscard": MessageLookupByLibrary.simpleMessage("Oui, annuler"),
    "youHaveUnsavedChangesAreYouSureYouWantTo":
        MessageLookupByLibrary.simpleMessage(
          "Vous avez des modifications non enregistrées. Êtes-vous sûr de vouloir quitter cette page ?",
        ),
  };
}

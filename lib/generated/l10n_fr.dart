// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Accueil';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Appareils',
      one: 'Appareil',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Plus';

  @override
  String get customers => 'Clients';

  @override
  String get assets => 'Actifs';

  @override
  String get tenants => 'Locataires';

  @override
  String get auditLogs => 'Journaux d’audit';

  @override
  String get noCustomersFound => 'Aucun client trouvé';

  @override
  String get noAssetsFound => 'Aucun actif trouvé';

  @override
  String get noTenantsFound => 'Aucun locataire trouvé';

  @override
  String get noDevicesFound => 'Aucun appareil trouvé';

  @override
  String get noAuditLogsFound => 'Aucun journal d’audit trouvé';

  @override
  String get logout => 'Déconnexion';

  @override
  String get login => 'Connexion';

  @override
  String get loginToYourAccount => 'Connexion à votre compte';

  @override
  String get email => 'Email';

  @override
  String get emailInvalidText => 'Format d’email invalide.';

  @override
  String get username => 'nom d’utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordForgotText => 'Mot de passe oublié ?';

  @override
  String get passwordReset => 'Réinitialiser le mot de passe';

  @override
  String get passwordResetText =>
      'Saisissez l’email associé à votre compte et nous vous enverrons un email avec un lien de réinitialisation du mot de passe';

  @override
  String get requestPasswordReset =>
      'Demander une réinitialisation du mot de passe';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Le lien de vérification de l’email a été envoyé avec succès !';

  @override
  String get or => 'OU';

  @override
  String get no => 'Non';

  @override
  String get yes => 'Oui';

  @override
  String get title => 'Titre';

  @override
  String get country => 'Pays';

  @override
  String get city => 'Ville';

  @override
  String get stateOrProvince => 'État / Province';

  @override
  String get postalCode => 'Code postal / ZIP';

  @override
  String get address => 'Adresse';

  @override
  String get address2 => 'Adresse 2';

  @override
  String get phone => 'Téléphone';

  @override
  String get alarmClearTitle => 'Réinitialiser l’alarme';

  @override
  String get alarmClearText =>
      'Êtes-vous sûr de vouloir réinitialiser l’alarme ?';

  @override
  String get alarmAcknowledgeTitle => 'Acquitter l’alarme';

  @override
  String get alarmAcknowledgeText =>
      'Êtes-vous sûr de vouloir acquitter l’alarme ?';

  @override
  String get assetName => 'Nom de l’actif';

  @override
  String get type => 'Type';

  @override
  String get label => 'Libellé';

  @override
  String get auditLogDetails => 'Détails du journal d’audit';

  @override
  String get customerDetails => 'Détails du client';

  @override
  String get assetDetails => 'Détails de l’actif';

  @override
  String get tenantDetails => 'Détails du locataire';

  @override
  String get entityType => 'Type d’entité';

  @override
  String get actionData => 'Données d’action';

  @override
  String get failureDetails => 'Détails de l’échec';

  @override
  String get allDevices => 'Tous les appareils';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get deviceActive => 'Actif';

  @override
  String get deviceInactive => 'Inactif';

  @override
  String get activeDevices => 'Actif';

  @override
  String get inactiveDevices => 'Inactif';

  @override
  String get alarmStatusActiveAcknowledged => 'Active acquittée';

  @override
  String get alarmStatusActiveUnacknowledged => 'Active non acquittée';

  @override
  String get alarmStatusClearedAcknowledged => 'Réinitialisée acquittée';

  @override
  String get alarmStatusClearedUnacknowledged => 'Réinitialisée non acquittée';

  @override
  String get alarmStatusFilterActive => 'Active';

  @override
  String get systemAdministrator => 'Administrateur système';

  @override
  String get tenantAdministrator => 'Administrateur locataire';

  @override
  String get customer => 'Client';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get currentPasswordRequireText => 'Le mot de passe actuel est requis.';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get newPasswordRequireText => 'Le nouveau mot de passe est requis.';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get newPassword2RequireText =>
      'La confirmation du nouveau mot de passe est requise.';

  @override
  String get newPassword2 => 'Confirmer le nouveau mot de passe';

  @override
  String get passwordErrorNotification =>
      'Les mots de passe saisis doivent être identiques !';

  @override
  String get profileSuccessNotification => 'Profil mis à jour avec succès';

  @override
  String get passwordSuccessNotification => 'Mot de passe modifié avec succès';

  @override
  String get notImplemented => 'Non implémenté !';

  @override
  String get listIsEmptyText => 'La liste est actuellement vide.';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get verifyYourIdentity => 'Vérifiez votre identité';

  @override
  String get continueText => 'Continuer';

  @override
  String get resendCode => 'Renvoyer le code';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time secondes',
      one: '1 seconde',
    );
    return 'Renvoyer le code dans $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Veuillez saisir le code de sécurité depuis votre application d’authentification.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Un code de sécurité a été envoyé sur votre téléphone au $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Un code de sécurité a été envoyé à votre adresse email à $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Veuillez saisir l’un de vos codes de secours.';

  @override
  String get toptAuthPlaceholder => 'Code';

  @override
  String get smsAuthPlaceholder => 'Code SMS';

  @override
  String get emailAuthPlaceholder => 'Code email';

  @override
  String get backupCodeAuthPlaceholder => 'Code de secours';

  @override
  String get verificationCodeIncorrect => 'Code de vérification incorrect';

  @override
  String get verificationCodeManyRequest =>
      'Trop de demandes pour vérifier le code de vérification';

  @override
  String get tryAnotherWay => 'Essayer une autre méthode';

  @override
  String get selectWayToVerify => 'Sélectionnez une méthode de vérification';

  @override
  String get mfaProviderTopt => 'Application d’authentification';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Code de secours';

  @override
  String get newUserText => 'Nouvel utilisateur ?';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get emailVerification => 'Vérification de l’email';

  @override
  String get emailVerificationSentText =>
      'Un email contenant les détails de vérification a été envoyé à l’adresse email spécifiée ';

  @override
  String get emailVerificationInstructionsText =>
      'Veuillez suivre les instructions fournies dans l’email afin de finaliser votre procédure d’inscription. Remarque : si vous n’avez pas vu l’email depuis un moment, veuillez vérifier votre dossier \'spam\' ou essayer de renvoyer l’email en cliquant sur le bouton \'Renvoyer\'.';

  @override
  String get resend => 'Renvoyer';

  @override
  String get activatingAccount => 'Activation du compte...';

  @override
  String get accountActivated => 'Compte activé avec succès !';

  @override
  String get emailVerified => 'Email vérifié';

  @override
  String get activatingAccountText =>
      'Votre compte est en cours d’activation.\nVeuillez patienter...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Félicitations !\nVotre compte $appTitle a été activé.\nVous pouvez maintenant vous connecter à votre espace $appTitle.';
  }

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get cancel => 'Annuler';

  @override
  String get accept => 'Accepter';

  @override
  String get termsOfUse => 'Conditions d’utilisation';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom de famille';

  @override
  String get imNotARobot => 'Je ne suis pas un robot';

  @override
  String get signUp => 'S’inscrire';

  @override
  String get alreadyHaveAnAccount => 'Vous avez déjà un compte ?';

  @override
  String get signIn => 'Se connecter';

  @override
  String get inactiveUserAlreadyExists => 'Utilisateur inactif déjà existant';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Un utilisateur est déjà enregistré avec une adresse email non vérifiée.\nCliquez sur le bouton \'Renvoyer\' si vous souhaitez renvoyer l’email de vérification.';

  @override
  String get assignee => 'Assigné';

  @override
  String get alarmTypes => 'Types d’alarmes';

  @override
  String get details => 'Détails';

  @override
  String get status => 'Statut';

  @override
  String get severity => 'Gravité';

  @override
  String get originator => 'Initiateur';

  @override
  String get startTime => 'Heure de début';

  @override
  String get duration => 'Durée';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value jours',
      one: '$value jour',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value heures',
      one: '$value heure',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minutes',
      one: '$value minute',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value secondes',
      one: '$value seconde',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Voir le tableau de bord';

  @override
  String get activity => 'Activité';

  @override
  String get addCommentMessage => 'Ajouter un commentaire...';

  @override
  String get clear => 'Réinitialiser';

  @override
  String get acknowledge => 'Acquitter';

  @override
  String get edit => 'Modifier';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get delete => 'Supprimer';

  @override
  String get edited => 'Modifié';

  @override
  String get deleteComment => 'Supprimer le commentaire';

  @override
  String get areYouSure => 'Êtes-vous sûr ?';

  @override
  String get noResultsFound => 'Aucun résultat trouvé';

  @override
  String get tryRefiningYourQuery => 'Veuillez affiner votre requête';

  @override
  String get failedToLoadTheList => 'Échec du chargement de la liste';

  @override
  String get tryRefreshing => 'Veuillez actualiser';

  @override
  String get refresh => 'Actualiser';

  @override
  String get users => 'Utilisateurs';

  @override
  String get unassigned => 'Non assigné';

  @override
  String get failedToLoadAlarmDetails =>
      'Échec du chargement des détails de l’alarme';

  @override
  String get somethingWentWrong => 'Une erreur s’est produite';

  @override
  String get chooseRegion => 'Choisir la région';

  @override
  String get selectRegion => 'Sélectionner la région';

  @override
  String get northAmerica => 'Amérique du Nord';

  @override
  String get europe => 'Europe';

  @override
  String get northAmericaRegionShort => 'Virginie du Nord';

  @override
  String get europeRegionShort => 'Francfort';

  @override
  String get deviceList => 'Liste des appareils';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tableaux de bord',
      one: 'Tableau de bord',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Mise à jour requise';

  @override
  String updateTo(Object version) {
    return 'Mettre à jour vers $version';
  }

  @override
  String get next => 'Suivant';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get wifiPassword => 'Mot de passe Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Pour poursuivre la configuration de votre appareil $deviceName, veuillez fournir les identifiants de votre réseau.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Saisissez le mot de passe pour $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Vous n’avez pas les autorisations suffisantes (« $permissions ») pour continuer. Veuillez accorder les autorisations requises et appuyer sur « Réessayer ».';
  }

  @override
  String get sendingWifiCredentials => 'Envoi des identifiants Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Confirmation de la connexion Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'L’appareil a été provisionné avec succès';

  @override
  String get returnToDashboard => 'Retour au tableau de bord';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Impossible d’établir la session avec l’appareil $deviceName. Veuillez réessayer';
  }

  @override
  String get claimingDevice => 'Réclamation de l’appareil';

  @override
  String get claimingMessageSuccess => 'L’appareil a été\nréclamé avec succès';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Vous n’avez pas les autorisations nécessaires (« $permissions ») pour continuer. Veuillez ouvrir les paramètres de l’application, accorder les autorisations et appuyer sur « Réessayer ».';
  }

  @override
  String get scanACode => 'Scanner un code';

  @override
  String get allowAccess => 'Autoriser l’accès';

  @override
  String get toggleCamera => 'Basculer la caméra';

  @override
  String get toggleFlash => 'Basculer le flash';

  @override
  String get unableToUseCamera => 'Impossible d’utiliser la caméra';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Ouvrez les paramètres et accordez l’accès à la caméra pour continuer';

  @override
  String get notFound => 'Introuvable';

  @override
  String routeNotDefined(Object name) {
    return 'Route non définie : $name';
  }

  @override
  String get loginWith => 'SE CONNECTER AVEC';

  @override
  String get scanQrCode => 'Scanner le code QR';

  @override
  String get searchResults => 'Résultats de recherche';

  @override
  String get viewAll => 'Voir tout';

  @override
  String get requestedEntityDoesNotExists => 'L’entité demandée n’existe pas.';

  @override
  String get noAlarmsFound => 'Aucune alarme trouvée';

  @override
  String get filters => 'Filtres';

  @override
  String get alarmStatusList => 'Liste des statuts d’alarme';

  @override
  String get alarmSeverityList => 'Liste des niveaux de gravité';

  @override
  String get cleared => 'Réinitialisée';

  @override
  String get acknowledged => 'Acquittée';

  @override
  String get unacknowledged => 'Non acquittée';

  @override
  String get critical => 'Critique';

  @override
  String get major => 'Majeure';

  @override
  String get minor => 'Mineure';

  @override
  String get warning => 'Avertissement';

  @override
  String get indeterminate => 'Indéterminée';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rechercher des utilisateurs',
      one: 'Rechercher un utilisateur',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Réinitialiser';

  @override
  String get update => 'Mettre à jour';

  @override
  String get alarmTypeList => 'Liste des types d’alarmes';

  @override
  String get anyType => 'Tout type';

  @override
  String get plusAlarmType => '+ Type d’alarme';

  @override
  String get all => 'Tout';

  @override
  String get allNotifications => 'Toutes';

  @override
  String get unread => 'Non lues';

  @override
  String get close => 'Fermer';

  @override
  String get fatalError => 'Erreur fatale';

  @override
  String get unknownError => 'Erreur inconnue.';

  @override
  String get sessionExpired => 'La session a expiré';

  @override
  String get fatalApplicationErrorOccurred =>
      'Une erreur fatale de l’application s’est produite :';

  @override
  String get connectionError => 'Erreur de connexion';

  @override
  String get failedToConnectToServer => 'Échec de la connexion au serveur';

  @override
  String get retry => 'Réessayer';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Le tableau de bord mobile doit être configuré dans le profil d’appareil !';

  @override
  String get openWifiSettings => 'Ouvrir les paramètres Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Connectez-vous au Wi-Fi que vous utilisez habituellement';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Revenez à l’application et appuyez sur le bouton Prêt';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Veuillez suivre les étapes suivantes pour reconnecter\nvotre téléphone à votre Wi-Fi habituel';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Les notifications push ne sont pas configurées.\nVeuillez contacter votre administrateur système.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase n’est pas configuré.\n Veuillez consulter la documentation officielle de Firebase pour\n savoir comment procéder.';

  @override
  String get markAllAsRead => 'Tout marquer comme lu';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Impossible d’ouvrir l’URL : $link';
  }

  @override
  String get noDashboardsFound => 'Aucun tableau de bord trouvé';

  @override
  String get openAppSettings => 'Ouvrir les paramètres de l’application';

  @override
  String get connectingToDevice => 'Connexion à l’appareil';

  @override
  String get connectToDevice => 'Se connecter à l’appareil';

  @override
  String get selectWifiNetwork => 'Sélectionner le réseau Wi-Fi';

  @override
  String get deviceProvisioning => 'Provisionnement de l’appareil';

  @override
  String get permissions => 'Autorisations';

  @override
  String get unableConnectToDevice => 'Impossible de se connecter à l’appareil';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'L’appareil ne parvient pas à trouver de Wi-Fi à proximité';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Échec de la connexion au réseau Wi-Fi $name.\nVeuillez vous assurer que votre téléphone est connecté au réseau Wi-Fi de l’appareil et que l’accès au réseau local est activé pour cette application dans les paramètres de votre appareil.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Impossible de se connecter au Wi-Fi car aucun réseau n’a été trouvé par l’appareil $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Veuillez suivre les étapes suivantes pour connecter votre téléphone à l’appareil';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Connectez-vous au Wi-Fi similaire à $wifiName';
  }

  @override
  String get ready => 'Prêt';

  @override
  String get exitDeviceProvisioning =>
      'Quitter le provisionnement de l’appareil';

  @override
  String get noNotificationsFound => 'Aucune notification trouvée';

  @override
  String get markAsRead => 'Marquer comme lu';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Veuillez scanner le code QR sur votre appareil';

  @override
  String get search => 'Rechercher';

  @override
  String get tenant => 'Locataire';

  @override
  String get tenantProfile => 'Profil de locataire';

  @override
  String get user => 'Utilisateur';

  @override
  String get asset => 'Actif';

  @override
  String get deviceProfile => 'Profil d’appareil';

  @override
  String get assetProfile => 'Profil d’actif';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmes',
      one: 'Alarme',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Chaîne de règles';

  @override
  String get ruleNode => 'Nœud de règle';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Vue d’entité';

  @override
  String get widgetsBundle => 'Lot de widgets';

  @override
  String get widgetType => 'Type de widget';

  @override
  String get apiUsageState => 'État d’utilisation de l’API';

  @override
  String get tbResource => 'Ressource';

  @override
  String get otaPackage => 'Package OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'File d’attente';

  @override
  String get notificationTarget => 'Destinataire de notification';

  @override
  String get notificationTemplate => 'Modèle de notification';

  @override
  String get notificationRequest => 'Requête de notification';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notifications',
      one: 'Notification',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Règle de notification';

  @override
  String get entityGroup => 'Groupe d’entités';

  @override
  String get converter => 'Convertisseur';

  @override
  String get integration => 'Intégration';

  @override
  String get schedulerEvent => 'Événement planifié';

  @override
  String get blobEntity => 'Entité Blob';

  @override
  String get role => 'Rôle';

  @override
  String get groupPermission => 'Permission de groupe';

  @override
  String get actionStatusSuccess => 'Succès';

  @override
  String get actionStatusFailure => 'Échec';

  @override
  String get actionTypeAdded => 'Ajouté';

  @override
  String get actionTypeDeleted => 'Supprimé';

  @override
  String get actionTypeUpdated => 'Mis à jour';

  @override
  String get actionTypeAttributesUpdated => 'Attributs mis à jour';

  @override
  String get actionTypeAttributesDeleted => 'Attributs supprimés';

  @override
  String get actionTypeRpcCall => 'Appel RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Identifiants mis à jour';

  @override
  String get actionTypeAssignedToCustomer => 'Assigné à un client';

  @override
  String get actionTypeUnassignedFromCustomer => 'Désattribué d’un client';

  @override
  String get actionTypeActivated => 'Activé';

  @override
  String get actionTypeSuspended => 'Suspendu';

  @override
  String get actionTypeCredentialsRead => 'Identifiants lus';

  @override
  String get actionTypeAttributesRead => 'Attributs lus';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relation mise à jour';

  @override
  String get actionTypeRelationDeleted => 'Relation supprimée';

  @override
  String get actionTypeRelationsDeleted => 'Toutes les relations supprimées';

  @override
  String get actionTypeAlarmAck => 'Alarme acquittée';

  @override
  String get actionTypeAlarmClear => 'Alarme réinitialisée';

  @override
  String get actionTypeAlarmDelete => 'Alarme supprimée';

  @override
  String get actionTypeAlarmAssigned => 'Alarme assignée';

  @override
  String get actionTypeAlarmUnassigned => 'Alarme désassignée';

  @override
  String get actionTypeLogin => 'Connexion';

  @override
  String get actionTypeLogout => 'Déconnexion';

  @override
  String get actionTypeLockout => 'Verrouillage';

  @override
  String get actionTypeAssignedFromTenant => 'Assigné depuis un locataire';

  @override
  String get actionTypeAssignedToTenant => 'Assigné à un locataire';

  @override
  String get actionTypeProvisionSuccess => 'Appareil provisionné';

  @override
  String get actionTypeProvisionFailure =>
      'Le provisionnement de l’appareil a échoué';

  @override
  String get actionTypeTimeseriesUpdated => 'Télémétrie mise à jour';

  @override
  String get actionTypeTimeseriesDeleted => 'Télémétrie supprimée';

  @override
  String get actionTypeAssignedToEdge => 'Attribué à un Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Désattribué d’un Edge';

  @override
  String get actionTypeAddedComment => 'Commentaire ajouté';

  @override
  String get actionTypeUpdatedComment => 'Commentaire mis à jour';

  @override
  String get actionTypeDeletedComment => 'Commentaire supprimé';

  @override
  String get actionTypeSmsSent => 'SMS envoyé';

  @override
  String get actionTypeAddedToEntityGroup => 'Ajouté au groupe d’entités';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Supprimé du groupe d’entités';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Appel API REST du moteur de règles';

  @override
  String get actionTypeMadePublic => 'Rendu public';

  @override
  String get actionTypeMadePrivate => 'Rendu privé';

  @override
  String get actionTypeChangeOwner => 'Propriétaire changé';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Vous n’avez pas les autorisations pour effectuer cette opération !';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Il semble que vos autorisations soient insuffisantes pour effectuer cette opération';

  @override
  String fieldIsRequired(String field) {
    return '$field est un champ obligatoire.';
  }

  @override
  String get no2faProvidersFound => 'Aucun fournisseur 2FA trouvé';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Veuillez contacter votre administrateur système';

  @override
  String errorOccured(Object e) {
    return 'Une erreur s’est produite : $e';
  }

  @override
  String get unsavedChanges => 'Modifications non enregistrées';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Des modifications non enregistrées existent. Voulez-vous vraiment quitter cette page ?';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Êtes-vous sûr ? Vous êtes sur le point de supprimer votre compte $authority.';
  }

  @override
  String get language => 'Langue';

  @override
  String get metricUnitSystem => 'Métrique';

  @override
  String get imperialUnitSystem => 'Impérial';

  @override
  String get hybridUnitSystem => 'Hybride';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Système d’unités';

  @override
  String get selectCountry => 'Sélectionner le pays';

  @override
  String get hideHomeDashboardToolbar =>
      'Masquer la barre d’outils du tableau de bord d’accueil';

  @override
  String get phoneNumberHelperText =>
      'Numéro de téléphone au format E.164, ex. +1201550123';

  @override
  String get homeDashboard => 'Tableau de bord d’accueil';

  @override
  String get security => 'Sécurité';

  @override
  String get twofactorAuthentication => 'Authentification à deux facteurs';

  @override
  String get verificationRequired => 'Vérification requise';

  @override
  String get twofactorAuthenticationIsRequired =>
      'L’authentification à deux facteurs est requise';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Définissez une méthode de vérification pour poursuivre la connexion';

  @override
  String get setUpAVerificationMethod => 'Définir une méthode de vérification';

  @override
  String get totpSetupSuccessDescription =>
      'La prochaine fois que vous vous connecterez, vous devrez fournir un code d’authentification à deux facteurs';

  @override
  String get smsSetupSuccessDescription =>
      'La prochaine fois que vous vous connecterez, vous serez invité à saisir le code de sécurité qui sera envoyé au numéro de téléphone';

  @override
  String get emailSetupSuccessDescription =>
      'La prochaine fois que vous vous connecterez, vous serez invité à saisir le code de sécurité qui sera envoyé à votre adresse email';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Lors de votre prochaine connexion, vous pourrez utiliser des codes de secours pour valider l’authentification à deux facteurs';

  @override
  String get loginToApp => 'Se connecter à l’application';

  @override
  String get goBack => 'Retour';

  @override
  String get done => 'Terminé';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Cela rendra votre compte moins sécurisé';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Voulez-vous vraiment désactiver $providerName ?';
  }

  @override
  String get yesDeactivate => 'Oui, désactiver';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Saisissez une adresse e-mail à utiliser comme méthode d’authentification.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Saisissez un numéro de téléphone à utiliser comme méthode d’authentification';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get copy => 'Copier';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Saisissez le code à 6 chiffres ici';

  @override
  String digitsCode(int count) {
    return 'Code à $count chiffres';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copiez la clé de 32 caractères dans votre application d’authentification, ou scannez le code QR ci-dessous';

  @override
  String get applyChanges => 'Appliquer les modifications';

  @override
  String get discardChanges => 'Annuler les modifications';

  @override
  String get yesDiscard => 'Oui, abandonner';

  @override
  String get thisActionCannotBeUndone => 'Cette action est irréversible';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'L’authentification à deux facteurs protège votre compte contre les accès non autorisés. Il vous suffit de saisir un code de sécurité lors de votre connexion.';

  @override
  String get calculatedField => 'Champ calculé';

  @override
  String get apiKey => 'Clé API';

  @override
  String get aiModel => 'Modèle IA';

  @override
  String get adminSettings => 'Paramètres administrateur';

  @override
  String get job => 'Tâche';

  @override
  String get mobileAppBundle => 'Pack d’application mobile';

  @override
  String get mobileApp => 'Application mobile';

  @override
  String get domain => 'Domaine';

  @override
  String get oauth2Client => 'Client OAuth 2.0';

  @override
  String get queueStats => 'Statistiques de file d’attente';

  @override
  String get phoneIsRequired => 'Le téléphone est requis';

  @override
  String get phoneIsInvalid => 'Le numéro de téléphone est invalide';

  @override
  String get addVerificationMethod => 'Ajouter une méthode de vérification';

  @override
  String get imageSavedToGallery =>
      'Enregistré dans la « Galerie d’images » de la plateforme';

  @override
  String get failedToSaveImage => 'Échec de l’enregistrement de l’image';

  @override
  String nSelected(int count) {
    return 'Sélectionnées : $count';
  }

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opérations ont échoué',
      one: '1 opération a échoué',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count notifications ?',
      one: 'Supprimer 1 notification ?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Marquer $count notifications comme lues ?',
      one: 'Marquer 1 notification comme lue ?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Récupération des données depuis votre hôte $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Connexion à l’hôte $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Basculement vers le nouvel hôte $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Échec de l’obtention d’un jeton de connexion depuis $host. Veuillez scanner un nouveau code QR.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Échec de la connexion à $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host n’est pas un serveur ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'La session du code QR n’est plus valide. Veuillez actualiser le code QR et scanner à nouveau.';

  @override
  String get openThisLinkTitle => 'Ouvrir ce lien ?';

  @override
  String get linkOpensSignInPage =>
      'Ce lien ouvre la page de connexion de ce serveur. Vous serez déconnecté de votre serveur actuel.';

  @override
  String get linkOpensSignInPageOnly =>
      'Ce lien ouvre la page de connexion de ce serveur.';

  @override
  String linkSignsInAs(Object email) {
    return 'Ce lien vous connecte à ce serveur en tant que $email.';
  }

  @override
  String get linkSignsIn => 'Ce lien vous connecte à ce serveur.';

  @override
  String get serverConnectionNotSecure =>
      'Ce serveur n’utilise pas de connexion sécurisée.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Cette application ne fonctionne qu’avec son propre serveur et ne peut pas ouvrir ce lien.';

  @override
  String get liveTrackingActive => 'Suivi de localisation en direct';

  @override
  String get liveTrackingPaused => 'Suivi en direct en pause';

  @override
  String get liveTrackingFixes => 'Positions';

  @override
  String get liveTrackingSaved => 'Enregistrées';

  @override
  String get liveTrackingErrors => 'Erreurs';

  @override
  String get liveTrackingStop => 'Arrêter';

  @override
  String get liveTrackingPause => 'Pause';

  @override
  String get liveTrackingResume => 'Reprendre';

  @override
  String get liveTrackingHide => 'Masquer';

  @override
  String get liveTrackingSessionTitle => 'Suivi de localisation en direct';

  @override
  String get liveTrackingTarget => 'Enregistrer la position dans l’entité';

  @override
  String get liveTrackingDashboard => 'Tableau de bord';

  @override
  String get liveTrackingStatus => 'Statut';

  @override
  String get liveTrackingStarted => 'Heure de début';

  @override
  String get liveTrackingLastFix => 'Dernière position';

  @override
  String get liveTrackingLastError => 'Dernière erreur';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Impossible d’enregistrer sur cette entité — elle n’existe plus. Le suivi continue ; mettez à jour la cible dans l’action du tableau de bord.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Aucune connexion au serveur. Ces positions n’ont pas été enregistrées — l’enregistrement reprendra dès que vous serez de nouveau en ligne.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Votre session a expiré. Reconnectez-vous pour continuer à enregistrer la position.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Impossible d’enregistrer sur cette entité — vous n’avez pas l’autorisation. Le suivi continue ; demandez à votre administrateur de vous accorder l’accès.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Impossible d’enregistrer cette position sur le serveur. L’enregistrement sera réessayé à la position suivante.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Les services de localisation sont désactivés sur cet appareil.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'L’autorisation de localisation a été refusée.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'L’autorisation de localisation est définitivement refusée. Activez-la dans les paramètres de l’application.';

  @override
  String get liveTrackingErrorLocation => 'Impossible d’obtenir la position.';

  @override
  String get liveTrackingMenuTitle => 'Suivi de localisation en direct';

  @override
  String get liveTrackingNoRecord =>
      'Aucun suivi actif et aucune session récente.';

  @override
  String get liveTrackingLastSession => 'Dernière session';

  @override
  String get liveTrackingStartAgain => 'Recommencer';

  @override
  String get liveTrackingEnded => 'Heure de fin';

  @override
  String get liveTrackingEndReason => 'Motif de fin';

  @override
  String get liveTrackingEndReasonManual => 'Arrêté manuellement';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Durée max atteinte';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrompu';

  @override
  String get serverUpdateRequired => 'Mise à jour du serveur requise';

  @override
  String get backToLogin => 'Retour à la connexion';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Cette application fonctionne avec ThingsBoard $minVersion ou version ultérieure.';
  }

  @override
  String get serverLabel => 'Serveur';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Demandez à votre administrateur de serveur de mettre à jour le serveur.';

  @override
  String get deviceClaimFailed =>
      'Impossible de réclamer l’appareil. Veuillez réessayer.';

  @override
  String get deviceToClaimNotFound =>
      'Appareil introuvable. Veuillez contacter le fournisseur de l’appareil.';

  @override
  String get enableAuthenticatorApp =>
      'Activer l’application d’authentification';

  @override
  String get enableSmsAuthenticator => 'Activer l’authentification par SMS';

  @override
  String get enableEmailAuthenticator =>
      'Activer l’authentification par e-mail';

  @override
  String get getBackupCode => 'Obtenir un code de secours';

  @override
  String get twoFaTotpDescription =>
      'Utilisez des applications comme Google Authenticator, Authy ou Duo sur votre téléphone pour vous authentifier. Elles génèrent un code de sécurité pour vous connecter.';

  @override
  String get twoFaSmsDescription =>
      'Utilisez votre téléphone pour vous authentifier. Nous vous enverrons un code de sécurité par SMS lors de votre connexion.';

  @override
  String get twoFaEmailDescription =>
      'Utilisez un code de sécurité envoyé à votre adresse email pour vous authentifier.';

  @override
  String get twoFaBackupCodeDescription =>
      'Ces codes d’accès imprimables à usage unique vous permettent de vous connecter lorsque vous n’avez pas votre téléphone, par exemple en voyage.';

  @override
  String get openInAuthenticatorApp =>
      'Ouvrir dans l’application d’authentification';

  @override
  String get noAuthenticatorAppFound =>
      'Aucune application d’authentification trouvée. Copiez plutôt la clé dans votre application.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Méthode activée : $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Votre administrateur exige l’authentification à deux facteurs pour $email.';
  }

  @override
  String get recommended => 'Recommandé';

  @override
  String get addBackupCodesHint =>
      'Ajoutez aussi des codes de secours pour pouvoir vous connecter si vous perdez votre téléphone.';

  @override
  String get totpSecretKey => 'Clé secrète';

  @override
  String get backupCodesDescription =>
      'Imprimez ces codes afin de les avoir à portée de main lorsque vous devrez vous connecter à votre compte. Chaque code de secours ne peut être utilisé qu’une seule fois.';

  @override
  String get backupCodesWarning =>
      'Une fois que vous quittez cette page, ces codes ne peuvent plus être affichés. Stockez-les en toute sécurité à l’aide des options ci-dessous.';

  @override
  String get downloadTxt => 'Télécharger (txt)';
}

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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Journaux d\'audit';

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
  String get logout => 'Déconnexion';

  @override
  String get login => 'Connexion';

  @override
  String get logoDefaultValue => 'Logo ThingsBoard';

  @override
  String get loginToYourAccount => 'Connectez-vous à votre compte';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'L\'email est requis.';

  @override
  String get emailInvalidText => 'Format d\'email invalide.';

  @override
  String get username => 'nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordRequireText => 'Le mot de passe est requis.';

  @override
  String get passwordForgotText => 'Mot de passe oublié ?';

  @override
  String get passwordReset => 'Réinitialiser le mot de passe';

  @override
  String get passwordResetText =>
      'Saisissez l\'adresse email associée à votre compte et nous vous enverrons un lien de réinitialisation de mot de passe';

  @override
  String get requestPasswordReset =>
      'Demander la réinitialisation du mot de passe';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Le lien de réinitialisation du mot de passe a été envoyé avec succès !';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Le lien de vérification par e-mail a été envoyé avec succès !';

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
  String get postalCode => 'Code postal';

  @override
  String get address => 'Adresse';

  @override
  String get address2 => 'Complément d\'adresse';

  @override
  String get phone => 'Téléphone';

  @override
  String get alarmClearTitle => 'Effacer l\'alarme';

  @override
  String get alarmClearText => 'Êtes-vous sûr de vouloir effacer l\'alarme ?';

  @override
  String get alarmAcknowledgeTitle => 'Accuser réception de l\'alarme';

  @override
  String get alarmAcknowledgeText =>
      'Êtes-vous sûr de vouloir accuser réception de l\'alarme ?';

  @override
  String get assetName => 'Nom de l\'actif';

  @override
  String get type => 'Type';

  @override
  String get label => 'Étiquette';

  @override
  String get assignedToCustomer => 'Attribué au client';

  @override
  String get auditLogDetails => 'Détails du journal d\'audit';

  @override
  String get entityType => 'Type d\'entité';

  @override
  String get actionData => 'Données d\'action';

  @override
  String get failureDetails => 'Détails de l\'échec';

  @override
  String get allDevices => 'Tous les appareils';

  @override
  String get active => 'Actif';

  @override
  String get inactive => 'Inactif';

  @override
  String get systemAdministrator => 'Administrateur système';

  @override
  String get tenantAdministrator => 'Administrateur de locataire';

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
      'Les mots de passe saisis doivent être identiques !';

  @override
  String get firstNameUpper => 'Prénom';

  @override
  String get lastNameUpper => 'Nom de famille';

  @override
  String get profileSuccessNotification => 'Profil mis à jour avec succès';

  @override
  String get passwordSuccessNotification => 'Mot de passe changé avec succès';

  @override
  String get notImplemented => 'Non implémenté !';

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
      'Veuillez saisir le code de sécurité depuis votre application d\'authentification.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Un code de sécurité a été envoyé à votre téléphone au $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Un code de sécurité a été envoyé à votre adresse email à $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Veuillez saisir l’un de vos codes de secours.';

  @override
  String get verificationCodeInvalid =>
      'Format du code de vérification invalide';

  @override
  String get toptAuthPlaceholder => 'Code';

  @override
  String get smsAuthPlaceholder => 'Code SMS';

  @override
  String get emailAuthPlaceholder => 'Code email';

  @override
  String get backupCodeAuthPlaceholder => 'Code de secours';

  @override
  String get verificationCodeIncorrect =>
      'Le code de vérification est incorrect';

  @override
  String get verificationCodeManyRequest =>
      'Trop de demandes, vérifiez le code de vérification';

  @override
  String get tryAnotherWay => 'Essayer une autre méthode';

  @override
  String get selectWayToVerify => 'Sélectionnez une méthode de vérification';

  @override
  String get mfaProviderTopt => 'Application d\'authentification';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Code de secours';

  @override
  String get newUserText => 'Nouvel utilisateur ?';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get emailVerification => 'Vérification de l\'email';

  @override
  String get emailVerificationSentText =>
      'Un email contenant les détails de vérification a été envoyé à l\'adresse spécifiée';

  @override
  String get emailVerificationInstructionsText =>
      'Veuillez suivre les instructions fournies dans l\'email pour finaliser votre inscription. Remarque : si vous ne voyez pas l\'email, vérifiez votre dossier \'spam\' ou cliquez sur le bouton \'Renvoyer\' pour le renvoyer.';

  @override
  String get resend => 'Renvoyer';

  @override
  String get activatingAccount => 'Activation du compte...';

  @override
  String get accountActivated => 'Compte activé avec succès !';

  @override
  String get emailVerified => 'Email vérifié';

  @override
  String get activatingAccountText =>
      'Votre compte est en cours d\'activation.\nVeuillez patienter...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Félicitations !\nVotre compte $appTitle a été activé.\nVous pouvez maintenant vous connecter à votre espace $appTitle.';
  }

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get cancel => 'Annuler';

  @override
  String get accept => 'Accepter';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get firstName => 'Prénom';

  @override
  String get firstNameRequireText => 'Le prénom est requis.';

  @override
  String get lastName => 'Nom de famille';

  @override
  String get lastNameRequireText => 'Le nom de famille est requis.';

  @override
  String get createPassword => 'Créer un mot de passe';

  @override
  String get repeatPassword => 'Répétez votre mot de passe';

  @override
  String get imNotARobot => 'Je ne suis pas un robot';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get alreadyHaveAnAccount => 'Vous avez déjà un compte ?';

  @override
  String get signIn => 'Se connecter';

  @override
  String get inactiveUserAlreadyExists => 'Un utilisateur inactif existe déjà';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Un utilisateur avec une adresse email non vérifiée est déjà enregistré.\nCliquez sur le bouton \'Renvoyer\' si vous souhaitez renvoyer l\'email de vérification.';

  @override
  String get assignee => 'Attribué à';

  @override
  String get alarmTypes => 'Types d\'alarme';

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
  String get days => 'jours';

  @override
  String get hours => 'heures';

  @override
  String get minutes => 'minutes';

  @override
  String get seconds => 'secondes';

  @override
  String get viewDashboard => 'Voir le tableau de bord';

  @override
  String get activity => 'Activité';

  @override
  String get addCommentMessage => 'Ajouter un commentaire...';

  @override
  String get selectUser => 'Sélectionner des utilisateurs';

  @override
  String get assignedToMe => 'Attribué à moi';

  @override
  String get clear => 'Effacer';

  @override
  String get acknowledge => 'Accuser réception';

  @override
  String get edit => 'Éditer';

  @override
  String get delete => 'Supprimer';

  @override
  String get edited => 'Édité';

  @override
  String get deleteComment => 'Supprimer le commentaire';

  @override
  String get areYouSure => 'Êtes-vous sûr ?';

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
  String get unassigned => 'Non attribué';

  @override
  String get failedToLoadAlarmDetails =>
      'Échec du chargement des détails de l\'alarme';

  @override
  String get somethingWentWrong => 'Une erreur s\'est produite';

  @override
  String get chooseRegion => 'Choisir une région';

  @override
  String get selectRegion => 'Sélectionner une région';

  @override
  String get northAmerica => 'Amérique du Nord';

  @override
  String get europe => 'Europe';

  @override
  String get northAmericaRegionShort => 'N. Virginie';

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
    return 'Pour continuer la configuration de votre appareil $deviceName, veuillez fournir les identifiants de votre réseau.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Saisir le mot de passe pour $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Aucun appareil trouvé. Veuillez vous assurer que le Bluetooth de votre téléphone est activé et que vous êtes à portée de l\'appareil.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Vous n\'avez pas les autorisations nécessaires pour \"$permissions\". Veuillez accorder les autorisations requises et appuyez sur \"Réessayer\".';
  }

  @override
  String get sendingWifiCredentials => 'Envoi des identifiants Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Confirmation de la connexion Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'L\'appareil a été provisionné avec succès';

  @override
  String get returnToDashboard => 'Retour au tableau de bord';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Impossible d\'établir une session avec l\'appareil $deviceName. Veuillez réessayer';
  }

  @override
  String get claimingDevice => 'Réclamation de l\'appareil';

  @override
  String get claimingDeviceDone => 'Réclamation de l\'appareil terminée';

  @override
  String get claimingMessageSuccess => 'L\'appareil a été\nréclamé avec succès';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Vous n\'avez pas les autorisations nécessaires pour \"$permissions\". Veuillez ouvrir les paramètres de l\'application, accorder les autorisations, puis appuyez sur \"Réessayer\".';
  }

  @override
  String get scanACode => 'Scanner un code';

  @override
  String get allowAccess => 'Autoriser l\'accès';

  @override
  String get toggleCamera => 'Changer de caméra';

  @override
  String get toggleFlash => 'Activer/désactiver le flash';

  @override
  String get unableToUseCamera => 'Impossible d\'utiliser la caméra';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Ouvrez les paramètres et accordez l\'accès à la caméra pour continuer';

  @override
  String get notFound => 'Non trouvé';

  @override
  String routeNotDefined(Object name) {
    return 'Route non définie : $name';
  }

  @override
  String get loginWith => 'Se connecter avec';

  @override
  String get scanQrCode => 'Scanner le code QR';

  @override
  String get anEmptyRequestDataReceived => 'Données de requête vides reçues.';

  @override
  String get somethingWentWrongRollback =>
      'Une erreur s\'est produite ... Annulation';

  @override
  String get searchResults => 'Résultats de recherche';

  @override
  String get viewAll => 'Tout afficher';

  @override
  String get requestedEntityDoesNotExists =>
      'L\'entité demandée n\'existe pas.';

  @override
  String get noAlarmsFound => 'Aucune alarme trouvée';

  @override
  String get filters => 'Filtres';

  @override
  String get alarmStatusList => 'Liste des statuts d\'alarme';

  @override
  String get alarmSeverityList => 'Liste des gravités d\'alarme';

  @override
  String get cleared => 'Effacé';

  @override
  String get acknowledged => 'Acquitté';

  @override
  String get unacknowledged => 'Non acquitté';

  @override
  String get critical => 'Critique';

  @override
  String get major => 'Majeur';

  @override
  String get minor => 'Mineur';

  @override
  String get warning => 'Avertissement';

  @override
  String get indeterminate => 'Indéterminé';

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
  String get alarmTypeList => 'Liste des types d\'alarme';

  @override
  String get anyType => 'Tout type';

  @override
  String get plusAlarmType => '+ Type d\'alarme';

  @override
  String get all => 'Tout';

  @override
  String get unread => 'Non lu';

  @override
  String get close => 'Fermer';

  @override
  String get codeVerificationFailed => 'Échec de la vérification du code !';

  @override
  String get fatalError => 'Erreur fatale';

  @override
  String get unknownError => 'Erreur inconnue.';

  @override
  String get fatalApplicationErrorOccurred =>
      'Erreur fatale de l\'application :';

  @override
  String get connectionError => 'Erreur de connexion';

  @override
  String get failedToConnectToServer => 'Échec de la connexion au serveur';

  @override
  String get retry => 'Réessayer';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Le tableau de bord mobile doit être configuré dans le profil de l\'appareil !';

  @override
  String get openWifiSettings => 'Ouvrir les paramètres Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Connectez-vous au Wi-Fi que vous utilisez habituellement';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Revenez à l\'application et appuyez sur le bouton Prêt';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Veuillez suivre les étapes suivantes pour reconnecter\nvotre téléphone à votre Wi-Fi habituel';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Les notifications push ne sont pas configurées.\nVeuillez contacter votre administrateur système.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase n\'est pas configuré.\nVeuillez consulter la documentation officielle de Firebase\npour les instructions.';

  @override
  String get markAllAsRead => 'Tout marquer comme lu';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Impossible d\'ouvrir l\'url : $link';
  }

  @override
  String get noDashboardsFound => 'Aucun tableau de bord trouvé';

  @override
  String get openAppSettings => 'Ouvrir les paramètres de l\'application';

  @override
  String get connectingToDevice => 'Connexion à l\'appareil';

  @override
  String get connectToDevice => 'Se connecter à l\'appareil';

  @override
  String get selectWifiNetwork => 'Sélectionner le réseau Wi-Fi';

  @override
  String get deviceProvisioning => 'Provisionnement de l\'appareil';

  @override
  String get permissions => 'Autorisations';

  @override
  String get unableConnectToDevice =>
      'Impossible de se connecter à l\'appareil';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'L\'appareil ne trouve pas de Wi-Fi à proximité';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'La connexion au réseau Wi-Fi $name a échoué.\nVeuillez vous assurer que votre téléphone est connecté au réseau Wi-Fi de l\'appareil et que l\'accès au réseau local est activé pour cette application.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Impossible de se connecter au Wi-Fi car aucun réseau n\'a été trouvé par l\'appareil $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Veuillez suivre les étapes suivantes pour connecter votre téléphone à l\'appareil';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Connectez-vous au Wi-Fi similaire à $wifiName';
  }

  @override
  String get ready => 'Prêt';

  @override
  String get exitDeviceProvisioning => 'Quitter le provisionnement';

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
  String get tenantProfile => 'Profil du locataire';

  @override
  String get user => 'Utilisateur';

  @override
  String get asset => 'Actif';

  @override
  String get deviceProfile => 'Profil de l\'appareil';

  @override
  String get assetProfile => 'Profil de l\'actif';

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
  String get entityView => 'Vue d\'entité';

  @override
  String get widgetsBundle => 'Pack de widgets';

  @override
  String get widgetType => 'Type de widget';

  @override
  String get apiUsageState => 'État d\'utilisation de l\'API';

  @override
  String get tbResource => 'Ressource';

  @override
  String get otaPackage => 'Paquet OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'File d\'attente';

  @override
  String get notificationTarget => 'Cible de notification';

  @override
  String get notificationTemplate => 'Modèle de notification';

  @override
  String get notificationRequest => 'Demande de notification';

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
  String get entityGroup => 'Groupe d\'entités';

  @override
  String get converter => 'Convertisseur';

  @override
  String get integration => 'Intégration';

  @override
  String get schedulerEvent => 'Événement du planificateur';

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
  String get actionTypeAssignedToCustomer => 'Attribué au client';

  @override
  String get actionTypeUnassignedFromCustomer => 'Retiré du client';

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
  String get actionTypeAlarmAck => 'Acquitté';

  @override
  String get actionTypeAlarmClear => 'Effacé';

  @override
  String get actionTypeAlarmDelete => 'Alarme supprimée';

  @override
  String get actionTypeAlarmAssigned => 'Alarme attribuée';

  @override
  String get actionTypeAlarmUnassigned => 'Alarme non attribuée';

  @override
  String get actionTypeLogin => 'Connexion';

  @override
  String get actionTypeLogout => 'Déconnexion';

  @override
  String get actionTypeLockout => 'Verrouillé';

  @override
  String get actionTypeAssignedFromTenant => 'Attribué depuis le locataire';

  @override
  String get actionTypeAssignedToTenant => 'Attribué au locataire';

  @override
  String get actionTypeProvisionSuccess => 'Appareil provisionné';

  @override
  String get actionTypeProvisionFailure => 'Échec du provisionnement';

  @override
  String get actionTypeTimeseriesUpdated => 'Télémétrie mise à jour';

  @override
  String get actionTypeTimeseriesDeleted => 'Télémétrie supprimée';

  @override
  String get actionTypeAssignedToEdge => 'Attribué à Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Retiré d\'Edge';

  @override
  String get actionTypeAddedComment => 'Commentaire ajouté';

  @override
  String get actionTypeUpdatedComment => 'Commentaire mis à jour';

  @override
  String get actionTypeDeletedComment => 'Commentaire supprimé';

  @override
  String get actionTypeSmsSent => 'SMS envoyé';

  @override
  String get actionTypeAddedToEntityGroup => 'Ajouté au groupe d\'entités';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Retiré du groupe d\'entités';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Appel du moteur de règles REST API';

  @override
  String get actionTypeMadePublic => 'Rendu public';

  @override
  String get actionTypeMadePrivate => 'Rendu privé';

  @override
  String get actionTypeChangeOwner => 'Propriétaire modifié';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Vous n\'avez pas les autorisations pour effectuer cette opération !';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Il semble que vos autorisations ne soient pas suffisantes pour effectuer cette opération';

  @override
  String get isRequiredText => 'est requis.';

  @override
  String get no2faProvidersFound => 'Aucun fournisseur 2FA trouvé';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Veuillez contacter votre administrateur système';

  @override
  String errorOccured(Object e) {
    return 'Erreur survenue : $e';
  }

  @override
  String get unsavedChanges => 'Modifications non enregistrées';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Vous avez des modifications non enregistrées. Êtes-vous sûr de vouloir quitter cette page ?';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Êtes-vous sûr ? Vous allez supprimer votre compte $authority.';
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
  String get unitSystem => 'Système d\'unités';

  @override
  String get selectCountry => 'Sélectionner le pays';

  @override
  String get hideHomeDashboardToolbar =>
      'Masquer la barre d\'outils du tableau de bord';

  @override
  String get phoneNumberHelperText =>
      'Numéro de téléphone au format E.164, ex. +1201550123';

  @override
  String get homeDashboard => 'Tableau de bord d\'accueil';

  @override
  String get security => 'Sécurité';

  @override
  String get twofactorAuthentication => 'Authentification à deux facteurs';

  @override
  String get verificationRequired => 'Vérification requise';

  @override
  String get twofactorAuthenticationIsRequired =>
      'L\'authentification à deux facteurs est requise';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configurez une méthode de vérification pour continuer votre connexion';

  @override
  String get setUpAVerificationMethod =>
      'Configurer une méthode de vérification';

  @override
  String get totpSetupSuccessDescription =>
      'Lors de votre prochaine connexion, vous devrez fournir un code d\'authentification à deux facteurs';

  @override
  String get smsSetupSuccessDescription =>
      'Lors de votre prochaine connexion, vous devrez saisir le code de sécurité envoyé au numéro de téléphone';

  @override
  String get emailSetupSuccessDescription =>
      'Lors de votre prochaine connexion, vous devrez saisir le code de sécurité envoyé à votre adresse email';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Lors de votre prochaine connexion, vous pourrez utiliser des codes de secours pour l\'authentification à deux facteurs';

  @override
  String get loginToApp => 'Se connecter à l\'application';

  @override
  String get goBack => 'Retour';

  @override
  String get done => 'Terminé';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Cela rendra votre compte moins sécurisé';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Êtes-vous sûr de vouloir désactiver $providerName ?';
  }

  @override
  String get yesDeactivate => 'Oui, désactiver';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Entrez un email à utiliser comme authentificateur.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Entrez un numéro de téléphone à utiliser comme authentificateur';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String errorSendingCode(String error) {
    return 'Erreur lors de l\'envoi du code : $error';
  }

  @override
  String get copy => 'Copier';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Entrez le code à 6 chiffres de votre application ici :';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'chiffres',
      one: 'chiffre',
    );
    return 'Code à $count $_temp0';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copiez la clé à 32 chiffres dans votre application d\'authentification ou scannez le code QR ci-dessous';

  @override
  String get applyChanges => 'Appliquer les modifications';

  @override
  String get discardChanges => 'Annuler les modifications';

  @override
  String get yesDiscard => 'Oui, annuler';

  @override
  String get thisActionCannotBeUndone =>
      'Cette action ne peut pas être annulée';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'L\'authentification à deux facteurs protège votre compte contre les accès non autorisés. Il vous suffit de saisir un code de sécurité lors de la connexion.';

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
  String get mobileAppBundle => 'Pack application mobile';

  @override
  String get mobileApp => 'Application mobile';

  @override
  String get domain => 'Domaine';

  @override
  String get oauth2Client => 'Client OAuth2';

  @override
  String get queueStats => 'Statistiques de file d\'attente';

  @override
  String get phoneIsRequired => 'Le téléphone est requis';

  @override
  String get phoneIsInvalid => 'Le numéro de téléphone est invalide';

  @override
  String get addVerificationMethod => 'Ajouter une méthode de vérification';

  @override
  String get imageSavedToGallery => 'Enregistré dans \'Galerie d’images\'';

  @override
  String get failedToSaveImage => 'Échec de l’enregistrement de l’image';

  @override
  String nSelected(int count) {
    return '$count sélectionnés';
  }

  @override
  String get selectAll => 'Sélectionner tout le chargé';

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
  String get liveTrackingActive => 'Live location tracking';

  @override
  String get liveTrackingPaused => 'Live tracking paused';

  @override
  String get liveTrackingFixes => 'Fixes';

  @override
  String get liveTrackingSaved => 'Saved';

  @override
  String get liveTrackingErrors => 'Errors';

  @override
  String get liveTrackingStop => 'Stop';

  @override
  String get liveTrackingPause => 'Pause';

  @override
  String get liveTrackingResume => 'Resume';

  @override
  String get liveTrackingHide => 'Hide';

  @override
  String get liveTrackingSessionTitle => 'Live location tracking';

  @override
  String get liveTrackingTarget => 'Save location to entity';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Start time';

  @override
  String get liveTrackingLastFix => 'Last fix';

  @override
  String get liveTrackingLastError => 'Last error';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Can\'t save to this entity — it no longer exists. Tracking continues; update the target in the dashboard action.';

  @override
  String get liveTrackingErrorNoConnection =>
      'No connection to the server. These fixes weren\'t saved — saving resumes when you\'re back online.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Your session ended. Sign in again to keep saving location.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Can\'t save to this entity — you don\'t have permission. Tracking continues; ask your administrator to grant access.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Couldn\'t save this fix to the server. Saving retries with the next fix.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Location services are turned off on this device.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Location permission was denied.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Location permission is permanently denied. Enable it in the app settings.';

  @override
  String get liveTrackingErrorLocation => 'Couldn\'t get a location fix.';

  @override
  String get liveTrackingMenuTitle => 'Live location tracking';

  @override
  String get liveTrackingNoRecord =>
      'No active tracking and no recent session.';

  @override
  String get liveTrackingLastSession => 'Last session';

  @override
  String get liveTrackingStartAgain => 'Start again';

  @override
  String get liveTrackingEnded => 'End time';

  @override
  String get liveTrackingEndReason => 'End reason';

  @override
  String get liveTrackingEndReasonManual => 'Stopped manually';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Reached max duration';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrupted';

  @override
  String get serverUpdateRequired => 'Mise à jour du serveur requise';

  @override
  String get backToLogin => 'Retour à la connexion';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Cette application fonctionne avec ThingsBoard $minVersion ou une version ultérieure.';
  }

  @override
  String get serverLabel => 'Serveur';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Demandez à l\'administrateur du serveur de le mettre à jour.';

  @override
  String get deviceClaimFailed =>
      'Impossible de réclamer l\'appareil. Veuillez réessayer.';

  @override
  String get deviceToClaimNotFound =>
      'Appareil introuvable. Veuillez contacter le fournisseur de l\'appareil.';
}

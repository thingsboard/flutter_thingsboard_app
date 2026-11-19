// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class SPt extends S {
  SPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Início';

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
  String get more => 'Mais';

  @override
  String get customers => 'Clientes';

  @override
  String get assets => 'Ativos';

  @override
  String get tenants => 'Locatários';

  @override
  String get auditLogs => 'Logs de auditoria';

  @override
  String get noCustomersFound => 'Nenhum cliente encontrado';

  @override
  String get noAssetsFound => 'Nenhum ativo encontrado';

  @override
  String get noTenantsFound => 'Nenhum locatário encontrado';

  @override
  String get noDevicesFound => 'Nenhum dispositivo encontrado';

  @override
  String get noAuditLogsFound => 'Nenhum log de auditoria encontrado';

  @override
  String get logout => 'Sair';

  @override
  String get login => 'Entrar';

  @override
  String get logoDefaultValue => 'Logotipo ThingsBoard';

  @override
  String get loginToYourAccount => 'Entrar na sua conta';

  @override
  String get email => 'E-mail';

  @override
  String get emailRequireText => 'O e-mail é obrigatório.';

  @override
  String get emailInvalidText => 'Formato de e-mail inválido.';

  @override
  String get username => 'nome de usuário';

  @override
  String get password => 'Senha';

  @override
  String get passwordRequireText => 'A senha é obrigatória.';

  @override
  String get passwordForgotText => 'Esqueceu a senha?';

  @override
  String get passwordReset => 'Redefinir senha';

  @override
  String get passwordResetText =>
      'Digite o e-mail associado à sua conta e enviaremos um e-mail com o link para redefinir a senha';

  @override
  String get requestPasswordReset => 'Solicitar redefinição de senha';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Link para redefinição de senha enviado com sucesso!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Link de verificação de e-mail enviado com sucesso!';

  @override
  String get or => 'OU';

  @override
  String get no => 'Não';

  @override
  String get yes => 'Sim';

  @override
  String get title => 'Título';

  @override
  String get country => 'País';

  @override
  String get city => 'Cidade';

  @override
  String get stateOrProvince => 'Estado / Província';

  @override
  String get postalCode => 'CEP / Código postal';

  @override
  String get address => 'Endereço';

  @override
  String get address2 => 'Endereço 2';

  @override
  String get phone => 'Telefone';

  @override
  String get alarmClearTitle => 'Resolver alarme';

  @override
  String get alarmClearText => 'Tem certeza de que deseja resolver o alarme?';

  @override
  String get alarmAcknowledgeTitle => 'Reconhecer alarme';

  @override
  String get alarmAcknowledgeText =>
      'Tem certeza de que deseja reconhecer o alarme?';

  @override
  String get assetName => 'Nome do ativo';

  @override
  String get type => 'Tipo';

  @override
  String get label => 'Rótulo';

  @override
  String get assignedToCustomer => 'Atribuído ao cliente';

  @override
  String get auditLogDetails => 'Detalhes do log de auditoria';

  @override
  String get customerDetails => 'Detalhes do cliente';

  @override
  String get assetDetails => 'Detalhes do ativo';

  @override
  String get tenantDetails => 'Detalhes do locatário';

  @override
  String get entityType => 'Tipo de entidade';

  @override
  String get actionData => 'Dados da ação';

  @override
  String get failureDetails => 'Detalhes da falha';

  @override
  String get allDevices => 'Todos os dispositivos';

  @override
  String get active => 'Ativo';

  @override
  String get inactive => 'Inativo';

  @override
  String get activeDevices => 'Ativo';

  @override
  String get inactiveDevices => 'Inativo';

  @override
  String get alarmStatusActiveAcknowledged => 'Ativo reconhecido';

  @override
  String get alarmStatusActiveUnacknowledged => 'Ativo não reconhecido';

  @override
  String get alarmStatusClearedAcknowledged => 'Resolvido reconhecido';

  @override
  String get alarmStatusClearedUnacknowledged => 'Resolvido não reconhecido';

  @override
  String get alarmStatusFilterActive => 'Ativo';

  @override
  String get systemAdministrator => 'Administrador do sistema';

  @override
  String get tenantAdministrator => 'Administrador do locatário';

  @override
  String get customer => 'Cliente';

  @override
  String get changePassword => 'Alterar senha';

  @override
  String get currentPasswordRequireText => 'A senha atual é obrigatória.';

  @override
  String get currentPassword => 'Senha atual';

  @override
  String get newPasswordRequireText => 'A nova senha é obrigatória.';

  @override
  String get newPassword => 'Nova senha';

  @override
  String get newPassword2RequireText =>
      'A confirmação da nova senha é obrigatória.';

  @override
  String get newPassword2 => 'Confirmar nova senha';

  @override
  String get passwordErrorNotification =>
      'As senhas inseridas devem ser iguais!';

  @override
  String get firstNameUpper => 'Nome';

  @override
  String get lastNameUpper => 'Sobrenome';

  @override
  String get profileSuccessNotification => 'Perfil atualizado com sucesso';

  @override
  String get passwordSuccessNotification => 'Senha alterada com sucesso';

  @override
  String get notImplemented => 'Não implementado!';

  @override
  String get listIsEmptyText => 'A lista está vazia no momento.';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get verifyYourIdentity => 'Verificar sua identidade';

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
    return 'Reenviar código em $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Insira o código de segurança do seu aplicativo autenticador.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Um código de segurança foi enviado para o seu telefone em $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Um código de segurança foi enviado para o seu endereço de e-mail em $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Insira um dos seus códigos de backup.';

  @override
  String get toptAuthPlaceholder => 'Código';

  @override
  String get smsAuthPlaceholder => 'Código SMS';

  @override
  String get emailAuthPlaceholder => 'Código de e-mail';

  @override
  String get backupCodeAuthPlaceholder => 'Código de backup';

  @override
  String get verificationCodeIncorrect => 'Código de verificação incorreto';

  @override
  String get verificationCodeManyRequest =>
      'Muitas solicitações para verificar o código de verificação';

  @override
  String get tryAnotherWay => 'Tentar outra forma';

  @override
  String get selectWayToVerify => 'Selecionar uma forma de verificação';

  @override
  String get mfaProviderTopt => 'Aplicativo autenticador';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Código de backup';

  @override
  String get newUserText => 'Novo usuário?';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get emailVerification => 'Verificação de e-mail';

  @override
  String get emailVerificationSentText =>
      'Um e-mail com os detalhes de verificação foi enviado para o endereço de e-mail especificado ';

  @override
  String get emailVerificationInstructionsText =>
      'Siga as instruções fornecidas no e-mail para concluir o procedimento de cadastro. Observação: se você não visualizar o e-mail por um tempo, verifique sua pasta de \'spam\' ou tente reenviar o e-mail clicando no botão \'Reenviar\'.';

  @override
  String get resend => 'Reenviar';

  @override
  String get activatingAccount => 'Ativando conta...';

  @override
  String get accountActivated => 'Conta ativada com sucesso!';

  @override
  String get emailVerified => 'E-mail verificado';

  @override
  String get activatingAccountText =>
      'Sua conta está sendo ativada.\nAguarde...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Parabéns!\nSua conta $appTitle foi ativada.\nAgora você pode fazer login no seu espaço $appTitle.';
  }

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get cancel => 'Cancelar';

  @override
  String get accept => 'Aceitar';

  @override
  String get termsOfUse => 'Termos de Uso';

  @override
  String get firstName => 'Nome';

  @override
  String get firstNameRequireText => 'O nome é obrigatório.';

  @override
  String get lastName => 'Sobrenome';

  @override
  String get lastNameRequireText => 'O sobrenome é obrigatório.';

  @override
  String get createPassword => 'Criar uma senha';

  @override
  String get repeatPassword => 'Repetir sua senha';

  @override
  String get imNotARobot => 'Não sou um robô';

  @override
  String get signUp => 'Cadastrar';

  @override
  String get alreadyHaveAnAccount => 'Já tem uma conta?';

  @override
  String get signIn => 'Entrar';

  @override
  String get inactiveUserAlreadyExists => 'Usuário inativo já existe';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Já existe um usuário cadastrado com endereço de e-mail não verificado.\nClique no botão \'Reenviar\' se desejar reenviar o e-mail de verificação.';

  @override
  String get assignee => 'Responsável';

  @override
  String get alarmTypes => 'Tipos de alarme';

  @override
  String get details => 'Detalhes';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Severidade';

  @override
  String get originator => 'Originador';

  @override
  String get startTime => 'Hora de início';

  @override
  String get duration => 'Duração';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dias',
      one: '$value dia',
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
  String get viewDashboard => 'Visualizar dashboard';

  @override
  String get activity => 'Atividade';

  @override
  String get addCommentMessage => 'Adicionar um comentário...';

  @override
  String get selectUser => 'Selecionar usuários';

  @override
  String get assignedToMe => 'Atribuído a mim';

  @override
  String get clear => 'Resolver';

  @override
  String get acknowledge => 'Reconhecer';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Excluir';

  @override
  String get edited => 'Editado';

  @override
  String get deleteComment => 'Excluir comentário';

  @override
  String get areYouSure => 'Tem certeza?';

  @override
  String get noResultsFound => 'Nenhum resultado encontrado';

  @override
  String get tryRefiningYourQuery => 'Tente refinar sua consulta';

  @override
  String get failedToLoadTheList => 'Falha ao carregar a lista';

  @override
  String get tryRefreshing => 'Tente atualizar';

  @override
  String get refresh => 'Atualizar';

  @override
  String get users => 'Usuários';

  @override
  String get unassigned => 'Não atribuído';

  @override
  String get failedToLoadAlarmDetails =>
      'Falha ao carregar os detalhes do alarme';

  @override
  String get somethingWentWrong => 'Algo deu errado';

  @override
  String get chooseRegion => 'Escolher região';

  @override
  String get selectRegion => 'Selecionar região';

  @override
  String get northAmerica => 'América do Norte';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'N. Virgínia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Lista de dispositivos';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dashboards',
      one: 'Dashboard',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Atualização necessária';

  @override
  String updateTo(Object version) {
    return 'Atualizar para $version';
  }

  @override
  String get next => 'Próximo';

  @override
  String get confirmation => 'Confirmação';

  @override
  String get wifiPassword => 'Senha Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Para continuar a configuração do seu dispositivo $deviceName, forneça as credenciais da sua rede.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Digite a senha para $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Nenhum dispositivo encontrado. Verifique se o Bluetooth do seu telefone está ativado e se você está dentro do alcance do novo dispositivo.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Você não tem permissões suficientes (\"$permissions\") para continuar. Conceda as permissões necessárias e toque em \"Tentar novamente\".';
  }

  @override
  String get sendingWifiCredentials => 'Enviando credenciais Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Confirmando conexão Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'O dispositivo foi provisionado com sucesso';

  @override
  String get returnToDashboard => 'Voltar ao dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Não foi possível estabelecer sessão com o dispositivo $deviceName. Tente novamente';
  }

  @override
  String get claimingDevice => 'Reivindicando dispositivo';

  @override
  String get claimingDeviceDone => 'Reivindicação do dispositivo concluída';

  @override
  String get claimingMessageSuccess => 'Dispositivo reivindicado\ncom sucesso';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Você não tem permissões suficientes (\"$permissions\") para continuar. Abra as configurações do aplicativo, conceda as permissões e toque em \"Tentar novamente\".';
  }

  @override
  String get scanACode => 'Escanear um código';

  @override
  String get allowAccess => 'Permitir acesso';

  @override
  String get toggleCamera => 'Alternar câmera';

  @override
  String get toggleFlash => 'Alternar flash';

  @override
  String get unableToUseCamera => 'Não é possível usar a câmera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Abra as configurações e conceda acesso à câmera para continuar';

  @override
  String get notFound => 'Não encontrado';

  @override
  String routeNotDefined(Object name) {
    return 'Rota não definida: $name';
  }

  @override
  String get loginWith => 'Entrar com';

  @override
  String get scanQrCode => 'Escanear QR code';

  @override
  String get anEmptyRequestDataReceived =>
      'Dados de solicitação vazios recebidos.';

  @override
  String get somethingWentWrongRollback => 'Algo deu errado ... Reverter';

  @override
  String get searchResults => 'Resultados da pesquisa';

  @override
  String get viewAll => 'Ver todos';

  @override
  String get requestedEntityDoesNotExists =>
      'A entidade solicitada não existe.';

  @override
  String get noAlarmsFound => 'Nenhum alarme encontrado';

  @override
  String get filters => 'Filtros';

  @override
  String get alarmStatusList => 'Lista de status de alarme';

  @override
  String get alarmSeverityList => 'Lista de severidades de alarme';

  @override
  String get cleared => 'Resolvido';

  @override
  String get acknowledged => 'Reconhecido';

  @override
  String get unacknowledged => 'Não reconhecido';

  @override
  String get critical => 'Crítico';

  @override
  String get major => 'Maior';

  @override
  String get minor => 'Menor';

  @override
  String get warning => 'Aviso';

  @override
  String get indeterminate => 'Indeterminado';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pesquisar usuários',
      one: 'Pesquisar usuário',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Redefinir';

  @override
  String get update => 'Atualizar';

  @override
  String get alarmTypeList => 'Lista de tipos de alarme';

  @override
  String get anyType => 'Qualquer tipo';

  @override
  String get plusAlarmType => '+ Tipo de alarme';

  @override
  String get all => 'Todos';

  @override
  String get unread => 'Não lida';

  @override
  String get close => 'Fechar';

  @override
  String get codeVerificationFailed => 'Falha na verificação do código!';

  @override
  String get fatalError => 'Erro fatal';

  @override
  String get unknownError => 'Erro desconhecido.';

  @override
  String get sessionExpired => 'Sessão expirada';

  @override
  String get fatalApplicationErrorOccurred =>
      'Ocorreu um erro fatal no aplicativo:';

  @override
  String get connectionError => 'Erro de conexão';

  @override
  String get failedToConnectToServer => 'Falha ao conectar ao servidor';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'O dashboard móvel deve ser configurado no perfil do dispositivo!';

  @override
  String get openWifiSettings => 'Abrir configurações de Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Conecte-se ao Wi-Fi que você normalmente usa';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Volte para o aplicativo e toque no botão Pronto';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Siga os próximos passos para reconectar\nseu telefone ao seu Wi-Fi habitual';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'As notificações push não estão configuradas.\nEntre em contato com o administrador do sistema.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'O Firebase não está configurado.\n Consulte a documentação oficial do Firebase para\n obter orientação sobre como fazê-lo.';

  @override
  String get markAllAsRead => 'Marcar todas como lidas';

  @override
  String get profile => 'Perfil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Não é possível abrir a URL: $link';
  }

  @override
  String get noDashboardsFound => 'Nenhum dashboard encontrado';

  @override
  String get openAppSettings => 'Abrir configurações do aplicativo';

  @override
  String get connectingToDevice => 'Conectando ao dispositivo';

  @override
  String get connectToDevice => 'Conectar ao dispositivo';

  @override
  String get selectWifiNetwork => 'Selecionar rede Wi-Fi';

  @override
  String get deviceProvisioning => 'Provisionamento de dispositivo';

  @override
  String get permissions => 'Permissões';

  @override
  String get unableConnectToDevice =>
      'Não foi possível conectar ao dispositivo';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'O dispositivo não consegue encontrar Wi-Fi nas proximidades';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Falha na conexão com a rede Wi-Fi $name.\nVerifique se o seu telefone está conectado à rede Wi-Fi do dispositivo e se o acesso à Rede Local está habilitado para este aplicativo nas configurações do seu dispositivo.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Não foi possível conectar ao Wi-Fi porque as redes não foram encontradas pelo dispositivo $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Siga os próximos passos para conectar seu telefone ao dispositivo';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Conecte-se ao Wi-Fi semelhante a $wifiName';
  }

  @override
  String get ready => 'Pronto';

  @override
  String get exitDeviceProvisioning => 'Sair do provisionamento do dispositivo';

  @override
  String get noNotificationsFound => 'Nenhuma notificação encontrada';

  @override
  String get markAsRead => 'Marcar como lida';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Escaneie o QR code no seu dispositivo';

  @override
  String get search => 'Pesquisar';

  @override
  String get tenant => 'Locatário';

  @override
  String get tenantProfile => 'Perfil do locatário';

  @override
  String get user => 'Usuário';

  @override
  String get asset => 'Ativo';

  @override
  String get deviceProfile => 'Perfil do dispositivo';

  @override
  String get assetProfile => 'Perfil do ativo';

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
  String get ruleChain => 'Cadeia de regras';

  @override
  String get ruleNode => 'Nó de regra';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Visualização de entidade';

  @override
  String get widgetsBundle => 'Conjunto de widgets';

  @override
  String get widgetType => 'Tipo de widget';

  @override
  String get apiUsageState => 'Estado de uso da API';

  @override
  String get tbResource => 'Recurso';

  @override
  String get otaPackage => 'Pacote OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Fila';

  @override
  String get notificationTarget => 'Destinatário de notificação';

  @override
  String get notificationTemplate => 'Modelo de notificação';

  @override
  String get notificationRequest => 'Solicitação de notificação';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notificações',
      one: 'Notificação',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Regra de notificação';

  @override
  String get entityGroup => 'Grupo de entidades';

  @override
  String get converter => 'Conversor';

  @override
  String get integration => 'Integração';

  @override
  String get schedulerEvent => 'Evento do agendador';

  @override
  String get blobEntity => 'Entidade Blob';

  @override
  String get role => 'Função';

  @override
  String get groupPermission => 'Permissão de grupo';

  @override
  String get actionStatusSuccess => 'Sucesso';

  @override
  String get actionStatusFailure => 'Falha';

  @override
  String get actionTypeAdded => 'Adicionado';

  @override
  String get actionTypeDeleted => 'Excluído';

  @override
  String get actionTypeUpdated => 'Atualizado';

  @override
  String get actionTypeAttributesUpdated => 'Atributos atualizados';

  @override
  String get actionTypeAttributesDeleted => 'Atributos excluídos';

  @override
  String get actionTypeRpcCall => 'Chamada RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Credenciais atualizadas';

  @override
  String get actionTypeAssignedToCustomer => 'Atribuído ao cliente';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Atribuição ao cliente cancelada';

  @override
  String get actionTypeActivated => 'Ativado';

  @override
  String get actionTypeSuspended => 'Suspenso';

  @override
  String get actionTypeCredentialsRead => 'Credenciais lidas';

  @override
  String get actionTypeAttributesRead => 'Atributos lidos';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relação atualizada';

  @override
  String get actionTypeRelationDeleted => 'Relação excluída';

  @override
  String get actionTypeRelationsDeleted => 'Todas as relações excluídas';

  @override
  String get actionTypeAlarmAck => 'Reconhecido';

  @override
  String get actionTypeAlarmClear => 'Resolvido';

  @override
  String get actionTypeAlarmDelete => 'Alarme excluído';

  @override
  String get actionTypeAlarmAssigned => 'Alarme atribuído';

  @override
  String get actionTypeAlarmUnassigned => 'Atribuição do alarme cancelada';

  @override
  String get actionTypeLogin => 'Login';

  @override
  String get actionTypeLogout => 'Logout';

  @override
  String get actionTypeLockout => 'Bloqueio';

  @override
  String get actionTypeAssignedFromTenant => 'Atribuído a partir do locatário';

  @override
  String get actionTypeAssignedToTenant => 'Atribuído ao locatário';

  @override
  String get actionTypeProvisionSuccess => 'Dispositivo provisionado';

  @override
  String get actionTypeProvisionFailure =>
      'Falha no provisionamento do dispositivo';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetria atualizada';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetria excluída';

  @override
  String get actionTypeAssignedToEdge => 'Atribuído ao Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Atribuição ao Edge cancelada';

  @override
  String get actionTypeAddedComment => 'Comentário adicionado';

  @override
  String get actionTypeUpdatedComment => 'Comentário atualizado';

  @override
  String get actionTypeDeletedComment => 'Comentário excluído';

  @override
  String get actionTypeSmsSent => 'SMS enviado';

  @override
  String get actionTypeAddedToEntityGroup => 'Adicionado ao grupo de entidades';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Removido do grupo de entidades';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Chamada REST API do motor de regras';

  @override
  String get actionTypeMadePublic => 'Tornado público';

  @override
  String get actionTypeMadePrivate => 'Tornado privado';

  @override
  String get actionTypeChangeOwner => 'Proprietário alterado';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Você não tem permissões para executar esta operação!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Parece que suas permissões não são suficientes para concluir esta operação';

  @override
  String get isRequiredText => 'é um campo obrigatório.';

  @override
  String get no2faProvidersFound => 'Nenhum provedor 2FA encontrado';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Entre em contato com o administrador do sistema';

  @override
  String errorOccured(Object e) {
    return 'Ocorreu um erro: $e';
  }

  @override
  String get unsavedChanges => 'Alterações não salvas';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Há alterações não salvas. Tem certeza de que deseja sair desta página?';

  @override
  String get deleteAccount => 'Excluir conta';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Tem certeza? Você vai excluir sua conta de $authority.';
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
  String get autoUnitSystem => 'Automático';

  @override
  String get languageAuto => 'Automático';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get selectCountry => 'Selecionar país';

  @override
  String get hideHomeDashboardToolbar =>
      'Ocultar barra de ferramentas do dashboard inicial';

  @override
  String get phoneNumberHelperText =>
      'Número de telefone no formato E.164, ex.: +1201550123';

  @override
  String get homeDashboard => 'Dashboard inicial';

  @override
  String get security => 'Segurança';

  @override
  String get twofactorAuthentication => 'Autenticação de dois fatores';

  @override
  String get verificationRequired => 'Verificação obrigatória';

  @override
  String get twofactorAuthenticationIsRequired =>
      'A autenticação de dois fatores é obrigatória';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Configure um método de verificação para continuar com seu login';

  @override
  String get setUpAVerificationMethod => 'Configurar um método de verificação';

  @override
  String get totpSetupSuccessDescription =>
      'Na próxima vez que fizer login, será necessário fornecer um código de autenticação de dois fatores';

  @override
  String get smsSetupSuccessDescription =>
      'Na próxima vez que fizer login, será solicitado que insira o código de segurança que será enviado para o número de telefone';

  @override
  String get emailSetupSuccessDescription =>
      'Na próxima vez que fizer login, será solicitado que insira o código de segurança que será enviado para o seu endereço de e-mail';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Na próxima vez que você fizer login, poderá usar códigos de backup para concluir a autenticação de dois fatores';

  @override
  String get loginToApp => 'Entrar no aplicativo';

  @override
  String get goBack => 'Voltar';

  @override
  String get done => 'Concluído';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Isso tornará sua conta menos segura';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Tem certeza de que deseja desativar $providerName?';
  }

  @override
  String get yesDeactivate => 'Sim, desativar';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Insira um e-mail para usar como autenticador.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Insira um número de telefone para usar como autenticador';

  @override
  String get sendCode => 'Enviar código';

  @override
  String errorSendingCode(String error) {
    return 'Erro ao enviar código: $error';
  }

  @override
  String get copy => 'Copiar';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Insira o código de 6 dígitos aqui';

  @override
  String digitsCode(int count) {
    return 'Código de $count dígitos';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copie a chave de 32 caracteres para seu aplicativo autenticador ou escaneie o QR code abaixo';

  @override
  String get applyChanges => 'Aplicar alterações';

  @override
  String get discardChanges => 'Descartar alterações';

  @override
  String get yesDiscard => 'Sim, descartar';

  @override
  String get thisActionCannotBeUndone => 'Esta ação não pode ser desfeita';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'A autenticação de dois fatores protege sua conta contra acesso não autorizado. Basta inserir um código de segurança ao fazer login.';

  @override
  String get calculatedField => 'Campo calculado';

  @override
  String get apiKey => 'Chave de API';

  @override
  String get aiModel => 'Modelo de IA';

  @override
  String get adminSettings => 'Configurações de administração';

  @override
  String get job => 'Tarefa';

  @override
  String get mobileAppBundle => 'Pacote do aplicativo móvel';

  @override
  String get mobileApp => 'Aplicativo móvel';

  @override
  String get domain => 'Domínio';

  @override
  String get oauth2Client => 'Cliente OAuth 2.0';

  @override
  String get queueStats => 'Estatísticas da fila';

  @override
  String get phoneIsRequired => 'O telefone é obrigatório';

  @override
  String get phoneIsInvalid => 'O telefone é inválido';

  @override
  String get addVerificationMethod => 'Adicionar método de verificação';

  @override
  String get imageSavedToGallery =>
      'Salvo na \'Galeria de imagens\' da plataforma';

  @override
  String get failedToSaveImage => 'Falha ao salvar a imagem';

  @override
  String nSelected(int count) {
    return 'Selecionadas: $count';
  }

  @override
  String get selectAll => 'Selecionar todas as carregadas';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operações falharam',
      one: '$count operação falhou',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count notificações?',
      one: 'Excluir $count notificação?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Marcar $count notificações como lidas?',
      one: 'Marcar $count notificação como lida?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Obtendo dados do seu host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Fazendo login no host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Mudando para o novo host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Falha ao obter um token de login de $host. Escaneie um novo QR code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Falha ao conectar a $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host não é um servidor ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'A sessão do QR code não é mais válida. Atualize o QR code e escaneie novamente.';

  @override
  String get openThisLinkTitle => 'Abrir este link?';

  @override
  String get linkOpensSignInPage =>
      'Este link abre a página de login deste servidor. Você será desconectado do seu servidor atual.';

  @override
  String get linkOpensSignInPageOnly =>
      'Este link abre a página de login deste servidor.';

  @override
  String linkSignsInAs(Object email) {
    return 'Este link conecta você a este servidor como $email.';
  }

  @override
  String get linkSignsIn => 'Este link conecta você a este servidor.';

  @override
  String get serverConnectionNotSecure =>
      'Este servidor não usa uma conexão segura.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Este aplicativo funciona somente com seu próprio servidor e não pode abrir este link.';

  @override
  String get liveTrackingActive => 'Rastreamento de localização ao vivo';

  @override
  String get liveTrackingPaused => 'Rastreamento ao vivo pausado';

  @override
  String get liveTrackingFixes => 'Posições';

  @override
  String get liveTrackingSaved => 'Salvas';

  @override
  String get liveTrackingErrors => 'Erros';

  @override
  String get liveTrackingStop => 'Parar';

  @override
  String get liveTrackingPause => 'Pausar';

  @override
  String get liveTrackingResume => 'Retomar';

  @override
  String get liveTrackingHide => 'Ocultar';

  @override
  String get liveTrackingSessionTitle => 'Rastreamento de localização ao vivo';

  @override
  String get liveTrackingTarget => 'Salvar localização na entidade';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Hora de início';

  @override
  String get liveTrackingLastFix => 'Última posição';

  @override
  String get liveTrackingLastError => 'Último erro';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Não é possível salvar nesta entidade — ela não existe mais. O rastreamento continua; atualize o destino na ação do dashboard.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Sem conexão com o servidor. Estas posições não foram salvas — o salvamento será retomado quando você estiver on-line novamente.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Sua sessão terminou. Entre novamente para continuar salvando a localização.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Não é possível salvar nesta entidade — você não tem permissão. O rastreamento continua; peça ao seu administrador para conceder acesso.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Não foi possível salvar esta posição no servidor. O salvamento será tentado novamente com a próxima posição.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Os serviços de localização estão desativados neste dispositivo.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'A permissão de localização foi negada.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'A permissão de localização foi negada permanentemente. Ative-a nas configurações do aplicativo.';

  @override
  String get liveTrackingErrorLocation =>
      'Não foi possível obter a localização.';

  @override
  String get liveTrackingMenuTitle => 'Rastreamento de localização ao vivo';

  @override
  String get liveTrackingNoRecord =>
      'Nenhum rastreamento ativo e nenhuma sessão recente.';

  @override
  String get liveTrackingLastSession => 'Última sessão';

  @override
  String get liveTrackingStartAgain => 'Iniciar novamente';

  @override
  String get liveTrackingEnded => 'Hora de término';

  @override
  String get liveTrackingEndReason => 'Motivo do encerramento';

  @override
  String get liveTrackingEndReasonManual => 'Interrompido manualmente';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Duração máxima atingida';

  @override
  String get liveTrackingEndReasonInterrupted => 'Interrompido';

  @override
  String get serverUpdateRequired => 'Atualização do servidor necessária';

  @override
  String get backToLogin => 'Voltar ao login';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Este aplicativo funciona com o ThingsBoard $minVersion ou posterior.';
  }

  @override
  String get serverLabel => 'Servidor';

  @override
  String get versionLabel => 'Versão';

  @override
  String get askAdminToUpdateServer =>
      'Peça ao administrador do servidor para atualizá-lo.';

  @override
  String get deviceClaimFailed =>
      'Não foi possível reivindicar o dispositivo. Tente novamente.';

  @override
  String get deviceToClaimNotFound =>
      'Dispositivo não encontrado. Entre em contato com o fornecedor do dispositivo.';

  @override
  String get enableAuthenticatorApp => 'Ativar aplicativo autenticador';

  @override
  String get enableSmsAuthenticator => 'Ativar autenticador por SMS';

  @override
  String get enableEmailAuthenticator => 'Ativar autenticador por e-mail';

  @override
  String get getBackupCode => 'Obter código de backup';

  @override
  String get twoFaTotpDescription =>
      'Use aplicativos como Google Authenticator, Authy ou Duo no seu telefone para autenticar. Será gerado um código de segurança para login.';

  @override
  String get twoFaSmsDescription =>
      'Use seu telefone para autenticar. Enviaremos um código de segurança via SMS quando você fizer login.';

  @override
  String get twoFaEmailDescription =>
      'Use um código de segurança enviado para seu endereço de e-mail para autenticar.';

  @override
  String get twoFaBackupCodeDescription =>
      'Esses códigos de acesso único imprimíveis permitem que você faça login quando estiver longe do seu telefone, como quando está viajando.';

  @override
  String get openInAuthenticatorApp => 'Abrir no aplicativo autenticador';

  @override
  String get noAuthenticatorAppFound =>
      'Nenhum aplicativo autenticador encontrado. Em vez disso, copie a chave para o seu aplicativo.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider está ativado';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Seu administrador exige autenticação de dois fatores para $email.';
  }

  @override
  String get recommended => 'Recomendado';

  @override
  String get addBackupCodesHint =>
      'Adicione também códigos de backup, para que você ainda consiga entrar se perder o telefone.';

  @override
  String get totpSecretKey => 'Chave secreta';

  @override
  String get backupCodesDescription =>
      'Imprima os códigos para tê-los à mão quando precisar usá-los para entrar na sua conta. Cada código de backup pode ser usado uma única vez.';

  @override
  String get backupCodesWarning =>
      'Depois que você sair desta página, estes códigos não poderão ser exibidos novamente. Armazene-os com segurança usando as opções abaixo.';

  @override
  String get downloadTxt => 'Baixar (txt)';
}

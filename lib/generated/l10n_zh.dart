// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => '首页';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '设备',
      one: '设备',
    );
    return '$_temp0';
  }

  @override
  String get more => '更多';

  @override
  String get customers => '客户';

  @override
  String get assets => '资产';

  @override
  String get tenants => '租户';

  @override
  String get auditLogs => '审计日志';

  @override
  String get noCustomersFound => '未找到客户';

  @override
  String get noAssetsFound => '未找到资产';

  @override
  String get noTenantsFound => '未找到租户';

  @override
  String get noDevicesFound => '未找到设备';

  @override
  String get noAuditLogsFound => '未找到审计日志';

  @override
  String get logout => '退出登录';

  @override
  String get login => '登录';

  @override
  String get logoDefaultValue => 'ThingsBoard 徽标';

  @override
  String get loginToYourAccount => '登录您的账户';

  @override
  String get email => '邮箱';

  @override
  String get emailRequireText => '邮箱为必填项。';

  @override
  String get emailInvalidText => '邮箱格式无效。';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get passwordRequireText => '密码为必填项。';

  @override
  String get passwordForgotText => '忘记密码？';

  @override
  String get passwordReset => '重置密码';

  @override
  String get passwordResetText => '请输入与您账户关联的邮箱，我们将发送一封包含密码重置链接的邮件。';

  @override
  String get requestPasswordReset => '请求重置密码';

  @override
  String get passwordResetLinkSuccessfullySentNotification => '密码重置链接已成功发送！';

  @override
  String get emailVersificationSuccessfullySentNotification => '邮箱验证链接已成功发送！';

  @override
  String get or => '或';

  @override
  String get no => '否';

  @override
  String get yes => '是';

  @override
  String get title => '标题';

  @override
  String get country => '国家';

  @override
  String get city => '城市';

  @override
  String get stateOrProvince => '州/省';

  @override
  String get postalCode => '邮政编码';

  @override
  String get address => '地址';

  @override
  String get address2 => '地址 2';

  @override
  String get phone => '电话';

  @override
  String get alarmClearTitle => '清除告警';

  @override
  String get alarmClearText => '确定要清除告警吗？';

  @override
  String get alarmAcknowledgeTitle => '确认告警';

  @override
  String get alarmAcknowledgeText => '确定要确认告警吗？';

  @override
  String get assetName => '资产名称';

  @override
  String get type => '类型';

  @override
  String get label => '标签';

  @override
  String get assignedToCustomer => '已分配给客户';

  @override
  String get auditLogDetails => '审计日志详情';

  @override
  String get customerDetails => '客户详情';

  @override
  String get assetDetails => '资产详情';

  @override
  String get tenantDetails => '租户详情';

  @override
  String get entityType => '实体类型';

  @override
  String get actionData => '操作数据';

  @override
  String get failureDetails => '失败详情';

  @override
  String get allDevices => '所有设备';

  @override
  String get active => '活动';

  @override
  String get inactive => '非活动';

  @override
  String get activeDevices => '活跃';

  @override
  String get inactiveDevices => '不活跃';

  @override
  String get alarmStatusActiveAcknowledged => '活动已确认';

  @override
  String get alarmStatusActiveUnacknowledged => '活动未确认';

  @override
  String get alarmStatusClearedAcknowledged => '已清除已确认';

  @override
  String get alarmStatusClearedUnacknowledged => '已清除未确认';

  @override
  String get alarmStatusFilterActive => '活动';

  @override
  String get systemAdministrator => '系统管理员';

  @override
  String get tenantAdministrator => '租户管理员';

  @override
  String get customer => '客户';

  @override
  String get changePassword => '修改密码';

  @override
  String get currentPasswordRequireText => '当前密码为必填项。';

  @override
  String get currentPassword => '当前密码';

  @override
  String get newPasswordRequireText => '新密码为必填项。';

  @override
  String get newPassword => '新密码';

  @override
  String get newPassword2RequireText => '再次输入新密码为必填项。';

  @override
  String get newPassword2 => '确认新密码';

  @override
  String get passwordErrorNotification => '输入的密码必须一致！';

  @override
  String get firstNameUpper => '名';

  @override
  String get lastNameUpper => '姓';

  @override
  String get profileSuccessNotification => '个人资料更新成功。';

  @override
  String get passwordSuccessNotification => '密码修改成功。';

  @override
  String get notImplemented => '尚未实现！';

  @override
  String get listIsEmptyText => '列表当前为空。';

  @override
  String get tryAgain => '重试';

  @override
  String get verifyYourIdentity => '验证您的身份';

  @override
  String get continueText => '继续';

  @override
  String get resendCode => '重新发送验证码';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time 秒后可重新发送验证码',
    );
    return '$_temp0';
  }

  @override
  String get totpAuthDescription => '请输入您的身份验证器应用中的安全码。';

  @override
  String smsAuthDescription(Object contact) {
    return '安全码已发送到您的手机号码 $contact。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '安全码已发送到您的邮箱 $contact。';
  }

  @override
  String get backupCodeAuthDescription => '请输入您的备用验证码之一。';

  @override
  String get toptAuthPlaceholder => '验证码';

  @override
  String get smsAuthPlaceholder => '短信验证码';

  @override
  String get emailAuthPlaceholder => '邮箱验证码';

  @override
  String get backupCodeAuthPlaceholder => '备用验证码';

  @override
  String get verificationCodeIncorrect => '验证码不正确';

  @override
  String get verificationCodeManyRequest => '验证码校验请求过多';

  @override
  String get tryAnotherWay => '尝试其他方式';

  @override
  String get selectWayToVerify => '选择验证方式';

  @override
  String get mfaProviderTopt => '身份验证器应用';

  @override
  String get mfaProviderSms => '短信';

  @override
  String get mfaProviderEmail => '邮箱';

  @override
  String get mfaProviderBackupCode => '备用验证码';

  @override
  String get newUserText => '新用户？';

  @override
  String get createAccount => '创建账户';

  @override
  String get emailVerification => '邮箱验证';

  @override
  String get emailVerificationSentText => '包含验证信息的邮件已发送至指定的邮箱地址 ';

  @override
  String get emailVerificationInstructionsText =>
      '请按照邮件中的说明完成注册流程。注意：如果一段时间后仍未收到邮件，请检查“垃圾邮件”文件夹，或点击“重新发送”按钮再次发送邮件。';

  @override
  String get resend => '重新发送';

  @override
  String get activatingAccount => '正在激活账户…';

  @override
  String get accountActivated => '账户已成功激活！';

  @override
  String get emailVerified => '邮箱已验证';

  @override
  String get activatingAccountText => '正在激活您的账户。\n请稍候……';

  @override
  String accountActivatedText(Object appTitle) {
    return '恭喜！\n您的 $appTitle 账户已激活。\n现在您可以登录您的 $appTitle 空间。';
  }

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get cancel => '取消';

  @override
  String get accept => '接受';

  @override
  String get termsOfUse => '使用条款';

  @override
  String get firstName => '名';

  @override
  String get firstNameRequireText => '名为必填项。';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓为必填项。';

  @override
  String get createPassword => '创建密码';

  @override
  String get repeatPassword => '重复您的密码';

  @override
  String get imNotARobot => '我不是机器人';

  @override
  String get signUp => '注册';

  @override
  String get alreadyHaveAnAccount => '已有账户？';

  @override
  String get signIn => '登录';

  @override
  String get inactiveUserAlreadyExists => '未激活的用户已存在';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '已存在一位邮箱尚未验证的注册用户。\n如需重新发送验证邮件，请点击“重新发送”按钮。';

  @override
  String get assignee => '受理人';

  @override
  String get alarmTypes => '告警类型';

  @override
  String get details => '详情';

  @override
  String get status => '状态';

  @override
  String get severity => '级别';

  @override
  String get originator => '发起者';

  @override
  String get startTime => '开始时间';

  @override
  String get duration => '持续时间';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 天',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 小时',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 分钟',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 秒',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => '查看仪表板';

  @override
  String get activity => '活动';

  @override
  String get addCommentMessage => '添加评论...';

  @override
  String get selectUser => '选择用户';

  @override
  String get assignedToMe => '分配给我';

  @override
  String get clear => '清除';

  @override
  String get acknowledge => '确认';

  @override
  String get edit => '编辑';

  @override
  String get delete => '删除';

  @override
  String get edited => '已编辑';

  @override
  String get deleteComment => '删除评论';

  @override
  String get areYouSure => '确定吗？';

  @override
  String get noResultsFound => '未找到结果';

  @override
  String get tryRefiningYourQuery => '请尝试优化查询条件。';

  @override
  String get failedToLoadTheList => '加载列表失败';

  @override
  String get tryRefreshing => '请尝试刷新。';

  @override
  String get refresh => '刷新';

  @override
  String get users => '用户';

  @override
  String get unassigned => '未分配';

  @override
  String get failedToLoadAlarmDetails => '加载告警详情失败';

  @override
  String get somethingWentWrong => '出错了';

  @override
  String get chooseRegion => '选择区域';

  @override
  String get selectRegion => '选择区域';

  @override
  String get northAmerica => '北美';

  @override
  String get europe => '欧洲';

  @override
  String get northAmericaRegionShort => '北弗吉尼亚';

  @override
  String get europeRegionShort => '法兰克福';

  @override
  String get deviceList => '设备列表';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '仪表板',
      one: '仪表板',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => '需要更新';

  @override
  String updateTo(Object version) {
    return '更新到 $version';
  }

  @override
  String get next => '下一步';

  @override
  String get confirmation => '确认';

  @override
  String get wifiPassword => 'Wi-Fi 密码';

  @override
  String wifiHelpMessage(Object deviceName) {
    return '要继续设置您的设备 $deviceName，请提供您的网络凭据。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '输入 $network 的密码';
  }

  @override
  String get deviceNotFoundMessage => '未找到设备。请确保您手机的蓝牙已开启，并且在新设备的信号范围内。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '您没有足够的“$permissions”权限以继续操作。请授予所需权限，然后点击“重试”。';
  }

  @override
  String get sendingWifiCredentials => '正在发送 Wi-Fi 凭据';

  @override
  String get confirmingWifiConnection => '正在确认 Wi-Fi 连接';

  @override
  String get provisionedSuccessfully => '设备已成功预配。';

  @override
  String get returnToDashboard => '返回仪表板';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '无法与设备 $deviceName 建立会话。请重试。';
  }

  @override
  String get claimingDevice => '正在认领设备';

  @override
  String get claimingDeviceDone => '设备认领完成';

  @override
  String get claimingMessageSuccess => '设备已\n成功认领';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '您没有足够的“$permissions”权限以继续操作。请打开应用设置，授予权限，然后点击“重试”。';
  }

  @override
  String get scanACode => '扫码';

  @override
  String get allowAccess => '允许访问';

  @override
  String get toggleCamera => '切换摄像头';

  @override
  String get toggleFlash => '切换闪光灯';

  @override
  String get unableToUseCamera => '无法使用摄像头';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      '请打开设置并授予摄像头访问权限以继续';

  @override
  String get notFound => '未找到';

  @override
  String routeNotDefined(Object name) {
    return '未定义路由：$name';
  }

  @override
  String get loginWith => '登录方式';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get anEmptyRequestDataReceived => '收到的请求数据为空。';

  @override
  String get somethingWentWrongRollback => '出现错误……正在回滚';

  @override
  String get searchResults => '搜索结果';

  @override
  String get viewAll => '查看全部';

  @override
  String get requestedEntityDoesNotExists => '请求的实体不存在。';

  @override
  String get noAlarmsFound => '未找到告警';

  @override
  String get filters => '过滤器';

  @override
  String get alarmStatusList => '告警状态列表';

  @override
  String get alarmSeverityList => '告警级别列表';

  @override
  String get cleared => '已清除';

  @override
  String get acknowledged => '已确认';

  @override
  String get unacknowledged => '未确认';

  @override
  String get critical => '严重';

  @override
  String get major => '重要';

  @override
  String get minor => '次要';

  @override
  String get warning => '警告';

  @override
  String get indeterminate => '不确定';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '搜索用户',
    );
    return '$_temp0';
  }

  @override
  String get reset => '重置';

  @override
  String get update => '更新';

  @override
  String get alarmTypeList => '告警类型列表';

  @override
  String get anyType => '任意类型';

  @override
  String get plusAlarmType => '+ 告警类型';

  @override
  String get all => '全部';

  @override
  String get allNotifications => '全部';

  @override
  String get unread => '未读';

  @override
  String get close => '关闭';

  @override
  String get codeVerificationFailed => '验证码验证失败！';

  @override
  String get fatalError => '严重错误';

  @override
  String get unknownError => '未知错误。';

  @override
  String get sessionExpired => '会话已过期';

  @override
  String get fatalApplicationErrorOccurred => '发生严重应用错误：';

  @override
  String get connectionError => '连接错误';

  @override
  String get failedToConnectToServer => '无法连接到服务器';

  @override
  String get retry => '重试';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '应在设备配置中配置移动端仪表板！';

  @override
  String get openWifiSettings => '打开 Wi-Fi 设置';

  @override
  String get connectToTheWifiYouUsuallyUse => '连接到您常用的 Wi-Fi';

  @override
  String get returnToTheAppAndTapReadyButton => '返回应用并点击“就绪”按钮';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '请按以下步骤将您的手机重新连接到\n常用的 Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      '推送通知未配置。\n请联系您的系统管理员。';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase 未配置。\n 请参阅 Firebase 官方文档以\n 获取配置指引。';

  @override
  String get markAllAsRead => '全部标记为已读';

  @override
  String get profile => '个人资料';

  @override
  String cantLaunchUrlLink(String link) {
    return '无法打开链接：$link';
  }

  @override
  String get noDashboardsFound => '未找到仪表板';

  @override
  String get openAppSettings => '打开应用设置';

  @override
  String get connectingToDevice => '正在连接到设备';

  @override
  String get connectToDevice => '连接到设备';

  @override
  String get selectWifiNetwork => '选择 Wi-Fi 网络';

  @override
  String get deviceProvisioning => '设备预配';

  @override
  String get permissions => '权限';

  @override
  String get unableConnectToDevice => '无法连接到设备';

  @override
  String get deviceNotAbleToFindWifiNearby => '设备无法找到附近的 Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '连接到 $name Wi-Fi 网络失败。\n请确保您的手机已连接到设备的 Wi-Fi 网络，并在手机设置中为此应用启用本地网络访问权限。';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '无法连接到 Wi-Fi，因为设备 $name 未找到网络';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo => '请按以下步骤将您的手机连接到设备';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '连接到类似 $wifiName 的 Wi-Fi';
  }

  @override
  String get ready => '就绪';

  @override
  String get exitDeviceProvisioning => '退出设备预配';

  @override
  String get noNotificationsFound => '未找到通知';

  @override
  String get markAsRead => '标记为已读';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => '请扫描您设备上的二维码。';

  @override
  String get search => '搜索';

  @override
  String get tenant => '租户';

  @override
  String get tenantProfile => '租户配置';

  @override
  String get user => '用户';

  @override
  String get asset => '资产';

  @override
  String get deviceProfile => '设备配置';

  @override
  String get assetProfile => '资产配置';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '告警',
      one: '告警',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => '规则链';

  @override
  String get ruleNode => '规则节点';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => '实体视图';

  @override
  String get widgetsBundle => '部件包';

  @override
  String get widgetType => '部件类型';

  @override
  String get apiUsageState => 'API 使用状态';

  @override
  String get tbResource => '资源';

  @override
  String get otaPackage => 'OTA 软件包';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '队列';

  @override
  String get notificationTarget => '通知接收者';

  @override
  String get notificationTemplate => '通知模板';

  @override
  String get notificationRequest => '通知请求';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '通知',
      one: '通知',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => '通知规则';

  @override
  String get entityGroup => '实体组';

  @override
  String get converter => '转换器';

  @override
  String get integration => '集成';

  @override
  String get schedulerEvent => '调度器事件';

  @override
  String get blobEntity => 'Blob 实体';

  @override
  String get role => '角色';

  @override
  String get groupPermission => '组权限';

  @override
  String get actionStatusSuccess => '成功';

  @override
  String get actionStatusFailure => '失败';

  @override
  String get actionTypeAdded => '已添加';

  @override
  String get actionTypeDeleted => '已删除';

  @override
  String get actionTypeUpdated => '已更新';

  @override
  String get actionTypeAttributesUpdated => '属性已更新';

  @override
  String get actionTypeAttributesDeleted => '属性已删除';

  @override
  String get actionTypeRpcCall => 'RPC 调用';

  @override
  String get actionTypeCredentialsUpdated => '凭据已更新';

  @override
  String get actionTypeAssignedToCustomer => '已分配给客户';

  @override
  String get actionTypeUnassignedFromCustomer => '已从客户取消分配';

  @override
  String get actionTypeActivated => '已激活';

  @override
  String get actionTypeSuspended => '已停用';

  @override
  String get actionTypeCredentialsRead => '凭据已读取';

  @override
  String get actionTypeAttributesRead => '属性已读取';

  @override
  String get actionTypeRelationAddOrUpdate => '关联已更新';

  @override
  String get actionTypeRelationDeleted => '关联已删除';

  @override
  String get actionTypeRelationsDeleted => '所有关联已删除';

  @override
  String get actionTypeAlarmAck => '告警已确认';

  @override
  String get actionTypeAlarmClear => '告警已清除';

  @override
  String get actionTypeAlarmDelete => '告警已删除';

  @override
  String get actionTypeAlarmAssigned => '告警已分配';

  @override
  String get actionTypeAlarmUnassigned => '告警已取消分配';

  @override
  String get actionTypeLogin => '登录';

  @override
  String get actionTypeLogout => '退出登录';

  @override
  String get actionTypeLockout => '锁定';

  @override
  String get actionTypeAssignedFromTenant => '已从租户分配';

  @override
  String get actionTypeAssignedToTenant => '已分配给租户';

  @override
  String get actionTypeProvisionSuccess => '设备已预配';

  @override
  String get actionTypeProvisionFailure => '设备预配失败';

  @override
  String get actionTypeTimeseriesUpdated => '遥测已更新';

  @override
  String get actionTypeTimeseriesDeleted => '遥测已删除';

  @override
  String get actionTypeAssignedToEdge => '已分配给 Edge';

  @override
  String get actionTypeUnassignedFromEdge => '已从 Edge 取消分配';

  @override
  String get actionTypeAddedComment => '已添加评论';

  @override
  String get actionTypeUpdatedComment => '已更新评论';

  @override
  String get actionTypeDeletedComment => '已删除评论';

  @override
  String get actionTypeSmsSent => '短信已发送';

  @override
  String get actionTypeAddedToEntityGroup => '已添加到实体组';

  @override
  String get actionTypeRemovedFromEntityGroup => '已从实体组移除';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API 规则引擎调用';

  @override
  String get actionTypeMadePublic => '已设为公开';

  @override
  String get actionTypeMadePrivate => '已设为私有';

  @override
  String get actionTypeChangeOwner => '所有者已更改';

  @override
  String get youDontHavePermissionsToPerformThisOperation => '您没有权限执行此操作！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '您的权限似乎不足以完成此操作。';

  @override
  String get isRequiredText => '为必填项。';

  @override
  String get no2faProvidersFound => '未找到双因素认证提供商';

  @override
  String get pleaseContactYourSystemAdministrator => '请联系您的系统管理员';

  @override
  String errorOccured(Object e) {
    return '发生错误：$e';
  }

  @override
  String get unsavedChanges => '未保存的更改';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo => '您有未保存的更改。确定要离开此页面吗？';

  @override
  String get deleteAccount => '删除账户';

  @override
  String accountDeletionDialogBody(Object authority) {
    return '确定吗？您将删除您的 $authority 账户。';
  }

  @override
  String get language => '语言';

  @override
  String get metricUnitSystem => '公制';

  @override
  String get imperialUnitSystem => '英制';

  @override
  String get hybridUnitSystem => '混合';

  @override
  String get autoUnitSystem => '自动';

  @override
  String get languageAuto => '自动';

  @override
  String get unitSystem => '单位制';

  @override
  String get selectCountry => '选择国家/地区';

  @override
  String get hideHomeDashboardToolbar => '隐藏主页仪表板工具栏';

  @override
  String get phoneNumberHelperText => 'E.164 格式的电话号码，例如 +1201550123';

  @override
  String get homeDashboard => '主页仪表板';

  @override
  String get security => '安全';

  @override
  String get twofactorAuthentication => '双因素认证';

  @override
  String get verificationRequired => '需要验证';

  @override
  String get twofactorAuthenticationIsRequired => '需要双因素认证';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin => '设置验证方式以继续登录';

  @override
  String get setUpAVerificationMethod => '设置验证方式';

  @override
  String get totpSetupSuccessDescription => '下次登录时，您需要提供双因素认证验证码';

  @override
  String get smsSetupSuccessDescription => '下次登录时，系统将提示您输入发送到该手机号码的安全码';

  @override
  String get emailSetupSuccessDescription => '下次登录时，系统将提示您输入发送到您邮箱的安全码';

  @override
  String get backupCodeSetupSuccessDescription => '下次登录时，您可以使用备用验证码通过双因素认证';

  @override
  String get loginToApp => '登录应用';

  @override
  String get goBack => '返回';

  @override
  String get done => '完成';

  @override
  String get thisWillMakeYourAccountLessSecure => '这将降低您账户的安全性';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '确定要停用 $providerName 吗？';
  }

  @override
  String get yesDeactivate => '是，停用';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '输入用作身份验证器的邮箱。';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator => '输入用作身份验证器的电话号码';

  @override
  String get sendCode => '发送验证码';

  @override
  String errorSendingCode(String error) {
    return '发送验证码出错：$error';
  }

  @override
  String get copy => '复制';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get enter6digitsKeyFromYourAppHere => '在此输入 6 位验证码';

  @override
  String digitsCode(int count) {
    return '$count 位验证码';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '将 32 位字符的密钥复制到身份验证器应用，或扫描下方的二维码';

  @override
  String get applyChanges => '应用更改';

  @override
  String get discardChanges => '放弃更改';

  @override
  String get yesDiscard => '是，放弃';

  @override
  String get thisActionCannotBeUndone => '此操作无法撤销。';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '双因素认证保护您的账户免受未授权访问。您只需在登录时输入安全码即可。';

  @override
  String get calculatedField => '计算字段';

  @override
  String get apiKey => 'API 密钥';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get adminSettings => '管理员设置';

  @override
  String get job => '作业';

  @override
  String get mobileAppBundle => '移动应用包';

  @override
  String get mobileApp => '移动应用';

  @override
  String get domain => '域名';

  @override
  String get oauth2Client => 'OAuth2 客户端';

  @override
  String get queueStats => '队列统计';

  @override
  String get phoneIsRequired => '电话为必填项。';

  @override
  String get phoneIsInvalid => '电话无效。';

  @override
  String get addVerificationMethod => '添加验证方式';

  @override
  String get imageSavedToGallery => '已保存至平台“图片库”。';

  @override
  String get failedToSaveImage => '保存图片失败。';

  @override
  String nSelected(int count) {
    return '已选择 $count 项';
  }

  @override
  String get selectAll => '选择全部已加载项';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项操作失败。',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要删除 $count 条通知吗？',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '确定要将 $count 条通知标记为已读吗？',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return '正在从您的主机 $host 获取数据';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return '正在登录主机 $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return '正在将您切换到新主机 $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '无法从 $host 获取登录令牌。请扫描新的二维码。';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '无法连接到 $host。';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host 不是 ThingsBoard 服务器。';
  }

  @override
  String get qrCodeSessionIsNoLongerValid => '二维码会话已失效。请刷新二维码并重新扫描。';

  @override
  String get openThisLinkTitle => '要打开此链接吗？';

  @override
  String get linkOpensSignInPage => '此链接将打开该服务器的登录页面。您将从当前服务器退出登录。';

  @override
  String get linkOpensSignInPageOnly => '此链接将打开该服务器的登录页面。';

  @override
  String linkSignsInAs(Object email) {
    return '此链接将以 $email 身份登录该服务器。';
  }

  @override
  String get linkSignsIn => '此链接将登录该服务器。';

  @override
  String get serverConnectionNotSecure => '该服务器未使用安全连接。';

  @override
  String get linkToOtherServerNotAllowed => '本应用仅适用于其自身的服务器，无法打开此链接。';

  @override
  String get liveTrackingActive => '实时位置跟踪';

  @override
  String get liveTrackingPaused => '实时跟踪已暂停';

  @override
  String get liveTrackingFixes => '定位次数';

  @override
  String get liveTrackingSaved => '已保存';

  @override
  String get liveTrackingErrors => '错误';

  @override
  String get liveTrackingStop => '停止';

  @override
  String get liveTrackingPause => '暂停';

  @override
  String get liveTrackingResume => '继续';

  @override
  String get liveTrackingHide => '隐藏';

  @override
  String get liveTrackingSessionTitle => '实时位置跟踪';

  @override
  String get liveTrackingTarget => '将位置保存到实体';

  @override
  String get liveTrackingDashboard => '仪表板';

  @override
  String get liveTrackingStatus => '状态';

  @override
  String get liveTrackingStarted => '开始时间';

  @override
  String get liveTrackingLastFix => '上次定位';

  @override
  String get liveTrackingLastError => '上次错误';

  @override
  String get liveTrackingErrorTargetNotFound =>
      '无法保存到此实体——该实体已不存在。跟踪将继续；请在仪表板操作中更新目标。';

  @override
  String get liveTrackingErrorNoConnection => '无法连接到服务器。这些定位未保存——恢复联网后将继续保存。';

  @override
  String get liveTrackingErrorUnauthorized => '您的会话已结束。请重新登录以继续保存位置。';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      '无法保存到此实体——您没有相应权限。跟踪将继续；请联系管理员授予访问权限。';

  @override
  String get liveTrackingErrorSaveFailed => '无法将此次定位保存到服务器。将在下次定位时重试保存。';

  @override
  String get liveTrackingErrorServicesDisabled => '此设备上的定位服务已关闭。';

  @override
  String get liveTrackingErrorPermissionDenied => '位置权限已被拒绝。';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '位置权限已被永久拒绝。请在应用设置中启用。';

  @override
  String get liveTrackingErrorLocation => '无法获取位置信息。';

  @override
  String get liveTrackingMenuTitle => '实时位置跟踪';

  @override
  String get liveTrackingNoRecord => '没有正在进行的跟踪，也没有最近的会话。';

  @override
  String get liveTrackingLastSession => '上次会话';

  @override
  String get liveTrackingStartAgain => '重新开始';

  @override
  String get liveTrackingEnded => '结束时间';

  @override
  String get liveTrackingEndReason => '结束原因';

  @override
  String get liveTrackingEndReasonManual => '手动停止';

  @override
  String get liveTrackingEndReasonMaxDuration => '已达到最长时长';

  @override
  String get liveTrackingEndReasonInterrupted => '已中断';

  @override
  String get serverUpdateRequired => '需要更新服务器';

  @override
  String get backToLogin => '返回登录';

  @override
  String serverRequiresVersion(String minVersion) {
    return '此应用需要 ThingsBoard $minVersion 或更高版本。';
  }

  @override
  String get serverLabel => '服务器';

  @override
  String get versionLabel => '版本';

  @override
  String get askAdminToUpdateServer => '请联系您的服务器管理员更新服务器。';

  @override
  String get deviceClaimFailed => '无法认领该设备。请重试。';

  @override
  String get deviceToClaimNotFound => '未找到设备。请联系设备提供商。';

  @override
  String get enableAuthenticatorApp => '启用身份验证器应用';

  @override
  String get enableSmsAuthenticator => '启用短信验证';

  @override
  String get enableEmailAuthenticator => '启用邮箱验证';

  @override
  String get getBackupCode => '获取备用验证码';

  @override
  String get twoFaTotpDescription =>
      '使用手机上的 Google Authenticator、Authy 或 Duo 等应用进行认证。它将生成登录所需的安全码。';

  @override
  String get twoFaSmsDescription => '使用手机进行认证。登录时我们将通过短信向您发送安全码。';

  @override
  String get twoFaEmailDescription => '使用发送到您邮箱的安全码进行认证。';

  @override
  String get twoFaBackupCodeDescription =>
      '这些可打印的一次性密码允许您在不方便使用手机时（例如旅行中）登录账户。';

  @override
  String get openInAuthenticatorApp => '在身份验证器应用中打开';

  @override
  String get noAuthenticatorAppFound => '未找到身份验证器应用。请改为将密钥复制到您的应用中。';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider 已启用';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '您的管理员要求 $email 使用双因素认证。';
  }

  @override
  String get recommended => '推荐';

  @override
  String get addBackupCodesHint => '同时添加备用验证码，以便在丢失手机时仍可登录。';

  @override
  String get totpSecretKey => '密钥';

  @override
  String get backupCodesDescription => '打印这些验证码，以便在需要登录账户时随时使用。每个备用验证码只能使用一次。';

  @override
  String get backupCodesWarning => '离开此页面后，这些验证码将无法再次显示。请使用以下选项安全保存。';

  @override
  String get downloadTxt => '下载（txt）';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class SZhCn extends SZh {
  SZhCn() : super('zh_CN');
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class SZhTw extends SZh {
  SZhTw() : super('zh_TW');

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => '首頁';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '裝置',
      one: '裝置',
    );
    return '$_temp0';
  }

  @override
  String get more => '更多';

  @override
  String get customers => '客戶';

  @override
  String get assets => '資產';

  @override
  String get tenants => '租戶';

  @override
  String get auditLogs => '稽核記錄';

  @override
  String get noCustomersFound => '找不到客戶';

  @override
  String get noAssetsFound => '找不到資產';

  @override
  String get noTenantsFound => '找不到租戶';

  @override
  String get noDevicesFound => '找不到裝置';

  @override
  String get noAuditLogsFound => '找不到稽核記錄';

  @override
  String get logout => '登出';

  @override
  String get login => '登入';

  @override
  String get logoDefaultValue => 'ThingsBoard 標誌';

  @override
  String get loginToYourAccount => '登入您的帳戶';

  @override
  String get email => '電子郵件';

  @override
  String get emailRequireText => '電子郵件為必填項。';

  @override
  String get emailInvalidText => '電子郵件格式無效。';

  @override
  String get username => '使用者名稱';

  @override
  String get password => '密碼';

  @override
  String get passwordRequireText => '密碼為必填項。';

  @override
  String get passwordForgotText => '忘記密碼？';

  @override
  String get passwordReset => '重設密碼';

  @override
  String get passwordResetText => '請輸入與您帳戶關聯的電子郵件，我們將寄送密碼重設連結給您。';

  @override
  String get requestPasswordReset => '請求重設密碼';

  @override
  String get passwordResetLinkSuccessfullySentNotification => '密碼重設連結已成功寄出！';

  @override
  String get emailVersificationSuccessfullySentNotification => '電子郵件驗證連結已成功寄出！';

  @override
  String get or => '或';

  @override
  String get no => '否';

  @override
  String get yes => '是';

  @override
  String get title => '標題';

  @override
  String get country => '國家';

  @override
  String get city => '城市';

  @override
  String get stateOrProvince => '州／省';

  @override
  String get postalCode => '郵遞區號';

  @override
  String get address => '地址';

  @override
  String get address2 => '地址 2';

  @override
  String get phone => '電話';

  @override
  String get alarmClearTitle => '清除警報';

  @override
  String get alarmClearText => '確定要清除警報嗎？';

  @override
  String get alarmAcknowledgeTitle => '確認警報';

  @override
  String get alarmAcknowledgeText => '確定要確認警報嗎？';

  @override
  String get assetName => '資產名稱';

  @override
  String get type => '類型';

  @override
  String get label => '標籤';

  @override
  String get assignedToCustomer => '已指派給客戶';

  @override
  String get auditLogDetails => '稽核記錄詳細資料';

  @override
  String get customerDetails => '客戶詳細資料';

  @override
  String get assetDetails => '資產詳細資料';

  @override
  String get tenantDetails => '租戶詳細資料';

  @override
  String get entityType => '實體類型';

  @override
  String get actionData => '操作資料';

  @override
  String get failureDetails => '失敗詳細資料';

  @override
  String get allDevices => '所有裝置';

  @override
  String get active => '活躍';

  @override
  String get inactive => '不活躍';

  @override
  String get activeDevices => '活躍';

  @override
  String get inactiveDevices => '不活躍';

  @override
  String get alarmStatusActiveAcknowledged => '未清除、已確認';

  @override
  String get alarmStatusActiveUnacknowledged => '未清除、未確認';

  @override
  String get alarmStatusClearedAcknowledged => '已清除、已確認';

  @override
  String get alarmStatusClearedUnacknowledged => '已清除、未確認';

  @override
  String get alarmStatusFilterActive => '未清除';

  @override
  String get systemAdministrator => '系統管理員';

  @override
  String get tenantAdministrator => '租戶管理員';

  @override
  String get customer => '客戶';

  @override
  String get changePassword => '修改密碼';

  @override
  String get currentPasswordRequireText => '目前密碼為必填項。';

  @override
  String get currentPassword => '目前密碼';

  @override
  String get newPasswordRequireText => '新密碼為必填項。';

  @override
  String get newPassword => '新密碼';

  @override
  String get newPassword2RequireText => '再次輸入新密碼為必填項。';

  @override
  String get newPassword2 => '確認新密碼';

  @override
  String get passwordErrorNotification => '輸入的密碼必須一致！';

  @override
  String get firstNameUpper => '名字';

  @override
  String get lastNameUpper => '姓氏';

  @override
  String get profileSuccessNotification => '個人資料已成功更新。';

  @override
  String get passwordSuccessNotification => '密碼修改成功';

  @override
  String get notImplemented => '尚未實作！';

  @override
  String get listIsEmptyText => '目前清單為空。';

  @override
  String get tryAgain => '重試';

  @override
  String get verifyYourIdentity => '驗證您的身分';

  @override
  String get continueText => '繼續';

  @override
  String get resendCode => '重新傳送驗證碼';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time 秒後重新傳送驗證碼',
      one: '1 秒後重新傳送驗證碼',
    );
    return '$_temp0';
  }

  @override
  String get totpAuthDescription => '請輸入您的身分驗證器應用程式中的安全碼。';

  @override
  String smsAuthDescription(Object contact) {
    return '安全碼已傳送到您的手機號碼 $contact。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '安全碼已傳送到您的電子郵件地址 $contact。';
  }

  @override
  String get backupCodeAuthDescription => '請輸入您的備用驗證碼之一。';

  @override
  String get toptAuthPlaceholder => '驗證碼';

  @override
  String get smsAuthPlaceholder => '簡訊驗證碼';

  @override
  String get emailAuthPlaceholder => '電子郵件驗證碼';

  @override
  String get backupCodeAuthPlaceholder => '備用驗證碼';

  @override
  String get verificationCodeIncorrect => '驗證碼不正確';

  @override
  String get verificationCodeManyRequest => '檢查驗證碼的請求次數過多';

  @override
  String get tryAnotherWay => '嘗試其他方式';

  @override
  String get selectWayToVerify => '選擇驗證方式';

  @override
  String get mfaProviderTopt => '身分驗證器應用程式';

  @override
  String get mfaProviderSms => '簡訊';

  @override
  String get mfaProviderEmail => '電子郵件';

  @override
  String get mfaProviderBackupCode => '備用驗證碼';

  @override
  String get newUserText => '新使用者？';

  @override
  String get createAccount => '建立帳戶';

  @override
  String get emailVerification => '電子郵件驗證';

  @override
  String get emailVerificationSentText => '已將包含驗證資訊的電子郵件傳送至指定的電子郵件地址 ';

  @override
  String get emailVerificationInstructionsText =>
      '請依照電子郵件中的指示完成註冊程序。注意：如果您一直未收到電子郵件，請檢查「垃圾郵件」資料夾，或點選「重新傳送」按鈕以重新傳送電子郵件。';

  @override
  String get resend => '重新傳送';

  @override
  String get activatingAccount => '正在啟用帳戶…';

  @override
  String get accountActivated => '帳戶已成功啟用！';

  @override
  String get emailVerified => '電子郵件已驗證';

  @override
  String get activatingAccountText => '您的帳戶正在啟用中。\n請稍候…';

  @override
  String accountActivatedText(Object appTitle) {
    return '恭喜！\n您的 $appTitle 帳戶已啟用。\n現在您可以登入您的 $appTitle 空間。';
  }

  @override
  String get privacyPolicy => '隱私權原則';

  @override
  String get cancel => '取消';

  @override
  String get accept => '接受';

  @override
  String get termsOfUse => '使用條款';

  @override
  String get firstName => '名';

  @override
  String get firstNameRequireText => '名字為必填項。';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓氏為必填項。';

  @override
  String get createPassword => '建立密碼';

  @override
  String get repeatPassword => '再次輸入密碼';

  @override
  String get imNotARobot => '我不是機器人';

  @override
  String get signUp => '註冊';

  @override
  String get alreadyHaveAnAccount => '已經有帳戶了嗎？';

  @override
  String get signIn => '登入';

  @override
  String get inactiveUserAlreadyExists => '尚未啟用的使用者已存在';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '已有使用者註冊，但電子郵件地址尚未驗證。\n如需重新傳送驗證郵件，請點選「重新傳送」按鈕。';

  @override
  String get assignee => '受理人';

  @override
  String get alarmTypes => '警報類型';

  @override
  String get details => '詳細資料';

  @override
  String get status => '狀態';

  @override
  String get severity => '嚴重程度';

  @override
  String get originator => '發起者';

  @override
  String get startTime => '開始時間';

  @override
  String get duration => '持續時間';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 天',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 小時',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 分鐘',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 秒',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => '檢視儀表板';

  @override
  String get activity => '活動';

  @override
  String get addCommentMessage => '新增留言…';

  @override
  String get selectUser => '選取使用者';

  @override
  String get assignedToMe => '指派給我';

  @override
  String get clear => '清除';

  @override
  String get acknowledge => '確認';

  @override
  String get edit => '編輯';

  @override
  String get delete => '刪除';

  @override
  String get edited => '已編輯';

  @override
  String get deleteComment => '刪除留言';

  @override
  String get areYouSure => '確定嗎？';

  @override
  String get noResultsFound => '找不到結果';

  @override
  String get tryRefiningYourQuery => '請嘗試調整您的查詢條件。';

  @override
  String get failedToLoadTheList => '無法載入清單';

  @override
  String get tryRefreshing => '請嘗試重新整理。';

  @override
  String get refresh => '重新整理';

  @override
  String get users => '使用者';

  @override
  String get unassigned => '未指派';

  @override
  String get failedToLoadAlarmDetails => '無法載入警報詳細資料';

  @override
  String get somethingWentWrong => '發生錯誤';

  @override
  String get chooseRegion => '選擇區域';

  @override
  String get selectRegion => '選取區域';

  @override
  String get northAmerica => '北美';

  @override
  String get europe => '歐洲';

  @override
  String get northAmericaRegionShort => '北維吉尼亞';

  @override
  String get europeRegionShort => '法蘭克福';

  @override
  String get deviceList => '裝置清單';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '儀表板',
      one: '儀表板',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => '需要更新';

  @override
  String updateTo(Object version) {
    return '更新至 $version';
  }

  @override
  String get next => '下一步';

  @override
  String get confirmation => '確認';

  @override
  String get wifiPassword => 'Wi-Fi 密碼';

  @override
  String wifiHelpMessage(Object deviceName) {
    return '若要繼續設定您的裝置 $deviceName，請提供您的網路認證資訊。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '請輸入 $network 的密碼';
  }

  @override
  String get deviceNotFoundMessage => '找不到裝置。請確認您手機的藍牙已開啟，且在新裝置的範圍內。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '您沒有足夠的「$permissions」權限可繼續操作。請授予必要權限後點選「重試」。';
  }

  @override
  String get sendingWifiCredentials => '正在傳送 Wi-Fi 認證資訊';

  @override
  String get confirmingWifiConnection => '正在確認 Wi-Fi 連線';

  @override
  String get provisionedSuccessfully => '裝置已成功佈建。';

  @override
  String get returnToDashboard => '返回儀表板';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '無法與裝置 $deviceName 建立工作階段。請重試。';
  }

  @override
  String get claimingDevice => '正在認領裝置';

  @override
  String get claimingDeviceDone => '裝置認領完成';

  @override
  String get claimingMessageSuccess => '裝置已\n成功認領';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '您沒有足夠的「$permissions」權限以繼續。請開啟應用程式設定，授予權限後點選「重試」。';
  }

  @override
  String get scanACode => '掃描代碼';

  @override
  String get allowAccess => '允許存取';

  @override
  String get toggleCamera => '切換相機';

  @override
  String get toggleFlash => '切換閃光燈';

  @override
  String get unableToUseCamera => '無法使用相機';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      '請開啟設定並授予相機存取權以繼續。';

  @override
  String get notFound => '找不到';

  @override
  String routeNotDefined(Object name) {
    return '未定義路由：$name';
  }

  @override
  String get loginWith => '登入方式';

  @override
  String get scanQrCode => '掃描 QR 碼';

  @override
  String get anEmptyRequestDataReceived => '收到空的請求資料。';

  @override
  String get somethingWentWrongRollback => '發生錯誤……正在復原';

  @override
  String get searchResults => '搜尋結果';

  @override
  String get viewAll => '檢視全部';

  @override
  String get requestedEntityDoesNotExists => '所請求的實體不存在。';

  @override
  String get noAlarmsFound => '找不到警報';

  @override
  String get filters => '篩選條件';

  @override
  String get alarmStatusList => '警報狀態清單';

  @override
  String get alarmSeverityList => '警報嚴重程度清單';

  @override
  String get cleared => '已清除';

  @override
  String get acknowledged => '已確認';

  @override
  String get unacknowledged => '未確認';

  @override
  String get critical => '嚴重';

  @override
  String get major => '重要';

  @override
  String get minor => '次要';

  @override
  String get warning => '警告';

  @override
  String get indeterminate => '不確定';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '搜尋使用者',
    );
    return '$_temp0';
  }

  @override
  String get reset => '重設';

  @override
  String get update => '更新';

  @override
  String get alarmTypeList => '警報類型清單';

  @override
  String get anyType => '任意類型';

  @override
  String get plusAlarmType => '+ 警報類型';

  @override
  String get all => '全部';

  @override
  String get allNotifications => '全部';

  @override
  String get unread => '未讀';

  @override
  String get close => '關閉';

  @override
  String get codeVerificationFailed => '驗證碼驗證失敗！';

  @override
  String get fatalError => '嚴重錯誤';

  @override
  String get unknownError => '未知錯誤。';

  @override
  String get sessionExpired => '工作階段已過期';

  @override
  String get fatalApplicationErrorOccurred => '發生應用程式嚴重錯誤：';

  @override
  String get connectionError => '連線錯誤';

  @override
  String get failedToConnectToServer => '無法連線至伺服器';

  @override
  String get retry => '重試';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '行動儀表板應在裝置設定檔中設定！';

  @override
  String get openWifiSettings => '開啟 Wi-Fi 設定';

  @override
  String get connectToTheWifiYouUsuallyUse => '連線至您通常使用的 Wi-Fi';

  @override
  String get returnToTheAppAndTapReadyButton => '返回應用程式並點選「就緒」按鈕';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '請依照以下步驟將您的手機\n重新連線至您常用的 Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      '尚未設定推播通知。\n請聯絡您的系統管理員。';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      '尚未設定 Firebase。\n請參閱 Firebase 官方文件\n以了解設定方式。';

  @override
  String get markAllAsRead => '全部標記為已讀';

  @override
  String get profile => '個人資料';

  @override
  String cantLaunchUrlLink(String link) {
    return '無法開啟 URL：$link';
  }

  @override
  String get noDashboardsFound => '找不到儀表板';

  @override
  String get openAppSettings => '開啟應用程式設定';

  @override
  String get connectingToDevice => '正在連線至裝置';

  @override
  String get connectToDevice => '連線至裝置';

  @override
  String get selectWifiNetwork => '選取 Wi-Fi 網路';

  @override
  String get deviceProvisioning => '裝置佈建';

  @override
  String get permissions => '權限';

  @override
  String get unableConnectToDevice => '無法連線至裝置';

  @override
  String get deviceNotAbleToFindWifiNearby => '裝置無法找到附近的 Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '連線至 $name Wi-Fi 網路失敗。\n請確認您的手機已連線至裝置的 Wi-Fi 網路，且已在手機設定中允許此應用程式存取區域網路。';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '無法連線至 Wi-Fi，因為裝置 $name 未找到網路';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      '請依照以下步驟將您的手機連線至裝置。';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '連線至類似 $wifiName 的 Wi-Fi。';
  }

  @override
  String get ready => '就緒';

  @override
  String get exitDeviceProvisioning => '結束裝置佈建';

  @override
  String get noNotificationsFound => '找不到通知';

  @override
  String get markAsRead => '標記為已讀';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => '請掃描您裝置上的 QR 碼。';

  @override
  String get search => '搜尋';

  @override
  String get tenant => '租戶';

  @override
  String get tenantProfile => '租戶設定檔';

  @override
  String get user => '使用者';

  @override
  String get asset => '資產';

  @override
  String get deviceProfile => '裝置設定檔';

  @override
  String get assetProfile => '資產設定檔';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '警報',
      one: '警報',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => '規則鏈';

  @override
  String get ruleNode => '規則節點';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => '實體檢視';

  @override
  String get widgetsBundle => '小工具包';

  @override
  String get widgetType => '小工具類型';

  @override
  String get apiUsageState => 'API 使用狀態';

  @override
  String get tbResource => '資源';

  @override
  String get otaPackage => 'OTA 軟體套件';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '佇列';

  @override
  String get notificationTarget => '通知收件者群組';

  @override
  String get notificationTemplate => '通知範本';

  @override
  String get notificationRequest => '通知請求';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '通知',
      one: '通知',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => '通知規則';

  @override
  String get entityGroup => '實體群組';

  @override
  String get converter => '轉換器';

  @override
  String get integration => '整合';

  @override
  String get schedulerEvent => '排程事件';

  @override
  String get blobEntity => 'Blob 實體';

  @override
  String get role => '角色';

  @override
  String get groupPermission => '群組權限';

  @override
  String get actionStatusSuccess => '成功';

  @override
  String get actionStatusFailure => '失敗';

  @override
  String get actionTypeAdded => '已新增';

  @override
  String get actionTypeDeleted => '已刪除';

  @override
  String get actionTypeUpdated => '已更新';

  @override
  String get actionTypeAttributesUpdated => '屬性已更新';

  @override
  String get actionTypeAttributesDeleted => '屬性已刪除';

  @override
  String get actionTypeRpcCall => 'RPC 呼叫';

  @override
  String get actionTypeCredentialsUpdated => '認證資訊已更新';

  @override
  String get actionTypeAssignedToCustomer => '已指派給客戶';

  @override
  String get actionTypeUnassignedFromCustomer => '已從客戶取消指派';

  @override
  String get actionTypeActivated => '已啟用';

  @override
  String get actionTypeSuspended => '已停用';

  @override
  String get actionTypeCredentialsRead => '認證資訊已讀取';

  @override
  String get actionTypeAttributesRead => '屬性已讀取';

  @override
  String get actionTypeRelationAddOrUpdate => '關聯已更新';

  @override
  String get actionTypeRelationDeleted => '關聯已刪除';

  @override
  String get actionTypeRelationsDeleted => '所有關聯已刪除';

  @override
  String get actionTypeAlarmAck => '已確認';

  @override
  String get actionTypeAlarmClear => '已清除';

  @override
  String get actionTypeAlarmDelete => '警報已刪除';

  @override
  String get actionTypeAlarmAssigned => '警報已指派';

  @override
  String get actionTypeAlarmUnassigned => '警報已取消指派';

  @override
  String get actionTypeLogin => '登入';

  @override
  String get actionTypeLogout => '登出';

  @override
  String get actionTypeLockout => '鎖定';

  @override
  String get actionTypeAssignedFromTenant => '已從租戶指派';

  @override
  String get actionTypeAssignedToTenant => '已指派給租戶';

  @override
  String get actionTypeProvisionSuccess => '裝置已佈建';

  @override
  String get actionTypeProvisionFailure => '裝置佈建失敗';

  @override
  String get actionTypeTimeseriesUpdated => '遙測已更新';

  @override
  String get actionTypeTimeseriesDeleted => '遙測已刪除';

  @override
  String get actionTypeAssignedToEdge => '已指派給 Edge';

  @override
  String get actionTypeUnassignedFromEdge => '已從 Edge 取消指派';

  @override
  String get actionTypeAddedComment => '已新增留言';

  @override
  String get actionTypeUpdatedComment => '已更新留言';

  @override
  String get actionTypeDeletedComment => '已刪除留言';

  @override
  String get actionTypeSmsSent => '簡訊已傳送';

  @override
  String get actionTypeAddedToEntityGroup => '已新增至實體群組';

  @override
  String get actionTypeRemovedFromEntityGroup => '已從實體群組移除';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API 規則引擎呼叫';

  @override
  String get actionTypeMadePublic => '已設為公開';

  @override
  String get actionTypeMadePrivate => '已設為私有';

  @override
  String get actionTypeChangeOwner => '所有者已變更';

  @override
  String get youDontHavePermissionsToPerformThisOperation => '您沒有執行此操作的權限！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '您的權限似乎不足以完成此操作。';

  @override
  String get isRequiredText => '為必填項。';

  @override
  String get no2faProvidersFound => '找不到雙因素驗證提供者';

  @override
  String get pleaseContactYourSystemAdministrator => '請聯絡您的系統管理員。';

  @override
  String errorOccured(Object e) {
    return '發生錯誤：$e';
  }

  @override
  String get unsavedChanges => '未儲存的變更';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo => '您有未儲存的變更。確定要離開此頁面嗎？';

  @override
  String get deleteAccount => '刪除帳戶';

  @override
  String accountDeletionDialogBody(Object authority) {
    return '確定嗎？您即將刪除您的 $authority 帳戶。';
  }

  @override
  String get language => '語言';

  @override
  String get metricUnitSystem => '公制';

  @override
  String get imperialUnitSystem => '英制';

  @override
  String get hybridUnitSystem => '混合';

  @override
  String get autoUnitSystem => '自動';

  @override
  String get languageAuto => '自動';

  @override
  String get unitSystem => '單位制';

  @override
  String get selectCountry => '選取國家／地區';

  @override
  String get hideHomeDashboardToolbar => '隱藏首頁儀表板工具列';

  @override
  String get phoneNumberHelperText => 'E.164 格式的電話號碼，例如 +1201550123。';

  @override
  String get homeDashboard => '首頁儀表板';

  @override
  String get security => '安全性';

  @override
  String get twofactorAuthentication => '雙因素驗證';

  @override
  String get verificationRequired => '需要驗證';

  @override
  String get twofactorAuthenticationIsRequired => '需要雙因素驗證';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      '請設定一種驗證方式以繼續登入。';

  @override
  String get setUpAVerificationMethod => '設定驗證方式';

  @override
  String get totpSetupSuccessDescription => '下次登入時，您需要提供雙因素驗證碼';

  @override
  String get smsSetupSuccessDescription => '下次登入時，系統將提示您輸入傳送到該手機號碼的安全碼';

  @override
  String get emailSetupSuccessDescription => '下次登入時，系統將提示您輸入傳送到您電子郵件地址的安全碼';

  @override
  String get backupCodeSetupSuccessDescription => '下次登入時，您將可以使用備用驗證碼通過雙因素驗證。';

  @override
  String get loginToApp => '登入應用程式';

  @override
  String get goBack => '返回';

  @override
  String get done => '完成';

  @override
  String get thisWillMakeYourAccountLessSecure => '這會降低您帳戶的安全性。';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '確定要停用「$providerName」嗎？';
  }

  @override
  String get yesDeactivate => '是，停用';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '輸入用於身分驗證的電子郵件地址。';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator => '輸入用於身分驗證的手機號碼。';

  @override
  String get sendCode => '傳送驗證碼';

  @override
  String errorSendingCode(String error) {
    return '傳送驗證碼時發生錯誤：$error';
  }

  @override
  String get copy => '複製';

  @override
  String get copiedToClipboard => '已複製到剪貼簿。';

  @override
  String get enter6digitsKeyFromYourAppHere => '在此輸入 6 位驗證碼';

  @override
  String digitsCode(int count) {
    return '$count 位驗證碼';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '請將 32 字元的金鑰複製到您的身分驗證器應用程式，或掃描下方的 QR 碼。';

  @override
  String get applyChanges => '套用變更';

  @override
  String get discardChanges => '放棄變更';

  @override
  String get yesDiscard => '是，放棄';

  @override
  String get thisActionCannotBeUndone => '此操作無法復原。';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '雙因素驗證保護您的帳戶免受未授權存取。您只需在登入時輸入安全碼即可。';

  @override
  String get calculatedField => '計算欄位';

  @override
  String get apiKey => 'API 金鑰';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get adminSettings => '管理設定';

  @override
  String get job => '作業';

  @override
  String get mobileAppBundle => '行動應用程式套件';

  @override
  String get mobileApp => '行動應用程式';

  @override
  String get domain => '網域';

  @override
  String get oauth2Client => 'OAuth 2.0 用戶端';

  @override
  String get queueStats => '佇列統計';

  @override
  String get phoneIsRequired => '電話為必填項。';

  @override
  String get phoneIsInvalid => '電話無效。';

  @override
  String get addVerificationMethod => '新增驗證方式';

  @override
  String get imageSavedToGallery => '已儲存至平台「圖片庫」。';

  @override
  String get failedToSaveImage => '儲存圖片失敗。';

  @override
  String nSelected(int count) {
    return '已選取 $count 項';
  }

  @override
  String get selectAll => '選取全部已載入項目';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 項操作失敗',
      one: '1 項操作失敗',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確定要刪除 $count 則通知嗎？',
      one: '確定要刪除 1 則通知嗎？',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確定要將 $count 則通知標記為已讀嗎？',
      one: '確定要將 1 則通知標記為已讀嗎？',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return '正在從您的主機 $host 取得資料';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return '正在將您登入主機 $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return '正在將您切換至新主機 $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '無法從 $host 取得登入權杖。請掃描新的 QR 碼。';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '無法連線至 $host。';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host 不是 ThingsBoard 伺服器';
  }

  @override
  String get qrCodeSessionIsNoLongerValid => 'QR 碼工作階段已失效。請重新整理 QR 碼並再次掃描。';

  @override
  String get openThisLinkTitle => '要開啟此連結嗎？';

  @override
  String get linkOpensSignInPage => '此連結會開啟此伺服器的登入頁面。您將從目前的伺服器登出。';

  @override
  String get linkOpensSignInPageOnly => '此連結會開啟此伺服器的登入頁面。';

  @override
  String linkSignsInAs(Object email) {
    return '此連結會以 $email 的身分將您登入此伺服器。';
  }

  @override
  String get linkSignsIn => '此連結會將您登入此伺服器。';

  @override
  String get serverConnectionNotSecure => '此伺服器未使用安全連線。';

  @override
  String get linkToOtherServerNotAllowed => '此應用程式僅能搭配自身的伺服器運作，無法開啟此連結。';

  @override
  String get liveTrackingActive => '即時位置追蹤';

  @override
  String get liveTrackingPaused => '即時追蹤已暫停';

  @override
  String get liveTrackingFixes => '定位點';

  @override
  String get liveTrackingSaved => '已儲存';

  @override
  String get liveTrackingErrors => '錯誤';

  @override
  String get liveTrackingStop => '停止';

  @override
  String get liveTrackingPause => '暫停';

  @override
  String get liveTrackingResume => '繼續';

  @override
  String get liveTrackingHide => '隱藏';

  @override
  String get liveTrackingSessionTitle => '即時位置追蹤';

  @override
  String get liveTrackingTarget => '將位置儲存至實體';

  @override
  String get liveTrackingDashboard => '儀表板';

  @override
  String get liveTrackingStatus => '狀態';

  @override
  String get liveTrackingStarted => '開始時間';

  @override
  String get liveTrackingLastFix => '最後定位點';

  @override
  String get liveTrackingLastError => '最後錯誤';

  @override
  String get liveTrackingErrorTargetNotFound =>
      '無法儲存至此實體：該實體已不存在。追蹤仍持續進行；請於儀表板動作中更新目標。';

  @override
  String get liveTrackingErrorNoConnection => '無法連線至伺服器。這些定位點尚未儲存，恢復連線後將繼續儲存。';

  @override
  String get liveTrackingErrorUnauthorized => '您的工作階段已結束。請重新登入以繼續儲存位置。';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      '無法儲存至此實體：您沒有權限。追蹤仍持續進行；請洽您的管理員授予存取權限。';

  @override
  String get liveTrackingErrorSaveFailed => '無法將此定位點儲存至伺服器。將於下一個定位點時重試儲存。';

  @override
  String get liveTrackingErrorServicesDisabled => '此裝置的定位服務已關閉。';

  @override
  String get liveTrackingErrorPermissionDenied => '定位權限已遭拒絕。';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '定位權限已永久拒絕。請於應用程式設定中啟用。';

  @override
  String get liveTrackingErrorLocation => '無法取得定位點。';

  @override
  String get liveTrackingMenuTitle => '即時位置追蹤';

  @override
  String get liveTrackingNoRecord => '沒有進行中的追蹤，也沒有最近的工作階段。';

  @override
  String get liveTrackingLastSession => '上次工作階段';

  @override
  String get liveTrackingStartAgain => '重新開始';

  @override
  String get liveTrackingEnded => '結束時間';

  @override
  String get liveTrackingEndReason => '結束原因';

  @override
  String get liveTrackingEndReasonManual => '已手動停止';

  @override
  String get liveTrackingEndReasonMaxDuration => '已達最長時間';

  @override
  String get liveTrackingEndReasonInterrupted => '已中斷';

  @override
  String get serverUpdateRequired => '伺服器需要更新';

  @override
  String get backToLogin => '返回登入';

  @override
  String serverRequiresVersion(String minVersion) {
    return '此應用程式需搭配 ThingsBoard $minVersion 或更新版本。';
  }

  @override
  String get serverLabel => '伺服器';

  @override
  String get versionLabel => '版本';

  @override
  String get askAdminToUpdateServer => '請聯絡您的伺服器管理員更新伺服器。';

  @override
  String get deviceClaimFailed => '無法認領裝置。請重試。';

  @override
  String get deviceToClaimNotFound => '找不到裝置。請聯絡裝置供應商。';

  @override
  String get enableAuthenticatorApp => '啟用身分驗證器應用程式';

  @override
  String get enableSmsAuthenticator => '啟用簡訊驗證';

  @override
  String get enableEmailAuthenticator => '啟用電子郵件驗證';

  @override
  String get getBackupCode => '取得備用驗證碼';

  @override
  String get twoFaTotpDescription =>
      '使用手機上的 Google Authenticator、Authy 或 Duo 等應用程式進行驗證。它將產生登入所需的安全碼。';

  @override
  String get twoFaSmsDescription => '使用手機進行驗證。登入時我們將透過簡訊向您傳送安全碼。';

  @override
  String get twoFaEmailDescription => '使用傳送到您電子郵件地址的安全碼進行驗證。';

  @override
  String get twoFaBackupCodeDescription =>
      '這些可列印的一次性密碼允許您在不方便使用手機時（例如旅行中）登入帳戶。';

  @override
  String get openInAuthenticatorApp => '在驗證器應用程式中開啟';

  @override
  String get noAuthenticatorAppFound => '找不到驗證器應用程式。請改將金鑰複製到您的應用程式中。';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider 已啟用';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '您的管理員要求 $email 啟用雙因素驗證。';
  }

  @override
  String get recommended => '建議';

  @override
  String get addBackupCodesHint => '也請新增備用驗證碼，以便在遺失手機時仍能登入。';

  @override
  String get totpSecretKey => '金鑰';

  @override
  String get backupCodesDescription => '請列印這些驗證碼，以便在需要登入帳戶時使用。每個備用驗證碼只能使用一次。';

  @override
  String get backupCodesWarning => '離開此頁面後，這些驗證碼將無法再次顯示。請使用以下選項安全儲存。';

  @override
  String get downloadTxt => '下載（txt）';
}

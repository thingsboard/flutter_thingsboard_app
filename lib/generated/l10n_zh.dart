// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Thingsboard';

  @override
  String get home => '主页';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Devices',
      one: 'Device',
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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => '审计报告';

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
  String get logout => '登出';

  @override
  String get login => '登录';

  @override
  String get logoDefaultValue => 'Thingsboard Logo';

  @override
  String get loginToYourAccount => '登录你的账号';

  @override
  String get email => '邮箱';

  @override
  String get emailRequireText => '邮箱是必填项';

  @override
  String get emailInvalidText => '邮箱格式无效';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get passwordRequireText => '密码是必填项';

  @override
  String get passwordForgotText => '忘记密码?';

  @override
  String get passwordReset => '重置密码';

  @override
  String get passwordResetText => '输入和账号关联的邮箱，我们将发送密码重置链接到您的邮箱';

  @override
  String get requestPasswordReset => '请求重置密码';

  @override
  String get passwordResetLinkSuccessfullySentNotification => '密码重置链接发送成功！';

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
  String get stateOrProvince => '州 / 省';

  @override
  String get postalCode => '邮编';

  @override
  String get address => '地址';

  @override
  String get address2 => '地址 2';

  @override
  String get phone => '电话';

  @override
  String get alarmClearTitle => '清除告警';

  @override
  String get alarmClearText => '你确定要清除告警吗?';

  @override
  String get alarmAcknowledgeTitle => '确认告警';

  @override
  String get alarmAcknowledgeText => '你确定要确认告警吗?';

  @override
  String get assetName => '资产名';

  @override
  String get type => '类型';

  @override
  String get label => '标签';

  @override
  String get assignedToCustomer => '分配给客户';

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
  String get actionData => '动作数据';

  @override
  String get failureDetails => '失败详情';

  @override
  String get allDevices => '所有设备';

  @override
  String get active => '激活';

  @override
  String get inactive => '失活';

  @override
  String get systemAdministrator => '系统管理员';

  @override
  String get tenantAdministrator => '租户管理员';

  @override
  String get customer => '客户';

  @override
  String get changePassword => '修改密码';

  @override
  String get currentPasswordRequireText => '当前密码是必填项';

  @override
  String get currentPassword => '当前密码';

  @override
  String get newPasswordRequireText => '新密码是必填项';

  @override
  String get newPassword => '新密码';

  @override
  String get newPassword2RequireText => '请再次输入新密码';

  @override
  String get newPassword2 => '确认新密码';

  @override
  String get passwordErrorNotification => '输入的密码必须相同！';

  @override
  String get firstNameUpper => '名';

  @override
  String get lastNameUpper => '姓';

  @override
  String get profileSuccessNotification => '个人资料更新成功';

  @override
  String get passwordSuccessNotification => '密码修改成功';

  @override
  String get notImplemented => '未实现！';

  @override
  String get listIsEmptyText => '列表当前为空';

  @override
  String get tryAgain => '再试一次';

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
      other: '$time 秒',
      one: '1 秒',
    );
    return '在 $_temp0内重新发送验证码';
  }

  @override
  String get totpAuthDescription => '请输入来自您身份验证器应用的安全码。';

  @override
  String smsAuthDescription(Object contact) {
    return '安全码已发送到您的手机 $contact。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '安全码已发送到您的邮箱 $contact。';
  }

  @override
  String get backupCodeAuthDescription => '请输入您的备份码之一。';

  @override
  String get toptAuthPlaceholder => '验证码';

  @override
  String get smsAuthPlaceholder => '短信验证码';

  @override
  String get emailAuthPlaceholder => '邮箱验证码';

  @override
  String get backupCodeAuthPlaceholder => '备份码';

  @override
  String get verificationCodeIncorrect => '验证码不正确';

  @override
  String get verificationCodeManyRequest => '验证码请求过于频繁';

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
  String get mfaProviderBackupCode => '备份码';

  @override
  String get newUserText => '新用户?';

  @override
  String get createAccount => '创建账户';

  @override
  String get emailVerification => '邮箱验证';

  @override
  String get emailVerificationSentText => '验证邮件已发送到指定的邮箱地址 ';

  @override
  String get emailVerificationInstructionsText =>
      '请按照邮件中的说明完成注册流程。注意：如果您没有看到邮件，请检查您的\"垃圾邮件\"文件夹，或点击\"重新发送\"按钮重新发送邮件。';

  @override
  String get resend => '重新发送';

  @override
  String get activatingAccount => '正在激活账户...';

  @override
  String get accountActivated => '账户激活成功！';

  @override
  String get emailVerified => '邮箱验证成功';

  @override
  String get activatingAccountText => '您的账户正在激活中。\n请稍等...';

  @override
  String accountActivatedText(Object appTitle) {
    return '恭喜！\n您的 $appTitle 账户已激活。\n现在您可以登录到您的 $appTitle 空间。';
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
  String get firstNameRequireText => '名是必填项';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓是必填项';

  @override
  String get createPassword => '创建密码';

  @override
  String get repeatPassword => '重复输入密码';

  @override
  String get imNotARobot => '我不是机器人';

  @override
  String get signUp => '注册';

  @override
  String get alreadyHaveAnAccount => '已有账户?';

  @override
  String get signIn => '登录';

  @override
  String get inactiveUserAlreadyExists => '未激活用户已存在';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '已注册但邮箱未验证的用户。\n如果您希望重新发送验证邮件，请点击\"重新发送\"按钮。';

  @override
  String get assignee => '被分配人';

  @override
  String get alarmTypes => '告警类型';

  @override
  String get details => '详情';

  @override
  String get status => '状态';

  @override
  String get severity => '严重程度';

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
      other: '$value days',
      one: '$value day',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value hours',
      one: '$value hour',
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
      other: '$value seconds',
      one: '$value second',
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
  String get areYouSure => '您确定吗?';

  @override
  String get noResultsFound => '未找到结果';

  @override
  String get tryRefiningYourQuery => '请尝试优化您的查询';

  @override
  String get failedToLoadTheList => '加载列表失败';

  @override
  String get tryRefreshing => '请尝试刷新';

  @override
  String get refresh => '刷新';

  @override
  String get users => '用户';

  @override
  String get unassigned => '未分配';

  @override
  String get failedToLoadAlarmDetails => '加载告警详情失败';

  @override
  String get somethingWentWrong => '出现问题';

  @override
  String get chooseRegion => '选择地区';

  @override
  String get selectRegion => '选择地区';

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
      other: 'Dashboards',
      one: 'Dashboard',
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
    return '要继续设置您的设备 $deviceName，请提供您网络的凭据。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '输入 $network 的密码';
  }

  @override
  String get deviceNotFoundMessage => '未找到设备。请确保您手机的蓝牙已打开且在新设备的信号范围内。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '您没有足够的\"$permissions\"权限以继续。请授予所需权限并点击\"再试一次\"。';
  }

  @override
  String get sendingWifiCredentials => '发送 Wi-Fi 凭据';

  @override
  String get confirmingWifiConnection => '确认 Wi-Fi 连接';

  @override
  String get provisionedSuccessfully => '设备配置成功';

  @override
  String get returnToDashboard => '返回仪表板';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '无法与设备 $deviceName 建立会话。请重试';
  }

  @override
  String get claimingDevice => '声明设备';

  @override
  String get claimingDeviceDone => '设备声明完成';

  @override
  String get claimingMessageSuccess => '设备\n声明成功';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '您没有足够的\"$permissions\"权限以继续。请打开应用设置，授予权限并点击\"再试一次\"。';
  }

  @override
  String get scanACode => '扫描代码';

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
      '打开设置并授予摄像头访问权限以继续';

  @override
  String get notFound => '未找到';

  @override
  String routeNotDefined(Object name) {
    return '路由未定义: $name';
  }

  @override
  String get loginWith => '登录方式';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get anEmptyRequestDataReceived => '收到空的请求数据。';

  @override
  String get somethingWentWrongRollback => '出现问题... 回滚';

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
  String get alarmSeverityList => '告警严重程度列表';

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
      one: '搜索用户',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Reset';

  @override
  String get update => 'Update';

  @override
  String get alarmTypeList => 'Alarm type list';

  @override
  String get anyType => 'Any type';

  @override
  String get plusAlarmType => '+ Alarm type';

  @override
  String get all => 'All';

  @override
  String get unread => 'Unread';

  @override
  String get close => 'Close';

  @override
  String get codeVerificationFailed => 'Code verification failed!';

  @override
  String get fatalError => 'Fatal error';

  @override
  String get unknownError => 'Unknown error.';

  @override
  String get sessionExpired => 'Session has expired';

  @override
  String get fatalApplicationErrorOccurred =>
      'Fatal application error occurred:';

  @override
  String get connectionError => 'Connection error';

  @override
  String get failedToConnectToServer => 'Failed to connect to server';

  @override
  String get retry => 'Retry';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobile dashboard should be configured in device profile!';

  @override
  String get openWifiSettings => 'Open Wi-Fi settings';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Connect to the Wi-Fi you usually use';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Return to the app and tap Ready button';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push notifications are not configured.\nPlease contact your system administrator.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get profile => 'Profile';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Can\'t launch url: $link';
  }

  @override
  String get noDashboardsFound => 'No dashboards found';

  @override
  String get openAppSettings => 'Open app settings';

  @override
  String get connectingToDevice => 'Connecting to device';

  @override
  String get connectToDevice => 'Connect to device';

  @override
  String get selectWifiNetwork => 'Select Wi-Fi network';

  @override
  String get deviceProvisioning => 'Device provisioning';

  @override
  String get permissions => 'Permissions';

  @override
  String get unableConnectToDevice => 'Unable connect to device';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Device not able to find Wi-Fi nearby';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Connection to the $name Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Unable connect to Wi-Fi because networks wasn\'t found by device $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Please follow the next steps to connect your phone to device';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Connect to Wi-Fi similar to $wifiName';
  }

  @override
  String get ready => 'Ready';

  @override
  String get exitDeviceProvisioning => 'Exit device provisioning';

  @override
  String get noNotificationsFound => 'No notifications found';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get url => 'Url';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Please scan QR code on your device';

  @override
  String get search => 'Search';

  @override
  String get tenant => 'Tenant';

  @override
  String get tenantProfile => 'Tenant profile';

  @override
  String get user => 'User';

  @override
  String get asset => 'Asset';

  @override
  String get deviceProfile => '设备配置文件';

  @override
  String get assetProfile => '资产配置文件';

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
  String get edge => '边缘';

  @override
  String get entityView => '实体视图';

  @override
  String get widgetsBundle => '组件包';

  @override
  String get widgetType => '组件类型';

  @override
  String get apiUsageState => 'API使用状态';

  @override
  String get tbResource => '资源';

  @override
  String get otaPackage => 'OTA包';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '队列';

  @override
  String get notificationTarget => '通知目标';

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
  String get schedulerEvent => '调度事件';

  @override
  String get blobEntity => 'Blob 实体';

  @override
  String get role => '角色';

  @override
  String get groupPermission => '组权限';

  @override
  String get actionStatusSuccess => 'Success';

  @override
  String get actionStatusFailure => 'Failure';

  @override
  String get actionTypeAdded => 'Added';

  @override
  String get actionTypeDeleted => 'Deleted';

  @override
  String get actionTypeUpdated => 'Updated';

  @override
  String get actionTypeAttributesUpdated => 'Attributes Updated';

  @override
  String get actionTypeAttributesDeleted => 'Attributes Deleted';

  @override
  String get actionTypeRpcCall => 'RPC Call';

  @override
  String get actionTypeCredentialsUpdated => 'Credentials Updated';

  @override
  String get actionTypeAssignedToCustomer => 'Assigned to Customer';

  @override
  String get actionTypeUnassignedFromCustomer => 'Unassigned from Customer';

  @override
  String get actionTypeActivated => 'Activated';

  @override
  String get actionTypeSuspended => 'Suspended';

  @override
  String get actionTypeCredentialsRead => 'Credentials read';

  @override
  String get actionTypeAttributesRead => 'Attributes read';

  @override
  String get actionTypeRelationAddOrUpdate => 'Relation updated';

  @override
  String get actionTypeRelationDeleted => 'Relation deleted';

  @override
  String get actionTypeRelationsDeleted => 'All relation deleted';

  @override
  String get actionTypeAlarmAck => 'Acknowledged';

  @override
  String get actionTypeAlarmClear => 'Cleared';

  @override
  String get actionTypeAlarmDelete => 'Alarm Deleted';

  @override
  String get actionTypeAlarmAssigned => 'Alarm Assigned';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm Unassigned';

  @override
  String get actionTypeLogin => 'Login';

  @override
  String get actionTypeLogout => 'Logout';

  @override
  String get actionTypeLockout => 'Lockout';

  @override
  String get actionTypeAssignedFromTenant => 'Assigned from Tenant';

  @override
  String get actionTypeAssignedToTenant => 'Assigned to Tenant';

  @override
  String get actionTypeProvisionSuccess => 'Device provisioned';

  @override
  String get actionTypeProvisionFailure => 'Device provisioning was failed';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetry updated';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetry deleted';

  @override
  String get actionTypeAssignedToEdge => 'Assigned to Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Unassigned from Edge';

  @override
  String get actionTypeAddedComment => 'Added Comment';

  @override
  String get actionTypeUpdatedComment => 'Updated Comment';

  @override
  String get actionTypeDeletedComment => 'Deleted Comment';

  @override
  String get actionTypeSmsSent => 'SMS Sent';

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
  String get youDontHavePermissionsToPerformThisOperation => '您没有执行此操作的权限！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '您的权限似乎不足以完成此操作';

  @override
  String get isRequiredText => 'is required.';

  @override
  String get no2faProvidersFound => 'No 2FA providers found';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Please contact your system administrator';

  @override
  String errorOccured(Object e) {
    return 'Error occured: $e';
  }

  @override
  String get unsavedChanges => 'Unsaved changes';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'You have unsaved changes. Are you sure you want to leave this page?';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Are you sure? You are going to delete your $authority account.';
  }

  @override
  String get language => 'Language';

  @override
  String get metricUnitSystem => 'Metric';

  @override
  String get imperialUnitSystem => 'Imperial';

  @override
  String get hybridUnitSystem => 'Hybrid';

  @override
  String get autoUnitSystem => 'Auto';

  @override
  String get languageAuto => 'Auto';

  @override
  String get unitSystem => 'Unit system';

  @override
  String get selectCountry => 'Select country';

  @override
  String get hideHomeDashboardToolbar => 'Hide home dashboard toolbar';

  @override
  String get phoneNumberHelperText =>
      'Phone Number in E.164 format, ex. +1201550123';

  @override
  String get homeDashboard => 'Home dashboard';

  @override
  String get security => 'Security';

  @override
  String get twofactorAuthentication => 'Two-factor authentication';

  @override
  String get verificationRequired => 'Verification required';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Two-factor authentication is required';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Set up a verification method to continue with your login';

  @override
  String get setUpAVerificationMethod => 'Set up a verification method';

  @override
  String get totpSetupSuccessDescription =>
      'The next time you log in, you will need to provide a two-factor authentication code';

  @override
  String get smsSetupSuccessDescription =>
      'The next time you log in, you will be prompted to enter the security code that will be sent to the phone number';

  @override
  String get emailSetupSuccessDescription =>
      'The next time you log in, you will be prompted to enter the security code that will be sent to your email address';

  @override
  String get backupCodeSetupSuccessDescription =>
      'The next time you log in, you will be able to use backup codes to pass two factor authentification';

  @override
  String get loginToApp => 'Login to app';

  @override
  String get goBack => 'Go back';

  @override
  String get done => 'Done';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'This will make your account less secure';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Are you sure you want to deactivate $providerName?';
  }

  @override
  String get yesDeactivate => 'Yes, deactivate';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Enter an email to use as your authenticator.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Enter a phone number to use as your authenticator';

  @override
  String get sendCode => 'Send code';

  @override
  String errorSendingCode(String error) {
    return 'Error sending code: $error';
  }

  @override
  String get copy => 'Copy';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Enter the 6-digit code here';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'digits',
      one: 'digit',
    );
    return '$count-$_temp0 code';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Copy 32-digits key to your authentication app or scan QR-code below';

  @override
  String get applyChanges => 'Apply changes';

  @override
  String get discardChanges => 'Discard changes';

  @override
  String get yesDiscard => 'Yes, discard';

  @override
  String get thisActionCannotBeUndone => 'This action cannot be undone';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Two-factor authentication protects your account from unauthorized access. All you have to do is enter a security code when you log in.';

  @override
  String get calculatedField => 'Calculated field';

  @override
  String get apiKey => 'Api key';

  @override
  String get aiModel => 'Ai model';

  @override
  String get adminSettings => 'Admin settings';

  @override
  String get job => 'Job';

  @override
  String get mobileAppBundle => 'Mobile app bundle';

  @override
  String get mobileApp => 'Mobile app';

  @override
  String get domain => 'Domain';

  @override
  String get oauth2Client => 'Oauth2 client';

  @override
  String get queueStats => 'Queue stats';

  @override
  String get phoneIsRequired => 'Phone is required';

  @override
  String get phoneIsInvalid => 'Phone is invalid';

  @override
  String get addVerificationMethod => 'Add verification method';

  @override
  String get imageSavedToGallery => '已保存到“图片库”';

  @override
  String get failedToSaveImage => '保存图片失败';

  @override
  String nSelected(int count) {
    return '$count selected';
  }

  @override
  String get selectAll => 'Select all loaded';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operations failed',
      one: '1 operation failed',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count notifications?',
      one: 'Delete 1 notification?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mark $count notifications as read?',
      one: 'Mark 1 notification as read?',
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
  String get openThisLinkTitle => '打开此链接？';

  @override
  String get linkOpensSignInPage => '此链接将打开此服务器的登录页面。你将从当前服务器退出登录。';

  @override
  String linkSignsInAs(Object email) {
    return '此链接将以 $email 身份登录此服务器。';
  }

  @override
  String get linkSignsIn => '此链接将登录此服务器。';

  @override
  String get serverConnectionNotSecure => '此服务器未使用安全连接。';

  @override
  String get linkToOtherServerNotAllowed => '此应用仅适用于其自己的服务器，无法打开此链接。';

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
  String get askAdminToUpdateServer => '请联系服务器管理员更新服务器。';

  @override
  String get deviceClaimFailed => '无法认领设备，请重试。';

  @override
  String get deviceToClaimNotFound => '未找到设备，请联系设备提供商。';

  @override
  String get enableAuthenticatorApp => 'Enable authenticator app';

  @override
  String get enableSmsAuthenticator => 'Enable SMS authenticator';

  @override
  String get enableEmailAuthenticator => 'Enable email authenticator';

  @override
  String get getBackupCode => 'Get backup code';

  @override
  String get twoFaTotpDescription =>
      'Use apps like Google Authenticator, Authy, or Duo on your phone to authenticate. It will generate a security code for logging in.';

  @override
  String get twoFaSmsDescription =>
      'Use your phone to authenticate. We\'ll send you a security code via SMS message when you log in.';

  @override
  String get twoFaEmailDescription =>
      'Use a security code sent to your email address to authenticate.';

  @override
  String get twoFaBackupCodeDescription =>
      'These printable one-time passcodes allow you to sign in when away from your phone, like when you’re traveling.';

  @override
  String get openInAuthenticatorApp => 'Open in authenticator app';

  @override
  String get noAuthenticatorAppFound =>
      'No authenticator app found. Copy the key into your app instead.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider is enabled';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Your administrator requires two-factor authentication for $email.';
  }

  @override
  String get recommended => 'Recommended';

  @override
  String get addBackupCodesHint =>
      'Add backup codes too, so you can still sign in if you lose your phone.';

  @override
  String get totpSecretKey => 'Secret key';

  @override
  String get backupCodesDescription =>
      'Print out the codes so you have them handy when you need to use them to log in to your account. You can use each backup code once.';

  @override
  String get backupCodesWarning =>
      'Once you leave this page, these codes cannot be shown again. Store them safely using the options below.';

  @override
  String get downloadTxt => 'Download (txt)';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class SZhCn extends SZh {
  SZhCn() : super('zh_CN');

  @override
  String get appTitle => 'Thingsboard';

  @override
  String get home => '主页';

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
  String get auditLogs => '审计报告';

  @override
  String get logout => '登出';

  @override
  String get login => '登录';

  @override
  String get logoDefaultValue => 'Thingsboard Logo';

  @override
  String get loginToYourAccount => '登录你的账号';

  @override
  String get email => '邮箱';

  @override
  String get emailRequireText => '邮箱是必填项';

  @override
  String get emailInvalidText => '邮箱格式无效';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get passwordRequireText => '密码是必填项';

  @override
  String get passwordForgotText => '忘记密码?';

  @override
  String get passwordReset => '重置密码';

  @override
  String get passwordResetText => '输入和账号关联的邮箱，我们将发送密码重置链接到您的邮箱';

  @override
  String get requestPasswordReset => '请求重置密码';

  @override
  String get passwordResetLinkSuccessfullySentNotification => '密码重置链接发送成功！';

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
  String get stateOrProvince => '州 / 省';

  @override
  String get postalCode => '邮编';

  @override
  String get address => '地址';

  @override
  String get address2 => '地址 2';

  @override
  String get phone => '电话';

  @override
  String get alarmClearTitle => '清除告警';

  @override
  String get alarmClearText => '你确定要清除告警吗?';

  @override
  String get alarmAcknowledgeTitle => '确认告警';

  @override
  String get alarmAcknowledgeText => '你确定要确认告警吗?';

  @override
  String get assetName => '资产名';

  @override
  String get type => '类型';

  @override
  String get label => '标签';

  @override
  String get assignedToCustomer => '分配给客户';

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
  String get actionData => '动作数据';

  @override
  String get failureDetails => '失败详情';

  @override
  String get allDevices => '所有设备';

  @override
  String get active => '激活';

  @override
  String get inactive => '失活';

  @override
  String get systemAdministrator => '系统管理员';

  @override
  String get tenantAdministrator => '租户管理员';

  @override
  String get customer => '客户';

  @override
  String get changePassword => '修改密码';

  @override
  String get currentPasswordRequireText => '当前密码是必填项';

  @override
  String get currentPassword => '当前密码';

  @override
  String get newPasswordRequireText => '新密码是必填项';

  @override
  String get newPassword => '新密码';

  @override
  String get newPassword2RequireText => '请再次输入新密码';

  @override
  String get newPassword2 => '确认新密码';

  @override
  String get passwordErrorNotification => '输入的密码必须相同！';

  @override
  String get firstNameUpper => '名';

  @override
  String get lastNameUpper => '姓';

  @override
  String get profileSuccessNotification => '个人资料更新成功';

  @override
  String get passwordSuccessNotification => '密码修改成功';

  @override
  String get notImplemented => '未实现！';

  @override
  String get listIsEmptyText => '列表当前为空';

  @override
  String get tryAgain => '再试一次';

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
      other: '$time 秒',
      one: '1 秒',
    );
    return '在 $_temp0内重新发送验证码';
  }

  @override
  String get totpAuthDescription => '请输入来自您身份验证器应用的安全码。';

  @override
  String smsAuthDescription(Object contact) {
    return '安全码已发送到您的手机 $contact。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '安全码已发送到您的邮箱 $contact。';
  }

  @override
  String get backupCodeAuthDescription => '请输入您的备份码之一。';

  @override
  String get toptAuthPlaceholder => '验证码';

  @override
  String get smsAuthPlaceholder => '短信验证码';

  @override
  String get emailAuthPlaceholder => '邮箱验证码';

  @override
  String get backupCodeAuthPlaceholder => '备份码';

  @override
  String get verificationCodeIncorrect => '验证码不正确';

  @override
  String get verificationCodeManyRequest => '验证码请求过于频繁';

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
  String get mfaProviderBackupCode => '备份码';

  @override
  String get newUserText => '新用户?';

  @override
  String get createAccount => '创建账户';

  @override
  String get emailVerification => '邮箱验证';

  @override
  String get emailVerificationSentText => '验证邮件已发送到指定的邮箱地址 ';

  @override
  String get emailVerificationInstructionsText =>
      '请按照邮件中的说明完成注册流程。注意：如果您没有看到邮件，请检查您的\"垃圾邮件\"文件夹，或点击\"重新发送\"按钮重新发送邮件。';

  @override
  String get resend => '重新发送';

  @override
  String get activatingAccount => '正在激活账户...';

  @override
  String get accountActivated => '账户激活成功！';

  @override
  String get emailVerified => '邮箱验证成功';

  @override
  String get activatingAccountText => '您的账户正在激活中。\n请稍等...';

  @override
  String accountActivatedText(Object appTitle) {
    return '恭喜！\n您的 $appTitle 账户已激活。\n现在您可以登录到您的 $appTitle 空间。';
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
  String get firstNameRequireText => '名是必填项';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓是必填项';

  @override
  String get createPassword => '创建密码';

  @override
  String get repeatPassword => '重复输入密码';

  @override
  String get imNotARobot => '我不是机器人';

  @override
  String get signUp => '注册';

  @override
  String get alreadyHaveAnAccount => '已有账户?';

  @override
  String get signIn => '登录';

  @override
  String get inactiveUserAlreadyExists => '未激活用户已存在';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '已注册但邮箱未验证的用户。\n如果您希望重新发送验证邮件，请点击\"重新发送\"按钮。';

  @override
  String get assignee => '被分配人';

  @override
  String get alarmTypes => '告警类型';

  @override
  String get details => '详情';

  @override
  String get status => '状态';

  @override
  String get severity => '严重程度';

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
  String get areYouSure => '您确定吗?';

  @override
  String get noResultsFound => '未找到结果';

  @override
  String get tryRefiningYourQuery => '请尝试优化您的查询';

  @override
  String get failedToLoadTheList => '加载列表失败';

  @override
  String get tryRefreshing => '请尝试刷新';

  @override
  String get refresh => '刷新';

  @override
  String get users => '用户';

  @override
  String get unassigned => '未分配';

  @override
  String get failedToLoadAlarmDetails => '加载告警详情失败';

  @override
  String get somethingWentWrong => '出现问题';

  @override
  String get chooseRegion => '选择地区';

  @override
  String get selectRegion => '选择地区';

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
    return '要继续设置您的设备 $deviceName，请提供您网络的凭据。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '输入 $network 的密码';
  }

  @override
  String get deviceNotFoundMessage => '未找到设备。请确保您手机的蓝牙已打开且在新设备的信号范围内。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '您没有足够的\"$permissions\"权限以继续。请授予所需权限并点击\"再试一次\"。';
  }

  @override
  String get sendingWifiCredentials => '发送 Wi-Fi 凭据';

  @override
  String get confirmingWifiConnection => '确认 Wi-Fi 连接';

  @override
  String get provisionedSuccessfully => '设备配置成功';

  @override
  String get returnToDashboard => '返回仪表板';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '无法与设备 $deviceName 建立会话。请重试';
  }

  @override
  String get claimingDevice => '声明设备';

  @override
  String get claimingDeviceDone => '设备声明完成';

  @override
  String get claimingMessageSuccess => '设备\n声明成功';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '您没有足够的\"$permissions\"权限以继续。请打开应用设置，授予权限并点击\"再试一次\"。';
  }

  @override
  String get scanACode => '扫描代码';

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
      '打开设置并授予摄像头访问权限以继续';

  @override
  String get notFound => '未找到';

  @override
  String routeNotDefined(Object name) {
    return '路由未定义: $name';
  }

  @override
  String get loginWith => '登录方式';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get anEmptyRequestDataReceived => '收到空的请求数据。';

  @override
  String get somethingWentWrongRollback => '出现问题... 回滚';

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
  String get alarmSeverityList => '告警严重程度列表';

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
      one: '搜索用户',
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
  String get anyType => '任何类型';

  @override
  String get plusAlarmType => '+ 告警类型';

  @override
  String get all => '全部';

  @override
  String get unread => '未读';

  @override
  String get close => '关闭';

  @override
  String get codeVerificationFailed => '验证码验证失败！';

  @override
  String get fatalError => '致命错误';

  @override
  String get unknownError => '未知错误。';

  @override
  String get sessionExpired => '会话已过期';

  @override
  String get fatalApplicationErrorOccurred => '发生致命应用程序错误：';

  @override
  String get connectionError => '连接错误';

  @override
  String get failedToConnectToServer => '无法连接到服务器';

  @override
  String get retry => '重试';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '需要在设备配置文件中配置移动仪表板！';

  @override
  String get openWifiSettings => '打开 Wi-Fi 设置';

  @override
  String get connectToTheWifiYouUsuallyUse => '连接到您常用的 Wi-Fi';

  @override
  String get returnToTheAppAndTapReadyButton => '返回应用并点击准备好按钮';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '请按照以下步骤重新将\n您的手机连接到常用 Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      '推送通知未配置。\n请联系您的系统管理员。';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase 未配置。\n请参考官方 Firebase 文档\n了解如何配置。';

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
  String get connectingToDevice => '正在连接设备';

  @override
  String get connectToDevice => '连接设备';

  @override
  String get selectWifiNetwork => '选择 Wi-Fi 网络';

  @override
  String get deviceProvisioning => '设备配置';

  @override
  String get permissions => '权限';

  @override
  String get unableConnectToDevice => '无法连接到设备';

  @override
  String get deviceNotAbleToFindWifiNearby => '设备无法找到附近的 Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '连接 Wi-Fi 网络 $name 失败。\n请确保您的手机已连接到设备的 Wi-Fi 网络，并且已在设备设置中为此应用启用本地网络访问。';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '无法连接 Wi-Fi，因为设备 $name 未找到网络';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      '请按照以下步骤将您的手机连接到设备';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '连接到类似 $wifiName 的 Wi-Fi';
  }

  @override
  String get ready => '准备好';

  @override
  String get exitDeviceProvisioning => '退出设备配置';

  @override
  String get noNotificationsFound => '未找到通知';

  @override
  String get markAsRead => '标记为已读';

  @override
  String get url => '链接';

  @override
  String get pleaseScanQrCodeOnYourDevice => '请扫描您设备上的二维码';

  @override
  String get search => '搜索';

  @override
  String get tenant => '租户';

  @override
  String get tenantProfile => '租户配置文件';

  @override
  String get user => '用户';

  @override
  String get asset => '资产';

  @override
  String get deviceProfile => '设备配置文件';

  @override
  String get assetProfile => '资产配置文件';

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
  String get edge => '边缘';

  @override
  String get entityView => '实体视图';

  @override
  String get widgetsBundle => '组件包';

  @override
  String get widgetType => '组件类型';

  @override
  String get apiUsageState => 'API使用状态';

  @override
  String get tbResource => '资源';

  @override
  String get otaPackage => 'OTA包';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '队列';

  @override
  String get notificationTarget => '通知目标';

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
  String get schedulerEvent => '调度事件';

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
  String get actionTypeCredentialsUpdated => '凭证已更新';

  @override
  String get actionTypeAssignedToCustomer => '已分配给客户';

  @override
  String get actionTypeUnassignedFromCustomer => '已从客户取消分配';

  @override
  String get actionTypeActivated => '已激活';

  @override
  String get actionTypeSuspended => '已暂停';

  @override
  String get actionTypeCredentialsRead => '凭证已读取';

  @override
  String get actionTypeAttributesRead => '属性已读取';

  @override
  String get actionTypeRelationAddOrUpdate => '关系已更新';

  @override
  String get actionTypeRelationDeleted => '关系已删除';

  @override
  String get actionTypeRelationsDeleted => '所有关系已删除';

  @override
  String get actionTypeAlarmAck => '已确认';

  @override
  String get actionTypeAlarmClear => '已清除';

  @override
  String get actionTypeAlarmDelete => '告警已删除';

  @override
  String get actionTypeAlarmAssigned => '告警已分配';

  @override
  String get actionTypeAlarmUnassigned => '告警已取消分配';

  @override
  String get actionTypeLogin => '登录';

  @override
  String get actionTypeLogout => '登出';

  @override
  String get actionTypeLockout => '已锁定';

  @override
  String get actionTypeAssignedFromTenant => '从租户分配';

  @override
  String get actionTypeAssignedToTenant => '分配给租户';

  @override
  String get actionTypeProvisionSuccess => '设备已配置';

  @override
  String get actionTypeProvisionFailure => '设备配置失败';

  @override
  String get actionTypeTimeseriesUpdated => '遥测数据已更新';

  @override
  String get actionTypeTimeseriesDeleted => '遥测数据已删除';

  @override
  String get actionTypeAssignedToEdge => '已分配给边缘';

  @override
  String get actionTypeUnassignedFromEdge => '已从边缘取消分配';

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
  String get youDontHavePermissionsToPerformThisOperation => '您没有执行此操作的权限！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '您的权限似乎不足以完成此操作';

  @override
  String get isRequiredText => '是必填项。';

  @override
  String get no2faProvidersFound => '未找到双因素认证提供者';

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
    return '您确定吗？您将删除您的 $authority 账户。';
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
  String get selectCountry => '选择国家';

  @override
  String get hideHomeDashboardToolbar => '隐藏首页仪表板工具栏';

  @override
  String get phoneNumberHelperText => 'E.164格式的电话号码，例如 +1201550123';

  @override
  String get homeDashboard => '首页仪表板';

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
  String get totpSetupSuccessDescription => '下次登录时，您需要提供双因素认证码';

  @override
  String get smsSetupSuccessDescription => '下次登录时，您将需要输入发送到手机号码的安全码';

  @override
  String get emailSetupSuccessDescription => '下次登录时，您将需要输入发送到电子邮箱的安全码';

  @override
  String get backupCodeSetupSuccessDescription => '下次登录时，您可以使用备份码进行双因素认证';

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
    return '您确定要停用 $providerName 吗？';
  }

  @override
  String get yesDeactivate => '是的，停用';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '输入用于验证的电子邮箱。';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator => '输入用于验证的手机号码';

  @override
  String get sendCode => '发送验证码';

  @override
  String errorSendingCode(String error) {
    return '发送验证码错误：$error';
  }

  @override
  String get copy => '复制';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get enter6digitsKeyFromYourAppHere => '在此输入 6 位验证码';

  @override
  String digitsCode(int count) {
    return '$count位数验证码';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '将32位密钥复制到您的验证器应用或扫描下方二维码';

  @override
  String get applyChanges => '应用更改';

  @override
  String get discardChanges => '放弃更改';

  @override
  String get yesDiscard => '是的，放弃';

  @override
  String get thisActionCannotBeUndone => '此操作无法撤消';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '双因素认证保护您的账户免受未授权访问。您只需在登录时输入安全码。';

  @override
  String get calculatedField => '计算字段';

  @override
  String get apiKey => 'API 密钥';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get adminSettings => '管理员设置';

  @override
  String get job => '任务';

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
  String get phoneIsRequired => '手机号码是必填项';

  @override
  String get phoneIsInvalid => '手机号码无效';

  @override
  String get addVerificationMethod => '添加验证方式';

  @override
  String get imageSavedToGallery => '已保存到“图片库”';

  @override
  String get failedToSaveImage => '保存图片失败';

  @override
  String nSelected(int count) {
    return '已选择 $count 项';
  }

  @override
  String get selectAll => '全选已加载';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项操作失败',
      one: '1 项操作失败',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 条通知？',
      one: '删除 1 条通知？',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '将 $count 条通知标记为已读？',
      one: '将 1 条通知标记为已读？',
    );
    return '$_temp0';
  }

  @override
  String get openThisLinkTitle => '打开此链接？';

  @override
  String get linkOpensSignInPage => '此链接将打开此服务器的登录页面。你将从当前服务器退出登录。';

  @override
  String linkSignsInAs(Object email) {
    return '此链接将以 $email 身份登录此服务器。';
  }

  @override
  String get linkSignsIn => '此链接将登录此服务器。';

  @override
  String get serverConnectionNotSecure => '此服务器未使用安全连接。';

  @override
  String get linkToOtherServerNotAllowed => '此应用仅适用于其自己的服务器，无法打开此链接。';

  @override
  String get liveTrackingActive => '实时位置跟踪';

  @override
  String get liveTrackingPaused => '实时跟踪已暂停';

  @override
  String get liveTrackingFixes => '定位点';

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
  String get liveTrackingLastFix => '最近定位';

  @override
  String get liveTrackingLastError => '最近错误';

  @override
  String get liveTrackingErrorTargetNotFound =>
      '无法保存到该实体：它已不存在。跟踪仍在继续；请在仪表板动作中更新目标。';

  @override
  String get liveTrackingErrorNoConnection => '无法连接服务器。这些定位点未保存，恢复联网后将继续保存。';

  @override
  String get liveTrackingErrorUnauthorized => '您的会话已结束。请重新登录以继续保存位置。';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      '无法保存到该实体：您没有权限。跟踪仍在继续；请联系管理员授予访问权限。';

  @override
  String get liveTrackingErrorSaveFailed => '无法将此定位点保存到服务器。将在下一个定位点时重试。';

  @override
  String get liveTrackingErrorServicesDisabled => '此设备已关闭定位服务。';

  @override
  String get liveTrackingErrorPermissionDenied => '位置权限被拒绝。';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '位置权限已被永久拒绝。请在应用设置中开启。';

  @override
  String get liveTrackingErrorLocation => '无法获取定位。';

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
  String get askAdminToUpdateServer => '请联系服务器管理员更新服务器。';

  @override
  String get deviceClaimFailed => '无法认领设备，请重试。';

  @override
  String get deviceToClaimNotFound => '未找到设备，请联系设备提供商。';

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
  String get noAuthenticatorAppFound => '未找到身份验证器应用。请将密钥复制到您的应用中。';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider 已启用';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '您的管理员要求 $email 使用双重身份验证。';
  }

  @override
  String get recommended => '推荐';

  @override
  String get addBackupCodesHint => '也请添加备用码，以便在丢失手机时仍能登录。';

  @override
  String get totpSecretKey => '密钥';

  @override
  String get backupCodesDescription => '打印这些验证码，以便在需要登录账户时随时使用。每个备用验证码只能使用一次。';

  @override
  String get backupCodesWarning => '离开此页面后，这些验证码将无法再次显示。请使用以下选项安全保存。';

  @override
  String get downloadTxt => '下载（txt）';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class SZhTw extends SZh {
  SZhTw() : super('zh_TW');

  @override
  String get appTitle => 'Thingsboard';

  @override
  String get home => '首頁';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '設備',
      one: '設備',
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
  String get auditLogs => '審計日誌';

  @override
  String get logout => '登出';

  @override
  String get login => '登入';

  @override
  String get logoDefaultValue => 'Thingsboard Logo';

  @override
  String get loginToYourAccount => '登入您的帳號';

  @override
  String get email => '電子郵件';

  @override
  String get emailRequireText => '電子郵件為必填項目';

  @override
  String get emailInvalidText => '電子郵件格式無效';

  @override
  String get username => '使用者名稱';

  @override
  String get password => '密碼';

  @override
  String get passwordRequireText => '密碼為必填項目';

  @override
  String get passwordForgotText => '忘記密碼？';

  @override
  String get passwordReset => '重設密碼';

  @override
  String get passwordResetText => '輸入與帳號關聯的電子郵件，我們將發送密碼重設連結到您的電子郵件';

  @override
  String get requestPasswordReset => '請求重設密碼';

  @override
  String get passwordResetLinkSuccessfullySentNotification => '密碼重設連結發送成功！';

  @override
  String get emailVersificationSuccessfullySentNotification => '電子郵件驗證連結已成功傳送！';

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
  String get stateOrProvince => '州 / 省';

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
  String get alarmClearText => '您確定要清除警報嗎？';

  @override
  String get alarmAcknowledgeTitle => '確認警報';

  @override
  String get alarmAcknowledgeText => '您確定要確認警報嗎？';

  @override
  String get assetName => '資產名稱';

  @override
  String get type => '類型';

  @override
  String get label => '標籤';

  @override
  String get assignedToCustomer => '指派給客戶';

  @override
  String get auditLogDetails => '審計日誌詳情';

  @override
  String get customerDetails => '客戶詳情';

  @override
  String get assetDetails => '資產詳情';

  @override
  String get tenantDetails => '租戶詳情';

  @override
  String get entityType => '實體類型';

  @override
  String get actionData => '動作資料';

  @override
  String get failureDetails => '失敗詳情';

  @override
  String get allDevices => '所有設備';

  @override
  String get active => '啟用';

  @override
  String get inactive => '停用';

  @override
  String get systemAdministrator => '系統管理員';

  @override
  String get tenantAdministrator => '租戶管理員';

  @override
  String get customer => '客戶';

  @override
  String get changePassword => '修改密碼';

  @override
  String get currentPasswordRequireText => '目前密碼為必填項目';

  @override
  String get currentPassword => '目前密碼';

  @override
  String get newPasswordRequireText => '新密碼為必填項目';

  @override
  String get newPassword => '新密碼';

  @override
  String get newPassword2RequireText => '請再次輸入新密碼';

  @override
  String get newPassword2 => '確認新密碼';

  @override
  String get passwordErrorNotification => '輸入的密碼必須相同！';

  @override
  String get firstNameUpper => '名';

  @override
  String get lastNameUpper => '姓';

  @override
  String get profileSuccessNotification => '個人資料更新成功';

  @override
  String get passwordSuccessNotification => '密碼修改成功';

  @override
  String get notImplemented => '未實現！';

  @override
  String get listIsEmptyText => '列表目前為空';

  @override
  String get tryAgain => '再試一次';

  @override
  String get verifyYourIdentity => '驗證您的身分';

  @override
  String get continueText => '繼續';

  @override
  String get resendCode => '重新發送驗證碼';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time 秒',
      one: '1 秒',
    );
    return '在 $_temp0內重新發送驗證碼';
  }

  @override
  String get totpAuthDescription => '請輸入來自您身分驗證器應用程式的安全碼。';

  @override
  String smsAuthDescription(Object contact) {
    return '安全碼已發送到您的手機 $contact。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '安全碼已發送到您的電子郵件 $contact。';
  }

  @override
  String get backupCodeAuthDescription => '請輸入您的備份碼之一。';

  @override
  String get toptAuthPlaceholder => '驗證碼';

  @override
  String get smsAuthPlaceholder => '簡訊驗證碼';

  @override
  String get emailAuthPlaceholder => '電子郵件驗證碼';

  @override
  String get backupCodeAuthPlaceholder => '備份碼';

  @override
  String get verificationCodeIncorrect => '驗證碼不正確';

  @override
  String get verificationCodeManyRequest => '驗證碼請求過於頻繁';

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
  String get mfaProviderBackupCode => '備份碼';

  @override
  String get newUserText => '新使用者？';

  @override
  String get createAccount => '建立帳戶';

  @override
  String get emailVerification => '電子郵件驗證';

  @override
  String get emailVerificationSentText => '驗證電子郵件已發送到指定的電子郵件地址 ';

  @override
  String get emailVerificationInstructionsText =>
      '請按照電子郵件中的說明完成註冊程序。注意：如果您沒有看到電子郵件，請檢查您的「垃圾郵件」資料夾，或點選「重新發送」按鈕重新發送電子郵件。';

  @override
  String get resend => '重新發送';

  @override
  String get activatingAccount => '正在啟用帳戶...';

  @override
  String get accountActivated => '帳戶啟用成功！';

  @override
  String get emailVerified => '電子郵件驗證成功';

  @override
  String get activatingAccountText => '您的帳戶正在啟用中。\n請稍等...';

  @override
  String accountActivatedText(Object appTitle) {
    return '恭喜！\n您的 $appTitle 帳戶已啟用。\n現在您可以登入到您的 $appTitle 空間。';
  }

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get cancel => '取消';

  @override
  String get accept => '接受';

  @override
  String get termsOfUse => '使用條款';

  @override
  String get firstName => '名';

  @override
  String get firstNameRequireText => '名為必填項目';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓為必填項目';

  @override
  String get createPassword => '建立密碼';

  @override
  String get repeatPassword => '重複輸入密碼';

  @override
  String get imNotARobot => '我不是機器人';

  @override
  String get signUp => '註冊';

  @override
  String get alreadyHaveAnAccount => '已有帳戶？';

  @override
  String get signIn => '登入';

  @override
  String get inactiveUserAlreadyExists => '未啟用使用者已存在';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '已註冊但電子郵件未驗證的使用者。\n如果您希望重新發送驗證電子郵件，請點選「重新發送」按鈕。';

  @override
  String get assignee => '被指派人';

  @override
  String get alarmTypes => '警報類型';

  @override
  String get details => '詳情';

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
  String get viewDashboard => '查看儀表板';

  @override
  String get activity => '活動';

  @override
  String get addCommentMessage => '新增評論...';

  @override
  String get selectUser => '選擇使用者';

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
  String get deleteComment => '刪除評論';

  @override
  String get areYouSure => '您確定嗎？';

  @override
  String get noResultsFound => '未找到結果';

  @override
  String get tryRefiningYourQuery => '請嘗試優化您的查詢';

  @override
  String get failedToLoadTheList => '載入清單失敗';

  @override
  String get tryRefreshing => '請嘗試重新整理';

  @override
  String get refresh => '重新整理';

  @override
  String get users => '使用者';

  @override
  String get unassigned => '未指派';

  @override
  String get failedToLoadAlarmDetails => '載入警報詳情失敗';

  @override
  String get somethingWentWrong => '發生問題';

  @override
  String get chooseRegion => '選擇地區';

  @override
  String get selectRegion => '選擇地區';

  @override
  String get northAmerica => '北美洲';

  @override
  String get europe => '歐洲';

  @override
  String get northAmericaRegionShort => '北維吉尼亞';

  @override
  String get europeRegionShort => '法蘭克福';

  @override
  String get deviceList => '設備清單';

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
    return '要繼續設定您的設備 $deviceName，請提供您網路的認證資料。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '輸入 $network 的密碼';
  }

  @override
  String get deviceNotFoundMessage => '未找到設備。請確保您手機的藍牙已開啟且在新設備的訊號範圍內。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '您沒有足夠的「$permissions」權限以繼續。請授予所需權限並點選「再試一次」。';
  }

  @override
  String get sendingWifiCredentials => '發送 Wi-Fi 認證資料';

  @override
  String get confirmingWifiConnection => '確認 Wi-Fi 連線';

  @override
  String get provisionedSuccessfully => '設備配置成功';

  @override
  String get returnToDashboard => '返回儀表板';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '無法與設備 $deviceName 建立連線。請重試';
  }

  @override
  String get claimingDevice => '宣告設備';

  @override
  String get claimingDeviceDone => '設備宣告完成';

  @override
  String get claimingMessageSuccess => '設備\n宣告成功';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '您沒有足夠的「$permissions」權限以繼續。請開啟應用程式設定，授予權限並點選「再試一次」。';
  }

  @override
  String get scanACode => '掃描代碼';

  @override
  String get allowAccess => '允許存取';

  @override
  String get toggleCamera => '切換攝影機';

  @override
  String get toggleFlash => '切換閃光燈';

  @override
  String get unableToUseCamera => '無法使用攝影機';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      '開啟設定並授予攝影機存取權限以繼續';

  @override
  String get notFound => '未找到';

  @override
  String routeNotDefined(Object name) {
    return '路由未定義：$name';
  }

  @override
  String get loginWith => '登入方式';

  @override
  String get scanQrCode => '掃描QR碼';

  @override
  String get anEmptyRequestDataReceived => '收到空的請求資料。';

  @override
  String get somethingWentWrongRollback => '發生問題... 回復';

  @override
  String get searchResults => '搜尋結果';

  @override
  String get viewAll => '查看全部';

  @override
  String get requestedEntityDoesNotExists => '請求的實體不存在。';

  @override
  String get noAlarmsFound => '未找到警報';

  @override
  String get filters => '篩選器';

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
      one: '搜尋使用者',
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
  String get anyType => '任何類型';

  @override
  String get plusAlarmType => '+ 警報類型';

  @override
  String get all => '全部';

  @override
  String get unread => '未讀';

  @override
  String get close => '關閉';

  @override
  String get codeVerificationFailed => '驗證碼驗證失敗！';

  @override
  String get fatalError => '致命錯誤';

  @override
  String get unknownError => '未知錯誤。';

  @override
  String get sessionExpired => '工作階段已過期';

  @override
  String get fatalApplicationErrorOccurred => '發生致命應用程式錯誤：';

  @override
  String get connectionError => '連線錯誤';

  @override
  String get failedToConnectToServer => '無法連線至伺服器';

  @override
  String get retry => '重試';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '需要在設備設定檔中設定行動儀表板！';

  @override
  String get openWifiSettings => '開啟 Wi-Fi 設定';

  @override
  String get connectToTheWifiYouUsuallyUse => '連線到您常用的 Wi-Fi';

  @override
  String get returnToTheAppAndTapReadyButton => '返回應用程式並點選準備好按鈕';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '請按照以下步驟重新將\n您的手機連線到常用 Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      '推播通知未設定。\n請聯繫您的系統管理員。';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase 未設定。\n請參考官方 Firebase 文件\n了解如何設定。';

  @override
  String get markAllAsRead => '全部標記為已讀';

  @override
  String get profile => '個人資料';

  @override
  String cantLaunchUrlLink(String link) {
    return '無法開啟連結：$link';
  }

  @override
  String get noDashboardsFound => '未找到儀表板';

  @override
  String get openAppSettings => '開啟應用程式設定';

  @override
  String get connectingToDevice => '正在連線設備';

  @override
  String get connectToDevice => '連線設備';

  @override
  String get selectWifiNetwork => '選擇 Wi-Fi 網路';

  @override
  String get deviceProvisioning => '設備設定';

  @override
  String get permissions => '權限';

  @override
  String get unableConnectToDevice => '無法連線到設備';

  @override
  String get deviceNotAbleToFindWifiNearby => '設備無法找到附近的 Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '連線 Wi-Fi 網路 $name 失敗。\n請確保您的手機已連線到設備的 Wi-Fi 網路，並且已在設備設定中為此應用程式啟用本地網路存取。';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '無法連線 Wi-Fi，因為設備 $name 未找到網路';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      '請按照以下步驟將您的手機連線到設備';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '連線到類似 $wifiName 的 Wi-Fi';
  }

  @override
  String get ready => '準備好';

  @override
  String get exitDeviceProvisioning => '退出設備設定';

  @override
  String get noNotificationsFound => '未找到通知';

  @override
  String get markAsRead => '標記為已讀';

  @override
  String get url => '連結';

  @override
  String get pleaseScanQrCodeOnYourDevice => '請掃描您設備上的 QR 碼';

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
  String get deviceProfile => '設備設定檔';

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
  String get edge => '邊緣';

  @override
  String get entityView => '實體視圖';

  @override
  String get widgetsBundle => '元件包';

  @override
  String get widgetType => '元件類型';

  @override
  String get apiUsageState => 'API使用狀態';

  @override
  String get tbResource => '資源';

  @override
  String get otaPackage => 'OTA套件';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '佇列';

  @override
  String get notificationTarget => '通知目標';

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
  String get actionTypeCredentialsUpdated => '認證資料已更新';

  @override
  String get actionTypeAssignedToCustomer => '已指派給客戶';

  @override
  String get actionTypeUnassignedFromCustomer => '已取消指派客戶';

  @override
  String get actionTypeActivated => '已啟用';

  @override
  String get actionTypeSuspended => '已暫停';

  @override
  String get actionTypeCredentialsRead => '認證資料已讀取';

  @override
  String get actionTypeAttributesRead => '屬性已讀取';

  @override
  String get actionTypeRelationAddOrUpdate => '關係已更新';

  @override
  String get actionTypeRelationDeleted => '關係已刪除';

  @override
  String get actionTypeRelationsDeleted => '所有關係已刪除';

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
  String get actionTypeLockout => '已鎖定';

  @override
  String get actionTypeAssignedFromTenant => '從租戶指派';

  @override
  String get actionTypeAssignedToTenant => '指派給租戶';

  @override
  String get actionTypeProvisionSuccess => '設備已設定';

  @override
  String get actionTypeProvisionFailure => '設備設定失敗';

  @override
  String get actionTypeTimeseriesUpdated => '遙測資料已更新';

  @override
  String get actionTypeTimeseriesDeleted => '遙測資料已刪除';

  @override
  String get actionTypeAssignedToEdge => '已指派給邊緣';

  @override
  String get actionTypeUnassignedFromEdge => '已從邊緣取消指派';

  @override
  String get actionTypeAddedComment => '已新增評論';

  @override
  String get actionTypeUpdatedComment => '已更新評論';

  @override
  String get actionTypeDeletedComment => '已刪除評論';

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
  String get actionTypeChangeOwner => '擁有者已變更';

  @override
  String get youDontHavePermissionsToPerformThisOperation => '您沒有執行此操作的權限！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '您的權限似乎不足以完成此操作';

  @override
  String get isRequiredText => '為必填項目。';

  @override
  String get no2faProvidersFound => '未找到雙因素驗證提供者';

  @override
  String get pleaseContactYourSystemAdministrator => '請聯繫您的系統管理員';

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
    return '您確定嗎？您將刪除您的 $authority 帳戶。';
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
  String get selectCountry => '選擇國家';

  @override
  String get hideHomeDashboardToolbar => '隱藏首頁儀表板工具列';

  @override
  String get phoneNumberHelperText => 'E.164格式的電話號碼，例如 +1201550123';

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
  String get setUpAVerificationMethodToContinueWithYourLogin => '設定驗證方式以繼續登入';

  @override
  String get setUpAVerificationMethod => '設定驗證方式';

  @override
  String get totpSetupSuccessDescription => '下次登入時，您需要提供雙因素驗證碼';

  @override
  String get smsSetupSuccessDescription => '下次登入時，您將需要輸入傳送到手機號碼的安全碼';

  @override
  String get emailSetupSuccessDescription => '下次登入時，您將需要輸入傳送到電子郵件的安全碼';

  @override
  String get backupCodeSetupSuccessDescription => '下次登入時，您可以使用備份碼進行雙因素驗證';

  @override
  String get loginToApp => '登入應用程式';

  @override
  String get goBack => '返回';

  @override
  String get done => '完成';

  @override
  String get thisWillMakeYourAccountLessSecure => '這將降低您帳戶的安全性';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '您確定要停用 $providerName 嗎？';
  }

  @override
  String get yesDeactivate => '是的，停用';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '輸入用於驗證的電子郵件。';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator => '輸入用於驗證的手機號碼';

  @override
  String get sendCode => '傳送驗證碼';

  @override
  String errorSendingCode(String error) {
    return '傳送驗證碼錯誤：$error';
  }

  @override
  String get copy => '複製';

  @override
  String get copiedToClipboard => '已複製到剪貼簿';

  @override
  String get enter6digitsKeyFromYourAppHere => '在此輸入 6 位驗證碼';

  @override
  String digitsCode(int count) {
    return '$count位數驗證碼';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '將32位金鑰複製到您的驗證器應用程式或掃描下方 QR 碼';

  @override
  String get applyChanges => '套用變更';

  @override
  String get discardChanges => '捨棄變更';

  @override
  String get yesDiscard => '是的，捨棄';

  @override
  String get thisActionCannotBeUndone => '此操作無法復原';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '雙因素驗證保護您的帳戶免受未經授權的存取。您只需在登入時輸入安全碼。';

  @override
  String get calculatedField => '計算欄位';

  @override
  String get apiKey => 'API 金鑰';

  @override
  String get aiModel => 'AI 模型';

  @override
  String get adminSettings => '管理員設定';

  @override
  String get job => '工作';

  @override
  String get mobileAppBundle => '行動應用程式套件';

  @override
  String get mobileApp => '行動應用程式';

  @override
  String get domain => '網域';

  @override
  String get oauth2Client => 'OAuth2 用戶端';

  @override
  String get queueStats => '佇列統計';

  @override
  String get phoneIsRequired => '手機號碼為必填項目';

  @override
  String get phoneIsInvalid => '手機號碼無效';

  @override
  String get addVerificationMethod => '新增驗證方式';

  @override
  String get imageSavedToGallery => '已儲存至「圖片庫」';

  @override
  String get failedToSaveImage => '儲存圖片失敗';

  @override
  String nSelected(int count) {
    return '已選擇 $count 項';
  }

  @override
  String get selectAll => '全選已載入';

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
      other: '刪除 $count 則通知？',
      one: '刪除 1 則通知？',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '將 $count 則通知標記為已讀？',
      one: '將 1 則通知標記為已讀？',
    );
    return '$_temp0';
  }

  @override
  String get openThisLinkTitle => '開啟此連結？';

  @override
  String get linkOpensSignInPage => '此連結將開啟此伺服器的登入頁面。你將從目前的伺服器登出。';

  @override
  String linkSignsInAs(Object email) {
    return '此連結將以 $email 身分登入此伺服器。';
  }

  @override
  String get linkSignsIn => '此連結將登入此伺服器。';

  @override
  String get serverConnectionNotSecure => '此伺服器未使用安全連線。';

  @override
  String get linkToOtherServerNotAllowed => '此應用程式僅適用於其自己的伺服器，無法開啟此連結。';

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
  String get liveTrackingTarget => '將位置儲存到實體';

  @override
  String get liveTrackingDashboard => '儀表板';

  @override
  String get liveTrackingStatus => '狀態';

  @override
  String get liveTrackingStarted => '開始時間';

  @override
  String get liveTrackingLastFix => '最近定位';

  @override
  String get liveTrackingLastError => '最近錯誤';

  @override
  String get liveTrackingErrorTargetNotFound =>
      '無法儲存到此實體：它已不存在。追蹤仍在繼續；請在儀表板動作中更新目標。';

  @override
  String get liveTrackingErrorNoConnection => '無法連線至伺服器。這些定位點未儲存，恢復連線後將繼續儲存。';

  @override
  String get liveTrackingErrorUnauthorized => '您的工作階段已結束。請重新登入以繼續儲存位置。';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      '無法儲存到此實體：您沒有權限。追蹤仍在繼續；請聯絡管理員授予存取權限。';

  @override
  String get liveTrackingErrorSaveFailed => '無法將此定位點儲存到伺服器。將在下一個定位點時重試。';

  @override
  String get liveTrackingErrorServicesDisabled => '此裝置已關閉定位服務。';

  @override
  String get liveTrackingErrorPermissionDenied => '位置權限遭到拒絕。';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '位置權限已被永久拒絕。請在應用程式設定中開啟。';

  @override
  String get liveTrackingErrorLocation => '無法取得定位。';

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
  String get liveTrackingEndReasonManual => '手動停止';

  @override
  String get liveTrackingEndReasonMaxDuration => '已達最長時間';

  @override
  String get liveTrackingEndReasonInterrupted => '已中斷';

  @override
  String get serverUpdateRequired => '需要更新伺服器';

  @override
  String get backToLogin => '返回登入';

  @override
  String serverRequiresVersion(String minVersion) {
    return '此應用程式需要 ThingsBoard $minVersion 或更新版本。';
  }

  @override
  String get serverLabel => '伺服器';

  @override
  String get versionLabel => '版本';

  @override
  String get askAdminToUpdateServer => '請聯絡伺服器管理員更新伺服器。';

  @override
  String get deviceClaimFailed => '無法認領裝置，請再試一次。';

  @override
  String get deviceToClaimNotFound => '找不到裝置，請聯絡裝置供應商。';

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
  String get noAuthenticatorAppFound => '找不到驗證器應用程式。請將金鑰複製到您的應用程式中。';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider 已啟用';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '您的管理員要求 $email 使用雙重驗證。';
  }

  @override
  String get recommended => '建議';

  @override
  String get addBackupCodesHint => '也請新增備用碼，以便在遺失手機時仍能登入。';

  @override
  String get totpSecretKey => '金鑰';

  @override
  String get backupCodesDescription => '請列印這些驗證碼，以便在需要登入帳戶時使用。每個備用驗證碼只能使用一次。';

  @override
  String get backupCodesWarning => '離開此頁面後，這些驗證碼將無法再次顯示。請使用以下選項安全儲存。';

  @override
  String get downloadTxt => '下載（txt）';
}

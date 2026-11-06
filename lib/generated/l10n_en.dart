// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Home';

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
  String get more => 'More';

  @override
  String get customers => 'Customers';

  @override
  String get assets => 'Assets';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Audit Logs';

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
  String get logout => 'Log Out';

  @override
  String get login => 'Log In';

  @override
  String get logoDefaultValue => 'ThingsBoard Logo';

  @override
  String get loginToYourAccount => 'Login to your account';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'Email is required.';

  @override
  String get emailInvalidText => 'Invalid email format.';

  @override
  String get username => 'username';

  @override
  String get password => 'Password';

  @override
  String get passwordRequireText => 'Password is required.';

  @override
  String get passwordForgotText => 'Forgot Password?';

  @override
  String get passwordReset => 'Reset password';

  @override
  String get passwordResetText =>
      'Enter the email associated with your account and we\'ll send an email with password reset link';

  @override
  String get requestPasswordReset => 'Request password reset';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Password reset link was successfully sent!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Email verification link was successfully sent!';

  @override
  String get or => 'OR';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get title => 'Title';

  @override
  String get country => 'Country';

  @override
  String get city => 'City';

  @override
  String get stateOrProvince => 'State / Province';

  @override
  String get postalCode => 'Zip / Postal Code';

  @override
  String get address => 'Address';

  @override
  String get address2 => 'Address 2';

  @override
  String get phone => 'Phone';

  @override
  String get alarmClearTitle => 'Clear Alarm';

  @override
  String get alarmClearText => 'Are you sure you want to clear Alarm?';

  @override
  String get alarmAcknowledgeTitle => 'Acknowledge Alarm';

  @override
  String get alarmAcknowledgeText =>
      'Are you sure you want to acknowledge Alarm?';

  @override
  String get assetName => 'Asset name';

  @override
  String get type => 'Type';

  @override
  String get label => 'Label';

  @override
  String get assignedToCustomer => 'Assigned to customer';

  @override
  String get auditLogDetails => 'Audit log details';

  @override
  String get entityType => 'Entity Type';

  @override
  String get actionData => 'Action data';

  @override
  String get failureDetails => 'Failure details';

  @override
  String get allDevices => 'All devices';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get systemAdministrator => 'System Administrator';

  @override
  String get tenantAdministrator => 'Tenant Administrator';

  @override
  String get customer => 'Customer';

  @override
  String get changePassword => 'Change Password';

  @override
  String get currentPasswordRequireText => 'Current password is required.';

  @override
  String get currentPassword => 'Current password';

  @override
  String get newPasswordRequireText => 'New password is required.';

  @override
  String get newPassword => 'New password';

  @override
  String get newPassword2RequireText => 'New password again is required.';

  @override
  String get newPassword2 => 'Confirm new password';

  @override
  String get passwordErrorNotification => 'Entered passwords must be same!';

  @override
  String get firstNameUpper => 'First Name';

  @override
  String get lastNameUpper => 'Last Name';

  @override
  String get profileSuccessNotification => 'Profile successfully updated';

  @override
  String get passwordSuccessNotification => 'Password successfully changed';

  @override
  String get notImplemented => 'Not implemented!';

  @override
  String get listIsEmptyText => 'The list is currently empty.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get verifyYourIdentity => 'Verify your identity';

  @override
  String get continueText => 'Continue';

  @override
  String get resendCode => 'Resend code';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time seconds',
      one: '1 second',
    );
    return 'Resend code in $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Please enter the security code from your authenticator app.';

  @override
  String smsAuthDescription(Object contact) {
    return 'A security code has been sent to your phone at $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'A security code has been sent to your email address at $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Please enter one of your backup codes.';

  @override
  String get verificationCodeInvalid => 'Invalid verification code format';

  @override
  String get toptAuthPlaceholder => 'Code';

  @override
  String get smsAuthPlaceholder => 'SMS code';

  @override
  String get emailAuthPlaceholder => 'Email code';

  @override
  String get backupCodeAuthPlaceholder => 'Backup code';

  @override
  String get verificationCodeIncorrect => 'Verification code is incorrect';

  @override
  String get verificationCodeManyRequest =>
      'Too many requests check verification code';

  @override
  String get tryAnotherWay => 'Try another way';

  @override
  String get selectWayToVerify => 'Select a way to verify';

  @override
  String get mfaProviderTopt => 'Authenticator app';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Backup code';

  @override
  String get newUserText => 'New User?';

  @override
  String get createAccount => 'Create Account';

  @override
  String get emailVerification => 'Email verification';

  @override
  String get emailVerificationSentText =>
      'An email with verification details was sent to the specified email address ';

  @override
  String get emailVerificationInstructionsText =>
      'Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven\'t seen the email for a while, please check your \'spam\' folder or try to resend email by clicking \'Resend\' button.';

  @override
  String get resend => 'Resend';

  @override
  String get activatingAccount => 'Activating account...';

  @override
  String get accountActivated => 'Account successfully activated!';

  @override
  String get emailVerified => 'Email verified';

  @override
  String get activatingAccountText =>
      'Your account is currently activating.\nPlease wait...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Congratulations!\nYour $appTitle account has been activated.\nNow you can login to your $appTitle space.';
  }

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get cancel => 'Cancel';

  @override
  String get accept => 'Accept';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get firstName => 'First name';

  @override
  String get firstNameRequireText => 'First name is required.';

  @override
  String get lastName => 'Last name';

  @override
  String get lastNameRequireText => 'Last name is required.';

  @override
  String get createPassword => 'Create a password';

  @override
  String get repeatPassword => 'Repeat your password';

  @override
  String get imNotARobot => 'I\'m not a robot';

  @override
  String get signUp => 'Sign up';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign In';

  @override
  String get invalidPasswordLengthMessage =>
      'Your password must be at least 6 characters long';

  @override
  String get confirmNotRobotMessage =>
      'You must confirm that you are not a robot';

  @override
  String get acceptPrivacyPolicyMessage => 'You must accept our Privacy Policy';

  @override
  String get acceptTermsOfUseMessage => 'You must accept our Terms of Use';

  @override
  String get inactiveUserAlreadyExists => 'Inactive user already exists';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email.';

  @override
  String get assignee => 'Assignee';

  @override
  String get alarmTypes => 'Alarm types';

  @override
  String get details => 'Details';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Severity';

  @override
  String get originator => 'Originator';

  @override
  String get startTime => 'Start time';

  @override
  String get duration => 'Duration';

  @override
  String get days => 'days';

  @override
  String get hours => 'hours';

  @override
  String get minutes => 'minutes';

  @override
  String get seconds => 'seconds';

  @override
  String get viewDashboard => 'View Dashboard';

  @override
  String get activity => 'Activity';

  @override
  String get addCommentMessage => 'Add a comment...';

  @override
  String get selectUser => 'Select users';

  @override
  String get assignedToMe => 'Assigned to me';

  @override
  String get clear => 'Clear';

  @override
  String get acknowledge => 'Acknowledge';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get edited => 'Edited';

  @override
  String get deleteComment => 'Delete comment';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get tryRefiningYourQuery => 'Please try refining your query';

  @override
  String get failedToLoadTheList => 'Failed to load the list';

  @override
  String get tryRefreshing => 'Please try refreshing';

  @override
  String get refresh => 'Refresh';

  @override
  String get users => 'Users';

  @override
  String get unassigned => 'Unassigned';

  @override
  String get failedToLoadAlarmDetails => 'Failed to load alarm details';

  @override
  String get somethingWentWrong => 'Something Went Wrong';

  @override
  String get chooseRegion => 'Choose region';

  @override
  String get selectRegion => 'Select region';

  @override
  String get northAmerica => 'North America';

  @override
  String get europe => 'Europe';

  @override
  String get northAmericaRegionShort => 'N. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Device list';

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
  String get updateRequired => 'Update required';

  @override
  String updateTo(Object version) {
    return 'Update to $version';
  }

  @override
  String popTitle(Object deviceName) {
    return 'Enter PIN of $deviceName to confirm proof of possession';
  }

  @override
  String get next => 'Next';

  @override
  String get confirmation => 'Confirmation';

  @override
  String get bleHelpMessage =>
      'To provision your new device, please make sure that your phone’s Bluetooth is turned on and within range of your new device';

  @override
  String get wifiPassword => 'Wi-Fi password';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'To continue setup of your device $deviceName, please provide your Network\'s credentials.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Enter password for $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'You don\'t have enough permissions for \"$permissions\" to proceed. Please grant the required permissions and tap \"Try Again\".';
  }

  @override
  String get sendingWifiCredentials => 'Sending Wi-Fi credentials';

  @override
  String get confirmingWifiConnection => 'Confirming Wi-Fi connection';

  @override
  String get provisionedSuccessfully =>
      'Device has been successfully provisioned';

  @override
  String get returnToDashboard => 'Return to dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Cannot establish session with device $deviceName. Please try again';
  }

  @override
  String get claimingDevice => 'Claiming device';

  @override
  String get claimingDeviceDone => 'Device claiming done';

  @override
  String get claimingMessageSuccess => 'Device has been\nsuccessfully claimed';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'You don\'t have enough permissions for \"$permissions\" to proceed. Please open app settings, grant permissions and trap \"Try Again\".';
  }

  @override
  String get scanACode => 'Scan a code';

  @override
  String get allowAccess => 'Allow access';

  @override
  String get toggleCamera => 'Toggle camera';

  @override
  String get toggleFlash => 'Toggle flash';

  @override
  String get unableToUseCamera => 'Unable to use camera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Open settings and grant access to camera to continue';

  @override
  String get notFound => 'Not Found';

  @override
  String routeNotDefined(Object name) {
    return 'Route not defined: $name';
  }

  @override
  String get loginWith => 'Login with';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get anEmptyRequestDataReceived => 'An empty request data received.';

  @override
  String get somethingWentWrongRollback => 'Something went wrong ... Rollback';

  @override
  String get searchResults => 'Search results';

  @override
  String get viewAll => 'View all';

  @override
  String get requestedEntityDoesNotExists =>
      'Requested entity does not exists.';

  @override
  String get noAlarmsFound => 'No alarms found';

  @override
  String get filters => 'Filters';

  @override
  String get alarmStatusList => 'Alarm status list';

  @override
  String get alarmSeverityList => 'Alarm severity list';

  @override
  String get cleared => 'Cleared';

  @override
  String get acknowledged => 'Acknowledged';

  @override
  String get unacknowledged => 'Unacknowledged';

  @override
  String get critical => 'Critical';

  @override
  String get major => 'Major';

  @override
  String get minor => 'Minor';

  @override
  String get warning => 'Warning';

  @override
  String get indeterminate => 'Indeterminate';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Search users',
      one: 'Search user',
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
  String get deviceProfile => 'Device profile';

  @override
  String get assetProfile => 'Asset profile';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarms',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Rule chain';

  @override
  String get ruleNode => 'Rule node';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entity view';

  @override
  String get widgetsBundle => 'Widgets bundle';

  @override
  String get widgetType => 'Widget type';

  @override
  String get apiUsageState => 'API Usage State';

  @override
  String get tbResource => 'Resource';

  @override
  String get otaPackage => 'OTA package';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Queue';

  @override
  String get notificationTarget => 'Notification target';

  @override
  String get notificationTemplate => 'Notification template';

  @override
  String get notificationRequest => 'Notification request';

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
  String get notificationRule => 'Notification rule';

  @override
  String get entityGroup => 'Entity Group';

  @override
  String get converter => 'Converter';

  @override
  String get integration => 'Integration';

  @override
  String get schedulerEvent => 'Scheduler Event';

  @override
  String get blobEntity => 'Blob Entity';

  @override
  String get role => 'Role';

  @override
  String get groupPermission => 'Group Permission';

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
  String get actionTypeAddedToEntityGroup => 'Added to Entity Group';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Removed from Entity Group';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST API Rule Engine Call';

  @override
  String get actionTypeMadePublic => 'Made Public';

  @override
  String get actionTypeMadePrivate => 'Made Private';

  @override
  String get actionTypeChangeOwner => 'Owner Changed';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'You don\'t have permissions to perform this operation!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'It looks like your permissions aren\'t sufficient to complete this operation';

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
  String get enter6digitsKeyFromYourAppHere =>
      'Enter 6-digits key from your app here:';

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
  String get cantDeleteUserAccount => 'Can\\\'t delete user account';

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
  String get imageSavedToGallery => 'Saved to platform \'Image gallery\'';

  @override
  String get failedToSaveImage => 'Failed to save image';

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
  String get serverUpdateRequired => 'Server update required';

  @override
  String get backToLogin => 'Back to login';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'This app works with ThingsBoard $minVersion or later.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Version';

  @override
  String get askAdminToUpdateServer =>
      'Ask your server administrator to update the server.';
}

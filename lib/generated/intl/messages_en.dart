// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(appTitle) =>
      "Congratulations!\nYour ${appTitle} account has been activated.\nNow you can login to your ${appTitle} space.";

  static String m1(count) =>
      "${Intl.plural(count, one: 'Alarm', other: 'Alarms')}";

  static String m2(deviceName) =>
      "Cannot establish session with device ${deviceName}. Please try again";

  static String m3(link) => "Can\'t launch url: ${link}";

  static String m4(wifiName) => "Connect to Wi-Fi similar to ${wifiName}";

  static String m5(name) =>
      "Connection to the ${name} Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.";

  static String m6(count) =>
      "${Intl.plural(count, one: 'Dashboard', other: 'Dashboards')}";

  static String m7(count) =>
      "${Intl.plural(count, one: 'Device', other: 'Devices')}";

  static String m8(contact) =>
      "A security code has been sent to your email address at ${contact}.";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Notification', other: 'Notifications')}";

  static String m10(permissions) =>
      "You don\'t have enough permissions for \"${permissions}\" to proceed. Please open app settings, grant permissions and trap \"Try Again\".";

  static String m11(permissions) =>
      "You don\'t have enough permissions for \"${permissions}\" to proceed. Please grant the required permissions and tap \"Try Again\".";

  static String m12(deviceName) =>
      "Enter PIN of ${deviceName} to confirm proof of possession";

  static String m13(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m14(name) => "Route not defined: ${name}";

  static String m15(count) =>
      "${Intl.plural(count, one: 'Search user', other: 'Search users')}";

  static String m16(contact) =>
      "A security code has been sent to your phone at ${contact}.";

  static String m17(name) =>
      "Unable connect to Wi-Fi because networks wasn\'t found by device ${name}";

  static String m18(version) => "Update to ${version}";

  static String m19(deviceName) =>
      "To continue setup of your device ${deviceName}, please provide your Network\'s credentials.";

  static String m20(network) => "Enter password for ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "You must accept our Privacy Policy",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "You must accept our Terms of Use",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Account successfully activated!",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Acknowledge"),
    "acknowledged": MessageLookupByLibrary.simpleMessage("Acknowledged"),
    "actionData": MessageLookupByLibrary.simpleMessage("Action data"),
    "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Failure"),
    "actionStatusSuccess": MessageLookupByLibrary.simpleMessage("Success"),
    "actionTypeActivated": MessageLookupByLibrary.simpleMessage("Activated"),
    "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Added"),
    "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
      "Added Comment",
    ),
    "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage("Acknowledged"),
    "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
      "Alarm Assigned",
    ),
    "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Cleared"),
    "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
      "Alarm Deleted",
    ),
    "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
      "Alarm Unassigned",
    ),
    "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
      "Assigned from Tenant",
    ),
    "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Assigned to Customer",
    ),
    "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
      "Assigned to Edge",
    ),
    "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
      "Assigned to Tenant",
    ),
    "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
      "Attributes Deleted",
    ),
    "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
      "Attributes read",
    ),
    "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Attributes Updated",
    ),
    "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
      "Credentials read",
    ),
    "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
      "Credentials Updated",
    ),
    "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Deleted"),
    "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
      "Deleted Comment",
    ),
    "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Lockout"),
    "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Login"),
    "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
      "Device provisioning was failed",
    ),
    "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
      "Device provisioned",
    ),
    "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
      "Relation updated",
    ),
    "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
      "Relation deleted",
    ),
    "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
      "All relation deleted",
    ),
    "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("RPC Call"),
    "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage("SMS Sent"),
    "actionTypeSuspended": MessageLookupByLibrary.simpleMessage("Suspended"),
    "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
      "Telemetry deleted",
    ),
    "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
      "Telemetry updated",
    ),
    "actionTypeUnassignedFromCustomer": MessageLookupByLibrary.simpleMessage(
      "Unassigned from Customer",
    ),
    "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
      "Unassigned from Edge",
    ),
    "actionTypeUpdated": MessageLookupByLibrary.simpleMessage("Updated"),
    "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
      "Updated Comment",
    ),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Activating account...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Your account is currently activating.\nPlease wait...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activity": MessageLookupByLibrary.simpleMessage("Activity"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Add a comment...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "address2": MessageLookupByLibrary.simpleMessage("Address 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to acknowledge Alarm?",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Acknowledge Alarm",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear Alarm?",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Clear Alarm"),
    "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
      "Alarm severity list",
    ),
    "alarmStatusList": MessageLookupByLibrary.simpleMessage(
      "Alarm status list",
    ),
    "alarmTypeList": MessageLookupByLibrary.simpleMessage("Alarm type list"),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarm types"),
    "alarms": m1,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allDevices": MessageLookupByLibrary.simpleMessage("All devices"),
    "allowAccess": MessageLookupByLibrary.simpleMessage("Allow access"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
      "An empty request data received.",
    ),
    "anyType": MessageLookupByLibrary.simpleMessage("Any type"),
    "apiUsageState": MessageLookupByLibrary.simpleMessage("API Usage State"),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assetName": MessageLookupByLibrary.simpleMessage("Asset name"),
    "assetProfile": MessageLookupByLibrary.simpleMessage("Asset profile"),
    "assets": MessageLookupByLibrary.simpleMessage("Assets"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Assigned to customer",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Assigned to me"),
    "assignee": MessageLookupByLibrary.simpleMessage("Assignee"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Audit log details",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage("Audit Logs"),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter one of your backup codes.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Backup code",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "To provision your new device, please make sure that your phone’s Bluetooth is turned on and within range of your new device",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cannotEstablishSession": m2,
    "cantLaunchUrlLink": m3,
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Choose region"),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("Claiming device"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Device claiming done",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Device has been\nsuccessfully claimed",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Clear"),
    "cleared": MessageLookupByLibrary.simpleMessage("Cleared"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
      "Code verification failed!",
    ),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "You must confirm that you are not a robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirming Wi-Fi connection",
    ),
    "connectToDevice": MessageLookupByLibrary.simpleMessage(
      "Connect to device",
    ),
    "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
      "Connect to the Wi-Fi you usually use",
    ),
    "connectToWifiSimilarToWifiname": m4,
    "connectingToDevice": MessageLookupByLibrary.simpleMessage(
      "Connecting to device",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Connection error"),
    "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m5,
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "createPassword": MessageLookupByLibrary.simpleMessage("Create a password"),
    "critical": MessageLookupByLibrary.simpleMessage("Critical"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current password"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Current password is required.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "dashboards": m6,
    "days": MessageLookupByLibrary.simpleMessage("days"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Delete comment"),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Device list"),
    "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
      "Device not able to find Wi-Fi nearby",
    ),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.",
    ),
    "deviceProfile": MessageLookupByLibrary.simpleMessage("Device profile"),
    "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Device provisioning",
    ),
    "devices": m7,
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "edge": MessageLookupByLibrary.simpleMessage("Edge"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "edited": MessageLookupByLibrary.simpleMessage("Edited"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m8,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Email code"),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Invalid email format.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "Email is required.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "Email verification",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven\'t seen the email for a while, please check your \'spam\' folder or try to resend email by clicking \'Resend\' button.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "An email with verification details was sent to the specified email address ",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage("Email verified"),
    "entityType": MessageLookupByLibrary.simpleMessage("Entity Type"),
    "entityView": MessageLookupByLibrary.simpleMessage("Entity view"),
    "europe": MessageLookupByLibrary.simpleMessage("Europe"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
      "Exit device provisioning",
    ),
    "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to server",
    ),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Failed to load alarm details",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Failed to load the list",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Failure details"),
    "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Fatal application error occurred:",
    ),
    "fatalError": MessageLookupByLibrary.simpleMessage("Fatal error"),
    "filters": MessageLookupByLibrary.simpleMessage("Filters"),
    "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
        MessageLookupByLibrary.simpleMessage(
          "Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.",
        ),
    "firstName": MessageLookupByLibrary.simpleMessage("First name"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "First name is required.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("First Name"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hours": MessageLookupByLibrary.simpleMessage("hours"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("I\'m not a robot"),
    "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Inactive user already exists",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email.",
    ),
    "indeterminate": MessageLookupByLibrary.simpleMessage("Indeterminate"),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Your password must be at least 6 characters long",
    ),
    "isRequiredText": MessageLookupByLibrary.simpleMessage("is required."),
    "label": MessageLookupByLibrary.simpleMessage("Label"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Last name is required.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Last Name"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "The list is currently empty.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Log In"),
    "loginNotification": MessageLookupByLibrary.simpleMessage(
      "Login to your account",
    ),
    "loginWith": MessageLookupByLibrary.simpleMessage("Login with"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "major": MessageLookupByLibrary.simpleMessage("Major"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Mark as read"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Backup code",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authenticator app",
    ),
    "minor": MessageLookupByLibrary.simpleMessage("Minor"),
    "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
    "mobileDashboardShouldBeConfiguredInDeviceProfile":
        MessageLookupByLibrary.simpleMessage(
          "Mobile dashboard should be configured in device profile!",
        ),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Confirm new password",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "New password again is required.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "New password is required.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("New User?"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noAlarmsFound": MessageLookupByLibrary.simpleMessage("No alarms found"),
    "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
      "No dashboards found",
    ),
    "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
      "No notifications found",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("No results found"),
    "northAmerica": MessageLookupByLibrary.simpleMessage("North America"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Not Found"),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Not implemented!"),
    "notificationRequest": MessageLookupByLibrary.simpleMessage(
      "Notification request",
    ),
    "notificationRule": MessageLookupByLibrary.simpleMessage(
      "Notification rule",
    ),
    "notificationTarget": MessageLookupByLibrary.simpleMessage(
      "Notification target",
    ),
    "notificationTemplate": MessageLookupByLibrary.simpleMessage(
      "Notification template",
    ),
    "notifications": m9,
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open app settings",
    ),
    "openAppSettingsToGrantPermissionMessage": m10,
    "openSettingsAndGrantAccessToCameraToContinue":
        MessageLookupByLibrary.simpleMessage(
          "Open settings and grant access to camera to continue",
        ),
    "openWifiSettings": MessageLookupByLibrary.simpleMessage(
      "Open Wi-Fi settings",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "originator": MessageLookupByLibrary.simpleMessage("Originator"),
    "otaPackage": MessageLookupByLibrary.simpleMessage("OTA package"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Entered passwords must be same!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Password is required.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage("Reset password"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Password reset link was successfully sent!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Enter the email associated with your account and we\'ll send an email with password reset link",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Password successfully changed",
    ),
    "permissions": MessageLookupByLibrary.simpleMessage("Permissions"),
    "permissionsNotEnoughMessage": m11,
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "pleaseFollowTheNextStepsToConnectYourPhoneTo":
        MessageLookupByLibrary.simpleMessage(
          "Please follow the next steps to connect your phone to device",
        ),
    "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
        MessageLookupByLibrary.simpleMessage(
          "Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi",
        ),
    "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
      "Please scan QR code on your device",
    ),
    "plusAlarmType": MessageLookupByLibrary.simpleMessage("+ Alarm type"),
    "popTitle": m12,
    "postalCode": MessageLookupByLibrary.simpleMessage("Zip / Postal Code"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profile successfully updated",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Device has been successfully provisioned",
    ),
    "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
        MessageLookupByLibrary.simpleMessage(
          "Push notifications are not configured.\nPlease contact your system administrator.",
        ),
    "queue": MessageLookupByLibrary.simpleMessage("Queue"),
    "ready": MessageLookupByLibrary.simpleMessage("Ready"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Repeat your password",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Request password reset",
    ),
    "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
      "Requested entity does not exists.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "resendCodeWait": m13,
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Return to dashboard",
    ),
    "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
      "Return to the app and tap Ready button",
    ),
    "routeNotDefined": m14,
    "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
    "ruleChain": MessageLookupByLibrary.simpleMessage("Rule chain"),
    "ruleNode": MessageLookupByLibrary.simpleMessage("Rule node"),
    "scanACode": MessageLookupByLibrary.simpleMessage("Scan a code"),
    "scanQrCode": MessageLookupByLibrary.simpleMessage("Scan QR code"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchResults": MessageLookupByLibrary.simpleMessage("Search results"),
    "searchUsers": m15,
    "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Select region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Select users"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Select a way to verify",
    ),
    "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
      "Select Wi-Fi network",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sending Wi-Fi credentials",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Severity"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "smsAuthDescription": m16,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS code"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something Went Wrong",
    ),
    "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
      "Something went wrong ... Rollback",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Start time"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("State / Province"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "System Administrator",
    ),
    "tbResource": MessageLookupByLibrary.simpleMessage("Resource"),
    "tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Tenant Administrator",
    ),
    "tenantProfile": MessageLookupByLibrary.simpleMessage("Tenant profile"),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "toggleCamera": MessageLookupByLibrary.simpleMessage("Toggle camera"),
    "toggleFlash": MessageLookupByLibrary.simpleMessage("Toggle flash"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Please enter the security code from your authenticator app.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage("Try another way"),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Please try refining your query",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Please try refreshing",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
      "Unable connect to device",
    ),
    "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m17,
    "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
      "Unable to use camera",
    ),
    "unacknowledged": MessageLookupByLibrary.simpleMessage("Unacknowledged"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Unassigned"),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error."),
    "unread": MessageLookupByLibrary.simpleMessage("Unread"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("Update required"),
    "updateTo": m18,
    "url": MessageLookupByLibrary.simpleMessage("Url"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "username": MessageLookupByLibrary.simpleMessage("username"),
    "users": MessageLookupByLibrary.simpleMessage("Users"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Verification code is incorrect",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Invalid verification code format",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Too many requests check verification code",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Verify your identity",
    ),
    "viewAll": MessageLookupByLibrary.simpleMessage("View all"),
    "viewDashboard": MessageLookupByLibrary.simpleMessage("View Dashboard"),
    "warning": MessageLookupByLibrary.simpleMessage("Warning"),
    "widgetType": MessageLookupByLibrary.simpleMessage("Widget type"),
    "widgetsBundle": MessageLookupByLibrary.simpleMessage("Widgets bundle"),
    "wifiHelpMessage": m19,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi password"),
    "wifiPasswordMessage": m20,
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
  };
}

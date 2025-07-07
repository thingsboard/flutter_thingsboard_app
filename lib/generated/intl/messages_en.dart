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

  static String m3(appTitle) =>
      "Congratulations!\nYour ${appTitle} account has been activated.\nNow you can login to your ${appTitle} space.";

  static String m4(deviceName) =>
      "Cannot establish session with device ${deviceName}. Please try again";

  static String m0(contact) =>
      "A security code has been sent to your email address at ${contact}.";

  static String m5(permissions) =>
      "You don\'t have enough permissions for \"${permissions}\" to proceed. Please open app settings, grant permissions and trap \"Try Again\".";

  static String m6(permissions) =>
      "You don\'t have enough permissions for \"${permissions}\" to proceed. Please grant the required permissions and tap \"Try Again\".";

  static String m7(deviceName) =>
      "Enter PIN of ${deviceName} to confirm proof of possession";

  static String m1(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m2(contact) =>
      "A security code has been sent to your phone at ${contact}.";

  static String m8(version) => "Update to ${version}";

  static String m9(deviceName) =>
      "To continue setup of your device ${deviceName}, please provide your Network\'s credentials.";

  static String m10(network) => "Enter password for ${network}";

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
    "accountActivatedText": m3,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Acknowledge"),
    "actionData": MessageLookupByLibrary.simpleMessage("Action data"),
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
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Alarm types"),
    "alarms": MessageLookupByLibrary.simpleMessage("Alarms"),
    "allDevices": MessageLookupByLibrary.simpleMessage("All devices"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "assetName": MessageLookupByLibrary.simpleMessage("Asset name"),
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
    "cannotEstablishSession": m4,
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
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "You must confirm that you are not a robot",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Confirming Wi-Fi connection",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "createPassword": MessageLookupByLibrary.simpleMessage("Create a password"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current password"),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Current password is required.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "dashboards": MessageLookupByLibrary.simpleMessage("Dashboards"),
    "days": MessageLookupByLibrary.simpleMessage("days"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Delete comment"),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Device list"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.",
    ),
    "devices": MessageLookupByLibrary.simpleMessage("Devices"),
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "edited": MessageLookupByLibrary.simpleMessage("Edited"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m0,
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
    "europe": MessageLookupByLibrary.simpleMessage("Europe"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Failed to load alarm details",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Failed to load the list",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage("Failure details"),
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
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Your password must be at least 6 characters long",
    ),
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
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "ThingsBoard Logo",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Backup code",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Authenticator app",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
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
    "noResultsFound": MessageLookupByLibrary.simpleMessage("No results found"),
    "northAmerica": MessageLookupByLibrary.simpleMessage("North America"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "N. Virginia",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage("Not implemented!"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "openAppSettingsToGrantPermissionMessage": m5,
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "originator": MessageLookupByLibrary.simpleMessage("Originator"),
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
    "permissionsNotEnoughMessage": m6,
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "popTitle": m7,
    "postalCode": MessageLookupByLibrary.simpleMessage("Zip / Postal Code"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Profile successfully updated",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Device has been successfully provisioned",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Repeat your password",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Request password reset",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "resendCodeWait": m1,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Return to dashboard",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Select region"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Select users"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Select a way to verify",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Sending Wi-Fi credentials",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Severity"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "smsAuthDescription": m2,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS code"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something Went Wrong",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Start time"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage("State / Province"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "System Administrator",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Tenant Administrator",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
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
    "unassigned": MessageLookupByLibrary.simpleMessage("Unassigned"),
    "updateRequired": MessageLookupByLibrary.simpleMessage("Update required"),
    "updateTo": m8,
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
    "viewDashboard": MessageLookupByLibrary.simpleMessage("View Dashboard"),
    "wifiHelpMessage": m9,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Wi-Fi password"),
    "wifiPasswordMessage": m10,
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
  };
}

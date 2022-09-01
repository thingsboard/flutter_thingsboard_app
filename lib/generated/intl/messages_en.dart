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

  static String m0(contact) =>
      "A security code has been sent to your email address at ${contact}.";

  static String m1(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m2(contact) =>
      "A security code has been sent to your phone at ${contact}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "No": MessageLookupByLibrary.simpleMessage("No"),
        "OR": MessageLookupByLibrary.simpleMessage("OR"),
        "Yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "actionData": MessageLookupByLibrary.simpleMessage("Action data"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "address2": MessageLookupByLibrary.simpleMessage("Address 2"),
        "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to acknowledge Alarm?"),
        "alarmAcknowledgeTitle":
            MessageLookupByLibrary.simpleMessage("Acknowledge Alarm"),
        "alarmClearText": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to clear Alarm?"),
        "alarmClearTitle": MessageLookupByLibrary.simpleMessage("Clear Alarm"),
        "alarms": MessageLookupByLibrary.simpleMessage("Alarms"),
        "allDevices": MessageLookupByLibrary.simpleMessage("All devices"),
        "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
        "assetName": MessageLookupByLibrary.simpleMessage("Asset name"),
        "assets": MessageLookupByLibrary.simpleMessage("Assets"),
        "assignedToCustomer":
            MessageLookupByLibrary.simpleMessage("Assigned to customer"),
        "auditLogDetails":
            MessageLookupByLibrary.simpleMessage("Audit log details"),
        "auditLogs": MessageLookupByLibrary.simpleMessage("Audit Logs"),
        "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
            "Please enter one of your backup codes."),
        "backupCodeAuthPlaceholder":
            MessageLookupByLibrary.simpleMessage("Backup code"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("currentPassword"),
        "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
            "Current password is required."),
        "currentPasswordStar":
            MessageLookupByLibrary.simpleMessage("Current password *"),
        "customer": MessageLookupByLibrary.simpleMessage("Customer"),
        "customers": MessageLookupByLibrary.simpleMessage("Customers"),
        "devices": MessageLookupByLibrary.simpleMessage("Devices"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAuthDescription": m0,
        "emailAuthPlaceholder":
            MessageLookupByLibrary.simpleMessage("Email code"),
        "emailInvalidText":
            MessageLookupByLibrary.simpleMessage("Invalid email format."),
        "emailRequireText":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "emailStar": MessageLookupByLibrary.simpleMessage("Email *"),
        "entityType": MessageLookupByLibrary.simpleMessage("Entity Type"),
        "failureDetails":
            MessageLookupByLibrary.simpleMessage("Failure details"),
        "firstName": MessageLookupByLibrary.simpleMessage("firstName"),
        "firstNameUpper": MessageLookupByLibrary.simpleMessage("First Name"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "label": MessageLookupByLibrary.simpleMessage("Label"),
        "lastName": MessageLookupByLibrary.simpleMessage("lastName"),
        "lastNameUpper": MessageLookupByLibrary.simpleMessage("Last Name"),
        "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
            "The list is currently empty."),
        "login": MessageLookupByLibrary.simpleMessage("Log In"),
        "loginNotification":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "logoDefaultValue":
            MessageLookupByLibrary.simpleMessage("ThingsBoard Logo"),
        "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
        "mfaProviderBackupCode":
            MessageLookupByLibrary.simpleMessage("Backup code"),
        "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
        "mfaProviderTopt":
            MessageLookupByLibrary.simpleMessage("Authenticator app"),
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "newPassword": MessageLookupByLibrary.simpleMessage("newPassword"),
        "newPassword2": MessageLookupByLibrary.simpleMessage("newPassword2"),
        "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
            "New password again is required."),
        "newPassword2Star":
            MessageLookupByLibrary.simpleMessage("New password again *"),
        "newPasswordRequireText":
            MessageLookupByLibrary.simpleMessage("New password is required."),
        "newPasswordStar":
            MessageLookupByLibrary.simpleMessage("New password *"),
        "notImplemented":
            MessageLookupByLibrary.simpleMessage("Not implemented!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
            "Entered passwords must be same!"),
        "passwordForgotText":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "passwordRequireText":
            MessageLookupByLibrary.simpleMessage("Password is required."),
        "passwordReset": MessageLookupByLibrary.simpleMessage("Reset password"),
        "passwordResetLinkSuccessfullySentNotification":
            MessageLookupByLibrary.simpleMessage(
                "Password reset link was successfully sent!"),
        "passwordResetText": MessageLookupByLibrary.simpleMessage(
            "Enter the email associated with your account and we\'ll send an email with password reset link"),
        "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
            "Password successfully changed"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "postalCode": MessageLookupByLibrary.simpleMessage("Zip / Postal Code"),
        "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
            "Profile successfully updated"),
        "requestPasswordReset":
            MessageLookupByLibrary.simpleMessage("Request password reset"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "resendCodeWait": m1,
        "selectWayToVerify":
            MessageLookupByLibrary.simpleMessage("Select a way to verify"),
        "smsAuthDescription": m2,
        "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS code"),
        "stateOrProvince":
            MessageLookupByLibrary.simpleMessage("State / Province"),
        "systemAdministrator":
            MessageLookupByLibrary.simpleMessage("System Administrator"),
        "tenantAdministrator":
            MessageLookupByLibrary.simpleMessage("Tenant Administrator"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Code"),
        "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
            "Please enter the security code from your authenticator app."),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "tryAnotherWay":
            MessageLookupByLibrary.simpleMessage("Try another way"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "username": MessageLookupByLibrary.simpleMessage("username"),
        "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
            "Verification code is incorrect"),
        "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
            "Invalid verification code format"),
        "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
            "Too many requests check verification code"),
        "verifyYourIdentity":
            MessageLookupByLibrary.simpleMessage("Verify your identity")
      };
}

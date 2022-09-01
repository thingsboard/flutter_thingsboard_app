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

  static String m1(contact) =>
      "A security code has been sent to your email address at ${contact}.";

  static String m2(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m3(contact) =>
      "A security code has been sent to your phone at ${contact}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "No": MessageLookupByLibrary.simpleMessage("No"),
        "OR": MessageLookupByLibrary.simpleMessage("OR"),
        "Yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
            "You must accept our Privacy Policy"),
        "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
            "You must accept our Terms of Use"),
        "accountActivated": MessageLookupByLibrary.simpleMessage(
            "Account successfully activated!"),
        "accountActivatedText": m0,
        "actionData": MessageLookupByLibrary.simpleMessage("Action data"),
        "activatingAccount":
            MessageLookupByLibrary.simpleMessage("Activating account..."),
        "activatingAccountText": MessageLookupByLibrary.simpleMessage(
            "Your account is currently activating.\nPlease wait..."),
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
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
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
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
            "You must confirm that you are not a robot"),
        "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "createPasswordStar":
            MessageLookupByLibrary.simpleMessage("Create a password *"),
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
        "emailAuthDescription": m1,
        "emailAuthPlaceholder":
            MessageLookupByLibrary.simpleMessage("Email code"),
        "emailInvalidText":
            MessageLookupByLibrary.simpleMessage("Invalid email format."),
        "emailRequireText":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "emailStar": MessageLookupByLibrary.simpleMessage("Email *"),
        "emailVerification":
            MessageLookupByLibrary.simpleMessage("Email verification"),
        "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
            "Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven\'t seen the email for a while, please check your \'spam\' folder or try to resend email by clicking \'Resend\' button."),
        "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
            "An email with verification details was sent to the specified email address "),
        "emailVerified": MessageLookupByLibrary.simpleMessage("Email verified"),
        "entityType": MessageLookupByLibrary.simpleMessage("Entity Type"),
        "failureDetails":
            MessageLookupByLibrary.simpleMessage("Failure details"),
        "firstName": MessageLookupByLibrary.simpleMessage("firstName"),
        "firstNameRequireText":
            MessageLookupByLibrary.simpleMessage("First name is required."),
        "firstNameStar": MessageLookupByLibrary.simpleMessage("First name *"),
        "firstNameUpper": MessageLookupByLibrary.simpleMessage("First Name"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "imNotARobot": MessageLookupByLibrary.simpleMessage("I\'m not a robot"),
        "inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Inactive user already exists"),
        "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
            "There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email."),
        "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
            "Your password must be at least 6 characters long"),
        "label": MessageLookupByLibrary.simpleMessage("Label"),
        "lastName": MessageLookupByLibrary.simpleMessage("lastName"),
        "lastNameRequireText":
            MessageLookupByLibrary.simpleMessage("Last name is required."),
        "lastNameStar": MessageLookupByLibrary.simpleMessage("Last name *"),
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
        "newUserText": MessageLookupByLibrary.simpleMessage("New User?"),
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
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
            "Profile successfully updated"),
        "repeatPasswordStar":
            MessageLookupByLibrary.simpleMessage("Repeat your password *"),
        "requestPasswordReset":
            MessageLookupByLibrary.simpleMessage("Request password reset"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
        "resendCodeWait": m2,
        "selectWayToVerify":
            MessageLookupByLibrary.simpleMessage("Select a way to verify"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "smsAuthDescription": m3,
        "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("SMS code"),
        "stateOrProvince":
            MessageLookupByLibrary.simpleMessage("State / Province"),
        "systemAdministrator":
            MessageLookupByLibrary.simpleMessage("System Administrator"),
        "tenantAdministrator":
            MessageLookupByLibrary.simpleMessage("Tenant Administrator"),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of Use"),
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

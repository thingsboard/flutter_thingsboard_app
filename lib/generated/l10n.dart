import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_da.dart';
import 'l10n_de.dart';
import 'l10n_el.dart';
import 'l10n_en.dart';
import 'l10n_es.dart';
import 'l10n_fr.dart';
import 'l10n_it.dart';
import 'l10n_nl.dart';
import 'l10n_no.dart';
import 'l10n_vi.dart';
import 'l10n_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('nl'),
    Locale('no'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ThingsBoard'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Device} other{Devices}}'**
  String devices(int count);

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @assets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get assets;

  /// No description provided for @tenants.
  ///
  /// In en, this message translates to:
  /// **'Tenants'**
  String get tenants;

  /// No description provided for @auditLogs.
  ///
  /// In en, this message translates to:
  /// **'Audit Logs'**
  String get auditLogs;

  /// No description provided for @noCustomersFound.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get noCustomersFound;

  /// No description provided for @noAssetsFound.
  ///
  /// In en, this message translates to:
  /// **'No assets found'**
  String get noAssetsFound;

  /// No description provided for @noTenantsFound.
  ///
  /// In en, this message translates to:
  /// **'No tenants found'**
  String get noTenantsFound;

  /// No description provided for @noDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get noDevicesFound;

  /// No description provided for @noAuditLogsFound.
  ///
  /// In en, this message translates to:
  /// **'No audit logs found'**
  String get noAuditLogsFound;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @logoDefaultValue.
  ///
  /// In en, this message translates to:
  /// **'ThingsBoard Logo'**
  String get logoDefaultValue;

  /// No description provided for @loginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginToYourAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequireText.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get emailRequireText;

  /// No description provided for @emailInvalidText.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format.'**
  String get emailInvalidText;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRequireText.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordRequireText;

  /// No description provided for @passwordForgotText.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get passwordForgotText;

  /// No description provided for @passwordReset.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get passwordReset;

  /// No description provided for @passwordResetText.
  ///
  /// In en, this message translates to:
  /// **'Enter the email associated with your account and we\'ll send an email with password reset link'**
  String get passwordResetText;

  /// No description provided for @requestPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Request password reset'**
  String get requestPasswordReset;

  /// No description provided for @passwordResetLinkSuccessfullySentNotification.
  ///
  /// In en, this message translates to:
  /// **'Password reset link was successfully sent!'**
  String get passwordResetLinkSuccessfullySentNotification;

  /// No description provided for @emailVersificationSuccessfullySentNotification.
  ///
  /// In en, this message translates to:
  /// **'Email verification link was successfully sent!'**
  String get emailVersificationSuccessfullySentNotification;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @stateOrProvince.
  ///
  /// In en, this message translates to:
  /// **'State / Province'**
  String get stateOrProvince;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Zip / Postal Code'**
  String get postalCode;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @address2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get address2;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @alarmClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Alarm'**
  String get alarmClearTitle;

  /// No description provided for @alarmClearText.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear Alarm?'**
  String get alarmClearText;

  /// No description provided for @alarmAcknowledgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge Alarm'**
  String get alarmAcknowledgeTitle;

  /// No description provided for @alarmAcknowledgeText.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to acknowledge Alarm?'**
  String get alarmAcknowledgeText;

  /// No description provided for @assetName.
  ///
  /// In en, this message translates to:
  /// **'Asset name'**
  String get assetName;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @assignedToCustomer.
  ///
  /// In en, this message translates to:
  /// **'Assigned to customer'**
  String get assignedToCustomer;

  /// No description provided for @auditLogDetails.
  ///
  /// In en, this message translates to:
  /// **'Audit log details'**
  String get auditLogDetails;

  /// No description provided for @entityType.
  ///
  /// In en, this message translates to:
  /// **'Entity Type'**
  String get entityType;

  /// No description provided for @actionData.
  ///
  /// In en, this message translates to:
  /// **'Action data'**
  String get actionData;

  /// No description provided for @failureDetails.
  ///
  /// In en, this message translates to:
  /// **'Failure details'**
  String get failureDetails;

  /// No description provided for @allDevices.
  ///
  /// In en, this message translates to:
  /// **'All devices'**
  String get allDevices;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @systemAdministrator.
  ///
  /// In en, this message translates to:
  /// **'System Administrator'**
  String get systemAdministrator;

  /// No description provided for @tenantAdministrator.
  ///
  /// In en, this message translates to:
  /// **'Tenant Administrator'**
  String get tenantAdministrator;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPasswordRequireText.
  ///
  /// In en, this message translates to:
  /// **'Current password is required.'**
  String get currentPasswordRequireText;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @newPasswordRequireText.
  ///
  /// In en, this message translates to:
  /// **'New password is required.'**
  String get newPasswordRequireText;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @newPassword2RequireText.
  ///
  /// In en, this message translates to:
  /// **'New password again is required.'**
  String get newPassword2RequireText;

  /// No description provided for @newPassword2.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get newPassword2;

  /// No description provided for @passwordErrorNotification.
  ///
  /// In en, this message translates to:
  /// **'Entered passwords must be same!'**
  String get passwordErrorNotification;

  /// No description provided for @firstNameUpper.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstNameUpper;

  /// No description provided for @lastNameUpper.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameUpper;

  /// No description provided for @profileSuccessNotification.
  ///
  /// In en, this message translates to:
  /// **'Profile successfully updated'**
  String get profileSuccessNotification;

  /// No description provided for @passwordSuccessNotification.
  ///
  /// In en, this message translates to:
  /// **'Password successfully changed'**
  String get passwordSuccessNotification;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented!'**
  String get notImplemented;

  /// No description provided for @listIsEmptyText.
  ///
  /// In en, this message translates to:
  /// **'The list is currently empty.'**
  String get listIsEmptyText;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @verifyYourIdentity.
  ///
  /// In en, this message translates to:
  /// **'Verify your identity'**
  String get verifyYourIdentity;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @resendCodeWait.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {time,plural, =1{1 second}other{{time} seconds}}'**
  String resendCodeWait(num time);

  /// No description provided for @totpAuthDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter the security code from your authenticator app.'**
  String get totpAuthDescription;

  /// No description provided for @smsAuthDescription.
  ///
  /// In en, this message translates to:
  /// **'A security code has been sent to your phone at {contact}.'**
  String smsAuthDescription(Object contact);

  /// No description provided for @emailAuthDescription.
  ///
  /// In en, this message translates to:
  /// **'A security code has been sent to your email address at {contact}.'**
  String emailAuthDescription(Object contact);

  /// No description provided for @backupCodeAuthDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter one of your backup codes.'**
  String get backupCodeAuthDescription;

  /// No description provided for @verificationCodeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code format'**
  String get verificationCodeInvalid;

  /// No description provided for @toptAuthPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get toptAuthPlaceholder;

  /// No description provided for @smsAuthPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'SMS code'**
  String get smsAuthPlaceholder;

  /// No description provided for @emailAuthPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Email code'**
  String get emailAuthPlaceholder;

  /// No description provided for @backupCodeAuthPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Backup code'**
  String get backupCodeAuthPlaceholder;

  /// No description provided for @verificationCodeIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Verification code is incorrect'**
  String get verificationCodeIncorrect;

  /// No description provided for @verificationCodeManyRequest.
  ///
  /// In en, this message translates to:
  /// **'Too many requests check verification code'**
  String get verificationCodeManyRequest;

  /// No description provided for @tryAnotherWay.
  ///
  /// In en, this message translates to:
  /// **'Try another way'**
  String get tryAnotherWay;

  /// No description provided for @selectWayToVerify.
  ///
  /// In en, this message translates to:
  /// **'Select a way to verify'**
  String get selectWayToVerify;

  /// No description provided for @mfaProviderTopt.
  ///
  /// In en, this message translates to:
  /// **'Authenticator app'**
  String get mfaProviderTopt;

  /// No description provided for @mfaProviderSms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get mfaProviderSms;

  /// No description provided for @mfaProviderEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mfaProviderEmail;

  /// No description provided for @mfaProviderBackupCode.
  ///
  /// In en, this message translates to:
  /// **'Backup code'**
  String get mfaProviderBackupCode;

  /// No description provided for @newUserText.
  ///
  /// In en, this message translates to:
  /// **'New User?'**
  String get newUserText;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email verification'**
  String get emailVerification;

  /// No description provided for @emailVerificationSentText.
  ///
  /// In en, this message translates to:
  /// **'An email with verification details was sent to the specified email address '**
  String get emailVerificationSentText;

  /// No description provided for @emailVerificationInstructionsText.
  ///
  /// In en, this message translates to:
  /// **'Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven\'t seen the email for a while, please check your \'spam\' folder or try to resend email by clicking \'Resend\' button.'**
  String get emailVerificationInstructionsText;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @activatingAccount.
  ///
  /// In en, this message translates to:
  /// **'Activating account...'**
  String get activatingAccount;

  /// No description provided for @accountActivated.
  ///
  /// In en, this message translates to:
  /// **'Account successfully activated!'**
  String get accountActivated;

  /// No description provided for @emailVerified.
  ///
  /// In en, this message translates to:
  /// **'Email verified'**
  String get emailVerified;

  /// No description provided for @activatingAccountText.
  ///
  /// In en, this message translates to:
  /// **'Your account is currently activating.\nPlease wait...'**
  String get activatingAccountText;

  /// No description provided for @accountActivatedText.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!\nYour {appTitle} account has been activated.\nNow you can login to your {appTitle} space.'**
  String accountActivatedText(Object appTitle);

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @firstNameRequireText.
  ///
  /// In en, this message translates to:
  /// **'First name is required.'**
  String get firstNameRequireText;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @lastNameRequireText.
  ///
  /// In en, this message translates to:
  /// **'Last name is required.'**
  String get lastNameRequireText;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createPassword;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat your password'**
  String get repeatPassword;

  /// No description provided for @imNotARobot.
  ///
  /// In en, this message translates to:
  /// **'I\'m not a robot'**
  String get imNotARobot;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @inactiveUserAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Inactive user already exists'**
  String get inactiveUserAlreadyExists;

  /// No description provided for @inactiveUserAlreadyExistsMessage.
  ///
  /// In en, this message translates to:
  /// **'There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email.'**
  String get inactiveUserAlreadyExistsMessage;

  /// No description provided for @assignee.
  ///
  /// In en, this message translates to:
  /// **'Assignee'**
  String get assignee;

  /// No description provided for @alarmTypes.
  ///
  /// In en, this message translates to:
  /// **'Alarm types'**
  String get alarmTypes;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @severity.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get severity;

  /// No description provided for @originator.
  ///
  /// In en, this message translates to:
  /// **'Originator'**
  String get originator;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get startTime;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @viewDashboard.
  ///
  /// In en, this message translates to:
  /// **'View Dashboard'**
  String get viewDashboard;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @addCommentMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a comment...'**
  String get addCommentMessage;

  /// No description provided for @selectUser.
  ///
  /// In en, this message translates to:
  /// **'Select users'**
  String get selectUser;

  /// No description provided for @assignedToMe.
  ///
  /// In en, this message translates to:
  /// **'Assigned to me'**
  String get assignedToMe;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @acknowledge.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get acknowledge;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edited.
  ///
  /// In en, this message translates to:
  /// **'Edited'**
  String get edited;

  /// No description provided for @deleteComment.
  ///
  /// In en, this message translates to:
  /// **'Delete comment'**
  String get deleteComment;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @tryRefiningYourQuery.
  ///
  /// In en, this message translates to:
  /// **'Please try refining your query'**
  String get tryRefiningYourQuery;

  /// No description provided for @failedToLoadTheList.
  ///
  /// In en, this message translates to:
  /// **'Failed to load the list'**
  String get failedToLoadTheList;

  /// No description provided for @tryRefreshing.
  ///
  /// In en, this message translates to:
  /// **'Please try refreshing'**
  String get tryRefreshing;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @unassigned.
  ///
  /// In en, this message translates to:
  /// **'Unassigned'**
  String get unassigned;

  /// No description provided for @failedToLoadAlarmDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to load alarm details'**
  String get failedToLoadAlarmDetails;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get somethingWentWrong;

  /// No description provided for @chooseRegion.
  ///
  /// In en, this message translates to:
  /// **'Choose region'**
  String get chooseRegion;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select region'**
  String get selectRegion;

  /// No description provided for @northAmerica.
  ///
  /// In en, this message translates to:
  /// **'North America'**
  String get northAmerica;

  /// No description provided for @europe.
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get europe;

  /// No description provided for @northAmericaRegionShort.
  ///
  /// In en, this message translates to:
  /// **'N. Virginia'**
  String get northAmericaRegionShort;

  /// No description provided for @europeRegionShort.
  ///
  /// In en, this message translates to:
  /// **'Frankfurt'**
  String get europeRegionShort;

  /// No description provided for @deviceList.
  ///
  /// In en, this message translates to:
  /// **'Device list'**
  String get deviceList;

  /// No description provided for @dashboards.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Dashboard} other{Dashboards}}'**
  String dashboards(int count);

  /// No description provided for @updateRequired.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get updateRequired;

  /// No description provided for @updateTo.
  ///
  /// In en, this message translates to:
  /// **'Update to {version}'**
  String updateTo(Object version);

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @wifiPassword.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi password'**
  String get wifiPassword;

  /// No description provided for @wifiHelpMessage.
  ///
  /// In en, this message translates to:
  /// **'To continue setup of your device {deviceName}, please provide your Network\'s credentials.'**
  String wifiHelpMessage(Object deviceName);

  /// No description provided for @wifiPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter password for {network}'**
  String wifiPasswordMessage(Object network);

  /// No description provided for @deviceNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.'**
  String get deviceNotFoundMessage;

  /// No description provided for @permissionsNotEnoughMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough permissions for \"{permissions}\" to proceed. Please grant the required permissions and tap \"Try Again\".'**
  String permissionsNotEnoughMessage(Object permissions);

  /// No description provided for @sendingWifiCredentials.
  ///
  /// In en, this message translates to:
  /// **'Sending Wi-Fi credentials'**
  String get sendingWifiCredentials;

  /// No description provided for @confirmingWifiConnection.
  ///
  /// In en, this message translates to:
  /// **'Confirming Wi-Fi connection'**
  String get confirmingWifiConnection;

  /// No description provided for @provisionedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Device has been successfully provisioned'**
  String get provisionedSuccessfully;

  /// No description provided for @returnToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Return to dashboard'**
  String get returnToDashboard;

  /// No description provided for @cannotEstablishSession.
  ///
  /// In en, this message translates to:
  /// **'Cannot establish session with device {deviceName}. Please try again'**
  String cannotEstablishSession(Object deviceName);

  /// No description provided for @claimingDevice.
  ///
  /// In en, this message translates to:
  /// **'Claiming device'**
  String get claimingDevice;

  /// No description provided for @claimingDeviceDone.
  ///
  /// In en, this message translates to:
  /// **'Device claiming done'**
  String get claimingDeviceDone;

  /// No description provided for @claimingMessageSuccess.
  ///
  /// In en, this message translates to:
  /// **'Device has been\nsuccessfully claimed'**
  String get claimingMessageSuccess;

  /// No description provided for @openAppSettingsToGrantPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough permissions for \"{permissions}\" to proceed. Please open app settings, grant permissions and trap \"Try Again\".'**
  String openAppSettingsToGrantPermissionMessage(Object permissions);

  /// No description provided for @scanACode.
  ///
  /// In en, this message translates to:
  /// **'Scan a code'**
  String get scanACode;

  /// No description provided for @allowAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get allowAccess;

  /// No description provided for @toggleCamera.
  ///
  /// In en, this message translates to:
  /// **'Toggle camera'**
  String get toggleCamera;

  /// No description provided for @toggleFlash.
  ///
  /// In en, this message translates to:
  /// **'Toggle flash'**
  String get toggleFlash;

  /// No description provided for @unableToUseCamera.
  ///
  /// In en, this message translates to:
  /// **'Unable to use camera'**
  String get unableToUseCamera;

  /// No description provided for @openSettingsAndGrantAccessToCameraToContinue.
  ///
  /// In en, this message translates to:
  /// **'Open settings and grant access to camera to continue'**
  String get openSettingsAndGrantAccessToCameraToContinue;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get notFound;

  /// No description provided for @routeNotDefined.
  ///
  /// In en, this message translates to:
  /// **'Route not defined: {name}'**
  String routeNotDefined(Object name);

  /// No description provided for @loginWith.
  ///
  /// In en, this message translates to:
  /// **'Login with'**
  String get loginWith;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get scanQrCode;

  /// No description provided for @anEmptyRequestDataReceived.
  ///
  /// In en, this message translates to:
  /// **'An empty request data received.'**
  String get anEmptyRequestDataReceived;

  /// No description provided for @somethingWentWrongRollback.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong ... Rollback'**
  String get somethingWentWrongRollback;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search results'**
  String get searchResults;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @requestedEntityDoesNotExists.
  ///
  /// In en, this message translates to:
  /// **'Requested entity does not exists.'**
  String get requestedEntityDoesNotExists;

  /// No description provided for @noAlarmsFound.
  ///
  /// In en, this message translates to:
  /// **'No alarms found'**
  String get noAlarmsFound;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @alarmStatusList.
  ///
  /// In en, this message translates to:
  /// **'Alarm status list'**
  String get alarmStatusList;

  /// No description provided for @alarmSeverityList.
  ///
  /// In en, this message translates to:
  /// **'Alarm severity list'**
  String get alarmSeverityList;

  /// No description provided for @cleared.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get cleared;

  /// No description provided for @acknowledged.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged'**
  String get acknowledged;

  /// No description provided for @unacknowledged.
  ///
  /// In en, this message translates to:
  /// **'Unacknowledged'**
  String get unacknowledged;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get critical;

  /// No description provided for @major.
  ///
  /// In en, this message translates to:
  /// **'Major'**
  String get major;

  /// No description provided for @minor.
  ///
  /// In en, this message translates to:
  /// **'Minor'**
  String get minor;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @indeterminate.
  ///
  /// In en, this message translates to:
  /// **'Indeterminate'**
  String get indeterminate;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Search user} other{Search users}}'**
  String searchUsers(int count);

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @alarmTypeList.
  ///
  /// In en, this message translates to:
  /// **'Alarm type list'**
  String get alarmTypeList;

  /// No description provided for @anyType.
  ///
  /// In en, this message translates to:
  /// **'Any type'**
  String get anyType;

  /// No description provided for @plusAlarmType.
  ///
  /// In en, this message translates to:
  /// **'+ Alarm type'**
  String get plusAlarmType;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @codeVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Code verification failed!'**
  String get codeVerificationFailed;

  /// No description provided for @fatalError.
  ///
  /// In en, this message translates to:
  /// **'Fatal error'**
  String get fatalError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get unknownError;

  /// No description provided for @fatalApplicationErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Fatal application error occurred:'**
  String get fatalApplicationErrorOccurred;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get connectionError;

  /// No description provided for @failedToConnectToServer.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to server'**
  String get failedToConnectToServer;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @mobileDashboardShouldBeConfiguredInDeviceProfile.
  ///
  /// In en, this message translates to:
  /// **'Mobile dashboard should be configured in device profile!'**
  String get mobileDashboardShouldBeConfiguredInDeviceProfile;

  /// No description provided for @openWifiSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Wi-Fi settings'**
  String get openWifiSettings;

  /// No description provided for @connectToTheWifiYouUsuallyUse.
  ///
  /// In en, this message translates to:
  /// **'Connect to the Wi-Fi you usually use'**
  String get connectToTheWifiYouUsuallyUse;

  /// No description provided for @returnToTheAppAndTapReadyButton.
  ///
  /// In en, this message translates to:
  /// **'Return to the app and tap Ready button'**
  String get returnToTheAppAndTapReadyButton;

  /// No description provided for @pleaseFollowTheNextStepsToReconnectnyourPhoneToYour.
  ///
  /// In en, this message translates to:
  /// **'Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi'**
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour;

  /// No description provided for @pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator.
  ///
  /// In en, this message translates to:
  /// **'Push notifications are not configured.\nPlease contact your system administrator.'**
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator;

  /// No description provided for @firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase.
  ///
  /// In en, this message translates to:
  /// **'Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.'**
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @cantLaunchUrlLink.
  ///
  /// In en, this message translates to:
  /// **'Can\'t launch url: {link}'**
  String cantLaunchUrlLink(String link);

  /// No description provided for @noDashboardsFound.
  ///
  /// In en, this message translates to:
  /// **'No dashboards found'**
  String get noDashboardsFound;

  /// No description provided for @openAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Open app settings'**
  String get openAppSettings;

  /// No description provided for @connectingToDevice.
  ///
  /// In en, this message translates to:
  /// **'Connecting to device'**
  String get connectingToDevice;

  /// No description provided for @connectToDevice.
  ///
  /// In en, this message translates to:
  /// **'Connect to device'**
  String get connectToDevice;

  /// No description provided for @selectWifiNetwork.
  ///
  /// In en, this message translates to:
  /// **'Select Wi-Fi network'**
  String get selectWifiNetwork;

  /// No description provided for @deviceProvisioning.
  ///
  /// In en, this message translates to:
  /// **'Device provisioning'**
  String get deviceProvisioning;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// No description provided for @unableConnectToDevice.
  ///
  /// In en, this message translates to:
  /// **'Unable connect to device'**
  String get unableConnectToDevice;

  /// No description provided for @deviceNotAbleToFindWifiNearby.
  ///
  /// In en, this message translates to:
  /// **'Device not able to find Wi-Fi nearby'**
  String get deviceNotAbleToFindWifiNearby;

  /// No description provided for @connectionToTheWifiNetworkFailednpleaseEnsureThatYour.
  ///
  /// In en, this message translates to:
  /// **'Connection to the {name} Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.'**
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name);

  /// No description provided for @unableConnectToWifiBecauseNetworksWasntFoundByDevice.
  ///
  /// In en, this message translates to:
  /// **'Unable connect to Wi-Fi because networks wasn\'t found by device {name}'**
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name);

  /// No description provided for @pleaseFollowTheNextStepsToConnectYourPhoneTo.
  ///
  /// In en, this message translates to:
  /// **'Please follow the next steps to connect your phone to device'**
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo;

  /// No description provided for @connectToWifiSimilarToWifiname.
  ///
  /// In en, this message translates to:
  /// **'Connect to Wi-Fi similar to {wifiName}'**
  String connectToWifiSimilarToWifiname(Object wifiName);

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @exitDeviceProvisioning.
  ///
  /// In en, this message translates to:
  /// **'Exit device provisioning'**
  String get exitDeviceProvisioning;

  /// No description provided for @noNotificationsFound.
  ///
  /// In en, this message translates to:
  /// **'No notifications found'**
  String get noNotificationsFound;

  /// No description provided for @markAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as read'**
  String get markAsRead;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'Url'**
  String get url;

  /// No description provided for @pleaseScanQrCodeOnYourDevice.
  ///
  /// In en, this message translates to:
  /// **'Please scan QR code on your device'**
  String get pleaseScanQrCodeOnYourDevice;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @tenant.
  ///
  /// In en, this message translates to:
  /// **'Tenant'**
  String get tenant;

  /// No description provided for @tenantProfile.
  ///
  /// In en, this message translates to:
  /// **'Tenant profile'**
  String get tenantProfile;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @asset.
  ///
  /// In en, this message translates to:
  /// **'Asset'**
  String get asset;

  /// No description provided for @deviceProfile.
  ///
  /// In en, this message translates to:
  /// **'Device profile'**
  String get deviceProfile;

  /// No description provided for @assetProfile.
  ///
  /// In en, this message translates to:
  /// **'Asset profile'**
  String get assetProfile;

  /// No description provided for @alarms.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Alarm} other{Alarms}}'**
  String alarms(int count);

  /// No description provided for @ruleChain.
  ///
  /// In en, this message translates to:
  /// **'Rule chain'**
  String get ruleChain;

  /// No description provided for @ruleNode.
  ///
  /// In en, this message translates to:
  /// **'Rule node'**
  String get ruleNode;

  /// No description provided for @edge.
  ///
  /// In en, this message translates to:
  /// **'Edge'**
  String get edge;

  /// No description provided for @entityView.
  ///
  /// In en, this message translates to:
  /// **'Entity view'**
  String get entityView;

  /// No description provided for @widgetsBundle.
  ///
  /// In en, this message translates to:
  /// **'Widgets bundle'**
  String get widgetsBundle;

  /// No description provided for @widgetType.
  ///
  /// In en, this message translates to:
  /// **'Widget type'**
  String get widgetType;

  /// No description provided for @apiUsageState.
  ///
  /// In en, this message translates to:
  /// **'API Usage State'**
  String get apiUsageState;

  /// No description provided for @tbResource.
  ///
  /// In en, this message translates to:
  /// **'Resource'**
  String get tbResource;

  /// No description provided for @otaPackage.
  ///
  /// In en, this message translates to:
  /// **'OTA package'**
  String get otaPackage;

  /// No description provided for @rpc.
  ///
  /// In en, this message translates to:
  /// **'RPC'**
  String get rpc;

  /// No description provided for @queue.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get queue;

  /// No description provided for @notificationTarget.
  ///
  /// In en, this message translates to:
  /// **'Notification target'**
  String get notificationTarget;

  /// No description provided for @notificationTemplate.
  ///
  /// In en, this message translates to:
  /// **'Notification template'**
  String get notificationTemplate;

  /// No description provided for @notificationRequest.
  ///
  /// In en, this message translates to:
  /// **'Notification request'**
  String get notificationRequest;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Notification} other{Notifications}}'**
  String notifications(int count);

  /// No description provided for @notificationRule.
  ///
  /// In en, this message translates to:
  /// **'Notification rule'**
  String get notificationRule;

  /// No description provided for @entityGroup.
  ///
  /// In en, this message translates to:
  /// **'Entity Group'**
  String get entityGroup;

  /// No description provided for @converter.
  ///
  /// In en, this message translates to:
  /// **'Converter'**
  String get converter;

  /// No description provided for @integration.
  ///
  /// In en, this message translates to:
  /// **'Integration'**
  String get integration;

  /// No description provided for @schedulerEvent.
  ///
  /// In en, this message translates to:
  /// **'Scheduler Event'**
  String get schedulerEvent;

  /// No description provided for @blobEntity.
  ///
  /// In en, this message translates to:
  /// **'Blob Entity'**
  String get blobEntity;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @groupPermission.
  ///
  /// In en, this message translates to:
  /// **'Group Permission'**
  String get groupPermission;

  /// No description provided for @actionStatusSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get actionStatusSuccess;

  /// No description provided for @actionStatusFailure.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get actionStatusFailure;

  /// No description provided for @actionTypeAdded.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get actionTypeAdded;

  /// No description provided for @actionTypeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get actionTypeDeleted;

  /// No description provided for @actionTypeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get actionTypeUpdated;

  /// No description provided for @actionTypeAttributesUpdated.
  ///
  /// In en, this message translates to:
  /// **'Attributes Updated'**
  String get actionTypeAttributesUpdated;

  /// No description provided for @actionTypeAttributesDeleted.
  ///
  /// In en, this message translates to:
  /// **'Attributes Deleted'**
  String get actionTypeAttributesDeleted;

  /// No description provided for @actionTypeRpcCall.
  ///
  /// In en, this message translates to:
  /// **'RPC Call'**
  String get actionTypeRpcCall;

  /// No description provided for @actionTypeCredentialsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Credentials Updated'**
  String get actionTypeCredentialsUpdated;

  /// No description provided for @actionTypeAssignedToCustomer.
  ///
  /// In en, this message translates to:
  /// **'Assigned to Customer'**
  String get actionTypeAssignedToCustomer;

  /// No description provided for @actionTypeUnassignedFromCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unassigned from Customer'**
  String get actionTypeUnassignedFromCustomer;

  /// No description provided for @actionTypeActivated.
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get actionTypeActivated;

  /// No description provided for @actionTypeSuspended.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get actionTypeSuspended;

  /// No description provided for @actionTypeCredentialsRead.
  ///
  /// In en, this message translates to:
  /// **'Credentials read'**
  String get actionTypeCredentialsRead;

  /// No description provided for @actionTypeAttributesRead.
  ///
  /// In en, this message translates to:
  /// **'Attributes read'**
  String get actionTypeAttributesRead;

  /// No description provided for @actionTypeRelationAddOrUpdate.
  ///
  /// In en, this message translates to:
  /// **'Relation updated'**
  String get actionTypeRelationAddOrUpdate;

  /// No description provided for @actionTypeRelationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Relation deleted'**
  String get actionTypeRelationDeleted;

  /// No description provided for @actionTypeRelationsDeleted.
  ///
  /// In en, this message translates to:
  /// **'All relation deleted'**
  String get actionTypeRelationsDeleted;

  /// No description provided for @actionTypeAlarmAck.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged'**
  String get actionTypeAlarmAck;

  /// No description provided for @actionTypeAlarmClear.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get actionTypeAlarmClear;

  /// No description provided for @actionTypeAlarmDelete.
  ///
  /// In en, this message translates to:
  /// **'Alarm Deleted'**
  String get actionTypeAlarmDelete;

  /// No description provided for @actionTypeAlarmAssigned.
  ///
  /// In en, this message translates to:
  /// **'Alarm Assigned'**
  String get actionTypeAlarmAssigned;

  /// No description provided for @actionTypeAlarmUnassigned.
  ///
  /// In en, this message translates to:
  /// **'Alarm Unassigned'**
  String get actionTypeAlarmUnassigned;

  /// No description provided for @actionTypeLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get actionTypeLogin;

  /// No description provided for @actionTypeLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get actionTypeLogout;

  /// No description provided for @actionTypeLockout.
  ///
  /// In en, this message translates to:
  /// **'Lockout'**
  String get actionTypeLockout;

  /// No description provided for @actionTypeAssignedFromTenant.
  ///
  /// In en, this message translates to:
  /// **'Assigned from Tenant'**
  String get actionTypeAssignedFromTenant;

  /// No description provided for @actionTypeAssignedToTenant.
  ///
  /// In en, this message translates to:
  /// **'Assigned to Tenant'**
  String get actionTypeAssignedToTenant;

  /// No description provided for @actionTypeProvisionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Device provisioned'**
  String get actionTypeProvisionSuccess;

  /// No description provided for @actionTypeProvisionFailure.
  ///
  /// In en, this message translates to:
  /// **'Device provisioning was failed'**
  String get actionTypeProvisionFailure;

  /// No description provided for @actionTypeTimeseriesUpdated.
  ///
  /// In en, this message translates to:
  /// **'Telemetry updated'**
  String get actionTypeTimeseriesUpdated;

  /// No description provided for @actionTypeTimeseriesDeleted.
  ///
  /// In en, this message translates to:
  /// **'Telemetry deleted'**
  String get actionTypeTimeseriesDeleted;

  /// No description provided for @actionTypeAssignedToEdge.
  ///
  /// In en, this message translates to:
  /// **'Assigned to Edge'**
  String get actionTypeAssignedToEdge;

  /// No description provided for @actionTypeUnassignedFromEdge.
  ///
  /// In en, this message translates to:
  /// **'Unassigned from Edge'**
  String get actionTypeUnassignedFromEdge;

  /// No description provided for @actionTypeAddedComment.
  ///
  /// In en, this message translates to:
  /// **'Added Comment'**
  String get actionTypeAddedComment;

  /// No description provided for @actionTypeUpdatedComment.
  ///
  /// In en, this message translates to:
  /// **'Updated Comment'**
  String get actionTypeUpdatedComment;

  /// No description provided for @actionTypeDeletedComment.
  ///
  /// In en, this message translates to:
  /// **'Deleted Comment'**
  String get actionTypeDeletedComment;

  /// No description provided for @actionTypeSmsSent.
  ///
  /// In en, this message translates to:
  /// **'SMS Sent'**
  String get actionTypeSmsSent;

  /// No description provided for @actionTypeAddedToEntityGroup.
  ///
  /// In en, this message translates to:
  /// **'Added to Entity Group'**
  String get actionTypeAddedToEntityGroup;

  /// No description provided for @actionTypeRemovedFromEntityGroup.
  ///
  /// In en, this message translates to:
  /// **'Removed from Entity Group'**
  String get actionTypeRemovedFromEntityGroup;

  /// No description provided for @actionTypeRestApiRuleEngineCall.
  ///
  /// In en, this message translates to:
  /// **'REST API Rule Engine Call'**
  String get actionTypeRestApiRuleEngineCall;

  /// No description provided for @actionTypeMadePublic.
  ///
  /// In en, this message translates to:
  /// **'Made Public'**
  String get actionTypeMadePublic;

  /// No description provided for @actionTypeMadePrivate.
  ///
  /// In en, this message translates to:
  /// **'Made Private'**
  String get actionTypeMadePrivate;

  /// No description provided for @actionTypeChangeOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner Changed'**
  String get actionTypeChangeOwner;

  /// No description provided for @youDontHavePermissionsToPerformThisOperation.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permissions to perform this operation!'**
  String get youDontHavePermissionsToPerformThisOperation;

  /// No description provided for @itLooksLikeYourPermissionsArentSufficientToCompleteThis.
  ///
  /// In en, this message translates to:
  /// **'It looks like your permissions aren\'t sufficient to complete this operation'**
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis;

  /// No description provided for @isRequiredText.
  ///
  /// In en, this message translates to:
  /// **'is required.'**
  String get isRequiredText;

  /// No description provided for @no2faProvidersFound.
  ///
  /// In en, this message translates to:
  /// **'No 2FA providers found'**
  String get no2faProvidersFound;

  /// No description provided for @pleaseContactYourSystemAdministrator.
  ///
  /// In en, this message translates to:
  /// **'Please contact your system administrator'**
  String get pleaseContactYourSystemAdministrator;

  /// No description provided for @errorOccured.
  ///
  /// In en, this message translates to:
  /// **'Error occured: {e}'**
  String errorOccured(Object e);

  /// No description provided for @unsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'Unsaved changes'**
  String get unsavedChanges;

  /// No description provided for @youHaveUnsavedChangesAreYouSureYouWantTo.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes. Are you sure you want to leave this page?'**
  String get youHaveUnsavedChangesAreYouSureYouWantTo;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @accountDeletionDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? You are going to delete your {authority} account.'**
  String accountDeletionDialogBody(Object authority);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @metricUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get metricUnitSystem;

  /// No description provided for @imperialUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperialUnitSystem;

  /// No description provided for @hybridUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get hybridUnitSystem;

  /// No description provided for @autoUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get autoUnitSystem;

  /// No description provided for @unitSystem.
  ///
  /// In en, this message translates to:
  /// **'Unit system'**
  String get unitSystem;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get selectCountry;

  /// No description provided for @hideHomeDashboardToolbar.
  ///
  /// In en, this message translates to:
  /// **'Hide home dashboard toolbar'**
  String get hideHomeDashboardToolbar;

  /// No description provided for @phoneNumberHelperText.
  ///
  /// In en, this message translates to:
  /// **'Phone Number in E.164 format, ex. +1201550123'**
  String get phoneNumberHelperText;

  /// No description provided for @homeDashboard.
  ///
  /// In en, this message translates to:
  /// **'Home dashboard'**
  String get homeDashboard;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @twofactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get twofactorAuthentication;

  /// No description provided for @verificationRequired.
  ///
  /// In en, this message translates to:
  /// **'Verification required'**
  String get verificationRequired;

  /// No description provided for @twofactorAuthenticationIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication is required'**
  String get twofactorAuthenticationIsRequired;

  /// No description provided for @setUpAVerificationMethodToContinueWithYourLogin.
  ///
  /// In en, this message translates to:
  /// **'Set up a verification method to continue with your login'**
  String get setUpAVerificationMethodToContinueWithYourLogin;

  /// No description provided for @setUpAVerificationMethod.
  ///
  /// In en, this message translates to:
  /// **'Set up a verification method'**
  String get setUpAVerificationMethod;

  /// No description provided for @totpSetupSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'The next time you log in, you will need to provide a two-factor authentication code'**
  String get totpSetupSuccessDescription;

  /// No description provided for @smsSetupSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'The next time you log in, you will be prompted to enter the security code that will be sent to the phone number'**
  String get smsSetupSuccessDescription;

  /// No description provided for @emailSetupSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'The next time you log in, you will be prompted to enter the security code that will be sent to your email address'**
  String get emailSetupSuccessDescription;

  /// No description provided for @backupCodeSetupSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'The next time you log in, you will be able to use backup codes to pass two factor authentification'**
  String get backupCodeSetupSuccessDescription;

  /// No description provided for @loginToApp.
  ///
  /// In en, this message translates to:
  /// **'Login to app'**
  String get loginToApp;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @thisWillMakeYourAccountLessSecure.
  ///
  /// In en, this message translates to:
  /// **'This will make your account less secure'**
  String get thisWillMakeYourAccountLessSecure;

  /// No description provided for @areYouSureYouWantToDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to deactivate {providerName}?'**
  String areYouSureYouWantToDeactivate(Object providerName);

  /// No description provided for @yesDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Yes, deactivate'**
  String get yesDeactivate;

  /// No description provided for @enterAnEmailToUseAsYourAuthenticator.
  ///
  /// In en, this message translates to:
  /// **'Enter an email to use as your authenticator.'**
  String get enterAnEmailToUseAsYourAuthenticator;

  /// No description provided for @enterAPhoneNumberToUseAsYourAuthenticator.
  ///
  /// In en, this message translates to:
  /// **'Enter a phone number to use as your authenticator'**
  String get enterAPhoneNumberToUseAsYourAuthenticator;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @errorSendingCode.
  ///
  /// In en, this message translates to:
  /// **'Error sending code: {error}'**
  String errorSendingCode(String error);

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @enter6digitsKeyFromYourAppHere.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digits key from your app here:'**
  String get enter6digitsKeyFromYourAppHere;

  /// No description provided for @digitsCode.
  ///
  /// In en, this message translates to:
  /// **'{count}-{count, plural, =1{digit} other{digits}} code'**
  String digitsCode(int count);

  /// No description provided for @copy32digitsKeyToYourAuthenticationAppOrScanQrcode.
  ///
  /// In en, this message translates to:
  /// **'Copy 32-digits key to your authentication app or scan QR-code below'**
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode;

  /// No description provided for @applyChanges.
  ///
  /// In en, this message translates to:
  /// **'Apply changes'**
  String get applyChanges;

  /// No description provided for @discardChanges.
  ///
  /// In en, this message translates to:
  /// **'Discard changes'**
  String get discardChanges;

  /// No description provided for @yesDiscard.
  ///
  /// In en, this message translates to:
  /// **'Yes, discard'**
  String get yesDiscard;

  /// No description provided for @thisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone'**
  String get thisActionCannotBeUndone;

  /// No description provided for @twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication protects your account from unauthorized access. All you have to do is enter a security code when you log in.'**
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou;

  /// No description provided for @calculatedField.
  ///
  /// In en, this message translates to:
  /// **'Calculated field'**
  String get calculatedField;

  /// No description provided for @apiKey.
  ///
  /// In en, this message translates to:
  /// **'Api key'**
  String get apiKey;

  /// No description provided for @aiModel.
  ///
  /// In en, this message translates to:
  /// **'Ai model'**
  String get aiModel;

  /// No description provided for @adminSettings.
  ///
  /// In en, this message translates to:
  /// **'Admin settings'**
  String get adminSettings;

  /// No description provided for @job.
  ///
  /// In en, this message translates to:
  /// **'Job'**
  String get job;

  /// No description provided for @mobileAppBundle.
  ///
  /// In en, this message translates to:
  /// **'Mobile app bundle'**
  String get mobileAppBundle;

  /// No description provided for @mobileApp.
  ///
  /// In en, this message translates to:
  /// **'Mobile app'**
  String get mobileApp;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @oauth2Client.
  ///
  /// In en, this message translates to:
  /// **'Oauth2 client'**
  String get oauth2Client;

  /// No description provided for @queueStats.
  ///
  /// In en, this message translates to:
  /// **'Queue stats'**
  String get queueStats;

  /// No description provided for @phoneIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone is required'**
  String get phoneIsRequired;

  /// No description provided for @phoneIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Phone is invalid'**
  String get phoneIsInvalid;

  /// No description provided for @addVerificationMethod.
  ///
  /// In en, this message translates to:
  /// **'Add verification method'**
  String get addVerificationMethod;

  /// No description provided for @imageSavedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Saved to platform \'Image gallery\''**
  String get imageSavedToGallery;

  /// No description provided for @failedToSaveImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to save image'**
  String get failedToSaveImage;

  /// No description provided for @nSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String nSelected(int count);

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all loaded'**
  String get selectAll;

  /// No description provided for @failedToPerformOperation.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 operation failed} other{{count} operations failed}}'**
  String failedToPerformOperation(int count);

  /// No description provided for @deleteSelectedNotifications.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 notification?} other{Delete {count} notifications?}}'**
  String deleteSelectedNotifications(int count);

  /// No description provided for @markSelectedNotificationsAsRead.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Mark 1 notification as read?} other{Mark {count} notifications as read?}}'**
  String markSelectedNotificationsAsRead(int count);

  /// No description provided for @gettingDataFromHost.
  ///
  /// In en, this message translates to:
  /// **'Getting data from your host {host}'**
  String gettingDataFromHost(Object host);

  /// No description provided for @loggingYouIntoHost.
  ///
  /// In en, this message translates to:
  /// **'Logging you into the host {host}'**
  String loggingYouIntoHost(Object host);

  /// No description provided for @switchingToNewHost.
  ///
  /// In en, this message translates to:
  /// **'Switching you to the new host {host}'**
  String switchingToNewHost(Object host);

  /// No description provided for @failedToObtainLoginTokenFromHost.
  ///
  /// In en, this message translates to:
  /// **'Failed to obtain a login token from {host}. Please scan a new QR code.'**
  String failedToObtainLoginTokenFromHost(Object host);

  /// No description provided for @failedToConnectToHost.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to {host}'**
  String failedToConnectToHost(Object host);

  /// No description provided for @qrCodeSessionIsNoLongerValid.
  ///
  /// In en, this message translates to:
  /// **'The QR code session is no longer valid. Please refresh the QR code and scan again.'**
  String get qrCodeSessionIsNoLongerValid;

  /// No description provided for @liveTrackingActive.
  ///
  /// In en, this message translates to:
  /// **'Live location tracking'**
  String get liveTrackingActive;

  /// No description provided for @liveTrackingPaused.
  ///
  /// In en, this message translates to:
  /// **'Live tracking paused'**
  String get liveTrackingPaused;

  /// No description provided for @liveTrackingFixes.
  ///
  /// In en, this message translates to:
  /// **'Fixes'**
  String get liveTrackingFixes;

  /// No description provided for @liveTrackingSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get liveTrackingSaved;

  /// No description provided for @liveTrackingErrors.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get liveTrackingErrors;

  /// No description provided for @liveTrackingStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get liveTrackingStop;

  /// No description provided for @liveTrackingPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get liveTrackingPause;

  /// No description provided for @liveTrackingResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get liveTrackingResume;

  /// No description provided for @liveTrackingHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get liveTrackingHide;

  /// No description provided for @liveTrackingSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Live location tracking'**
  String get liveTrackingSessionTitle;

  /// No description provided for @liveTrackingTarget.
  ///
  /// In en, this message translates to:
  /// **'Save location to entity'**
  String get liveTrackingTarget;

  /// No description provided for @liveTrackingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get liveTrackingDashboard;

  /// No description provided for @liveTrackingStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get liveTrackingStatus;

  /// No description provided for @liveTrackingStarted.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get liveTrackingStarted;

  /// No description provided for @liveTrackingLastFix.
  ///
  /// In en, this message translates to:
  /// **'Last fix'**
  String get liveTrackingLastFix;

  /// No description provided for @liveTrackingLastError.
  ///
  /// In en, this message translates to:
  /// **'Last error'**
  String get liveTrackingLastError;

  /// No description provided for @liveTrackingErrorTargetNotFound.
  ///
  /// In en, this message translates to:
  /// **'Can\'t save to this entity — it no longer exists. Tracking continues; update the target in the dashboard action.'**
  String get liveTrackingErrorTargetNotFound;

  /// No description provided for @liveTrackingErrorNoConnection.
  ///
  /// In en, this message translates to:
  /// **'No connection to the server. These fixes weren\'t saved — saving resumes when you\'re back online.'**
  String get liveTrackingErrorNoConnection;

  /// No description provided for @liveTrackingErrorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Your session ended. Sign in again to keep saving location.'**
  String get liveTrackingErrorUnauthorized;

  /// No description provided for @liveTrackingErrorSavePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Can\'t save to this entity — you don\'t have permission. Tracking continues; ask your administrator to grant access.'**
  String get liveTrackingErrorSavePermissionDenied;

  /// No description provided for @liveTrackingErrorSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save this fix to the server. Saving retries with the next fix.'**
  String get liveTrackingErrorSaveFailed;

  /// No description provided for @liveTrackingErrorServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are turned off on this device.'**
  String get liveTrackingErrorServicesDisabled;

  /// No description provided for @liveTrackingErrorPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission was denied.'**
  String get liveTrackingErrorPermissionDenied;

  /// No description provided for @liveTrackingErrorPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied. Enable it in the app settings.'**
  String get liveTrackingErrorPermissionDeniedForever;

  /// No description provided for @liveTrackingErrorLocation.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get a location fix.'**
  String get liveTrackingErrorLocation;

  /// No description provided for @liveTrackingMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Live location tracking'**
  String get liveTrackingMenuTitle;

  /// No description provided for @liveTrackingNoRecord.
  ///
  /// In en, this message translates to:
  /// **'No active tracking and no recent session.'**
  String get liveTrackingNoRecord;

  /// No description provided for @liveTrackingLastSession.
  ///
  /// In en, this message translates to:
  /// **'Last session'**
  String get liveTrackingLastSession;

  /// No description provided for @liveTrackingStartAgain.
  ///
  /// In en, this message translates to:
  /// **'Start again'**
  String get liveTrackingStartAgain;

  /// No description provided for @liveTrackingEnded.
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get liveTrackingEnded;

  /// No description provided for @liveTrackingEndReason.
  ///
  /// In en, this message translates to:
  /// **'End reason'**
  String get liveTrackingEndReason;

  /// No description provided for @liveTrackingEndReasonManual.
  ///
  /// In en, this message translates to:
  /// **'Stopped manually'**
  String get liveTrackingEndReasonManual;

  /// No description provided for @liveTrackingEndReasonMaxDuration.
  ///
  /// In en, this message translates to:
  /// **'Reached max duration'**
  String get liveTrackingEndReasonMaxDuration;

  /// No description provided for @liveTrackingEndReasonInterrupted.
  ///
  /// In en, this message translates to:
  /// **'Interrupted'**
  String get liveTrackingEndReasonInterrupted;

  /// No description provided for @serverUpdateRequired.
  ///
  /// In en, this message translates to:
  /// **'Server update required'**
  String get serverUpdateRequired;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get backToLogin;

  /// No description provided for @serverRequiresVersion.
  ///
  /// In en, this message translates to:
  /// **'This app works with ThingsBoard {minVersion} or later.'**
  String serverRequiresVersion(String minVersion);

  /// No description provided for @serverLabel.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get serverLabel;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionLabel;

  /// No description provided for @askAdminToUpdateServer.
  ///
  /// In en, this message translates to:
  /// **'Ask your server administrator to update the server.'**
  String get askAdminToUpdateServer;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fr',
    'it',
    'nl',
    'no',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return SZhCn();
          case 'TW':
            return SZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'da':
      return SDa();
    case 'de':
      return SDe();
    case 'el':
      return SEl();
    case 'en':
      return SEn();
    case 'es':
      return SEs();
    case 'fr':
      return SFr();
    case 'it':
      return SIt();
    case 'nl':
      return SNl();
    case 'no':
      return SNo();
    case 'vi':
      return SVi();
    case 'zh':
      return SZh();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

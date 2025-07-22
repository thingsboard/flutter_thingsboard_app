// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ThingsBoard`
  String get appTitle {
    return Intl.message('ThingsBoard', name: 'appTitle', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `{count, plural, =1{Device} other{Devices}}`
  String devices(int count) {
    return Intl.plural(
      count,
      one: 'Device',
      other: 'Devices',
      name: 'devices',
      desc: '',
      args: [count],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Customers`
  String get customers {
    return Intl.message('Customers', name: 'customers', desc: '', args: []);
  }

  /// `Assets`
  String get assets {
    return Intl.message('Assets', name: 'assets', desc: '', args: []);
  }

  /// `Audit Logs`
  String get auditLogs {
    return Intl.message('Audit Logs', name: 'auditLogs', desc: '', args: []);
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `ThingsBoard Logo`
  String get logoDefaultValue {
    return Intl.message(
      'ThingsBoard Logo',
      name: 'logoDefaultValue',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginNotification {
    return Intl.message(
      'Login to your account',
      name: 'loginNotification',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Email is required.`
  String get emailRequireText {
    return Intl.message(
      'Email is required.',
      name: 'emailRequireText',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format.`
  String get emailInvalidText {
    return Intl.message(
      'Invalid email format.',
      name: 'emailInvalidText',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message('username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password is required.`
  String get passwordRequireText {
    return Intl.message(
      'Password is required.',
      name: 'passwordRequireText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get passwordForgotText {
    return Intl.message(
      'Forgot Password?',
      name: 'passwordForgotText',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get passwordReset {
    return Intl.message(
      'Reset password',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email associated with your account and we'll send an email with password reset link`
  String get passwordResetText {
    return Intl.message(
      'Enter the email associated with your account and we\'ll send an email with password reset link',
      name: 'passwordResetText',
      desc: '',
      args: [],
    );
  }

  /// `Request password reset`
  String get requestPasswordReset {
    return Intl.message(
      'Request password reset',
      name: 'requestPasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link was successfully sent!`
  String get passwordResetLinkSuccessfullySentNotification {
    return Intl.message(
      'Password reset link was successfully sent!',
      name: 'passwordResetLinkSuccessfullySentNotification',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `State / Province`
  String get stateOrProvince {
    return Intl.message(
      'State / Province',
      name: 'stateOrProvince',
      desc: '',
      args: [],
    );
  }

  /// `Zip / Postal Code`
  String get postalCode {
    return Intl.message(
      'Zip / Postal Code',
      name: 'postalCode',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Address 2`
  String get address2 {
    return Intl.message('Address 2', name: 'address2', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Clear Alarm`
  String get alarmClearTitle {
    return Intl.message(
      'Clear Alarm',
      name: 'alarmClearTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear Alarm?`
  String get alarmClearText {
    return Intl.message(
      'Are you sure you want to clear Alarm?',
      name: 'alarmClearText',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledge Alarm`
  String get alarmAcknowledgeTitle {
    return Intl.message(
      'Acknowledge Alarm',
      name: 'alarmAcknowledgeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to acknowledge Alarm?`
  String get alarmAcknowledgeText {
    return Intl.message(
      'Are you sure you want to acknowledge Alarm?',
      name: 'alarmAcknowledgeText',
      desc: '',
      args: [],
    );
  }

  /// `Asset name`
  String get assetName {
    return Intl.message('Asset name', name: 'assetName', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Label`
  String get label {
    return Intl.message('Label', name: 'label', desc: '', args: []);
  }

  /// `Assigned to customer`
  String get assignedToCustomer {
    return Intl.message(
      'Assigned to customer',
      name: 'assignedToCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Audit log details`
  String get auditLogDetails {
    return Intl.message(
      'Audit log details',
      name: 'auditLogDetails',
      desc: '',
      args: [],
    );
  }

  /// `Entity Type`
  String get entityType {
    return Intl.message('Entity Type', name: 'entityType', desc: '', args: []);
  }

  /// `Action data`
  String get actionData {
    return Intl.message('Action data', name: 'actionData', desc: '', args: []);
  }

  /// `Failure details`
  String get failureDetails {
    return Intl.message(
      'Failure details',
      name: 'failureDetails',
      desc: '',
      args: [],
    );
  }

  /// `All devices`
  String get allDevices {
    return Intl.message('All devices', name: 'allDevices', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get inactive {
    return Intl.message('Inactive', name: 'inactive', desc: '', args: []);
  }

  /// `System Administrator`
  String get systemAdministrator {
    return Intl.message(
      'System Administrator',
      name: 'systemAdministrator',
      desc: '',
      args: [],
    );
  }

  /// `Tenant Administrator`
  String get tenantAdministrator {
    return Intl.message(
      'Tenant Administrator',
      name: 'tenantAdministrator',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password is required.`
  String get currentPasswordRequireText {
    return Intl.message(
      'Current password is required.',
      name: 'currentPasswordRequireText',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password is required.`
  String get newPasswordRequireText {
    return Intl.message(
      'New password is required.',
      name: 'newPasswordRequireText',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password again is required.`
  String get newPassword2RequireText {
    return Intl.message(
      'New password again is required.',
      name: 'newPassword2RequireText',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get newPassword2 {
    return Intl.message(
      'Confirm new password',
      name: 'newPassword2',
      desc: '',
      args: [],
    );
  }

  /// `Entered passwords must be same!`
  String get passwordErrorNotification {
    return Intl.message(
      'Entered passwords must be same!',
      name: 'passwordErrorNotification',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstNameUpper {
    return Intl.message(
      'First Name',
      name: 'firstNameUpper',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastNameUpper {
    return Intl.message('Last Name', name: 'lastNameUpper', desc: '', args: []);
  }

  /// `Profile successfully updated`
  String get profileSuccessNotification {
    return Intl.message(
      'Profile successfully updated',
      name: 'profileSuccessNotification',
      desc: '',
      args: [],
    );
  }

  /// `Password successfully changed`
  String get passwordSuccessNotification {
    return Intl.message(
      'Password successfully changed',
      name: 'passwordSuccessNotification',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented!`
  String get notImplemented {
    return Intl.message(
      'Not implemented!',
      name: 'notImplemented',
      desc: '',
      args: [],
    );
  }

  /// `The list is currently empty.`
  String get listIsEmptyText {
    return Intl.message(
      'The list is currently empty.',
      name: 'listIsEmptyText',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Verify your identity`
  String get verifyYourIdentity {
    return Intl.message(
      'Verify your identity',
      name: 'verifyYourIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message('Resend code', name: 'resendCode', desc: '', args: []);
  }

  /// `Resend code in {time,plural, =1{1 second}other{{time} seconds}}`
  String resendCodeWait(num time) {
    return Intl.message(
      'Resend code in ${Intl.plural(time, one: '1 second', other: '$time seconds')}',
      name: 'resendCodeWait',
      desc: '',
      args: [time],
    );
  }

  /// `Please enter the security code from your authenticator app.`
  String get totpAuthDescription {
    return Intl.message(
      'Please enter the security code from your authenticator app.',
      name: 'totpAuthDescription',
      desc: '',
      args: [],
    );
  }

  /// `A security code has been sent to your phone at {contact}.`
  String smsAuthDescription(Object contact) {
    return Intl.message(
      'A security code has been sent to your phone at $contact.',
      name: 'smsAuthDescription',
      desc: '',
      args: [contact],
    );
  }

  /// `A security code has been sent to your email address at {contact}.`
  String emailAuthDescription(Object contact) {
    return Intl.message(
      'A security code has been sent to your email address at $contact.',
      name: 'emailAuthDescription',
      desc: '',
      args: [contact],
    );
  }

  /// `Please enter one of your backup codes.`
  String get backupCodeAuthDescription {
    return Intl.message(
      'Please enter one of your backup codes.',
      name: 'backupCodeAuthDescription',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code format`
  String get verificationCodeInvalid {
    return Intl.message(
      'Invalid verification code format',
      name: 'verificationCodeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get toptAuthPlaceholder {
    return Intl.message(
      'Code',
      name: 'toptAuthPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `SMS code`
  String get smsAuthPlaceholder {
    return Intl.message(
      'SMS code',
      name: 'smsAuthPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Email code`
  String get emailAuthPlaceholder {
    return Intl.message(
      'Email code',
      name: 'emailAuthPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Backup code`
  String get backupCodeAuthPlaceholder {
    return Intl.message(
      'Backup code',
      name: 'backupCodeAuthPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is incorrect`
  String get verificationCodeIncorrect {
    return Intl.message(
      'Verification code is incorrect',
      name: 'verificationCodeIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests check verification code`
  String get verificationCodeManyRequest {
    return Intl.message(
      'Too many requests check verification code',
      name: 'verificationCodeManyRequest',
      desc: '',
      args: [],
    );
  }

  /// `Try another way`
  String get tryAnotherWay {
    return Intl.message(
      'Try another way',
      name: 'tryAnotherWay',
      desc: '',
      args: [],
    );
  }

  /// `Select a way to verify`
  String get selectWayToVerify {
    return Intl.message(
      'Select a way to verify',
      name: 'selectWayToVerify',
      desc: '',
      args: [],
    );
  }

  /// `Authenticator app`
  String get mfaProviderTopt {
    return Intl.message(
      'Authenticator app',
      name: 'mfaProviderTopt',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get mfaProviderSms {
    return Intl.message('SMS', name: 'mfaProviderSms', desc: '', args: []);
  }

  /// `Email`
  String get mfaProviderEmail {
    return Intl.message('Email', name: 'mfaProviderEmail', desc: '', args: []);
  }

  /// `Backup code`
  String get mfaProviderBackupCode {
    return Intl.message(
      'Backup code',
      name: 'mfaProviderBackupCode',
      desc: '',
      args: [],
    );
  }

  /// `New User?`
  String get newUserText {
    return Intl.message('New User?', name: 'newUserText', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get emailVerification {
    return Intl.message(
      'Email verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `An email with verification details was sent to the specified email address `
  String get emailVerificationSentText {
    return Intl.message(
      'An email with verification details was sent to the specified email address ',
      name: 'emailVerificationSentText',
      desc: '',
      args: [],
    );
  }

  /// `Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven't seen the email for a while, please check your 'spam' folder or try to resend email by clicking 'Resend' button.`
  String get emailVerificationInstructionsText {
    return Intl.message(
      'Please follow instructions provided in the email in order to complete your sign up procedure. Note: if you haven\'t seen the email for a while, please check your \'spam\' folder or try to resend email by clicking \'Resend\' button.',
      name: 'emailVerificationInstructionsText',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Activating account...`
  String get activatingAccount {
    return Intl.message(
      'Activating account...',
      name: 'activatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account successfully activated!`
  String get accountActivated {
    return Intl.message(
      'Account successfully activated!',
      name: 'accountActivated',
      desc: '',
      args: [],
    );
  }

  /// `Email verified`
  String get emailVerified {
    return Intl.message(
      'Email verified',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `Your account is currently activating.\nPlease wait...`
  String get activatingAccountText {
    return Intl.message(
      'Your account is currently activating.\nPlease wait...',
      name: 'activatingAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!\nYour {appTitle} account has been activated.\nNow you can login to your {appTitle} space.`
  String accountActivatedText(Object appTitle) {
    return Intl.message(
      'Congratulations!\nYour $appTitle account has been activated.\nNow you can login to your $appTitle space.',
      name: 'accountActivatedText',
      desc: '',
      args: [appTitle],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message('Terms of Use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `First name is required.`
  String get firstNameRequireText {
    return Intl.message(
      'First name is required.',
      name: 'firstNameRequireText',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Last name is required.`
  String get lastNameRequireText {
    return Intl.message(
      'Last name is required.',
      name: 'lastNameRequireText',
      desc: '',
      args: [],
    );
  }

  /// `Create a password`
  String get createPassword {
    return Intl.message(
      'Create a password',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat your password`
  String get repeatPassword {
    return Intl.message(
      'Repeat your password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `I'm not a robot`
  String get imNotARobot {
    return Intl.message(
      'I\'m not a robot',
      name: 'imNotARobot',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Your password must be at least 6 characters long`
  String get invalidPasswordLengthMessage {
    return Intl.message(
      'Your password must be at least 6 characters long',
      name: 'invalidPasswordLengthMessage',
      desc: '',
      args: [],
    );
  }

  /// `You must confirm that you are not a robot`
  String get confirmNotRobotMessage {
    return Intl.message(
      'You must confirm that you are not a robot',
      name: 'confirmNotRobotMessage',
      desc: '',
      args: [],
    );
  }

  /// `You must accept our Privacy Policy`
  String get acceptPrivacyPolicyMessage {
    return Intl.message(
      'You must accept our Privacy Policy',
      name: 'acceptPrivacyPolicyMessage',
      desc: '',
      args: [],
    );
  }

  /// `You must accept our Terms of Use`
  String get acceptTermsOfUseMessage {
    return Intl.message(
      'You must accept our Terms of Use',
      name: 'acceptTermsOfUseMessage',
      desc: '',
      args: [],
    );
  }

  /// `Inactive user already exists`
  String get inactiveUserAlreadyExists {
    return Intl.message(
      'Inactive user already exists',
      name: 'inactiveUserAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `There is already registered user with unverified email address.\nClick 'Resend' button if you wish to resend verification email.`
  String get inactiveUserAlreadyExistsMessage {
    return Intl.message(
      'There is already registered user with unverified email address.\nClick \'Resend\' button if you wish to resend verification email.',
      name: 'inactiveUserAlreadyExistsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Assignee`
  String get assignee {
    return Intl.message('Assignee', name: 'assignee', desc: '', args: []);
  }

  /// `Alarm types`
  String get alarmTypes {
    return Intl.message('Alarm types', name: 'alarmTypes', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Severity`
  String get severity {
    return Intl.message('Severity', name: 'severity', desc: '', args: []);
  }

  /// `Originator`
  String get originator {
    return Intl.message('Originator', name: 'originator', desc: '', args: []);
  }

  /// `Start time`
  String get startTime {
    return Intl.message('Start time', name: 'startTime', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `days`
  String get days {
    return Intl.message('days', name: 'days', desc: '', args: []);
  }

  /// `hours`
  String get hours {
    return Intl.message('hours', name: 'hours', desc: '', args: []);
  }

  /// `minutes`
  String get minutes {
    return Intl.message('minutes', name: 'minutes', desc: '', args: []);
  }

  /// `seconds`
  String get seconds {
    return Intl.message('seconds', name: 'seconds', desc: '', args: []);
  }

  /// `View Dashboard`
  String get viewDashboard {
    return Intl.message(
      'View Dashboard',
      name: 'viewDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message('Activity', name: 'activity', desc: '', args: []);
  }

  /// `Add a comment...`
  String get addCommentMessage {
    return Intl.message(
      'Add a comment...',
      name: 'addCommentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Select users`
  String get selectUser {
    return Intl.message('Select users', name: 'selectUser', desc: '', args: []);
  }

  /// `Assigned to me`
  String get assignedToMe {
    return Intl.message(
      'Assigned to me',
      name: 'assignedToMe',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Acknowledge`
  String get acknowledge {
    return Intl.message('Acknowledge', name: 'acknowledge', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edited`
  String get edited {
    return Intl.message('Edited', name: 'edited', desc: '', args: []);
  }

  /// `Delete comment`
  String get deleteComment {
    return Intl.message(
      'Delete comment',
      name: 'deleteComment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Please try refining your query`
  String get tryRefiningYourQuery {
    return Intl.message(
      'Please try refining your query',
      name: 'tryRefiningYourQuery',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load the list`
  String get failedToLoadTheList {
    return Intl.message(
      'Failed to load the list',
      name: 'failedToLoadTheList',
      desc: '',
      args: [],
    );
  }

  /// `Please try refreshing`
  String get tryRefreshing {
    return Intl.message(
      'Please try refreshing',
      name: 'tryRefreshing',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Unassigned`
  String get unassigned {
    return Intl.message('Unassigned', name: 'unassigned', desc: '', args: []);
  }

  /// `Failed to load alarm details`
  String get failedToLoadAlarmDetails {
    return Intl.message(
      'Failed to load alarm details',
      name: 'failedToLoadAlarmDetails',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something Went Wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Choose region`
  String get chooseRegion {
    return Intl.message(
      'Choose region',
      name: 'chooseRegion',
      desc: '',
      args: [],
    );
  }

  /// `Select region`
  String get selectRegion {
    return Intl.message(
      'Select region',
      name: 'selectRegion',
      desc: '',
      args: [],
    );
  }

  /// `North America`
  String get northAmerica {
    return Intl.message(
      'North America',
      name: 'northAmerica',
      desc: '',
      args: [],
    );
  }

  /// `Europe`
  String get europe {
    return Intl.message('Europe', name: 'europe', desc: '', args: []);
  }

  /// `N. Virginia`
  String get northAmericaRegionShort {
    return Intl.message(
      'N. Virginia',
      name: 'northAmericaRegionShort',
      desc: '',
      args: [],
    );
  }

  /// `Frankfurt`
  String get europeRegionShort {
    return Intl.message(
      'Frankfurt',
      name: 'europeRegionShort',
      desc: '',
      args: [],
    );
  }

  /// `Device list`
  String get deviceList {
    return Intl.message('Device list', name: 'deviceList', desc: '', args: []);
  }

  /// `{count, plural, =1{Dashboard} other{Dashboards}}`
  String dashboards(int count) {
    return Intl.plural(
      count,
      one: 'Dashboard',
      other: 'Dashboards',
      name: 'dashboards',
      desc: '',
      args: [count],
    );
  }

  /// `Update required`
  String get updateRequired {
    return Intl.message(
      'Update required',
      name: 'updateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Update to {version}`
  String updateTo(Object version) {
    return Intl.message(
      'Update to $version',
      name: 'updateTo',
      desc: '',
      args: [version],
    );
  }

  /// `Enter PIN of {deviceName} to confirm proof of possession`
  String popTitle(Object deviceName) {
    return Intl.message(
      'Enter PIN of $deviceName to confirm proof of possession',
      name: 'popTitle',
      desc: '',
      args: [deviceName],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `To provision your new device, please make sure that your phone’s Bluetooth is turned on and within range of your new device`
  String get bleHelpMessage {
    return Intl.message(
      'To provision your new device, please make sure that your phone’s Bluetooth is turned on and within range of your new device',
      name: 'bleHelpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi password`
  String get wifiPassword {
    return Intl.message(
      'Wi-Fi password',
      name: 'wifiPassword',
      desc: '',
      args: [],
    );
  }

  /// `To continue setup of your device {deviceName}, please provide your Network's credentials.`
  String wifiHelpMessage(Object deviceName) {
    return Intl.message(
      'To continue setup of your device $deviceName, please provide your Network\'s credentials.',
      name: 'wifiHelpMessage',
      desc: '',
      args: [deviceName],
    );
  }

  /// `Enter password for {network}`
  String wifiPasswordMessage(Object network) {
    return Intl.message(
      'Enter password for $network',
      name: 'wifiPasswordMessage',
      desc: '',
      args: [network],
    );
  }

  /// `Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.`
  String get deviceNotFoundMessage {
    return Intl.message(
      'Devices not found. Please make sure that your phone’s Bluetooth is turned on and within range of your new device.',
      name: 'deviceNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `You don't have enough permissions for "{permissions}" to proceed. Please grant the required permissions and tap "Try Again".`
  String permissionsNotEnoughMessage(Object permissions) {
    return Intl.message(
      'You don\'t have enough permissions for "$permissions" to proceed. Please grant the required permissions and tap "Try Again".',
      name: 'permissionsNotEnoughMessage',
      desc: '',
      args: [permissions],
    );
  }

  /// `Sending Wi-Fi credentials`
  String get sendingWifiCredentials {
    return Intl.message(
      'Sending Wi-Fi credentials',
      name: 'sendingWifiCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Confirming Wi-Fi connection`
  String get confirmingWifiConnection {
    return Intl.message(
      'Confirming Wi-Fi connection',
      name: 'confirmingWifiConnection',
      desc: '',
      args: [],
    );
  }

  /// `Device has been successfully provisioned`
  String get provisionedSuccessfully {
    return Intl.message(
      'Device has been successfully provisioned',
      name: 'provisionedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Return to dashboard`
  String get returnToDashboard {
    return Intl.message(
      'Return to dashboard',
      name: 'returnToDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Cannot establish session with device {deviceName}. Please try again`
  String cannotEstablishSession(Object deviceName) {
    return Intl.message(
      'Cannot establish session with device $deviceName. Please try again',
      name: 'cannotEstablishSession',
      desc: '',
      args: [deviceName],
    );
  }

  /// `Claiming device`
  String get claimingDevice {
    return Intl.message(
      'Claiming device',
      name: 'claimingDevice',
      desc: '',
      args: [],
    );
  }

  /// `Device claiming done`
  String get claimingDeviceDone {
    return Intl.message(
      'Device claiming done',
      name: 'claimingDeviceDone',
      desc: '',
      args: [],
    );
  }

  /// `Device has been\nsuccessfully claimed`
  String get claimingMessageSuccess {
    return Intl.message(
      'Device has been\nsuccessfully claimed',
      name: 'claimingMessageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You don't have enough permissions for "{permissions}" to proceed. Please open app settings, grant permissions and trap "Try Again".`
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return Intl.message(
      'You don\'t have enough permissions for "$permissions" to proceed. Please open app settings, grant permissions and trap "Try Again".',
      name: 'openAppSettingsToGrantPermissionMessage',
      desc: '',
      args: [permissions],
    );
  }

  /// `Scan a code`
  String get scanACode {
    return Intl.message('Scan a code', name: 'scanACode', desc: '', args: []);
  }

  /// `Allow access`
  String get allowAccess {
    return Intl.message(
      'Allow access',
      name: 'allowAccess',
      desc: '',
      args: [],
    );
  }

  /// `Toggle camera`
  String get toggleCamera {
    return Intl.message(
      'Toggle camera',
      name: 'toggleCamera',
      desc: '',
      args: [],
    );
  }

  /// `Toggle flash`
  String get toggleFlash {
    return Intl.message(
      'Toggle flash',
      name: 'toggleFlash',
      desc: '',
      args: [],
    );
  }

  /// `Unable to use camera`
  String get unableToUseCamera {
    return Intl.message(
      'Unable to use camera',
      name: 'unableToUseCamera',
      desc: '',
      args: [],
    );
  }

  /// `Open settings and grant access to camera to continue`
  String get openSettingsAndGrantAccessToCameraToContinue {
    return Intl.message(
      'Open settings and grant access to camera to continue',
      name: 'openSettingsAndGrantAccessToCameraToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get notFound {
    return Intl.message('Not Found', name: 'notFound', desc: '', args: []);
  }

  /// `Route not defined: {name}`
  String routeNotDefined(Object name) {
    return Intl.message(
      'Route not defined: $name',
      name: 'routeNotDefined',
      desc: '',
      args: [name],
    );
  }

  /// `Login with`
  String get loginWith {
    return Intl.message('Login with', name: 'loginWith', desc: '', args: []);
  }

  /// `Scan QR code`
  String get scanQrCode {
    return Intl.message('Scan QR code', name: 'scanQrCode', desc: '', args: []);
  }

  /// `An empty request data received.`
  String get anEmptyRequestDataReceived {
    return Intl.message(
      'An empty request data received.',
      name: 'anEmptyRequestDataReceived',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong ... Rollback`
  String get somethingWentWrongRollback {
    return Intl.message(
      'Something went wrong ... Rollback',
      name: 'somethingWentWrongRollback',
      desc: '',
      args: [],
    );
  }

  /// `Search results`
  String get searchResults {
    return Intl.message(
      'Search results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `Requested entity does not exists.`
  String get requestedEntityDoesNotExists {
    return Intl.message(
      'Requested entity does not exists.',
      name: 'requestedEntityDoesNotExists',
      desc: '',
      args: [],
    );
  }

  /// `No alarms found`
  String get noAlarmsFound {
    return Intl.message(
      'No alarms found',
      name: 'noAlarmsFound',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message('Filters', name: 'filters', desc: '', args: []);
  }

  /// `Alarm status list`
  String get alarmStatusList {
    return Intl.message(
      'Alarm status list',
      name: 'alarmStatusList',
      desc: '',
      args: [],
    );
  }

  /// `Alarm severity list`
  String get alarmSeverityList {
    return Intl.message(
      'Alarm severity list',
      name: 'alarmSeverityList',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get cleared {
    return Intl.message('Cleared', name: 'cleared', desc: '', args: []);
  }

  /// `Acknowledged`
  String get acknowledged {
    return Intl.message(
      'Acknowledged',
      name: 'acknowledged',
      desc: '',
      args: [],
    );
  }

  /// `Unacknowledged`
  String get unacknowledged {
    return Intl.message(
      'Unacknowledged',
      name: 'unacknowledged',
      desc: '',
      args: [],
    );
  }

  /// `Critical`
  String get critical {
    return Intl.message('Critical', name: 'critical', desc: '', args: []);
  }

  /// `Major`
  String get major {
    return Intl.message('Major', name: 'major', desc: '', args: []);
  }

  /// `Minor`
  String get minor {
    return Intl.message('Minor', name: 'minor', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Indeterminate`
  String get indeterminate {
    return Intl.message(
      'Indeterminate',
      name: 'indeterminate',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{Search user} other{Search users}}`
  String searchUsers(int count) {
    return Intl.plural(
      count,
      one: 'Search user',
      other: 'Search users',
      name: 'searchUsers',
      desc: '',
      args: [count],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Alarm type list`
  String get alarmTypeList {
    return Intl.message(
      'Alarm type list',
      name: 'alarmTypeList',
      desc: '',
      args: [],
    );
  }

  /// `Any type`
  String get anyType {
    return Intl.message('Any type', name: 'anyType', desc: '', args: []);
  }

  /// `+ Alarm type`
  String get plusAlarmType {
    return Intl.message(
      '+ Alarm type',
      name: 'plusAlarmType',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Unread`
  String get unread {
    return Intl.message('Unread', name: 'unread', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Code verification failed!`
  String get codeVerificationFailed {
    return Intl.message(
      'Code verification failed!',
      name: 'codeVerificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Fatal error`
  String get fatalError {
    return Intl.message('Fatal error', name: 'fatalError', desc: '', args: []);
  }

  /// `Unknown error.`
  String get unknownError {
    return Intl.message(
      'Unknown error.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Fatal application error occurred:`
  String get fatalApplicationErrorOccurred {
    return Intl.message(
      'Fatal application error occurred:',
      name: 'fatalApplicationErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Connection error`
  String get connectionError {
    return Intl.message(
      'Connection error',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to server`
  String get failedToConnectToServer {
    return Intl.message(
      'Failed to connect to server',
      name: 'failedToConnectToServer',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Mobile dashboard should be configured in device profile!`
  String get mobileDashboardShouldBeConfiguredInDeviceProfile {
    return Intl.message(
      'Mobile dashboard should be configured in device profile!',
      name: 'mobileDashboardShouldBeConfiguredInDeviceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Open Wi-Fi settings`
  String get openWifiSettings {
    return Intl.message(
      'Open Wi-Fi settings',
      name: 'openWifiSettings',
      desc: '',
      args: [],
    );
  }

  /// `Connect to the Wi-Fi you usually use`
  String get connectToTheWifiYouUsuallyUse {
    return Intl.message(
      'Connect to the Wi-Fi you usually use',
      name: 'connectToTheWifiYouUsuallyUse',
      desc: '',
      args: [],
    );
  }

  /// `Return to the app and tap Ready button`
  String get returnToTheAppAndTapReadyButton {
    return Intl.message(
      'Return to the app and tap Ready button',
      name: 'returnToTheAppAndTapReadyButton',
      desc: '',
      args: [],
    );
  }

  /// `Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi`
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour {
    return Intl.message(
      'Please follow the next steps to reconnect\nyour phone to your regular Wi-Fi',
      name: 'pleaseFollowTheNextStepsToReconnectnyourPhoneToYour',
      desc: '',
      args: [],
    );
  }

  /// `Push notifications are not configured.\nPlease contact your system administrator.`
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator {
    return Intl.message(
      'Push notifications are not configured.\nPlease contact your system administrator.',
      name:
          'pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator',
      desc: '',
      args: [],
    );
  }

  /// `Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.`
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase {
    return Intl.message(
      'Firebase is not configured.\n Please refer to the official Firebase documentation for\n guidance on how to do so.',
      name: 'firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Can't launch url: {link}`
  String cantLaunchUrlLink(String link) {
    return Intl.message(
      'Can\'t launch url: $link',
      name: 'cantLaunchUrlLink',
      desc: '',
      args: [link],
    );
  }

  /// `No dashboards found`
  String get noDashboardsFound {
    return Intl.message(
      'No dashboards found',
      name: 'noDashboardsFound',
      desc: '',
      args: [],
    );
  }

  /// `Open app settings`
  String get openAppSettings {
    return Intl.message(
      'Open app settings',
      name: 'openAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Connecting to device`
  String get connectingToDevice {
    return Intl.message(
      'Connecting to device',
      name: 'connectingToDevice',
      desc: '',
      args: [],
    );
  }

  /// `Connect to device`
  String get connectToDevice {
    return Intl.message(
      'Connect to device',
      name: 'connectToDevice',
      desc: '',
      args: [],
    );
  }

  /// `Select Wi-Fi network`
  String get selectWifiNetwork {
    return Intl.message(
      'Select Wi-Fi network',
      name: 'selectWifiNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Device provisioning`
  String get deviceProvisioning {
    return Intl.message(
      'Device provisioning',
      name: 'deviceProvisioning',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get permissions {
    return Intl.message('Permissions', name: 'permissions', desc: '', args: []);
  }

  /// `Unable connect to device`
  String get unableConnectToDevice {
    return Intl.message(
      'Unable connect to device',
      name: 'unableConnectToDevice',
      desc: '',
      args: [],
    );
  }

  /// `Device not able to find Wi-Fi nearby`
  String get deviceNotAbleToFindWifiNearby {
    return Intl.message(
      'Device not able to find Wi-Fi nearby',
      name: 'deviceNotAbleToFindWifiNearby',
      desc: '',
      args: [],
    );
  }

  /// `Connection to the {name} Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.`
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return Intl.message(
      'Connection to the $name Wi-Fi network failed.\nPlease ensure that your phone is connected to the device Wi-Fi network and that Local Network access is enabled for this app in your device settings.',
      name: 'connectionToTheWifiNetworkFailednpleaseEnsureThatYour',
      desc: '',
      args: [name],
    );
  }

  /// `Unable connect to Wi-Fi because networks wasn't found by device {name}`
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return Intl.message(
      'Unable connect to Wi-Fi because networks wasn\'t found by device $name',
      name: 'unableConnectToWifiBecauseNetworksWasntFoundByDevice',
      desc: '',
      args: [name],
    );
  }

  /// `Please follow the next steps to connect your phone to device`
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo {
    return Intl.message(
      'Please follow the next steps to connect your phone to device',
      name: 'pleaseFollowTheNextStepsToConnectYourPhoneTo',
      desc: '',
      args: [],
    );
  }

  /// `Connect to Wi-Fi similar to {wifiName}`
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return Intl.message(
      'Connect to Wi-Fi similar to $wifiName',
      name: 'connectToWifiSimilarToWifiname',
      desc: '',
      args: [wifiName],
    );
  }

  /// `Ready`
  String get ready {
    return Intl.message('Ready', name: 'ready', desc: '', args: []);
  }

  /// `Exit device provisioning`
  String get exitDeviceProvisioning {
    return Intl.message(
      'Exit device provisioning',
      name: 'exitDeviceProvisioning',
      desc: '',
      args: [],
    );
  }

  /// `No notifications found`
  String get noNotificationsFound {
    return Intl.message(
      'No notifications found',
      name: 'noNotificationsFound',
      desc: '',
      args: [],
    );
  }

  /// `Mark as read`
  String get markAsRead {
    return Intl.message('Mark as read', name: 'markAsRead', desc: '', args: []);
  }

  /// `Url`
  String get url {
    return Intl.message('Url', name: 'url', desc: '', args: []);
  }

  /// `Please scan QR code on your device`
  String get pleaseScanQrCodeOnYourDevice {
    return Intl.message(
      'Please scan QR code on your device',
      name: 'pleaseScanQrCodeOnYourDevice',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Tenant`
  String get tenant {
    return Intl.message('Tenant', name: 'tenant', desc: '', args: []);
  }

  /// `Tenant profile`
  String get tenantProfile {
    return Intl.message(
      'Tenant profile',
      name: 'tenantProfile',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Asset`
  String get asset {
    return Intl.message('Asset', name: 'asset', desc: '', args: []);
  }

  /// `Device profile`
  String get deviceProfile {
    return Intl.message(
      'Device profile',
      name: 'deviceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Asset profile`
  String get assetProfile {
    return Intl.message(
      'Asset profile',
      name: 'assetProfile',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{Alarm} other{Alarms}}`
  String alarms(int count) {
    return Intl.plural(
      count,
      one: 'Alarm',
      other: 'Alarms',
      name: 'alarms',
      desc: '',
      args: [count],
    );
  }

  /// `Rule chain`
  String get ruleChain {
    return Intl.message('Rule chain', name: 'ruleChain', desc: '', args: []);
  }

  /// `Rule node`
  String get ruleNode {
    return Intl.message('Rule node', name: 'ruleNode', desc: '', args: []);
  }

  /// `Edge`
  String get edge {
    return Intl.message('Edge', name: 'edge', desc: '', args: []);
  }

  /// `Entity view`
  String get entityView {
    return Intl.message('Entity view', name: 'entityView', desc: '', args: []);
  }

  /// `Widgets bundle`
  String get widgetsBundle {
    return Intl.message(
      'Widgets bundle',
      name: 'widgetsBundle',
      desc: '',
      args: [],
    );
  }

  /// `Widget type`
  String get widgetType {
    return Intl.message('Widget type', name: 'widgetType', desc: '', args: []);
  }

  /// `API Usage State`
  String get apiUsageState {
    return Intl.message(
      'API Usage State',
      name: 'apiUsageState',
      desc: '',
      args: [],
    );
  }

  /// `Resource`
  String get tbResource {
    return Intl.message('Resource', name: 'tbResource', desc: '', args: []);
  }

  /// `OTA package`
  String get otaPackage {
    return Intl.message('OTA package', name: 'otaPackage', desc: '', args: []);
  }

  /// `RPC`
  String get rpc {
    return Intl.message('RPC', name: 'rpc', desc: '', args: []);
  }

  /// `Queue`
  String get queue {
    return Intl.message('Queue', name: 'queue', desc: '', args: []);
  }

  /// `Notification target`
  String get notificationTarget {
    return Intl.message(
      'Notification target',
      name: 'notificationTarget',
      desc: '',
      args: [],
    );
  }

  /// `Notification template`
  String get notificationTemplate {
    return Intl.message(
      'Notification template',
      name: 'notificationTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Notification request`
  String get notificationRequest {
    return Intl.message(
      'Notification request',
      name: 'notificationRequest',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{Notification} other{Notifications}}`
  String notifications(int count) {
    return Intl.plural(
      count,
      one: 'Notification',
      other: 'Notifications',
      name: 'notifications',
      desc: '',
      args: [count],
    );
  }

  /// `Notification rule`
  String get notificationRule {
    return Intl.message(
      'Notification rule',
      name: 'notificationRule',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get actionStatusSuccess {
    return Intl.message(
      'Success',
      name: 'actionStatusSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get actionStatusFailure {
    return Intl.message(
      'Failure',
      name: 'actionStatusFailure',
      desc: '',
      args: [],
    );
  }

  /// `Added`
  String get actionTypeAdded {
    return Intl.message('Added', name: 'actionTypeAdded', desc: '', args: []);
  }

  /// `Deleted`
  String get actionTypeDeleted {
    return Intl.message(
      'Deleted',
      name: 'actionTypeDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Updated`
  String get actionTypeUpdated {
    return Intl.message(
      'Updated',
      name: 'actionTypeUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Attributes Updated`
  String get actionTypeAttributesUpdated {
    return Intl.message(
      'Attributes Updated',
      name: 'actionTypeAttributesUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Attributes Deleted`
  String get actionTypeAttributesDeleted {
    return Intl.message(
      'Attributes Deleted',
      name: 'actionTypeAttributesDeleted',
      desc: '',
      args: [],
    );
  }

  /// `RPC Call`
  String get actionTypeRpcCall {
    return Intl.message(
      'RPC Call',
      name: 'actionTypeRpcCall',
      desc: '',
      args: [],
    );
  }

  /// `Credentials Updated`
  String get actionTypeCredentialsUpdated {
    return Intl.message(
      'Credentials Updated',
      name: 'actionTypeCredentialsUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Customer`
  String get actionTypeAssignedToCustomer {
    return Intl.message(
      'Assigned to Customer',
      name: 'actionTypeAssignedToCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned from Customer`
  String get actionTypeUnassignedFromCustomer {
    return Intl.message(
      'Unassigned from Customer',
      name: 'actionTypeUnassignedFromCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Activated`
  String get actionTypeActivated {
    return Intl.message(
      'Activated',
      name: 'actionTypeActivated',
      desc: '',
      args: [],
    );
  }

  /// `Suspended`
  String get actionTypeSuspended {
    return Intl.message(
      'Suspended',
      name: 'actionTypeSuspended',
      desc: '',
      args: [],
    );
  }

  /// `Credentials read`
  String get actionTypeCredentialsRead {
    return Intl.message(
      'Credentials read',
      name: 'actionTypeCredentialsRead',
      desc: '',
      args: [],
    );
  }

  /// `Attributes read`
  String get actionTypeAttributesRead {
    return Intl.message(
      'Attributes read',
      name: 'actionTypeAttributesRead',
      desc: '',
      args: [],
    );
  }

  /// `Relation updated`
  String get actionTypeRelationAddOrUpdate {
    return Intl.message(
      'Relation updated',
      name: 'actionTypeRelationAddOrUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Relation deleted`
  String get actionTypeRelationDeleted {
    return Intl.message(
      'Relation deleted',
      name: 'actionTypeRelationDeleted',
      desc: '',
      args: [],
    );
  }

  /// `All relation deleted`
  String get actionTypeRelationsDeleted {
    return Intl.message(
      'All relation deleted',
      name: 'actionTypeRelationsDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledged`
  String get actionTypeAlarmAck {
    return Intl.message(
      'Acknowledged',
      name: 'actionTypeAlarmAck',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get actionTypeAlarmClear {
    return Intl.message(
      'Cleared',
      name: 'actionTypeAlarmClear',
      desc: '',
      args: [],
    );
  }

  /// `Alarm Deleted`
  String get actionTypeAlarmDelete {
    return Intl.message(
      'Alarm Deleted',
      name: 'actionTypeAlarmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Alarm Assigned`
  String get actionTypeAlarmAssigned {
    return Intl.message(
      'Alarm Assigned',
      name: 'actionTypeAlarmAssigned',
      desc: '',
      args: [],
    );
  }

  /// `Alarm Unassigned`
  String get actionTypeAlarmUnassigned {
    return Intl.message(
      'Alarm Unassigned',
      name: 'actionTypeAlarmUnassigned',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get actionTypeLogin {
    return Intl.message('Login', name: 'actionTypeLogin', desc: '', args: []);
  }

  /// `Logout`
  String get actionTypeLogout {
    return Intl.message('Logout', name: 'actionTypeLogout', desc: '', args: []);
  }

  /// `Lockout`
  String get actionTypeLockout {
    return Intl.message(
      'Lockout',
      name: 'actionTypeLockout',
      desc: '',
      args: [],
    );
  }

  /// `Assigned from Tenant`
  String get actionTypeAssignedFromTenant {
    return Intl.message(
      'Assigned from Tenant',
      name: 'actionTypeAssignedFromTenant',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Tenant`
  String get actionTypeAssignedToTenant {
    return Intl.message(
      'Assigned to Tenant',
      name: 'actionTypeAssignedToTenant',
      desc: '',
      args: [],
    );
  }

  /// `Device provisioned`
  String get actionTypeProvisionSuccess {
    return Intl.message(
      'Device provisioned',
      name: 'actionTypeProvisionSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Device provisioning was failed`
  String get actionTypeProvisionFailure {
    return Intl.message(
      'Device provisioning was failed',
      name: 'actionTypeProvisionFailure',
      desc: '',
      args: [],
    );
  }

  /// `Telemetry updated`
  String get actionTypeTimeseriesUpdated {
    return Intl.message(
      'Telemetry updated',
      name: 'actionTypeTimeseriesUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Telemetry deleted`
  String get actionTypeTimeseriesDeleted {
    return Intl.message(
      'Telemetry deleted',
      name: 'actionTypeTimeseriesDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Edge`
  String get actionTypeAssignedToEdge {
    return Intl.message(
      'Assigned to Edge',
      name: 'actionTypeAssignedToEdge',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned from Edge`
  String get actionTypeUnassignedFromEdge {
    return Intl.message(
      'Unassigned from Edge',
      name: 'actionTypeUnassignedFromEdge',
      desc: '',
      args: [],
    );
  }

  /// `Added Comment`
  String get actionTypeAddedComment {
    return Intl.message(
      'Added Comment',
      name: 'actionTypeAddedComment',
      desc: '',
      args: [],
    );
  }

  /// `Updated Comment`
  String get actionTypeUpdatedComment {
    return Intl.message(
      'Updated Comment',
      name: 'actionTypeUpdatedComment',
      desc: '',
      args: [],
    );
  }

  /// `Deleted Comment`
  String get actionTypeDeletedComment {
    return Intl.message(
      'Deleted Comment',
      name: 'actionTypeDeletedComment',
      desc: '',
      args: [],
    );
  }

  /// `SMS Sent`
  String get actionTypeSmsSent {
    return Intl.message(
      'SMS Sent',
      name: 'actionTypeSmsSent',
      desc: '',
      args: [],
    );
  }

  /// `is required.`
  String get isRequiredText {
    return Intl.message(
      'is required.',
      name: 'isRequiredText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

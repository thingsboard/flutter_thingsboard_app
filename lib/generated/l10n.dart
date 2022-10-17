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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ThingsBoard`
  String get appTitle {
    return Intl.message(
      'ThingsBoard',
      name: 'appTitle',
      desc: '',
      args: [],
    );
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

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get route_not_found {
    return Intl.message(
      'Not Found',
      name: 'route_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Route not defined: `
  String get route_not_defined {
    return Intl.message(
      'Route not defined: ',
      name: 'route_not_defined',
      desc: '',
      args: [],
    );
  }

  /// `Connection error`
  String get context_conn_err_title {
    return Intl.message(
      'Connection error',
      name: 'context_conn_err_title',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to server`
  String get context_conn_err_info {
    return Intl.message(
      'Failed to connect to server',
      name: 'context_conn_err_info',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_welcome {
    return Intl.message(
      'Login to your account',
      name: 'login_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login with {clientName}`
  String login_with(Object clientName) {
    return Intl.message(
      'Login with $clientName',
      name: 'login_with',
      desc: '',
      args: [clientName],
    );
  }

  /// `LOGIN WITH`
  String get login_with2 {
    return Intl.message(
      'LOGIN WITH',
      name: 'login_with2',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get login_or {
    return Intl.message(
      'OR',
      name: 'login_or',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_email {
    return Intl.message(
      'Email',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get login_email_required {
    return Intl.message(
      'Email is required.',
      name: 'login_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format.`
  String get login_email_invalid {
    return Intl.message(
      'Invalid email format.',
      name: 'login_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_pwd {
    return Intl.message(
      'Password',
      name: 'login_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get login_pwd_required {
    return Intl.message(
      'Password is required.',
      name: 'login_pwd_required',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get login_pwd_forgot {
    return Intl.message(
      'Forgot Password?',
      name: 'login_pwd_forgot',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_btn_txt {
    return Intl.message(
      'Login',
      name: 'login_btn_txt',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_pwd_title {
    return Intl.message(
      'Reset password',
      name: 'reset_pwd_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email address associated with your account and we'll send an email with the password reset link`
  String get reset_pwd_tips {
    return Intl.message(
      'Enter the email address associated with your account and we\'ll send an email with the password reset link',
      name: 'reset_pwd_tips',
      desc: '',
      args: [],
    );
  }

  /// `Email *`
  String get reset_pwd_email {
    return Intl.message(
      'Email *',
      name: 'reset_pwd_email',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get reset_pwd_email_required {
    return Intl.message(
      'Email is required.',
      name: 'reset_pwd_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format.`
  String get reset_pwd_email_invalid {
    return Intl.message(
      'Invalid email format.',
      name: 'reset_pwd_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Request password reset`
  String get reset_pwd_btn_txt {
    return Intl.message(
      'Request password reset',
      name: 'reset_pwd_btn_txt',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link was successfully sent!`
  String get reset_pwd_info {
    return Intl.message(
      'Password reset link was successfully sent!',
      name: 'reset_pwd_info',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_pwd_title {
    return Intl.message(
      'Change password',
      name: 'change_pwd_title',
      desc: '',
      args: [],
    );
  }

  /// `Current password *`
  String get change_pwd_old_pwd {
    return Intl.message(
      'Current password *',
      name: 'change_pwd_old_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Current password is required.`
  String get change_pwd_old_pwd_required {
    return Intl.message(
      'Current password is required.',
      name: 'change_pwd_old_pwd_required',
      desc: '',
      args: [],
    );
  }

  /// `New password *`
  String get change_pwd_new_pwd {
    return Intl.message(
      'New password *',
      name: 'change_pwd_new_pwd',
      desc: '',
      args: [],
    );
  }

  /// `New password is required.`
  String get change_pwd_new_pwd_required {
    return Intl.message(
      'New password is required.',
      name: 'change_pwd_new_pwd_required',
      desc: '',
      args: [],
    );
  }

  /// `New password again *`
  String get change_pwd_new_pwd2 {
    return Intl.message(
      'New password again *',
      name: 'change_pwd_new_pwd2',
      desc: '',
      args: [],
    );
  }

  /// `New password again is required.`
  String get change_pwd_new_pwd2_required {
    return Intl.message(
      'New password again is required.',
      name: 'change_pwd_new_pwd2_required',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_pwd_btn_txt {
    return Intl.message(
      'Change password',
      name: 'change_pwd_btn_txt',
      desc: '',
      args: [],
    );
  }

  /// `Entered passwords must be same!`
  String get change_pwd_info {
    return Intl.message(
      'Entered passwords must be same!',
      name: 'change_pwd_info',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_title {
    return Intl.message(
      'Profile',
      name: 'profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Email *`
  String get profile_email {
    return Intl.message(
      'Email *',
      name: 'profile_email',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get profile_email_required {
    return Intl.message(
      'Email is required.',
      name: 'profile_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format.`
  String get profile_email_invalid {
    return Intl.message(
      'Invalid email format.',
      name: 'profile_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get profile_first_name {
    return Intl.message(
      'First Name',
      name: 'profile_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get profile_last_name {
    return Intl.message(
      'Last Name',
      name: 'profile_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get profile_btn_txt {
    return Intl.message(
      'Change password',
      name: 'profile_btn_txt',
      desc: '',
      args: [],
    );
  }

  /// `Profile successfully updated`
  String get profile_info1 {
    return Intl.message(
      'Profile successfully updated',
      name: 'profile_info1',
      desc: '',
      args: [],
    );
  }

  /// `Password successfully changed`
  String get profile_info2 {
    return Intl.message(
      'Password successfully changed',
      name: 'profile_info2',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tenants`
  String get tenants_title {
    return Intl.message(
      'Tenants',
      name: 'tenants_title',
      desc: '',
      args: [],
    );
  }

  /// `No tenants found`
  String get tenants_not_found {
    return Intl.message(
      'No tenants found',
      name: 'tenants_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Tenant`
  String get tenant_title {
    return Intl.message(
      'Tenant',
      name: 'tenant_title',
      desc: '',
      args: [],
    );
  }

  /// `Tenant details`
  String get tenant_subtitle {
    return Intl.message(
      'Tenant details',
      name: 'tenant_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Alarms`
  String get alarms {
    return Intl.message(
      'Alarms',
      name: 'alarms',
      desc: '',
      args: [],
    );
  }

  /// `Alarms`
  String get alarms_title {
    return Intl.message(
      'Alarms',
      name: 'alarms_title',
      desc: '',
      args: [],
    );
  }

  /// `No alarms found`
  String get alarms_not_found {
    return Intl.message(
      'No alarms found',
      name: 'alarms_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Clear Alarm`
  String get alarm_clear_title {
    return Intl.message(
      'Clear Alarm',
      name: 'alarm_clear_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear Alarm?`
  String get alarm_clear_info {
    return Intl.message(
      'Are you sure you want to clear Alarm?',
      name: 'alarm_clear_info',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledge Alarm`
  String get alarm_ack_title {
    return Intl.message(
      'Acknowledge Alarm',
      name: 'alarm_ack_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to acknowledge Alarm?`
  String get alarm_ack_info {
    return Intl.message(
      'Are you sure you want to acknowledge Alarm?',
      name: 'alarm_ack_info',
      desc: '',
      args: [],
    );
  }

  /// `Critical`
  String get alarm_severity_critical {
    return Intl.message(
      'Critical',
      name: 'alarm_severity_critical',
      desc: '',
      args: [],
    );
  }

  /// `Major`
  String get alarm_severity_major {
    return Intl.message(
      'Major',
      name: 'alarm_severity_major',
      desc: '',
      args: [],
    );
  }

  /// `Minor`
  String get alarm_severity_minor {
    return Intl.message(
      'Minor',
      name: 'alarm_severity_minor',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get alarm_severity_warning {
    return Intl.message(
      'Warning',
      name: 'alarm_severity_warning',
      desc: '',
      args: [],
    );
  }

  /// `Indeterminate`
  String get alarm_severity_indeterminate {
    return Intl.message(
      'Indeterminate',
      name: 'alarm_severity_indeterminate',
      desc: '',
      args: [],
    );
  }

  /// `Active Acknowledged`
  String get alarm_status_active_ack {
    return Intl.message(
      'Active Acknowledged',
      name: 'alarm_status_active_ack',
      desc: '',
      args: [],
    );
  }

  /// `Active Unacknowledged`
  String get alarm_status_active_unack {
    return Intl.message(
      'Active Unacknowledged',
      name: 'alarm_status_active_unack',
      desc: '',
      args: [],
    );
  }

  /// `Cleared Acknowledged`
  String get alarm_status_cleared_ack {
    return Intl.message(
      'Cleared Acknowledged',
      name: 'alarm_status_cleared_ack',
      desc: '',
      args: [],
    );
  }

  /// `Cleared Unacknowledged`
  String get alarm_status_cleared_unack {
    return Intl.message(
      'Cleared Unacknowledged',
      name: 'alarm_status_cleared_unack',
      desc: '',
      args: [],
    );
  }

  /// `Mobile dashboard should be configured in device profile alarm rules!`
  String get alarm_info {
    return Intl.message(
      'Mobile dashboard should be configured in device profile alarm rules!',
      name: 'alarm_info',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get devices {
    return Intl.message(
      'Devices',
      name: 'devices',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get devices_title {
    return Intl.message(
      'Devices',
      name: 'devices_title',
      desc: '',
      args: [],
    );
  }

  /// `No devices found`
  String get devices_not_found {
    return Intl.message(
      'No devices found',
      name: 'devices_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get device_title {
    return Intl.message(
      'Device',
      name: 'device_title',
      desc: '',
      args: [],
    );
  }

  /// `All devices`
  String get device_all {
    return Intl.message(
      'All devices',
      name: 'device_all',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get device_active {
    return Intl.message(
      'Active',
      name: 'device_active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get device_inactive {
    return Intl.message(
      'Inactive',
      name: 'device_inactive',
      desc: '',
      args: [],
    );
  }

  /// `Mobile dashboard should be configured in device profile!`
  String get device_info {
    return Intl.message(
      'Mobile dashboard should be configured in device profile!',
      name: 'device_info',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `System Administrator`
  String get more_sys_admin {
    return Intl.message(
      'System Administrator',
      name: 'more_sys_admin',
      desc: '',
      args: [],
    );
  }

  /// `Tenant Administrator`
  String get more_tenant_admin {
    return Intl.message(
      'Tenant Administrator',
      name: 'more_tenant_admin',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get more_customer {
    return Intl.message(
      'Customer',
      name: 'more_customer',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get more_language {
    return Intl.message(
      'Language',
      name: 'more_language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get more_logout {
    return Intl.message(
      'Log out',
      name: 'more_logout',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get language_title {
    return Intl.message(
      'Change language',
      name: 'language_title',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get language_auto_title {
    return Intl.message(
      'Auto',
      name: 'language_auto_title',
      desc: '',
      args: [],
    );
  }

  /// `Follow Operating System`
  String get language_auto_subtitle {
    return Intl.message(
      'Follow Operating System',
      name: 'language_auto_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers {
    return Intl.message(
      'Customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers_title {
    return Intl.message(
      'Customers',
      name: 'customers_title',
      desc: '',
      args: [],
    );
  }

  /// `No customers found`
  String get customers_not_found {
    return Intl.message(
      'No customers found',
      name: 'customers_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer_title {
    return Intl.message(
      'Customer',
      name: 'customer_title',
      desc: '',
      args: [],
    );
  }

  /// `Customer details`
  String get customer_subtitle {
    return Intl.message(
      'Customer details',
      name: 'customer_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assets {
    return Intl.message(
      'Assets',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assets_title {
    return Intl.message(
      'Assets',
      name: 'assets_title',
      desc: '',
      args: [],
    );
  }

  /// `No assets found`
  String get assets_not_found {
    return Intl.message(
      'No assets found',
      name: 'assets_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get asset_title {
    return Intl.message(
      'Asset',
      name: 'asset_title',
      desc: '',
      args: [],
    );
  }

  /// `Asset details`
  String get asset_subtitle {
    return Intl.message(
      'Asset details',
      name: 'asset_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get asset_name {
    return Intl.message(
      'Name',
      name: 'asset_name',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get asset_type {
    return Intl.message(
      'Type',
      name: 'asset_type',
      desc: '',
      args: [],
    );
  }

  /// `Label`
  String get asset_label {
    return Intl.message(
      'Label',
      name: 'asset_label',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to`
  String get asset_assigned_to {
    return Intl.message(
      'Assigned to',
      name: 'asset_assigned_to',
      desc: '',
      args: [],
    );
  }

  /// `Audit Logs`
  String get audit_logs {
    return Intl.message(
      'Audit Logs',
      name: 'audit_logs',
      desc: '',
      args: [],
    );
  }

  /// `Audit Logs`
  String get audit_logs_title {
    return Intl.message(
      'Audit Logs',
      name: 'audit_logs_title',
      desc: '',
      args: [],
    );
  }

  /// `No audit logs found`
  String get audit_logs_not_found {
    return Intl.message(
      'No audit logs found',
      name: 'audit_logs_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get audit_log_status_success {
    return Intl.message(
      'Success',
      name: 'audit_log_status_success',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get audit_log_status_failure {
    return Intl.message(
      'Failure',
      name: 'audit_log_status_failure',
      desc: '',
      args: [],
    );
  }

  /// `Added`
  String get audit_log_type_added {
    return Intl.message(
      'Added',
      name: 'audit_log_type_added',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get audit_log_type_deleted {
    return Intl.message(
      'Deleted',
      name: 'audit_log_type_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Updated`
  String get audit_log_type_updated {
    return Intl.message(
      'Updated',
      name: 'audit_log_type_updated',
      desc: '',
      args: [],
    );
  }

  /// `Attributes Updated`
  String get audit_log_type_attributes_updated {
    return Intl.message(
      'Attributes Updated',
      name: 'audit_log_type_attributes_updated',
      desc: '',
      args: [],
    );
  }

  /// `Attributes Deleted`
  String get audit_log_type_attributes_deleted {
    return Intl.message(
      'Attributes Deleted',
      name: 'audit_log_type_attributes_deleted',
      desc: '',
      args: [],
    );
  }

  /// `RPC Call`
  String get audit_log_type_rpc_call {
    return Intl.message(
      'RPC Call',
      name: 'audit_log_type_rpc_call',
      desc: '',
      args: [],
    );
  }

  /// `Credentials Updated`
  String get audit_log_type_credentials_updated {
    return Intl.message(
      'Credentials Updated',
      name: 'audit_log_type_credentials_updated',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Customer`
  String get audit_log_type_assigned_to_customer {
    return Intl.message(
      'Assigned to Customer',
      name: 'audit_log_type_assigned_to_customer',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned from Customer`
  String get audit_log_type_unassigned_from_customer {
    return Intl.message(
      'Unassigned from Customer',
      name: 'audit_log_type_unassigned_from_customer',
      desc: '',
      args: [],
    );
  }

  /// `Activated`
  String get audit_log_type_activated {
    return Intl.message(
      'Activated',
      name: 'audit_log_type_activated',
      desc: '',
      args: [],
    );
  }

  /// `Suspended`
  String get audit_log_type_suspended {
    return Intl.message(
      'Suspended',
      name: 'audit_log_type_suspended',
      desc: '',
      args: [],
    );
  }

  /// `Credentials read`
  String get audit_log_type_credentials_read {
    return Intl.message(
      'Credentials read',
      name: 'audit_log_type_credentials_read',
      desc: '',
      args: [],
    );
  }

  /// `Attributes read`
  String get audit_log_type_attributes_read {
    return Intl.message(
      'Attributes read',
      name: 'audit_log_type_attributes_read',
      desc: '',
      args: [],
    );
  }

  /// `Relation updated`
  String get audit_log_type_relation_add_or_update {
    return Intl.message(
      'Relation updated',
      name: 'audit_log_type_relation_add_or_update',
      desc: '',
      args: [],
    );
  }

  /// `Relation deleted`
  String get audit_log_type_relation_deleted {
    return Intl.message(
      'Relation deleted',
      name: 'audit_log_type_relation_deleted',
      desc: '',
      args: [],
    );
  }

  /// `All relation deleted`
  String get audit_log_type_relations_deleted {
    return Intl.message(
      'All relation deleted',
      name: 'audit_log_type_relations_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledged`
  String get audit_log_type_alarm_ack {
    return Intl.message(
      'Acknowledged',
      name: 'audit_log_type_alarm_ack',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get audit_log_type_alarm_clear {
    return Intl.message(
      'Cleared',
      name: 'audit_log_type_alarm_clear',
      desc: '',
      args: [],
    );
  }

  /// `Assigned from Tenant`
  String get audit_log_type_assigned_from_tenant {
    return Intl.message(
      'Assigned from Tenant',
      name: 'audit_log_type_assigned_from_tenant',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Tenant`
  String get audit_log_type_assigned_to_tenant {
    return Intl.message(
      'Assigned to Tenant',
      name: 'audit_log_type_assigned_to_tenant',
      desc: '',
      args: [],
    );
  }

  /// `Device provisioned`
  String get audit_log_type_provision_success {
    return Intl.message(
      'Device provisioned',
      name: 'audit_log_type_provision_success',
      desc: '',
      args: [],
    );
  }

  /// `Device provisioning was failed`
  String get audit_log_type_provision_failure {
    return Intl.message(
      'Device provisioning was failed',
      name: 'audit_log_type_provision_failure',
      desc: '',
      args: [],
    );
  }

  /// `Telemetry updated`
  String get audit_log_type_timeseries_updated {
    return Intl.message(
      'Telemetry updated',
      name: 'audit_log_type_timeseries_updated',
      desc: '',
      args: [],
    );
  }

  /// `Telemetry deleted`
  String get audit_log_type_timeseries_deleted {
    return Intl.message(
      'Telemetry deleted',
      name: 'audit_log_type_timeseries_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Assigned to Edge`
  String get audit_log_type_assigned_to_edge {
    return Intl.message(
      'Assigned to Edge',
      name: 'audit_log_type_assigned_to_edge',
      desc: '',
      args: [],
    );
  }

  /// `Unassigned from Edge`
  String get audit_log_type_unassigned_from_edge {
    return Intl.message(
      'Unassigned from Edge',
      name: 'audit_log_type_unassigned_from_edge',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get audit_log_type_login {
    return Intl.message(
      'Login',
      name: 'audit_log_type_login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get audit_log_type_logout {
    return Intl.message(
      'Logout',
      name: 'audit_log_type_logout',
      desc: '',
      args: [],
    );
  }

  /// `Lockout`
  String get audit_log_type_lockout {
    return Intl.message(
      'Lockout',
      name: 'audit_log_type_lockout',
      desc: '',
      args: [],
    );
  }

  /// `Audit log details`
  String get audit_log_subtitle {
    return Intl.message(
      'Audit log details',
      name: 'audit_log_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Entity type`
  String get audit_log_entity_type {
    return Intl.message(
      'Entity type',
      name: 'audit_log_entity_type',
      desc: '',
      args: [],
    );
  }

  /// `Action type`
  String get audit_log_action_type {
    return Intl.message(
      'Action type',
      name: 'audit_log_action_type',
      desc: '',
      args: [],
    );
  }

  /// `Action data`
  String get audit_log_action_data {
    return Intl.message(
      'Action data',
      name: 'audit_log_action_data',
      desc: '',
      args: [],
    );
  }

  /// `Failure details`
  String get audit_log_failure_details {
    return Intl.message(
      'Failure details',
      name: 'audit_log_failure_details',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented!`
  String get entities_not_implemented {
    return Intl.message(
      'Not implemented!',
      name: 'entities_not_implemented',
      desc: '',
      args: [],
    );
  }

  /// `Search results`
  String get entities_search_results {
    return Intl.message(
      'Search results',
      name: 'entities_search_results',
      desc: '',
      args: [],
    );
  }

  /// `The list is currently empty.`
  String get entities_list_empty {
    return Intl.message(
      'The list is currently empty.',
      name: 'entities_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get entities_try_again {
    return Intl.message(
      'Try Again',
      name: 'entities_try_again',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get entities_view_all {
    return Intl.message(
      'View all',
      name: 'entities_view_all',
      desc: '',
      args: [],
    );
  }

  /// `Requested entity does not exists.`
  String get entities_not_exists {
    return Intl.message(
      'Requested entity does not exists.',
      name: 'entities_not_exists',
      desc: '',
      args: [],
    );
  }

  /// `Tenant`
  String get entity_type_tenant {
    return Intl.message(
      'Tenant',
      name: 'entity_type_tenant',
      desc: '',
      args: [],
    );
  }

  /// `Tenant profile`
  String get entity_type_tenant_profile {
    return Intl.message(
      'Tenant profile',
      name: 'entity_type_tenant_profile',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get entity_type_customer {
    return Intl.message(
      'Customer',
      name: 'entity_type_customer',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get entity_type_user {
    return Intl.message(
      'User',
      name: 'entity_type_user',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get entity_type_dashboard {
    return Intl.message(
      'Dashboard',
      name: 'entity_type_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get entity_type_asset {
    return Intl.message(
      'Asset',
      name: 'entity_type_asset',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get entity_type_device {
    return Intl.message(
      'Device',
      name: 'entity_type_device',
      desc: '',
      args: [],
    );
  }

  /// `Device profile`
  String get entity_type_device_profile {
    return Intl.message(
      'Device profile',
      name: 'entity_type_device_profile',
      desc: '',
      args: [],
    );
  }

  /// `Alarm`
  String get entity_type_alarm {
    return Intl.message(
      'Alarm',
      name: 'entity_type_alarm',
      desc: '',
      args: [],
    );
  }

  /// `Rule chain`
  String get entity_type_rule_chain {
    return Intl.message(
      'Rule chain',
      name: 'entity_type_rule_chain',
      desc: '',
      args: [],
    );
  }

  /// `Rule node`
  String get entity_type_rule_node {
    return Intl.message(
      'Rule node',
      name: 'entity_type_rule_node',
      desc: '',
      args: [],
    );
  }

  /// `Edge`
  String get entity_type_edge {
    return Intl.message(
      'Edge',
      name: 'entity_type_edge',
      desc: '',
      args: [],
    );
  }

  /// `Entity view`
  String get entity_type_entity_view {
    return Intl.message(
      'Entity view',
      name: 'entity_type_entity_view',
      desc: '',
      args: [],
    );
  }

  /// `Widgets bundle`
  String get entity_type_widgets_bundle {
    return Intl.message(
      'Widgets bundle',
      name: 'entity_type_widgets_bundle',
      desc: '',
      args: [],
    );
  }

  /// `Widget type`
  String get entity_type_widgets_type {
    return Intl.message(
      'Widget type',
      name: 'entity_type_widgets_type',
      desc: '',
      args: [],
    );
  }

  /// `Api usage state`
  String get entity_type_api_usage_state {
    return Intl.message(
      'Api usage state',
      name: 'entity_type_api_usage_state',
      desc: '',
      args: [],
    );
  }

  /// `Resource`
  String get entity_type_resource {
    return Intl.message(
      'Resource',
      name: 'entity_type_resource',
      desc: '',
      args: [],
    );
  }

  /// `OTA package`
  String get entity_type_ota_package {
    return Intl.message(
      'OTA package',
      name: 'entity_type_ota_package',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get entity_name {
    return Intl.message(
      'Name',
      name: 'entity_name',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get entity_country {
    return Intl.message(
      'Country',
      name: 'entity_country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get entity_city {
    return Intl.message(
      'City',
      name: 'entity_city',
      desc: '',
      args: [],
    );
  }

  /// `State / Province`
  String get entity_province {
    return Intl.message(
      'State / Province',
      name: 'entity_province',
      desc: '',
      args: [],
    );
  }

  /// `Zip / Postal Code`
  String get entity_zip {
    return Intl.message(
      'Zip / Postal Code',
      name: 'entity_zip',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get entity_address {
    return Intl.message(
      'Address',
      name: 'entity_address',
      desc: '',
      args: [],
    );
  }

  /// `Address 2`
  String get entity_address2 {
    return Intl.message(
      'Address 2',
      name: 'entity_address2',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get entity_phone {
    return Intl.message(
      'Phone',
      name: 'entity_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get entity_email {
    return Intl.message(
      'Email',
      name: 'entity_email',
      desc: '',
      args: [],
    );
  }

  /// `Dashboards`
  String get dashboards_title {
    return Intl.message(
      'Dashboards',
      name: 'dashboards_title',
      desc: '',
      args: [],
    );
  }

  /// `No dashboards found`
  String get dashboards_not_found {
    return Intl.message(
      'No dashboards found',
      name: 'dashboards_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard_title {
    return Intl.message(
      'Dashboard',
      name: 'dashboard_title',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented!`
  String get dashboard_not_implemented {
    return Intl.message(
      'Not implemented!',
      name: 'dashboard_not_implemented',
      desc: '',
      args: [],
    );
  }

  /// `Deprecated`
  String get dashboard_deprecated {
    return Intl.message(
      'Deprecated',
      name: 'dashboard_deprecated',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get dashboard_public {
    return Intl.message(
      'Public',
      name: 'dashboard_public',
      desc: '',
      args: [],
    );
  }

  /// `Scan a code`
  String get scan_code {
    return Intl.message(
      'Scan a code',
      name: 'scan_code',
      desc: '',
      args: [],
    );
  }

  /// `Toggle flash`
  String get scan_toggle_flash {
    return Intl.message(
      'Toggle flash',
      name: 'scan_toggle_flash',
      desc: '',
      args: [],
    );
  }

  /// `Toggle camera`
  String get scan_toggle_camera {
    return Intl.message(
      'Toggle camera',
      name: 'scan_toggle_camera',
      desc: '',
      args: [],
    );
  }

  /// `test code`
  String get scan_test_code {
    return Intl.message(
      'test code',
      name: 'scan_test_code',
      desc: '',
      args: [],
    );
  }

  /// `Unknown actionType: `
  String get action_err_type_unknown {
    return Intl.message(
      'Unknown actionType: ',
      name: 'action_err_type_unknown',
      desc: '',
      args: [],
    );
  }

  /// `actionType is not provided!`
  String get action_err_type_not_provided {
    return Intl.message(
      'actionType is not provided!',
      name: 'action_err_type_not_provided',
      desc: '',
      args: [],
    );
  }

  /// `Unknown picture mime type.`
  String get action_err_pic_mimetype_unknown {
    return Intl.message(
      'Unknown picture mime type.',
      name: 'action_err_pic_mimetype_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Missing target latitude or longitude arguments!`
  String get action_err_position_args_missing {
    return Intl.message(
      'Missing target latitude or longitude arguments!',
      name: 'action_err_position_args_missing',
      desc: '',
      args: [],
    );
  }

  /// `Missing or invalid phone number!`
  String get action_err_phone_missing {
    return Intl.message(
      'Missing or invalid phone number!',
      name: 'action_err_phone_missing',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled.`
  String get action_err_location_service_disabled {
    return Intl.message(
      'Location services are disabled.',
      name: 'action_err_location_service_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are denied.`
  String get action_err_location_permission_denied {
    return Intl.message(
      'Location permissions are denied.',
      name: 'action_err_location_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied, we cannot request permissions.`
  String get action_err_location_permission_denied2 {
    return Intl.message(
      'Location permissions are permanently denied, we cannot request permissions.',
      name: 'action_err_location_permission_denied2',
      desc: '',
      args: [],
    );
  }

  /// `Verify your identity`
  String get two_factor_verify_your_identity {
    return Intl.message(
      'Verify your identity',
      name: 'two_factor_verify_your_identity',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get two_factor_continue_text {
    return Intl.message(
      'Continue',
      name: 'two_factor_continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get two_factor_resend_code {
    return Intl.message(
      'Resend code',
      name: 'two_factor_resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in {time,plural, =1{1 second}other{{time} seconds}}`
  String two_factor_resendCode_wait(num time) {
    return Intl.message(
      'Resend code in ${Intl.plural(time, one: '1 second', other: '$time seconds')}',
      name: 'two_factor_resendCode_wait',
      desc: '',
      args: [time],
    );
  }

  /// `Please enter the security code from your authenticator app.`
  String get two_factor_totp_auth_description {
    return Intl.message(
      'Please enter the security code from your authenticator app.',
      name: 'two_factor_totp_auth_description',
      desc: '',
      args: [],
    );
  }

  /// `A security code has been sent to your phone at {contact}.`
  String two_factor_sms_auth_description(Object contact) {
    return Intl.message(
      'A security code has been sent to your phone at $contact.',
      name: 'two_factor_sms_auth_description',
      desc: '',
      args: [contact],
    );
  }

  /// `A security code has been sent to your email address at {contact}.`
  String two_factor_email_auth_description(Object contact) {
    return Intl.message(
      'A security code has been sent to your email address at $contact.',
      name: 'two_factor_email_auth_description',
      desc: '',
      args: [contact],
    );
  }

  /// `Please enter one of your backup codes.`
  String get two_factor_backup_code_auth_description {
    return Intl.message(
      'Please enter one of your backup codes.',
      name: 'two_factor_backup_code_auth_description',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code format`
  String get two_factor_verification_code_invalid {
    return Intl.message(
      'Invalid verification code format',
      name: 'two_factor_verification_code_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get two_factor_topt_auth_placeholder {
    return Intl.message(
      'Code',
      name: 'two_factor_topt_auth_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `SMS code`
  String get two_factor_sms_auth_placeholder {
    return Intl.message(
      'SMS code',
      name: 'two_factor_sms_auth_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Email code`
  String get two_factor_email_auth_placeholder {
    return Intl.message(
      'Email code',
      name: 'two_factor_email_auth_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Backup code`
  String get two_factor_backup_code_auth_placeholder {
    return Intl.message(
      'Backup code',
      name: 'two_factor_backup_code_auth_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is incorrect`
  String get two_factor_verification_code_incorrect {
    return Intl.message(
      'Verification code is incorrect',
      name: 'two_factor_verification_code_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests check verification code`
  String get two_factor_verification_code_many_request {
    return Intl.message(
      'Too many requests check verification code',
      name: 'two_factor_verification_code_many_request',
      desc: '',
      args: [],
    );
  }

  /// `Try another way`
  String get two_factor_try_another_way {
    return Intl.message(
      'Try another way',
      name: 'two_factor_try_another_way',
      desc: '',
      args: [],
    );
  }

  /// `Select a way to verify`
  String get two_factor_select_way_to_verify {
    return Intl.message(
      'Select a way to verify',
      name: 'two_factor_select_way_to_verify',
      desc: '',
      args: [],
    );
  }

  /// `Authenticator app`
  String get two_factor_mfa_provider_topt {
    return Intl.message(
      'Authenticator app',
      name: 'two_factor_mfa_provider_topt',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get two_factor_mfa_provider_sms {
    return Intl.message(
      'SMS',
      name: 'two_factor_mfa_provider_sms',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get two_factor_mfa_provider_email {
    return Intl.message(
      'Email',
      name: 'two_factor_mfa_provider_email',
      desc: '',
      args: [],
    );
  }

  /// `Backup code`
  String get two_factor_mfa_provider_backup_code {
    return Intl.message(
      'Backup code',
      name: 'two_factor_mfa_provider_backup_code',
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
      Locale.fromSubtags(languageCode: 'zh'),
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

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

  static String m0(clientName) => "Login with ${clientName}";

  static String m1(contact) =>
      "A security code has been sent to your email address at ${contact}.";

  static String m2(time) =>
      "Resend code in ${Intl.plural(time, one: '1 second', other: '${time} seconds')}";

  static String m3(contact) =>
      "A security code has been sent to your phone at ${contact}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_err_location_permission_denied":
            MessageLookupByLibrary.simpleMessage(
                "Location permissions are denied."),
        "action_err_location_permission_denied2":
            MessageLookupByLibrary.simpleMessage(
                "Location permissions are permanently denied, we cannot request permissions."),
        "action_err_location_service_disabled":
            MessageLookupByLibrary.simpleMessage(
                "Location services are disabled."),
        "action_err_phone_missing": MessageLookupByLibrary.simpleMessage(
            "Missing or invalid phone number!"),
        "action_err_pic_mimetype_unknown":
            MessageLookupByLibrary.simpleMessage("Unknown picture mime type."),
        "action_err_position_args_missing":
            MessageLookupByLibrary.simpleMessage(
                "Missing target latitude or longitude arguments!"),
        "action_err_type_not_provided":
            MessageLookupByLibrary.simpleMessage("actionType is not provided!"),
        "action_err_type_unknown":
            MessageLookupByLibrary.simpleMessage("Unknown actionType: "),
        "alarm_ack_info": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to acknowledge Alarm?"),
        "alarm_ack_title":
            MessageLookupByLibrary.simpleMessage("Acknowledge Alarm"),
        "alarm_clear_info": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to clear Alarm?"),
        "alarm_clear_title":
            MessageLookupByLibrary.simpleMessage("Clear Alarm"),
        "alarm_info": MessageLookupByLibrary.simpleMessage(
            "Mobile dashboard should be configured in device profile alarm rules!"),
        "alarm_severity_critical":
            MessageLookupByLibrary.simpleMessage("Critical"),
        "alarm_severity_indeterminate":
            MessageLookupByLibrary.simpleMessage("Indeterminate"),
        "alarm_severity_major": MessageLookupByLibrary.simpleMessage("Major"),
        "alarm_severity_minor": MessageLookupByLibrary.simpleMessage("Minor"),
        "alarm_severity_warning":
            MessageLookupByLibrary.simpleMessage("Warning"),
        "alarm_status_active_ack":
            MessageLookupByLibrary.simpleMessage("Active Acknowledged"),
        "alarm_status_active_unack":
            MessageLookupByLibrary.simpleMessage("Active Unacknowledged"),
        "alarm_status_cleared_ack":
            MessageLookupByLibrary.simpleMessage("Cleared Acknowledged"),
        "alarm_status_cleared_unack":
            MessageLookupByLibrary.simpleMessage("Cleared Unacknowledged"),
        "alarms": MessageLookupByLibrary.simpleMessage("Alarms"),
        "alarms_not_found":
            MessageLookupByLibrary.simpleMessage("No alarms found"),
        "alarms_title": MessageLookupByLibrary.simpleMessage("Alarms"),
        "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
        "asset_assigned_to":
            MessageLookupByLibrary.simpleMessage("Assigned to"),
        "asset_label": MessageLookupByLibrary.simpleMessage("Label"),
        "asset_name": MessageLookupByLibrary.simpleMessage("Name"),
        "asset_subtitle": MessageLookupByLibrary.simpleMessage("Asset details"),
        "asset_title": MessageLookupByLibrary.simpleMessage("Asset"),
        "asset_type": MessageLookupByLibrary.simpleMessage("Type"),
        "assets": MessageLookupByLibrary.simpleMessage("Assets"),
        "assets_not_found":
            MessageLookupByLibrary.simpleMessage("No assets found"),
        "assets_title": MessageLookupByLibrary.simpleMessage("Assets"),
        "audit_log_action_data":
            MessageLookupByLibrary.simpleMessage("Action data"),
        "audit_log_action_type":
            MessageLookupByLibrary.simpleMessage("Action type"),
        "audit_log_entity_type":
            MessageLookupByLibrary.simpleMessage("Entity type"),
        "audit_log_failure_details":
            MessageLookupByLibrary.simpleMessage("Failure details"),
        "audit_log_status_failure":
            MessageLookupByLibrary.simpleMessage("Failure"),
        "audit_log_status_success":
            MessageLookupByLibrary.simpleMessage("Success"),
        "audit_log_subtitle":
            MessageLookupByLibrary.simpleMessage("Audit log details"),
        "audit_log_type_activated":
            MessageLookupByLibrary.simpleMessage("Activated"),
        "audit_log_type_added": MessageLookupByLibrary.simpleMessage("Added"),
        "audit_log_type_alarm_ack":
            MessageLookupByLibrary.simpleMessage("Acknowledged"),
        "audit_log_type_alarm_clear":
            MessageLookupByLibrary.simpleMessage("Cleared"),
        "audit_log_type_assigned_from_tenant":
            MessageLookupByLibrary.simpleMessage("Assigned from Tenant"),
        "audit_log_type_assigned_to_customer":
            MessageLookupByLibrary.simpleMessage("Assigned to Customer"),
        "audit_log_type_assigned_to_edge":
            MessageLookupByLibrary.simpleMessage("Assigned to Edge"),
        "audit_log_type_assigned_to_tenant":
            MessageLookupByLibrary.simpleMessage("Assigned to Tenant"),
        "audit_log_type_attributes_deleted":
            MessageLookupByLibrary.simpleMessage("Attributes Deleted"),
        "audit_log_type_attributes_read":
            MessageLookupByLibrary.simpleMessage("Attributes read"),
        "audit_log_type_attributes_updated":
            MessageLookupByLibrary.simpleMessage("Attributes Updated"),
        "audit_log_type_credentials_read":
            MessageLookupByLibrary.simpleMessage("Credentials read"),
        "audit_log_type_credentials_updated":
            MessageLookupByLibrary.simpleMessage("Credentials Updated"),
        "audit_log_type_deleted":
            MessageLookupByLibrary.simpleMessage("Deleted"),
        "audit_log_type_lockout":
            MessageLookupByLibrary.simpleMessage("Lockout"),
        "audit_log_type_login": MessageLookupByLibrary.simpleMessage("Login"),
        "audit_log_type_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "audit_log_type_provision_failure":
            MessageLookupByLibrary.simpleMessage(
                "Device provisioning was failed"),
        "audit_log_type_provision_success":
            MessageLookupByLibrary.simpleMessage("Device provisioned"),
        "audit_log_type_relation_add_or_update":
            MessageLookupByLibrary.simpleMessage("Relation updated"),
        "audit_log_type_relation_deleted":
            MessageLookupByLibrary.simpleMessage("Relation deleted"),
        "audit_log_type_relations_deleted":
            MessageLookupByLibrary.simpleMessage("All relation deleted"),
        "audit_log_type_rpc_call":
            MessageLookupByLibrary.simpleMessage("RPC Call"),
        "audit_log_type_suspended":
            MessageLookupByLibrary.simpleMessage("Suspended"),
        "audit_log_type_timeseries_deleted":
            MessageLookupByLibrary.simpleMessage("Telemetry deleted"),
        "audit_log_type_timeseries_updated":
            MessageLookupByLibrary.simpleMessage("Telemetry updated"),
        "audit_log_type_unassigned_from_customer":
            MessageLookupByLibrary.simpleMessage("Unassigned from Customer"),
        "audit_log_type_unassigned_from_edge":
            MessageLookupByLibrary.simpleMessage("Unassigned from Edge"),
        "audit_log_type_updated":
            MessageLookupByLibrary.simpleMessage("Updated"),
        "audit_logs": MessageLookupByLibrary.simpleMessage("Audit Logs"),
        "audit_logs_not_found":
            MessageLookupByLibrary.simpleMessage("No audit logs found"),
        "audit_logs_title": MessageLookupByLibrary.simpleMessage("Audit Logs"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "change_pwd_btn_txt":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "change_pwd_info": MessageLookupByLibrary.simpleMessage(
            "Entered passwords must be same!"),
        "change_pwd_new_pwd":
            MessageLookupByLibrary.simpleMessage("New password *"),
        "change_pwd_new_pwd2":
            MessageLookupByLibrary.simpleMessage("New password again *"),
        "change_pwd_new_pwd2_required": MessageLookupByLibrary.simpleMessage(
            "New password again is required."),
        "change_pwd_new_pwd_required":
            MessageLookupByLibrary.simpleMessage("New password is required."),
        "change_pwd_old_pwd":
            MessageLookupByLibrary.simpleMessage("Current password *"),
        "change_pwd_old_pwd_required": MessageLookupByLibrary.simpleMessage(
            "Current password is required."),
        "change_pwd_title":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "context_conn_err_info":
            MessageLookupByLibrary.simpleMessage("Failed to connect to server"),
        "context_conn_err_title":
            MessageLookupByLibrary.simpleMessage("Connection error"),
        "customer_subtitle":
            MessageLookupByLibrary.simpleMessage("Customer details"),
        "customer_title": MessageLookupByLibrary.simpleMessage("Customer"),
        "customers": MessageLookupByLibrary.simpleMessage("Customers"),
        "customers_not_found":
            MessageLookupByLibrary.simpleMessage("No customers found"),
        "customers_title": MessageLookupByLibrary.simpleMessage("Customers"),
        "dashboard_deprecated":
            MessageLookupByLibrary.simpleMessage("Deprecated"),
        "dashboard_not_implemented":
            MessageLookupByLibrary.simpleMessage("Not implemented!"),
        "dashboard_public": MessageLookupByLibrary.simpleMessage("Public"),
        "dashboard_title": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "dashboards_not_found":
            MessageLookupByLibrary.simpleMessage("No dashboards found"),
        "dashboards_title": MessageLookupByLibrary.simpleMessage("Dashboards"),
        "device_active": MessageLookupByLibrary.simpleMessage("Active"),
        "device_all": MessageLookupByLibrary.simpleMessage("All devices"),
        "device_inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "device_info": MessageLookupByLibrary.simpleMessage(
            "Mobile dashboard should be configured in device profile!"),
        "device_title": MessageLookupByLibrary.simpleMessage("Device"),
        "devices": MessageLookupByLibrary.simpleMessage("Devices"),
        "devices_not_found":
            MessageLookupByLibrary.simpleMessage("No devices found"),
        "devices_title": MessageLookupByLibrary.simpleMessage("Devices"),
        "entities_list_empty": MessageLookupByLibrary.simpleMessage(
            "The list is currently empty."),
        "entities_not_exists": MessageLookupByLibrary.simpleMessage(
            "Requested entity does not exists."),
        "entities_not_implemented":
            MessageLookupByLibrary.simpleMessage("Not implemented!"),
        "entities_search_results":
            MessageLookupByLibrary.simpleMessage("Search results"),
        "entities_try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
        "entities_view_all": MessageLookupByLibrary.simpleMessage("View all"),
        "entity_address": MessageLookupByLibrary.simpleMessage("Address"),
        "entity_address2": MessageLookupByLibrary.simpleMessage("Address 2"),
        "entity_city": MessageLookupByLibrary.simpleMessage("City"),
        "entity_country": MessageLookupByLibrary.simpleMessage("Country"),
        "entity_email": MessageLookupByLibrary.simpleMessage("Email"),
        "entity_name": MessageLookupByLibrary.simpleMessage("Name"),
        "entity_phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "entity_province":
            MessageLookupByLibrary.simpleMessage("State / Province"),
        "entity_type_alarm": MessageLookupByLibrary.simpleMessage("Alarm"),
        "entity_type_api_usage_state":
            MessageLookupByLibrary.simpleMessage("Api usage state"),
        "entity_type_asset": MessageLookupByLibrary.simpleMessage("Asset"),
        "entity_type_customer":
            MessageLookupByLibrary.simpleMessage("Customer"),
        "entity_type_dashboard":
            MessageLookupByLibrary.simpleMessage("Dashboard"),
        "entity_type_device": MessageLookupByLibrary.simpleMessage("Device"),
        "entity_type_device_profile":
            MessageLookupByLibrary.simpleMessage("Device profile"),
        "entity_type_edge": MessageLookupByLibrary.simpleMessage("Edge"),
        "entity_type_entity_view":
            MessageLookupByLibrary.simpleMessage("Entity view"),
        "entity_type_ota_package":
            MessageLookupByLibrary.simpleMessage("OTA package"),
        "entity_type_resource":
            MessageLookupByLibrary.simpleMessage("Resource"),
        "entity_type_rule_chain":
            MessageLookupByLibrary.simpleMessage("Rule chain"),
        "entity_type_rule_node":
            MessageLookupByLibrary.simpleMessage("Rule node"),
        "entity_type_tenant": MessageLookupByLibrary.simpleMessage("Tenant"),
        "entity_type_tenant_profile":
            MessageLookupByLibrary.simpleMessage("Tenant profile"),
        "entity_type_user": MessageLookupByLibrary.simpleMessage("User"),
        "entity_type_widgets_bundle":
            MessageLookupByLibrary.simpleMessage("Widgets bundle"),
        "entity_type_widgets_type":
            MessageLookupByLibrary.simpleMessage("Widget type"),
        "entity_zip": MessageLookupByLibrary.simpleMessage("Zip / Postal Code"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "login_btn_txt": MessageLookupByLibrary.simpleMessage("Login"),
        "login_email": MessageLookupByLibrary.simpleMessage("Email"),
        "login_email_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid email format."),
        "login_email_required":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "login_or": MessageLookupByLibrary.simpleMessage("OR"),
        "login_pwd": MessageLookupByLibrary.simpleMessage("Password"),
        "login_pwd_forgot":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "login_pwd_required":
            MessageLookupByLibrary.simpleMessage("Password is required."),
        "login_welcome":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "login_with": m0,
        "login_with2": MessageLookupByLibrary.simpleMessage("LOGIN WITH"),
        "logoDefaultValue":
            MessageLookupByLibrary.simpleMessage("ThingsBoard Logo"),
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "more_customer": MessageLookupByLibrary.simpleMessage("Customer"),
        "more_logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "more_sys_admin":
            MessageLookupByLibrary.simpleMessage("System Administrator"),
        "more_tenant_admin":
            MessageLookupByLibrary.simpleMessage("Tenant Administrator"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "profile_btn_txt":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "profile_email": MessageLookupByLibrary.simpleMessage("Email *"),
        "profile_email_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid email format."),
        "profile_email_required":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "profile_first_name":
            MessageLookupByLibrary.simpleMessage("First Name"),
        "profile_info1": MessageLookupByLibrary.simpleMessage(
            "Profile successfully updated"),
        "profile_info2": MessageLookupByLibrary.simpleMessage(
            "Password successfully changed"),
        "profile_last_name": MessageLookupByLibrary.simpleMessage("Last Name"),
        "profile_title": MessageLookupByLibrary.simpleMessage("Profile"),
        "reset_pwd_btn_txt":
            MessageLookupByLibrary.simpleMessage("Request password reset"),
        "reset_pwd_email": MessageLookupByLibrary.simpleMessage("Email *"),
        "reset_pwd_email_invalid":
            MessageLookupByLibrary.simpleMessage("Invalid email format."),
        "reset_pwd_email_required":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "reset_pwd_info": MessageLookupByLibrary.simpleMessage(
            "Password reset link was successfully sent!"),
        "reset_pwd_tips": MessageLookupByLibrary.simpleMessage(
            "Enter the email address associated with your account and we\'ll send an email with the password reset link"),
        "reset_pwd_title":
            MessageLookupByLibrary.simpleMessage("Reset password"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "route_not_defined":
            MessageLookupByLibrary.simpleMessage("Route not defined: "),
        "route_not_found": MessageLookupByLibrary.simpleMessage("Not Found"),
        "scan_code": MessageLookupByLibrary.simpleMessage("Scan a code"),
        "scan_test_code": MessageLookupByLibrary.simpleMessage("test code"),
        "scan_toggle_camera":
            MessageLookupByLibrary.simpleMessage("Toggle camera"),
        "scan_toggle_flash":
            MessageLookupByLibrary.simpleMessage("Toggle flash"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "tenant_subtitle":
            MessageLookupByLibrary.simpleMessage("Tenant details"),
        "tenant_title": MessageLookupByLibrary.simpleMessage("Tenant"),
        "tenants_not_found":
            MessageLookupByLibrary.simpleMessage("No tenants found"),
        "tenants_title": MessageLookupByLibrary.simpleMessage("Tenants"),
        "two_factor_backup_code_auth_description":
            MessageLookupByLibrary.simpleMessage(
                "Please enter one of your backup codes."),
        "two_factor_backup_code_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("Backup code"),
        "two_factor_continue_text":
            MessageLookupByLibrary.simpleMessage("Continue"),
        "two_factor_email_auth_description": m1,
        "two_factor_email_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("Email code"),
        "two_factor_mfa_provider_backup_code":
            MessageLookupByLibrary.simpleMessage("Backup code"),
        "two_factor_mfa_provider_email":
            MessageLookupByLibrary.simpleMessage("Email"),
        "two_factor_mfa_provider_sms":
            MessageLookupByLibrary.simpleMessage("SMS"),
        "two_factor_mfa_provider_topt":
            MessageLookupByLibrary.simpleMessage("Authenticator app"),
        "two_factor_resendCode_wait": m2,
        "two_factor_resend_code":
            MessageLookupByLibrary.simpleMessage("Resend code"),
        "two_factor_select_way_to_verify":
            MessageLookupByLibrary.simpleMessage("Select a way to verify"),
        "two_factor_sms_auth_description": m3,
        "two_factor_sms_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("SMS code"),
        "two_factor_topt_auth_placeholder":
            MessageLookupByLibrary.simpleMessage("Code"),
        "two_factor_totp_auth_description":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the security code from your authenticator app."),
        "two_factor_try_another_way":
            MessageLookupByLibrary.simpleMessage("Try another way"),
        "two_factor_verification_code_incorrect":
            MessageLookupByLibrary.simpleMessage(
                "Verification code is incorrect"),
        "two_factor_verification_code_invalid":
            MessageLookupByLibrary.simpleMessage(
                "Invalid verification code format"),
        "two_factor_verification_code_many_request":
            MessageLookupByLibrary.simpleMessage(
                "Too many requests check verification code"),
        "two_factor_verify_your_identity":
            MessageLookupByLibrary.simpleMessage("Verify your identity"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}

import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

extension EntityTypeTranslationUtils on EntityType {
String getTranslatedEntityType( BuildContext context) {
  return switch (this) {
    EntityType.TENANT => S.of(context).tenant,
    
    EntityType.TENANT_PROFILE => S.of(context).tenantProfile,
    
    EntityType.CUSTOMER => S.of(context).customer,
    
    EntityType.USER => S.of(context).user,
    
    EntityType.DASHBOARD => S.of(context).dashboards(1),
    
    EntityType.ASSET => S.of(context).asset,
    
    EntityType.DEVICE => S.of(context).devices(1),
    
    EntityType.DEVICE_PROFILE => S.of(context).deviceProfile,
    
    EntityType.ASSET_PROFILE => S.of(context).assetProfile,
    
    EntityType.ALARM => S.of(context).alarms(1),
    
    EntityType.RULE_CHAIN => S.of(context).ruleChain,
    
    EntityType.RULE_NODE => S.of(context).ruleNode,
    
    EntityType.EDGE => S.of(context).edge,
    
    EntityType.ENTITY_VIEW => S.of(context).entityView,
    
    EntityType.WIDGETS_BUNDLE => S.of(context).widgetsBundle,
    
    EntityType.WIDGET_TYPE => S.of(context).widgetType,
    
    EntityType.API_USAGE_STATE => S.of(context).apiUsageState,
    
    EntityType.TB_RESOURCE => S.of(context).tbResource,
    
    EntityType.OTA_PACKAGE => S.of(context).otaPackage,
    
    EntityType.RPC => S.of(context).rpc,
    
    EntityType.QUEUE => S.of(context).queue,
    
    EntityType.NOTIFICATION_TARGET => S.of(context).notificationTarget,
    
    EntityType.NOTIFICATION_TEMPLATE => S.of(context).notificationTemplate,
    
    EntityType.NOTIFICATION_REQUEST => S.of(context).notificationRequest,
    
    EntityType.NOTIFICATION => S.of(context).notifications(1),
    
    EntityType.NOTIFICATION_RULE => S.of(context).notificationRule,
  };
}
}

extension AlarmStatusTranslationUtils on AlarmStatus {
  String getTranslatedAlarmStatus(BuildContext context) {
    return switch (this) {
      AlarmStatus.ACTIVE_ACK => '${S.of(context).active} ${S.of(context).acknowledged}',
      AlarmStatus.ACTIVE_UNACK => '${S.of(context).active} ${S.of(context).unacknowledged}',
      AlarmStatus.CLEARED_ACK => '${S.of(context).cleared} ${S.of(context).acknowledged}',
      AlarmStatus.CLEARED_UNACK => '${S.of(context).cleared} ${S.of(context).unacknowledged}',
    };
  }
}

extension AlarmSeverityTranslationUtils on AlarmSeverity {
  String getTranslatedAlarmSeverity(BuildContext context) {
    return switch (this) {
      AlarmSeverity.CRITICAL => S.of(context).critical,
      AlarmSeverity.MAJOR => S.of(context).major,
      AlarmSeverity.MINOR => S.of(context).minor,
      AlarmSeverity.WARNING => S.of(context).warning,
      AlarmSeverity.INDETERMINATE => S.of(context).indeterminate,
    };
  }
}

extension ActionStatusTranslationUtils on ActionStatus {
  String getTranslatedActionStatus(BuildContext context) {
    return switch (this) {
      ActionStatus.SUCCESS => S.of(context).actionStatusSuccess,
      ActionStatus.FAILURE => S.of(context).actionStatusFailure,
    };
  }
}

extension ActionTypeTranslationUtils on ActionType {
  String getTranslatedActionType(BuildContext context) {
    return switch (this) {
      ActionType.ADDED => S.of(context).actionTypeAdded,
      ActionType.DELETED => S.of(context).actionTypeDeleted,
      ActionType.UPDATED => S.of(context).actionTypeUpdated,
      ActionType.ATTRIBUTES_UPDATED => S.of(context).actionTypeAttributesUpdated,
      ActionType.ATTRIBUTES_DELETED => S.of(context).actionTypeAttributesDeleted,
      ActionType.RPC_CALL => S.of(context).actionTypeRpcCall,
      ActionType.CREDENTIALS_UPDATED => S.of(context).actionTypeCredentialsUpdated,
      ActionType.ASSIGNED_TO_CUSTOMER => S.of(context).actionTypeAssignedToCustomer,
      ActionType.UNASSIGNED_FROM_CUSTOMER => S.of(context).actionTypeUnassignedFromCustomer,
      ActionType.ACTIVATED => S.of(context).actionTypeActivated,
      ActionType.SUSPENDED => S.of(context).actionTypeSuspended,
      ActionType.CREDENTIALS_READ => S.of(context).actionTypeCredentialsRead,
      ActionType.ATTRIBUTES_READ => S.of(context).actionTypeAttributesRead,
      ActionType.RELATION_ADD_OR_UPDATE => S.of(context).actionTypeRelationAddOrUpdate,
      ActionType.RELATION_DELETED => S.of(context).actionTypeRelationDeleted,
      ActionType.RELATIONS_DELETED => S.of(context).actionTypeRelationsDeleted,
      ActionType.ALARM_ACK => S.of(context).actionTypeAlarmAck,
      ActionType.ALARM_CLEAR => S.of(context).actionTypeAlarmClear,
      ActionType.ALARM_DELETE => S.of(context).actionTypeAlarmDelete,
      ActionType.ALARM_ASSIGNED => S.of(context).actionTypeAlarmAssigned,
      ActionType.ALARM_UNASSIGNED => S.of(context).actionTypeAlarmUnassigned,
      ActionType.LOGIN => S.of(context).actionTypeLogin,
      ActionType.LOGOUT => S.of(context).actionTypeLogout,
      ActionType.LOCKOUT => S.of(context).actionTypeLockout,
      ActionType.ASSIGNED_FROM_TENANT => S.of(context).actionTypeAssignedFromTenant,
      ActionType.ASSIGNED_TO_TENANT => S.of(context).actionTypeAssignedToTenant,
      ActionType.PROVISION_SUCCESS => S.of(context).actionTypeProvisionSuccess,
      ActionType.PROVISION_FAILURE => S.of(context).actionTypeProvisionFailure,
      ActionType.TIMESERIES_UPDATED => S.of(context).actionTypeTimeseriesUpdated,
      ActionType.TIMESERIES_DELETED => S.of(context).actionTypeTimeseriesDeleted,
      ActionType.ASSIGNED_TO_EDGE => S.of(context).actionTypeAssignedToEdge,
      ActionType.UNASSIGNED_FROM_EDGE => S.of(context).actionTypeUnassignedFromEdge,
      ActionType.ADDED_COMMENT => S.of(context).actionTypeAddedComment,
      ActionType.UPDATED_COMMENT => S.of(context).actionTypeUpdatedComment,
      ActionType.DELETED_COMMENT => S.of(context).actionTypeDeletedComment,
      ActionType.SMS_SENT => S.of(context).actionTypeSmsSent,
    };
  }
}
typedef TranslationBuilder = String Function(BuildContext context);
typedef TranslatedDialogBuilder = DialogContent Function(BuildContext context);

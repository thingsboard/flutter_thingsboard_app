import 'package:thingsboard_client/thingsboard_client.dart';

abstract class EntityQueryApi {
  static final activeDeviceKeyFilter = KeyFilter(
      key: EntityKey(type: EntityKeyType.ATTRIBUTE, key: 'active'),
      valueType: EntityKeyValueType.BOOLEAN,
      predicate: BooleanFilterPredicate(
          operation: BooleanOperation.EQUAL,
          value: FilterPredicateValue(true)));

  static final inactiveDeviceKeyFilter = KeyFilter(
      key: EntityKey(type: EntityKeyType.ATTRIBUTE, key: 'active'),
      valueType: EntityKeyValueType.BOOLEAN,
      predicate: BooleanFilterPredicate(
          operation: BooleanOperation.EQUAL,
          value: FilterPredicateValue(false)));

  static final defaultDeviceFields = <EntityKey>[
    EntityKey(type: EntityKeyType.ENTITY_FIELD, key: 'name'),
    EntityKey(type: EntityKeyType.ENTITY_FIELD, key: 'type'),
    EntityKey(type: EntityKeyType.ENTITY_FIELD, key: 'label'),
    EntityKey(type: EntityKeyType.ENTITY_FIELD, key: 'createdTime')
  ];

  static final defaultDeviceAttributes = <EntityKey>[
    EntityKey(type: EntityKeyType.ATTRIBUTE, key: 'active')
  ];

  static Future<int> countDevices(ThingsboardClient tbClient,
      {String? deviceType, bool? active}) {
    EntityFilter deviceFilter;
    if (deviceType != null) {
      deviceFilter =
          DeviceTypeFilter(deviceType: deviceType, deviceNameFilter: '');
    } else {
      deviceFilter = EntityTypeFilter(entityType: EntityType.DEVICE);
    }
    EntityCountQuery deviceCountQuery =
        EntityCountQuery(entityFilter: deviceFilter);
    if (active != null) {
      deviceCountQuery.keyFilters = [
        active ? activeDeviceKeyFilter : inactiveDeviceKeyFilter
      ];
    }
    return tbClient
        .getEntityQueryService()
        .countEntitiesByQuery(deviceCountQuery);
  }

  static EntityDataQuery createDefaultDeviceQuery(
      {int pageSize = 20,
      String? searchText,
      String? deviceType,
      bool? active}) {
    EntityFilter deviceFilter;
    List<KeyFilter>? keyFilters;
    if (deviceType != null) {
      deviceFilter =
          DeviceTypeFilter(deviceType: deviceType, deviceNameFilter: '');
    } else {
      deviceFilter = EntityTypeFilter(entityType: EntityType.DEVICE);
    }
    if (active != null) {
      keyFilters = [active ? activeDeviceKeyFilter : inactiveDeviceKeyFilter];
    }
    return EntityDataQuery(
        entityFilter: deviceFilter,
        keyFilters: keyFilters,
        entityFields: defaultDeviceFields,
        latestValues: defaultDeviceAttributes,
        pageLink: EntityDataPageLink(
            pageSize: pageSize,
            textSearch: searchText,
            sortOrder: EntityDataSortOrder(
                key: EntityKey(
                    type: EntityKeyType.ENTITY_FIELD, key: 'createdTime'),
                direction: EntityDataSortOrderDirection.DESC)));
  }
}

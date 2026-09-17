import 'package:built_collection/built_collection.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract class EntityQueryApi {
  static final activeDeviceKeyFilter = KeyFilter(
    (b) =>
        b
          ..key =
              EntityKey(
                (b) =>
                    b
                      ..type = EntityKeyType.ATTRIBUTE
                      ..key = 'active',
              ).toBuilder()
          ..valueType = EntityKeyValueType.BOOLEAN
          ..predicate = BooleanFilterPredicate(
            (b) =>
                b
                  ..type = 'BOOLEAN'
                  ..operation = BooleanOperation.EQUAL
                  ..value =
                      FilterPredicateValueBoolean(
                        (b) => b..defaultValue = true,
                      ).toBuilder(),
          ),
  );

  static final inactiveDeviceKeyFilter = KeyFilter(
    (b) =>
        b
          ..key =
              EntityKey(
                (b) =>
                    b
                      ..type = EntityKeyType.ATTRIBUTE
                      ..key = 'active',
              ).toBuilder()
          ..valueType = EntityKeyValueType.BOOLEAN
          ..predicate = BooleanFilterPredicate(
            (b) =>
                b
                  ..type = 'BOOLEAN'
                  ..operation = BooleanOperation.EQUAL
                  ..value =
                      FilterPredicateValueBoolean(
                        (b) => b..defaultValue = false,
                      ).toBuilder(),
          ),
  );

  static final defaultDeviceFields = BuiltList<EntityKey>([
    EntityKey(
      (b) =>
          b
            ..type = EntityKeyType.ENTITY_FIELD
            ..key = 'name',
    ),
    EntityKey(
      (b) =>
          b
            ..type = EntityKeyType.ENTITY_FIELD
            ..key = 'type',
    ),
    EntityKey(
      (b) =>
          b
            ..type = EntityKeyType.ENTITY_FIELD
            ..key = 'label',
    ),
    EntityKey(
      (b) =>
          b
            ..type = EntityKeyType.ENTITY_FIELD
            ..key = 'createdTime',
    ),
  ]);

  static final defaultDeviceAttributes = BuiltList<EntityKey>([
    EntityKey(
      (b) =>
          b
            ..type = EntityKeyType.ATTRIBUTE
            ..key = 'active',
    ),
  ]);

  static Future<int> countDevices(
    ThingsboardClient tbClient, {
    String? deviceType,
    bool? active,
  }) async {
    final EntityFilter deviceFilter =
        deviceType != null
            ? DeviceTypeFilter(
              (b) =>
                  b
                    ..type = 'deviceType'
                    ..deviceTypes = ListBuilder<String>([deviceType])
                    ..deviceNameFilter = '',
            )
            : EntityTypeFilter(
              (b) =>
                  b
                    ..type = 'entityType'
                    ..entityType = EntityType.DEVICE,
            );

    BuiltList<KeyFilter>? keyFilters;
    if (active != null) {
      keyFilters = BuiltList<KeyFilter>([
        if (active) activeDeviceKeyFilter else inactiveDeviceKeyFilter,
      ]);
    }

    final deviceCountQuery = EntityCountQuery(
      (b) =>
          b
            ..entityFilter = deviceFilter
            ..keyFilters = keyFilters?.toBuilder(),
    );

    final response = await tbClient
        .getEntityQueryControllerApi()
        .countEntitiesByQuery(entityCountQuery: deviceCountQuery);
    return response.data ?? 0;
  }

  static EntityDataQuery createDefaultDeviceQuery({
    int pageSize = 20,
    String? searchText,
    String? deviceType,
    bool? active,
  }) {
    final EntityFilter deviceFilter =
        deviceType != null
            ? DeviceTypeFilter(
              (b) =>
                  b
                    ..type = 'deviceType'
                    ..deviceTypes = ListBuilder<String>([deviceType])
                    ..deviceNameFilter = '',
            )
            : EntityTypeFilter(
              (b) =>
                  b
                    ..type = 'entityType'
                    ..entityType = EntityType.DEVICE,
            );

    BuiltList<KeyFilter>? keyFilters;
    if (active != null) {
      keyFilters = BuiltList<KeyFilter>([
        if (active) activeDeviceKeyFilter else inactiveDeviceKeyFilter,
      ]);
    }

    return EntityDataQuery(
      (b) =>
          b
            ..entityFilter = deviceFilter
            ..keyFilters = keyFilters?.toBuilder()
            ..entityFields = defaultDeviceFields.toBuilder()
            ..latestValues = defaultDeviceAttributes.toBuilder()
            ..pageLink =
                EntityDataPageLink(
                  (b) =>
                      b
                        ..pageSize = pageSize
                        ..textSearch = searchText
                        ..sortOrder =
                            EntityDataSortOrder(
                              (b) =>
                                  b
                                    ..key =
                                        EntityKey(
                                          (b) =>
                                              b
                                                ..type =
                                                    EntityKeyType.ENTITY_FIELD
                                                ..key = 'createdTime',
                                        ).toBuilder()
                                    ..direction = Direction.DESC,
                            ).toBuilder(),
                ).toBuilder(),
    );
  }
}

/// Extension that restores the old `field()` / `attribute()` convenience
/// accessors on the built_value [EntityData] model.
extension EntityDataHelpers on EntityData {
  String? field(String key) => latest?['ENTITY_FIELD']?[key]?.value;
  String? attribute(String key) => latest?['ATTRIBUTE']?[key]?.value;
}

import 'package:hive/hive.dart';
import 'package:thingsboard_app/constants/hive_type_adapter_ids.dart';

part 'region.g.dart';

@HiveType(typeId: HiveTypeAdapterIds.regionAdapterId)
enum Region {
  @HiveField(0)
  northAmerica,
  @HiveField(1)
  europe,
  @HiveField(2)
  custom
}

extension RegionToString on Region {
  String regionToString() {
    switch (this) {
      case Region.northAmerica:
        return 'North America';
      case Region.europe:
        return 'Europe';
      case Region.custom:
        return 'Regions';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:thingsboard_app/constants/hive_type_adapter_ids.dart';
import 'package:thingsboard_app/generated/l10n.dart';

part 'region.g.dart';

@HiveType(typeId: HiveTypeAdapterIds.regionAdapterId)
enum Region {
  @HiveField(0)
  northAmerica,
  @HiveField(1)
  europe,
  @HiveField(2)
  custom,
}

extension RegionToString on Region {
  String regionToString(BuildContext context) {
    switch (this) {
      case Region.northAmerica:
        return S.of(context).northAmerica;
   
      case Region.europe:
        return S.of(context).europe;
      case Region.custom:
        return 'Regions';
    }
  }
}

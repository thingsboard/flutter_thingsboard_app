import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:thingsboard_app/constants/hive_type_adapter_ids.dart';
import 'package:thingsboard_app/generated/l10n.dart';


@HiveType(typeId: HiveTypeAdapterIds.regionAdapterId)
enum Region {
  @HiveField(0)
  northAmerica,
  @HiveField(1)
  europe,
  @HiveField(2)
  custom,
}
class RegionAdapter extends TypeAdapter<Region> {
  @override
  final int typeId = 1;

  @override
  Region read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Region.northAmerica;
      case 1:
        return Region.europe;
      case 2:
        return Region.custom;
      default:
        return Region.northAmerica;
    }
  }

  @override
  void write(BinaryWriter writer, Region obj) {
    switch (obj) {
      case Region.northAmerica:
        writer.writeByte(0);
      case Region.europe:
        writer.writeByte(1);
      case Region.custom:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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

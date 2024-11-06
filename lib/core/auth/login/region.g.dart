// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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
        break;
      case Region.europe:
        writer.writeByte(1);
        break;
      case Region.custom:
        writer.writeByte(2);
        break;
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

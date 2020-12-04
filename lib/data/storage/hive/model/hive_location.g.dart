// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLocationAdapter extends TypeAdapter<HiveLocation> {
  @override
  final int typeId = 2;

  @override
  HiveLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLocation(
      id: fields[0] as int,
      code: fields[1] as String,
      label: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLocation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

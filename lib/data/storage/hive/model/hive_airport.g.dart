// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_airport.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAirportAdapter extends TypeAdapter<HiveAirport> {
  @override
  final int typeId = 3;

  @override
  HiveAirport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAirport(
      id: fields[0] as int,
      code: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAirport obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAirportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

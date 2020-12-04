// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_subscription.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSubscriptionAdapter extends TypeAdapter<HiveSubscription> {
  @override
  final int typeId = 1;

  @override
  HiveSubscription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSubscription(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as Map)?.cast<String, Object>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveSubscription obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fromLabel)
      ..writeByte(2)
      ..write(obj.toLabel)
      ..writeByte(3)
      ..write(obj.request);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSubscriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

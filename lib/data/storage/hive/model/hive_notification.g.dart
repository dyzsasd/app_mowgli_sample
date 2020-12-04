// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNotificationAdapter extends TypeAdapter<HiveNotification> {
  @override
  final int typeId = 0;

  @override
  HiveNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNotification(
      fields[0] as int,
      fields[1] as String,
      fields[2] as DateTime,
      fields[3] as String,
      fields[4] as DateTime,
      fields[5] as String,
      fields[6] as String,
      fields[7] as num,
      fields[8] as String,
      (fields[9] as Map)?.cast<Object, Object>(),
      fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveNotification obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.subscriptionId)
      ..writeByte(2)
      ..write(obj.publicationDate)
      ..writeByte(3)
      ..write(obj.dealId)
      ..writeByte(4)
      ..write(obj.dealDate)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.currency)
      ..writeByte(9)
      ..write(obj.data)
      ..writeByte(10)
      ..write(obj.initialSubscriptionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

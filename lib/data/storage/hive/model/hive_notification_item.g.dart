// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_notification_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNotificationItemAdapter extends TypeAdapter<HiveNotificationItem> {
  @override
  final int typeId = 4;

  @override
  HiveNotificationItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNotificationItem(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as double,
      fields[10] as DateTime,
      fields[11] as DateTime,
      fields[12] as DateTime,
      (fields[13] as Map)?.cast<String, Object>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveNotificationItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.departureCity)
      ..writeByte(4)
      ..write(obj.arrivalCity)
      ..writeByte(5)
      ..write(obj.deviceId)
      ..writeByte(6)
      ..write(obj.subscriptionId)
      ..writeByte(7)
      ..write(obj.offerId)
      ..writeByte(8)
      ..write(obj.currency)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.lastCheck)
      ..writeByte(11)
      ..write(obj.outboundDate)
      ..writeByte(12)
      ..write(obj.inboundDate)
      ..writeByte(13)
      ..write(obj.request);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNotificationItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

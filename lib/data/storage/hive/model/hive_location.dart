import 'package:hive/hive.dart';
import 'package:mowgli/data/location/location_interface.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';

part 'hive_location.g.dart';

@HiveType(typeId: 2)
class HiveLocation extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String code;

  @HiveField(2)
  String label;

  HiveLocation({this.id, this.code, this.label});

  HiveLocation.fromLocation(Location data, this.id)
      : code = data.code,
        label = data.label;

  StoredLocation toStoredLocation() => StoredLocation(code: code, label: label);
}

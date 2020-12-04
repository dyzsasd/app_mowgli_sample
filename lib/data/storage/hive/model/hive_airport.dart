import 'package:hive/hive.dart';
import 'package:mowgli/data/airports/airports_interface.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';

part 'hive_airport.g.dart';

@HiveType(typeId: 3)
class HiveAirport extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String code;

  HiveAirport({this.id, this.code});

  HiveAirport.fromAirport(Location data, this.id) : code = data.code;

  StoredAirport toStoredAirport() => StoredAirport(code: code);
}

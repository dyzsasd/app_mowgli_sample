import 'package:mowgli/data/storage/hive/model/hive_airport.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';

abstract class AirportsService {
  Future<void> init();

  Future<Iterable<StoredAirport>> getStoredAirports();

  Future<void> generateAirports(Iterable<HiveAirport> airports);

  Future<AirportsService> get airportsServices;
}

class StoredAirport {
  final int id;
  final String code;

  StoredAirport({this.id, this.code});

  Location toLocationItem() => Location(code: code);
}

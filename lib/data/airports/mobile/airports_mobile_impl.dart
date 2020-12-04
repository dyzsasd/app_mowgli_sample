import 'package:get_it/get_it.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/airports/airports_interface.dart';
import 'package:mowgli/data/storage/hive/model/hive_airport.dart';
import 'package:mowgli/data/storage/hive/storage_hive.dart';
import 'package:mowgli/data/storage/storage.dart';

class AirportsMobileImpl extends AirportsService {
  StorageBox _box;

  @override
  Future<void> init() async {
    await _initStorage();
  }

  Future<void> _initStorage() async {
    _box = await ApplicationServices.storage.create('airports');
  }

  @override
  Future<void> generateAirports(Iterable<HiveAirport> airports) async {
    await _saveAirports(airports);
  }

  Future<void> _saveAirports(List<HiveAirport> airports) async {
    await _box.saveList('airports', airports);
  }

  @override
  Future<Iterable<StoredAirport>> getStoredAirports() async {
    Iterable<HiveAirport> airports =
        (await _box.getList('airports', <HiveAirport>[])).cast();

    return airports.map((HiveAirport airport) => airport.toStoredAirport());
  }

  @override
  Future<AirportsService> get airportsServices async {
    AirportsService airportsService;
    try {
      airportsService = ApplicationServices.airports;
    } catch (err) {
      // Not initialized, let's do it manually
      airportsService = AirportsMobileImpl();
      GetIt.instance.registerSingleton<AirportsService>(airportsService);
      GetIt.instance.registerSingleton<Storage>(StorageWithHive());
      await airportsService.init();
    }

    return airportsService;
  }
}

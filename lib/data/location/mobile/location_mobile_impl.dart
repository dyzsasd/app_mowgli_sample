import 'package:get_it/get_it.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/location/location_interface.dart';
import 'package:mowgli/data/storage/hive/model/hive_location.dart';
import 'package:mowgli/data/storage/hive/storage_hive.dart';
import 'package:mowgli/data/storage/storage.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';

class LocationMobileImpl extends LocationService {
  StorageBox _box;

  @override
  Future<void> init() async {
    await _initStorage();
  }

  Future<void> _initStorage() async {
    _box = await ApplicationServices.storage.create('location');
  }

  @override
  Future<void> generateLocation(int id, Location data) async {
    await _saveLocation(id, data);
  }

  Future<void> _saveLocation(int id, Location data) async {
    HiveLocation location = HiveLocation.fromLocation(data, id);
    await _box.saveItem('location', location);
  }

  @override
  Future<StoredLocation> getStoredLocation() async {
    HiveLocation location = await _box.getItem('location', HiveLocation());

    return location.toStoredLocation();
  }

  @override
  Future<LocationService> get locationServices async {
    LocationService locationService;
    try {
      locationService = ApplicationServices.location;
    } catch (err) {
      // Not initialized, let's do it manually
      locationService = LocationMobileImpl();
      GetIt.instance.registerSingleton<LocationService>(locationService);
      GetIt.instance.registerSingleton<Storage>(StorageWithHive());
      await locationService.init();
    }

    return locationService;
  }
}

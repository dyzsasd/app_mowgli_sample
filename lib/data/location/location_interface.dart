import 'package:mowgli/ui/screens/shared/model/location.dart';

abstract class LocationService {
  Future<void> init();

  Future<StoredLocation> getStoredLocation();

  Future<void> generateLocation(int id, Location data);

  Future<LocationService> get locationServices;
}

class StoredLocation {
  final int id;
  final String code;
  final String label;

  StoredLocation({this.id, this.code, this.label});
}

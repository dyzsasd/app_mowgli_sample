import 'package:mowgli/data/storage/hive/model/hive_location.dart';

abstract class Storage {
  Future<void> init();

  Future<StorageBox> get defaultBox;

  Future<StorageBox> create(String name, {bool replaceExisting});
}

abstract class StorageBox {
  Future<void> saveString(String key, String value);

  Future<String> getString(String key, [String defaultValue]);

  Stream<String> listenToStringValues(String key);

  Future<void> saveInt(String key, int value);

  Future<int> getInt(String key, [int defaultValue]);

  Stream<int> listenToIntValues(String key);

  Future<void> saveDouble(String key, double value);

  Future<double> getDouble(String key, [double defaultValue]);

  Stream<double> listenToDoubleValues(String key);

  Future<void> saveBoolean(String key, bool value);

  Future<bool> getBoolean(String key, [bool defaultValue]);

  Stream<bool> listenToBooleanValues(String key);

  Future<void> saveList(String key, List<Object> value);

  Future<List<Object>> getList(String key, [List<Object> defaultValue]);

  Stream<List<Object>> listenToListValues(String key);

  Future<void> saveItem(String key, Object value);

  Future<HiveLocation> getItem(String key, [Object defaultValue]);

  Future<void> clear();
}

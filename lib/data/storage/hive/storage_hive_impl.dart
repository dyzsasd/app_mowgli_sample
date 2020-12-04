import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mowgli/data/storage/hive/model/hive_airport.dart';
import 'package:mowgli/data/storage/hive/model/hive_location.dart';
import 'package:mowgli/data/storage/hive/model/hive_notification.dart';
import 'package:mowgli/data/storage/hive/model/hive_notification_item.dart';
import 'package:mowgli/data/storage/hive/model/hive_subscription.dart';
import 'package:mowgli/data/storage/storage.dart';

class StorageWithHive extends Storage {
  final Map<String, _StorageHiveBox> _boxes = <String, _StorageHiveBox>{};
  _StorageHiveBox _defaultBox;
  bool _isInitialized = false;

  @override
  @override
  Future<void> init() async {
    _isInitialized = false;
    await Hive.initFlutter();
    Hive.registerAdapter(HiveNotificationAdapter());
    Hive.registerAdapter(HiveSubscriptionAdapter());
    Hive.registerAdapter(HiveLocationAdapter());
    Hive.registerAdapter(HiveAirportAdapter());
    Hive.registerAdapter(HiveNotificationItemAdapter());
    _defaultBox = _StorageHiveBox._(await Hive.openBox('default'));
    _isInitialized = true;
  }

  @override
  Future<StorageBox> create(String name, {bool replaceExisting}) async {
    if (!_isInitialized) {
      await init();
    }

    if (name == 'default') {
      throw Exception(
          'The name \"default\" is reserved. Please use another one.');
    } else {
      if (_boxes[name] == null) {
        _boxes[name] = _StorageHiveBox._(await Hive.openBox(name));
      }

      return _boxes[name];
    }
  }

  @override
  Future<StorageBox> get defaultBox => Future<void>.value(_defaultBox);
}

class _StorageHiveBox extends StorageBox {
  final Box<Object> box;

  _StorageHiveBox._(this.box);

  @override
  Future<bool> getBoolean(String key, [bool defaultValue]) =>
      getValue(key, defaultValue: defaultValue ?? false);

  @override
  Future<double> getDouble(String key, [double defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  @override
  Future<int> getInt(String key, [int defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  @override
  Future<String> getString(String key, [String defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  @override
  Future<List<Object>> getList(String key, [List<dynamic> defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  @override
  Future<HiveLocation> getItem(String key, [Object defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  Future<T> getValue<T>(String key, {T defaultValue}) async {
    return box.get(key, defaultValue: defaultValue) ?? defaultValue;
  }

  @override
  Stream<bool> listenToBooleanValues(String key) {
    return box.watch(key: key).map((BoxEvent event) => event.value);
  }

  @override
  Stream<double> listenToDoubleValues(String key) {
    return box.watch(key: key).map((BoxEvent event) => event.value);
  }

  @override
  Stream<int> listenToIntValues(String key) {
    return box.watch(key: key).map((BoxEvent event) => event.value);
  }

  @override
  Stream<List<Object>> listenToListValues(String key) {
    return box.watch(key: key).map((BoxEvent event) => event.value);
  }

  @override
  Stream<String> listenToStringValues(String key) {
    return box.watch(key: key).map((BoxEvent event) => event.value);
  }

  @override
  Future<void> saveBoolean(String key, bool value) {
    return box.put(key, value);
  }

  @override
  Future<void> saveDouble(String key, double value) {
    return box.put(key, value);
  }

  @override
  Future<void> saveInt(String key, int value) {
    return box.put(key, value);
  }

  @override
  Future<void> saveString(String key, String value) {
    return box.put(key, value);
  }

  @override
  Future<void> saveList(String key, List<dynamic> value) {
    return box.put(key, value);
  }

  @override
  Future<void> saveItem(String key, Object value) {
    return box.put(key, value);
  }

  @override
  Future<void> clear() {
    return box.clear();
  }
}

class MapUtils {
  const MapUtils._();

  static Map<K, V> add<K, V>(Map<K, V> map, K key, V value) {
    map[key] = value;
    return map;
  }
}

extension MapUtilsExtensions<K, V> on Map<K, V> {
  Map<K, V> add(K key, V value) => MapUtils.add(this, key, value);
}

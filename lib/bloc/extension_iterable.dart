extension IterableEntryToMap<K, V> on Iterable<MapEntry<K, V>> {
  Map<K, V> get toMap =>
      Map.of({for (var entry in this) entry.key: entry.value});
}

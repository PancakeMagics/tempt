part of '../../model.dart';

extension MatchUtil on Match {
  String get group0 => group(0)!;
}

extension SplitUtil on String {
  MapEntry<String, String> get splitByFirstSpace {
    late final String key;
    final value = replaceFirstMapped(RegExp(r'\w '), (match) {
      key = match.group0.trim();
      return '';
    });
    return MapEntry(key, value);
  }
}

extension CamelAndUnderscoreUtil on String {
  String get _fromUnderscoreToCamel =>
      _uppercaseFirstChar._fromUnderscoreToCamelBody;

  String get _fromUnderscoreToCamelBody => splitMapJoin(RegExp(r'_[a-z]'),
      onMatch: (match) => match.group0[1].toUpperCase());

  String get _fromCamelToUnderscore =>
      _lowercaseFirstChar.splitMapJoin(RegExp(r'[a-z][A-Z]'), onMatch: (match) {
        final s = match.group0;
        return '${s[0]}_${s[1].toLowerCase()}';
      });

  String get _lowercaseFirstChar => replaceFirstMapped(
      RegExp(r'[A-Z]'), (match) => match.group0.toLowerCase());

  String get _uppercaseFirstChar => replaceFirstMapped(
      RegExp(r'[a-z]'), (match) => match.group0.toUpperCase());
}

extension _JStringToMoel on String {
  Json get _fromJStringToJson => jsonDecode(this) as Json;
  M _fromJStringToModel<M extends DataModel<M>>() => _fromJStringToJson.toModel<M>();

  MapEntry<Model, Json> get _parseTypedJString {
    late final Model modelType;
    final json = replaceFirstMapped(RegExp(r'[\w]+ '), (match) {
      modelType = match.group0._toModel;
      return '';
    })._fromJStringToJson;
    return MapEntry(modelType, json);
  }
}

extension _JStringFromIterable on Iterable<String> {
  String get _toJString => fold(
      StringBuffer(),
          (buffer, s) => buffer
        ..write('${s.length} ')
        ..write(s)).toString();
}

extension _JStringToIterable on String {
  Iterable<String> get _fromJStringToIterable {
    final list = <String>[];
    String s = this;
    while (s.isNotEmpty) {
      final entry = s.splitByFirstSpace;
      final length = int.parse(entry.key);
      final remain = entry.value;
      list.add(remain.substring(0, length));
      s = remain.substring(length);
    }
    return list;
  }
}

extension _JStringFromMap on Map<dynamic, dynamic> {
  String _toJStringFromMap<K, V>({
    required String Function(K key) keyMap,
    required String Function(V value) valueMap,
  }) =>
      keys.fold(StringBuffer(), (buffer, key) {
        final value = valueMap(this[key]);
        return buffer
          ..write('${keyMap(key)} ')
          ..write('${value.length} ')
          ..write(value);
      }).toString();
}

extension _JStringToMap on String {
  Map<K, S> _fromJStringToMap<K, S>({
    required K Function(String key) keyMap,
    required S Function(String value) valueMap,
  }) {
    final map = <String, String>{};
    String s = this;
    while (s.isNotEmpty) {
      final e1 = s.splitByFirstSpace;
      final e2 = e1.value.splitByFirstSpace;
      final key = e1.key;
      final valueLength = int.parse(e2.key);
      final remain = e2.value;

      map.putIfAbsent(key, () => remain.substring(0, valueLength));
      s = remain.substring(valueLength);
    }
    return map.map((key, value) => MapEntry(keyMap(key), valueMap(key)));
  }
}
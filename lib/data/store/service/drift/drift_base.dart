part of '../service.dart';

mixin _ImplDriftBase on _ImplDrift {
  // Future<Iterable<M>> get<M extends DataClass>({
  //   DriftLimitExp limit = _noDriftLimit,
  // }) async {
  //   // if (limit == _noDriftLimit) {
  //   //   return await _selectStatement<M>().get();
  //   // } else {
  //   //   return await (_selectStatement<M>()..limit(limit.key, offset: limit.value)).get();
  //   // }
  // }
}

typedef DriftLimitExp = MapEntry<int, int?>;
const MapEntry<int, int?> _noDriftLimit = MapEntry(0, null);
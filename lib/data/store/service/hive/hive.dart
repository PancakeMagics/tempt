part of '../service.dart';

/// hive database provider
class _ImplHiveProvider extends _ImplHive
    with
        _ImplHiveBase,
        _ImplHiveData,
        _ImplHiveStream {
  const _ImplHiveProvider._();

  static const _ImplHiveProvider _instance = _ImplHiveProvider._();

  factory _ImplHiveProvider() => _instance;
}

/// ancestor of all hive implementation
abstract class _ImplHive {
  const _ImplHive();

  Future<Box<M>> openBox<M extends DataModel<M>>() async =>
      await Hive.openBox(M.toStringUnderScore);

  Future<void> closeBox<M extends DataModel<M>>(Box<M> box) async =>
      await box.close();

}

extension _WatchValue<M> on Box<M> {
  Stream<M?> _watch(String id) => watch(key: id).map((event) => event.value as M?);
}
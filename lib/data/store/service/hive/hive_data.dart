part of '../service.dart';

mixin _ImplHiveData on _ImplHive {
  /// hive use the uuid i generate
  Future<void> insert<M extends DataModel<M>>(M model) async {
    final uuid = (const Uuid()).v4();
    model.storeId.putIfAbsent(StoreService.hive, () => uuid);
    Hive.box<M>(M.toStringUnderScore).put(uuid, model);
  }

  /// already check id in [StoreService._checkModelHaveId]

  Future<void> update<M extends DataModel<M>>(M model) async =>
      Hive.box<M>(M.toStringUnderScore).put(
        model.storeId[StoreService.hive]!,
        model,
      );

  Future<void> delete<M extends DataModel<M>>(M model) async =>
      Hive.box<M>(M.toStringUnderScore).delete(
        model.storeId[StoreService.hive]!,
      );
}

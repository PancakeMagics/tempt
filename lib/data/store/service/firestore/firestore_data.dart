part of '../service.dart';

mixin _ImplFirestoreData on _ImplFirestore {
  // TODO: ensure mutableWay is better than immutableWay
  Future<void> insert<M extends DataModel<M>>(M model) async {
    final newDocId = (await _collection<M>().add(model)).id;
    model.storeId.putIfAbsent(StoreService.firestore, () => newDocId);
  }

  /// already check id in [StoreService._checkModelHaveId]
  Future<void> update<M extends DataModel<M>>(M model) =>
      _collection<M>().doc(model.storeId[StoreService.firestore]).set(model);

  Future<void> delete<M extends DataModel<M>>(M model) =>
      _collection<M>().doc(model.storeId[StoreService.firestore]).delete();
}

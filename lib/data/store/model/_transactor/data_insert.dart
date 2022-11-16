part of '../model.dart';

mixin MixDataInsert<M extends DataModel<M>> on DataModel<M> implements MixDataGet<M> {
  Future<void> insert() => _storeService.insert(_model);

  Future<void> insertBeforeCheck({
    QueryWhere<M>? queryWhere,
    required Future<bool> Function(Result<M> queriedModels) askIfInsert,
  }) async {
    assert(queryWhere != null);
    if (await askIfInsert(await get(queryWhere: queryWhere))) {
      insert();
    }
  }
}
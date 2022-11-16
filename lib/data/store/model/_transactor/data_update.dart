part of '../model.dart';

mixin MixDataUpdate<M extends DataModel<M>> on DataModel<M> implements
    MixDataGet<M> {
  Future<void> update() => _storeService.update(_model);

  Future<void> updateBeforeACheck({
    QueryWhere<M>? queryWhere,
    required Future<bool> Function(Result<M> queriedModels) askIfUpdate,
  }) async {
    assert(queryWhere != null);
    if (await askIfUpdate(await get(queryWhere: queryWhere))) {
      update();
    }
  }
}
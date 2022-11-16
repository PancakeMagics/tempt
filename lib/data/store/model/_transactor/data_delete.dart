part of '../model.dart';

mixin MixDataDelete<M extends DataModel<M>> on DataModel<M>
    implements MixDataGet<M> {
  Future<void> delete() => _storeService.delete(_model);

  Future<void> deleteBeforeCheck({
    QueryWhere<M>? queryWhere,
    required Future<bool> Function(Result<M> queriedModels) askIfDelete,
  }) async {
    assert(queryWhere != null);
    if (await askIfDelete(await get(queryWhere: queryWhere))) {
      delete();
    }
  }
}

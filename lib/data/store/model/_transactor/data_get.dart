part of '../model.dart';

mixin MixDataGet<M extends DataModel<M>> on DataModel<M> {
  Future<Result<M>> get({
    QueryWhere<M>? queryWhere,
  }) async {
    assert(queryWhere != null);
    return _storeService.get(where: queryWhere!);
  }
}

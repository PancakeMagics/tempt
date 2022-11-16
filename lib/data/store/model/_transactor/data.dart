part of '../model.dart';

mixin MixData<M extends DataModel<M>> on DataModel<M>
    implements
        MixDataInsert<M>,
        MixDataGet<M>,
        MixDataUpdate<M>,
        MixDataDelete<M> {

  /// queue
  Future<void> queueTransaction({
    required List<BaseTransaction> transactions,
  }) async {
    for (var t in transactions) {
      await t();
    }
  }

  /// schedule
  Future<void> scheduleTransaction({
    required Map<DateTime, BaseTransaction> transactions,
  }) async {
    throw UnimplementedError();
  }
}

typedef BaseTransaction = Future<void> Function();

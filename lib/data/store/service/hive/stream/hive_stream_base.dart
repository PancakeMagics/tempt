part of '../../service.dart';

mixin _ImplHiveStream on _ImplHive {

  /// similar to [_ImplFirestoreStream.watch]
  Stream<Result<M>> watch<M extends DataModel<M>>({
    required QueryWhere<M> where,
  }) {
    late final Stream<Iterable<M?>> result;
    final box = Hive.box<M>(M.toStringUnderScore);

    if (where.id != null) {
      result = box._watch(where.id!).map((event) => [event]);

      ///
    } else {
      final streams = box.keys.map<Stream<M?>>((key) => box._watch(key));

      result = streams.mix(
        mixMatch: where.fieldsSet,
        mixValid: where.validation,
        mixAll: where.getAll,
      );
    }

    return result.map(
      (event) => Result.from(queryWhere: where, result: event),
    );
  }
}

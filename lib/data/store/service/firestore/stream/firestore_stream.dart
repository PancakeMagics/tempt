part of '../../service.dart';

mixin _ImplFirestoreStream on _ImplFirestore {
  Stream<Result<M>> watch<M extends DataModel<M>>({
    required QueryWhere<M> where,
  }) {
    late final Stream<Iterable<M?>> result;
    final collection = _collection<M>();

    if (where.id != null) {
      result = collection.doc(where.id)._modelStream;

      //
    } else if (where.getAll) {
      result = collection._iterableModelStream;

      //
    } else if (where.fieldsSet != null) {
      result = collection._filter(where.fieldsSet!)._iterableModelStream;

      //
    } else if (where.validation != null) {
      throw StoreServiceNoImplementationException();

      //
    } else {
      throw QueryNoWhereError();
    }

    return result.map((e) => Result.from(queryWhere: where, result: e));
  }
}

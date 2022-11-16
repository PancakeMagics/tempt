part of '../service.dart';

mixin _ImplFirestoreBase on _ImplFirestore {
  Future<Result<M>> get<M extends DataModel<M>>({
    required QueryWhere<M> where,
  }) async {
    late final Iterable<M?> result;
    final collection = _collection<M>();

    if (where.id != null) {
      result = [(await collection.doc(where.id).get()).data()];

      //
    } else if (where.getAll) {
      result = (await collection.get()).docs.map((e) => e.data());

      //
    } else if (where.fieldsSet != null) {
      result = (await collection._filter(where.fieldsSet!).get())._toModels;

      //
    } else if (where.validation != null) {
      throw StoreServiceNoImplementationException();

      //
    } else {
      throw QueryNoWhereError();
    }

    return Result.from(queryWhere: where, result: result);
  }
}

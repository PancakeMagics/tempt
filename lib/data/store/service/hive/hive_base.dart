part of '../service.dart';

mixin _ImplHiveBase on _ImplHive {
  Future<Result<M>> get<M extends DataModel<M>>({
    required QueryWhere<M> where,
  }) async {
    late final Iterable<M?> result;
    final box = Hive.box<M>(M.toStringUnderScore);

    if (where.id != null) {
      result = [box.get(where.id)];

      //
    } else if (where.getAll) {
      result = box.values;

      //
    } else if (where.fieldsSet != null) {
      result = box.values.where(
        (element) => element.match(where.fieldsSet!),
      );

      //
    } else if (where.validation != null) {
      result = box.values.where(where.validation!);

      //
    } else {
      throw QueryNoWhereError();
    }

    return Result.from(queryWhere: where, result: result);
  }
}

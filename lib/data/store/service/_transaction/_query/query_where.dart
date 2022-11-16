part of '../../service.dart';

class QueryWhere<M> {
  final StoreService storeService;
  final ResultType expectResult;

  final String? id;
  final bool getAll;
  final FieldsSet? fieldsSet;
  final bool Function(M? model)? validation;

  const QueryWhere._({
    required this.storeService,
    required this.expectResult,
    this.id,
    this.getAll = false,
    this.fieldsSet,
    this.validation,
  });

  factory QueryWhere({
    required StoreService storeService,
    required ResultType expectResult,
    required bool Function(M? model) where,
  }) =>
      QueryWhere._(
        storeService: storeService,
        expectResult: expectResult,
        validation: where,
      );

  factory QueryWhere.withFieldsSet({
    required StoreService storeService,
    required ResultType expectResult,
    required FieldsSet fieldsSet,
  }) =>
      QueryWhere._(
        storeService: storeService,
        expectResult: expectResult,
        fieldsSet: fieldsSet,
      );

  factory QueryWhere.withId({
    required StoreService storeService,
    required ResultType expectResult,
    required String id,
  }) =>
      QueryWhere._(
        storeService: storeService,
        expectResult: expectResult,
        id: id,
      );

  factory QueryWhere.all({
    required StoreService storeService,
    required ResultType expectResult,
  }) =>
      QueryWhere._(
        storeService: storeService,
        expectResult: expectResult,
        getAll: true,
      );
}

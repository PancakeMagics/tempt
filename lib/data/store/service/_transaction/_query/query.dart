part of '../../service.dart';

/// error, exceptions
class QueryNoWhereError extends Error {
  QueryNoWhereError();
}

// TODO:
/// insert
// Future<bool> Function(M existModel)? replaceWhen,

/// get
// @immutable
// class _TransactionArgumentGet {
//   final _TransactionInputHowMuch howMuch;
//   final _TransactionInputWhen when;
//   final _TransactionInputWhere where;
//   final _TransactionInputWho who;
//   const _TransactionArgumentGet({
//     this.howMuch = const _TransactionInputHowMuch(),
//     this.when = const _TransactionInputWhen(),
//     this.where = const _TransactionInputWhere(),
//     this.who = const _TransactionInputWho(),
//   });
// }
//
// typedef EntryEntrySetStringAndBoolAndBool = MapEntry<MapEntry<Set<String>, bool>, bool>;

/// update
// @immutable
// class _TransactionArgumentUpdate {
//   final Object? updateModel;
//   final MapEntry<_TransactionArgumentGet, M Function<M>(M model)>? updateAfterGet;
//
//   const _TransactionArgumentUpdate({
//     this.updateModel,
//     this.updateAfterGet,
//   }) : assert(updateModel == null || updateAfterGet == null);
// }

/// delete
// @immutable
// class _TransactionArgumentDelete {
//   final Object? deleteModel;
//   final MapEntry<_TransactionArgumentGet, M Function<M>(M model)>? deleteAfterGet;
//
//   const _TransactionArgumentDelete({
//     this.deleteModel,
//     this.deleteAfterGet,
//   }) : assert(deleteModel == null || deleteAfterGet == null);
// }
//


// TODO: integrate argument, return type
// enum ArgsOrResult {
//   searchingText,
//   fieldName,
//   fieldNameWithValue,
//
//   fields,
//   model,
//   models,
//
//   modelAndField,
//   modelAndFields,
//   modelsAndField,
//   modelsAndFields,
//
//   fieldAndText,
//   fieldsAndText,
//   modelAndText,
//   modelsAndText,
//
//   modelAndFieldAndText,
//   modelAndFieldsAndText,
//   modelsAndFieldAndText,
//   modelsAndFieldsAndText,
//
//   iterableModel,
//   mapFieldNameAndIterableModel,
// }
//

part of '../model.dart';

/// used in ui and bloc layer
abstract class _DataSetModel<M extends DataModel<M>>
    extends _DataSetModelBackend<M> {
  const _DataSetModel();

  FieldsSet difference<O>(ArgumentSet<M, O> argument) {
    final match = <String, EqualOrNot<dynamic>>{};

    ///
    if (argument.fields != null) {
      for (var field in argument.fields!.entries) {
        final name = field.key;
        final value = field.value;
        if (json[name] == value) {
          match.putIfAbsent(name, () => EqualOrNot(value, null));
        } else {
          match.putIfAbsent(name, () => EqualOrNot(null, value));
        }
      }

      ///
    } else if (argument.another != null) {
      _forEachPropsWith(
        another: argument.another!,
        fun: (fieldName, v1, v2) {
          late final EqualOrNot<dynamic> equalOrNot;
          if (v1 == v2) {
            equalOrNot = EqualOrNot(v2, null);
          } else {
            equalOrNot = EqualOrNot(null, v2);
          }
          match.putIfAbsent(fieldName, () => equalOrNot);
        },
      );

      ///
    } else if (argument.other != null) {
      throw UnimplementedError();
    } else {
      throw _ModelFunctionNotProvideError();
    }
    return match;
  }

  bool match(FieldsSet fieldsMatch) {
    for (var field in fieldsMatch.entries) {
      final value = json[field.key];
      final equalOrNot = field.value;

      if (equalOrNot.equalValue != null) {
        if (value != equalOrNot.equalValue) {
          return false;
        }
      } else {
        if (value == equalOrNot.notEqualValue) {
          return false;
        }
      }
    }
    return true;
  }
}

/// used in data layer
abstract class _DataSetModelBackend<M extends DataModel<M>> {
  const _DataSetModelBackend();

  Type get dataModelType => M;

  M get _model => this as M;

  Json get json => _model.json;

  void _forEachPropsWith({
    /// v1 is value of current-instance,
    /// v2 is value of argument-instance

    required M another,
    required void Function(String fieldName, dynamic v1, dynamic v2) fun,
  }) =>
      another.json.forEach((key, value) => fun(key, json[key], value));
}

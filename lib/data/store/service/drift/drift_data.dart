part of '../service.dart';

mixin _ImplDriftData on _ImplDrift {
  Future<void> _insert<M extends DataClass>(M model) => _insertStatement<M>().insert(model as Insertable<M>);

  // Future<void> _update<M extends DataClass>(M model) => _selectStatement<M>()
  // Future<void> _delete<M extends DataClass>(M model) => _selectStatement<M>()
}
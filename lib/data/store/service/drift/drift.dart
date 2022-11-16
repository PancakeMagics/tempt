part of '../service.dart';

/// drift database provider
class _ImplDriftProvider extends _ImplDrift
    with
        _ImplDriftBase,
        _ImplDriftData,
        _ImplDriftStream {
  _ImplDriftProvider._() : super._();

  static final _ImplDriftProvider _instance = _ImplDriftProvider._();
  factory _ImplDriftProvider() => _instance;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// drift database
LazyDatabase get _driftDb => LazyDatabase(
    //   () async => NativeDatabase(File(
    //     path.join((await getApplicationDocumentsDirectory()).path, 'db'),
    //   )),
    // );
    //   () async => WebDatabase(throw UnimplementedError()),
      () async => throw UnimplementedError(),
);

/// ancestor of all drift implementation
@DriftDatabase(tables: [Users])
abstract class _ImplDrift extends _$_ImplDrift {
  _ImplDrift._() : super(_driftDb);

  @override
  int get schemaVersion => 1;

  InsertStatement<Table, M> _insertStatement<M extends DataClass>() {
    final model = M.toModel;
    late final InsertStatement<Table, dynamic> statement;
    switch (model) {
      case Model.user:
        statement = into(users);
        break;
      default:
        throw StoreServiceNoImplementationException();
    }
    return statement as InsertStatement<Table, M>;
  }

  SimpleSelectStatement<Table, M>
      _selectStatement<M extends DataClass>() {
    final model = M.toModel;
    late final SimpleSelectStatement<Table, dynamic> statement;
    switch (model) {
      case Model.user:
        statement = select(users);
        break;
      default:
        throw StoreServiceNoImplementationException();
    }
    return statement as SimpleSelectStatement<Table, M>;
  }
}

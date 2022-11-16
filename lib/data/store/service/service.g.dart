// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends DataClass implements Insertable<User> {
  final int id;
  final String idFireAuth;
  const User({required this.id, required this.idFireAuth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_fire_auth'] = Variable<String>(idFireAuth);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      idFireAuth: Value(idFireAuth),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      idFireAuth: serializer.fromJson<String>(json['idFireAuth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idFireAuth': serializer.toJson<String>(idFireAuth),
    };
  }

  User copyWith({int? id, String? idFireAuth}) => User(
        id: id ?? this.id,
        idFireAuth: idFireAuth ?? this.idFireAuth,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('idFireAuth: $idFireAuth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idFireAuth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.idFireAuth == this.idFireAuth);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> idFireAuth;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.idFireAuth = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String idFireAuth,
  }) : idFireAuth = Value(idFireAuth);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? idFireAuth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idFireAuth != null) 'id_fire_auth': idFireAuth,
    });
  }

  UsersCompanion copyWith({Value<int>? id, Value<String>? idFireAuth}) {
    return UsersCompanion(
      id: id ?? this.id,
      idFireAuth: idFireAuth ?? this.idFireAuth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idFireAuth.present) {
      map['id_fire_auth'] = Variable<String>(idFireAuth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('idFireAuth: $idFireAuth')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idFireAuthMeta = const VerificationMeta('idFireAuth');
  @override
  late final GeneratedColumn<String> idFireAuth = GeneratedColumn<String>(
      'id_fire_auth', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, idFireAuth];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_fire_auth')) {
      context.handle(
          _idFireAuthMeta,
          idFireAuth.isAcceptableOrUnknown(
              data['id_fire_auth']!, _idFireAuthMeta));
    } else if (isInserting) {
      context.missing(_idFireAuthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idFireAuth: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id_fire_auth'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

abstract class _$_ImplDrift extends GeneratedDatabase {
  _$_ImplDrift(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

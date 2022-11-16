
import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:drift/drift.dart';

// import 'package:drift/web.dart' show WebDatabase;
// import 'dart:io' show File;
// import 'package:path/path.dart' as path;
// import 'package:drift/native.dart' show NativeDatabase;
// import 'package:path_provider/path_provider.dart' as p;
// import 'package:path_provider_windows/path_provider_windows.dart' as pw;

import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:hive/hive.dart' show Hive, Box;
import 'package:tempt/bloc/_error_exception.dart';
import 'package:uuid/uuid.dart' show Uuid;
import 'package:tempt/bloc/stream/stream_mix.dart';
import '../model/model.dart';

part 'service.g.dart';
part 'drift/_user/user.dart';
part 'drift/drift.dart';
part 'drift/drift_base.dart';
part 'drift/drift_data.dart';
part 'drift/stream/drift_stream.dart';
part 'firestore/firestore.dart';
part 'firestore/firestore_base.dart';
part 'firestore/firestore_data.dart';
part 'firestore/stream/firestore_stream.dart';
part 'hive/hive.dart';
part 'hive/hive_base.dart';
part 'hive/hive_data.dart';
part 'hive/stream/hive_stream_base.dart';

/// --------------------------
part '_transaction/_query/query.dart';
part '_transaction/_query/query_how_much.dart';
part '_transaction/_query/query_where.dart';
part '_transaction/_query/query_when.dart';
part '_transaction/_query/query_who.dart';
part '_transaction/_result/result.dart';


/// --------------------------------------------------------------------------------------------
enum StoreService implements //Service<StoreService>,
// class StoreService implements //Service<StoreService>,
        _ImplFirestoreProvider,
        _ImplHiveProvider {
  hive,
  firestore;

  _ImplHiveProvider get _hive => _ImplHiveProvider();

  _ImplFirestoreProvider get _firestore => _ImplFirestoreProvider();

  /// not provide
  @override
  fire.CollectionReference<M> _collection<M extends DataModel<M>>() =>
      throw StoreServiceProviderNotProvideError();


  /// provide: ------------------------------------------------------------------------------------------

  @override
  Future<void> insert<M extends DataModel<M>>(M model) async {
    switch (this) {
      case StoreService.hive:
        return await _hive.insert(model);
      case StoreService.firestore:
        return await _firestore.insert(model);
    }
  }

  void _checkModelHaveId<M>(M model) {
    final storeId = (model as DataModel).storeId;
    switch (this) {
      case StoreService.hive:
        if (storeId.containsKey(StoreService.hive)) {
          return;
        }
        break;
      case StoreService.firestore:
        if (storeId.containsKey(StoreService.firestore)) {
          return;
        }
        break;
    }
    throw StoreModelNoIdException();
  }

  @override
  Future<void> delete<M extends DataModel<M>>(M model) async {
    _checkModelHaveId<M>(model);
    switch (this) {
      case StoreService.hive:
        return await _hive.delete(model);
      case StoreService.firestore:
        return await _firestore.delete(model);
    }
  }

  @override
  Future<void> update<M extends DataModel<M>>(M model) async {
    _checkModelHaveId<M>(model);
    switch (this) {
      case StoreService.hive:
        return await _hive.update(model);
      case StoreService.firestore:
        return await _firestore.update(model);
    }
  }

  @override
  Future<Result<M>> get<M extends DataModel<M>>(
      {required QueryWhere<M> where}) async {
    switch (this) {
      case StoreService.hive:
        return await _hive.get(where: where);
      case StoreService.firestore:
        return await _firestore.get(where: where);
    }
  }

  @override
  Stream<Result<M>> watch<M extends DataModel<M>>({required QueryWhere<M> where}) {
    switch (this) {
      case StoreService.hive:
        return _hive.watch(where: where);
      case StoreService.firestore:
        return _firestore.watch(where: where);
    }
  }


  @override
  Future<Box<M>> openBox<M extends DataModel<M>>() async {
    switch (this) {
      case StoreService.hive:
        return await _hive.openBox();
      case StoreService.firestore:
        throw StoreServiceNoImplementationException();
    }
  }

  @override
  Future<void> closeBox<M extends DataModel<M>>(Box<M> box) async {
    switch (this) {
      case StoreService.hive:
        return await _hive.closeBox(box);
      case StoreService.firestore:
        throw StoreServiceNoImplementationException();
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

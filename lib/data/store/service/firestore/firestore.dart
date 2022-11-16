part of '../service.dart';

/// firestore database provider
class _ImplFirestoreProvider extends _ImplFirestore
    with _ImplFirestoreBase, _ImplFirestoreData, _ImplFirestoreStream {
  const _ImplFirestoreProvider._();

  factory _ImplFirestoreProvider() => _instance;
  static const _ImplFirestoreProvider _instance = _ImplFirestoreProvider._();
}

/// ancestor of all firestore implementation
abstract class _ImplFirestore {
  const _ImplFirestore();

  // TODO: nested collection
  fire.CollectionReference<M> _collection<M extends DataModel<M>>() =>
      fire.FirebaseFirestore.instance
          .collection(M.toStringUnderScore)
          .withConverter<M>(
            fromFirestore: (snapshot, _) => snapshot.data()!.toModel<M>(),
            toFirestore: (value, _) => value.json,
          );
}

/// extension
extension _QuerySanpshotUtil<M extends DataModel<M>> on fire.QuerySnapshot<M> {
  Iterable<M> get _toModels => docs.map((doc) => doc.data());
}

extension _QueryUtil<M extends DataModel<M>> on fire.Query<M> {
  fire.Query<M> _filter(FieldsSet fieldsSet) =>
      fieldsSet.keys.fold<fire.Query<M>>(this, (query, name) {
        final match = fieldsSet[name]!;
        return query.where(
          name,
          isEqualTo: match.equalValue,
          isNotEqualTo: match.notEqualValue,
        );
      });

  Stream<Iterable<M>> get _iterableModelStream =>
      snapshots().map((event) => event._toModels);
}

extension _DocRefUtil<M extends DataModel<M>> on fire.DocumentReference<M> {
  Stream<Iterable<M?>> get _modelStream => snapshots().map((event) => [event.data()]);
}
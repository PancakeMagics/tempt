part of '../../model.dart';

/// [FieldsSet] example,
///
/// final p1 = Person(name: 'Abby', phone: '0000');
/// final p2 = Person(name: 'Abby', phone: '999');
/// final p3 = Person(name: 'Abby', phone: '0000');
/// final match1 = service.get(
///   query: QueryWhere( see []
///     fieldsMatch: {
///       'name': MapEntry('Abby', null),
///     }, // equal 'Abby'
///   ),
/// );
/// print(match1); // p1, p2, p3
///
/// final match2 = service.get(
///   query: QueryWhere( see [QueryWhere]
///     fieldsMatch: {
///       'name': MapEntry('Abby', null),
///       'phone': MapEntry(null, '999')
///     }, // equal 'Abby', but not equal '999'
///   ),
/// );
/// print(match2); // p1, p2
typedef FieldsSet = Map<String, EqualOrNot<dynamic>>;
class EqualOrNot<A> {
  final A? equalValue;
  final A? notEqualValue;
  const EqualOrNot._(this.equalValue, this.notEqualValue);
  const factory EqualOrNot(A? equalValue, A? notEqualValue) = EqualOrNot<A>._;
}


class ArgumentSet<M, O> {
  final Json? fields;
  final M? another;
  final O? other;

  const ArgumentSet._({
    this.fields,
    this.another,
    this.other,
  });

  factory ArgumentSet.provideFields(Json fields) => ArgumentSet._(fields: fields);
  factory ArgumentSet.provideAnother(M another) => ArgumentSet._(another: another);
  factory ArgumentSet.provideOther(O other) => ArgumentSet._(other: other);
}


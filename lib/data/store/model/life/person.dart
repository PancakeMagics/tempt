part of '../model.dart';

@_Serialize()
class Person extends Human<Person> {
  const Person({
    super.storeId,
    required super.name,
    required super.description,
    super.relatedHuman,
    super.relatedNote,
    super.relatedEvent,
  });

  @override
  Json get json => _$PersonToJson(this);
}

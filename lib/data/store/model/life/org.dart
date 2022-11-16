part of '../model.dart';

@_Serialize()
class Org extends Human<Org> {
  const Org({
    super.storeId,
    required super.name,
    required super.description,
    super.relatedHuman,
    super.relatedNote,
    super.relatedEvent,
  });

  @override
  Json get json => _$OrgToJson(this);
}
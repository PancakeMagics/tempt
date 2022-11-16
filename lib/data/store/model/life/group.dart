part of '../model.dart';

@_Serialize()
class Group extends Human<Group> {
  const Group({
    super.storeId,
    required super.name,
    required super.description,
    super.relatedHuman,
    super.relatedNote,
    super.relatedEvent,
  });

  @override
  Json get json => _$GroupToJson(this);
}
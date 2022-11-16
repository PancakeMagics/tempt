part of '../model.dart';


@_Serialize()
class Friend extends Human<Friend> {
  const Friend({
    super.storeId,
    required super.name,
    required super.description,
    super.relatedHuman,
    super.relatedNote,
    super.relatedEvent,
  });

  @override
  Json get json => _$FriendToJson(this);
}

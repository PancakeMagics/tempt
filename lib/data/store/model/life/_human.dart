part of '../model.dart';

enum HumanKind {
  person,
  friend, // whom a person want to be with (love)
  group, // whom a person have to be with (fate)
  org, // whom a person want be well-organized for some reason (hope)
  allHumanBeings,
}

abstract class Human<M extends Human<M>> extends DataModel<M> {
  final String name;
  final Contact contact;
  final Note description;

  final HumanRelatedHuman relatedHuman;
  final HumanRelatedNote relatedNote;
  final HumanRelatedEvent relatedEvent;

  const Human({
    super.storeId,
    required this.name,
    required this.description,
    this.contact = const Contact(),
    this.relatedHuman = _emptyHrH,
    this.relatedNote = _emptyHrN,
    this.relatedEvent = _emptyHrE,
  });
}

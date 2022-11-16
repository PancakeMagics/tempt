part of '../../model.dart';

enum EventKind {
  ability,
  conscious,
  feeling,
}

abstract class Event<M extends Event<M>> extends DataModel<M> {
  final String name;
  final Note description;
  final MapEntry<String, String> duration;
  final MapEntry<Human, Human> managerAndExpectParticipator;
  final RelatedNote relatedNote;
  final RelatedEvent relatedEvent;
  final bool inBasket;
  final bool inTrash;

  const Event({
    required this.name,
    required this.description,
    required this.duration,
    required this.managerAndExpectParticipator,
    this.relatedNote = _emptyRN,
    this.relatedEvent = _emptyRE,
    this.inBasket = false,
    this.inTrash = false,
  });
}

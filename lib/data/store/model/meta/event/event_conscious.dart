part of '../../model.dart';

@_Serialize()
class EventConscious extends Event<EventConscious> {
  const EventConscious({
    required super.name,
    required super.description,
    required super.duration,
    required super.managerAndExpectParticipator,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
  });

  @override
  Json get json => _$EventConsciousToJson(this);
}

part of '../../model.dart';

@_Serialize()
class EventAbility extends Event<EventAbility> {
  // final String Field? field;

  const EventAbility({
    required super.name,
    required super.description,
    required super.duration,
    required super.managerAndExpectParticipator,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
  });

  @override
  Json get json => _$EventAbilityToJson(this);
}

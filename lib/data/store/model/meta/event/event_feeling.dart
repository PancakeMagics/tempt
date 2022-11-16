part of '../../model.dart';

@_Serialize()
class EventFeeling extends Event<EventFeeling> {
  // final String Field? field;
  const EventFeeling({
    required super.name,
    required super.description,
    required super.duration,
    required super.managerAndExpectParticipator,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
  });

  @override
  Json get json => _$EventFeelingToJson(this);
}

part of '../../model.dart';

@_Serialize()
class NoteConscious extends Note<NoteConscious> {
  const NoteConscious({
    required super.createdHumanAndDateTime,
    required super.content,
    super.visibility = Visibility.private,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
  });

  @override
  Json get json => _$NoteConsciousToJson(this);
}
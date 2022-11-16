part of '../../model.dart';

@_Serialize()
class NoteFeeling extends Note<NoteFeeling> {
  const NoteFeeling({
    required super.createdHumanAndDateTime,
    required super.content,
    super.visibility = Visibility.private,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
  });

  @override
  Json get json => _$NoteFeelingToJson(this);
}

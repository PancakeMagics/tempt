part of '../../model.dart';

/// describe a person's ability, power or restriction to do something
@_Serialize()
class NoteAbility extends Note<NoteAbility> {
  final bool isStudyGram;

  const NoteAbility({
    required super.createdHumanAndDateTime,
    required super.content,
    super.visibility = Visibility.private,
    super.relatedNote = _emptyRN,
    super.relatedEvent = _emptyRE,
    required this.isStudyGram,
  });

  @override
  Json get json => _$NoteAbilityToJson(this);
}

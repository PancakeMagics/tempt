part of '../../model.dart';

extension ParseType on Type {
  String get toStringUnderScore => toString()._fromCamelToUnderscore;

  Model get toModel => toString()._lowercaseFirstChar._toModel;
}

extension _StringToModel on String {
  Model get _toModel => parseEnumName(Model.values);
  HumanKind get _toHumanKind => parseEnumName(HumanKind.values);
  EventKind get _toEventKind => parseEnumName(EventKind.values);
  NoteKind get _toNoteKind => parseEnumName(NoteKind.values);
}

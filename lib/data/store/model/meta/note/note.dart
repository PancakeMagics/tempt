part of '../../model.dart';

enum NoteKind {
  ability,
  conscious,
  feeling,
}

abstract class Note<M extends Note<M>> extends DataModel<M> {
  final MapEntry<Human, String> createdHumanAndDateTime;
  final String content;
  final bool isDailyNote;
  final Visibility visibility;
  final RelatedNote relatedNote;
  final RelatedEvent relatedEvent;
  final bool inBasket;
  final bool inTrash;

  /// default storeId = {[StoreService.hive], createdDateTime} (TODO)
  const Note({
    required this.createdHumanAndDateTime,
    required this.content,
    this.isDailyNote = false,
    this.visibility = Visibility.private,
    this.relatedNote = _emptyRN,
    this.relatedEvent = _emptyRE,
    this.inBasket = false,
    this.inTrash = false,
  });
}

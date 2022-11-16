part of '../model.dart';

/// used in life
// {id: (the note represents current-instance's perspective on id-instance)}
// {humanKind: perspective-for-human}
// {noteKind: {ownerId: perspective-for-notes}}
// {eventKind: {managerId: perspective-for-events}}
typedef Perspectives = Map<String, Note>;
typedef HumanRelatedHuman = Map<HumanKind, Perspectives>;
typedef HumanRelatedNote = Map<NoteKind, Map<String, Perspectives>>;
typedef HumanRelatedEvent = Map<EventKind, Map<String, Perspectives>>;
const HumanRelatedHuman _emptyHrH = {};
const HumanRelatedNote _emptyHrN = {};
const HumanRelatedEvent _emptyHrE = {};

/// used in meta
// {noteKind: noteIds}
// {eventKind: eventIds}
typedef RelatedNote = Map<NoteKind, Set<String>>;
typedef RelatedEvent = Map<EventKind, Set<String>>;
const RelatedNote _emptyRN = {};
const RelatedEvent _emptyRE = {};

enum Visibility {
  private,
  protected,
  public,
}
// TODO:
// mixin DesignAble {}
part of '../../../model.dart';

/// [MapEntry]
class _ConvertEntry extends JsonConverter<MapEntry<String, String>, String> {
  const _ConvertEntry();

  @override
  String toJson(MapEntry<String, String> object) =>
      <String>[object.key, object.value]._toJString;

  @override
  MapEntry<String, String> fromJson(String json) {
    final list = json._fromJStringToIterable;
    return MapEntry(list.first, list.last);
  }
}

class _ConvertEntryH extends JsonConverter<MapEntry<Human, String>, String> {
  const _ConvertEntryH();

  @override
  String toJson(MapEntry<Human, String> object) => <String>[
        (const _ConvertHuman()).toJson(object.key),
        object.value
      ]._toJString;

  @override
  MapEntry<Human, String> fromJson(String json) {
    final list = json._fromJStringToIterable;
    return MapEntry((const _ConvertHuman()).fromJson(list.first), list.last);
  }
}

class _ConvertEntryHH extends JsonConverter<MapEntry<Human, Human>, String> {
  const _ConvertEntryHH();

  @override
  String toJson(MapEntry<Human, Human> object) => <String>[
        (const _ConvertHuman()).toJson(object.key),
        (const _ConvertHuman()).toJson(object.value),
      ]._toJString;

  @override
  MapEntry<Human, Human> fromJson(String json) {
    final list = json._fromJStringToIterable;
    return MapEntry((const _ConvertHuman()).fromJson(list.first),
        (const _ConvertHuman().fromJson(list.last)));
  }
}

/// [Map]
class _ConvertPerspectives extends JsonConverter<Perspectives, String> {
  const _ConvertPerspectives();

  @override
  String toJson(Perspectives ps) => ps._toJStringFromMap<String, Note>(
        keyMap: (key) => key,
        valueMap: (const _ConvertNote()).toJson,
      );

  @override
  Perspectives fromJson(String json) => json._fromJStringToMap<String, Note>(
        keyMap: (key) => key,
        valueMap: (const _ConvertNote()).fromJson,
      );
}

class _ConvertHrH extends JsonConverter<HumanRelatedHuman, String> {
  const _ConvertHrH();

  @override
  String toJson(HumanRelatedHuman hrh) =>
      hrh._toJStringFromMap<HumanKind, Perspectives>(
        keyMap: (key) => key.name,
        valueMap: (const _ConvertPerspectives()).toJson,
      );

  @override
  HumanRelatedHuman fromJson(String json) =>
      json._fromJStringToMap<HumanKind, Perspectives>(
        keyMap: (name) => name._toHumanKind,
        valueMap: (const _ConvertPerspectives()).fromJson,
      );
}

class _ConvertHrN extends JsonConverter<HumanRelatedNote, String> {
  const _ConvertHrN();

  @override
  String toJson(HumanRelatedNote hrn) =>
      hrn._toJStringFromMap<NoteKind, Map<String, Perspectives>>(
        keyMap: (key) => key.name,
        valueMap: (value) => value._toJStringFromMap<String, Perspectives>(
          keyMap: (key) => key,
          valueMap: (const _ConvertPerspectives()).toJson,
        ),
      );

  @override
  HumanRelatedNote fromJson(String json) =>
      json._fromJStringToMap<NoteKind, Map<String, Perspectives>>(
        keyMap: (key) => key._toNoteKind,
        valueMap: (value) => value._fromJStringToMap<String, Perspectives>(
          keyMap: (ownerId) => ownerId,
          valueMap: (const _ConvertPerspectives()).fromJson,
        ),
      );
}

class _ConvertHrE extends JsonConverter<HumanRelatedEvent, String> {
  const _ConvertHrE();

  @override
  String toJson(HumanRelatedEvent hre) =>
      hre._toJStringFromMap<EventKind, Map<String, Perspectives>>(
        keyMap: (key) => key.name,
        valueMap: (value) => value._toJStringFromMap<String, Perspectives>(
          keyMap: (key) => key,
          valueMap: (const _ConvertPerspectives()).toJson,
        ),
      );

  @override
  HumanRelatedEvent fromJson(String json) =>
      json._fromJStringToMap<EventKind, Map<String, Perspectives>>(
        keyMap: (key) => key._toEventKind,
        valueMap: (value) => value._fromJStringToMap<String, Perspectives>(
          keyMap: (ownerId) => ownerId,
          valueMap: (const _ConvertPerspectives()).fromJson,
        ),
      );
}

class _ConvertRN extends JsonConverter<RelatedNote, String> {
  const _ConvertRN();

  @override
  String toJson(RelatedNote object) =>
      object._toJStringFromMap<NoteKind, Set<String>>(
        keyMap: (key) => key.name,
        valueMap: (value) => value._toJString,
      );

  @override
  RelatedNote fromJson(String json) =>
      json._fromJStringToMap<NoteKind, Set<String>>(
        keyMap: (key) => key._toNoteKind,
        valueMap: (value) => value._fromJStringToIterable.toSet(),
      );
}

class _ConvertRE extends JsonConverter<RelatedEvent, String> {
  const _ConvertRE();

  @override
  String toJson(RelatedEvent object) =>
      object._toJStringFromMap<EventKind, Set<String>>(
        keyMap: (key) => key.name,
        valueMap: (value) => value._toJString,
      );

  @override
  RelatedEvent fromJson(String json) =>
      json._fromJStringToMap<EventKind, Set<String>>(
        keyMap: (key) => key._toEventKind,
        valueMap: (value) => value._fromJStringToIterable.toSet(),
      );
}

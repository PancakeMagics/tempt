part of '../../../model.dart';

String _abstractModelToJson(DataModel model) => '${model.dataModelType} ${model.jsonString}';

class _ConvertHuman extends JsonConverter<Human, String> {
  const _ConvertHuman();
  @override
  String toJson(Human model) => _abstractModelToJson(model);

  @override
  Human fromJson(String typedJsonString) {
    final entry = typedJsonString._parseTypedJString;
    final json = entry.value;
    switch (entry.key) {
      case Model.person:
        return json.toModel<Person>();
      case Model.friends:
        return json.toModel<Friend>();
      case Model.group:
        return json.toModel<Group>();
      case Model.org:
        return json.toModel<Org>();
      default:
        throw UnimplementedError();
    }
  }
}

class _ConvertEvent extends JsonConverter<Event, String> {
  const _ConvertEvent();

  @override
  String toJson(Event model) => _abstractModelToJson(model);

  @override
  Event fromJson(String typedJsonString) {
    final entry = typedJsonString._parseTypedJString;
    final json = entry.value;
    switch (entry.key) {
      case Model.eventAbility:
        return json.toModel<EventAbility>();
      case Model.eventConscious:
        return json.toModel<EventConscious>();
      case Model.eventFeeling:
        return json.toModel<EventFeeling>();
      default:
        throw UnimplementedError();
    }
  }
}

class _ConvertNote extends JsonConverter<Note, String> {
  const _ConvertNote();

  @override
  String toJson(Note model) => _abstractModelToJson(model);

  @override
  Note fromJson(String typedJsonString) {
    final entry = typedJsonString._parseTypedJString;
    final json = entry.value;
    switch (entry.key) {
      case Model.noteAbility:
        return json.toModel<NoteFeeling>();
      case Model.noteConscious:
        return json.toModel<NoteAbility>();
      case Model.noteFeeling:
        return json.toModel<NoteFeeling>();
      default:
        throw UnimplementedError();
    }
  }
}

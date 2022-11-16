part of '../../model.dart';

typedef Json = Map<String, dynamic>;
extension JsonsToModels on Iterable<Json> {
  Iterable<M> _toModels<M extends DataModel<M>>() {
    final modelType = M.toModel;
    final models = <M>[];
    switch (modelType) {
      case Model.person:
        for (var json in this) {
          models.add(_$PersonFromJson(json) as M);
        }
        break;
      case Model.friends:
        for (var json in this) {
          models.add(_$FriendFromJson(json) as M);
        }
        break;
      case Model.group:
        for (var json in this) {
          models.add(_$GroupFromJson(json) as M);
        }
        break;
      case Model.org:
        for (var json in this) {
          models.add(_$OrgFromJson(json) as M);
        }
        break;
      case Model.eventAbility:
        for (var json in this) {
          models.add(_$EventAbilityFromJson(json) as M);
        }
        break;
      case Model.eventConscious:
        for (var json in this) {
          models.add(_$EventConsciousFromJson(json) as M);
        }
        break;
      case Model.eventFeeling:
        for (var json in this) {
          models.add(_$EventFeelingFromJson(json) as M);
        }
        break;
      case Model.noteAbility:
        for (var json in this) {
          models.add(_$NoteAbilityFromJson(json) as M);
        }
        break;
      case Model.noteConscious:
        for (var json in this) {
          models.add(_$NoteConsciousFromJson(json) as M);
        }
        break;
      case Model.noteFeeling:
        for (var json in this) {
          models.add(_$NoteFeelingFromJson(json) as M);
        }
        break;
      default:
        throw UnimplementedError();
    }
    return models;
  }
}

extension JsonToModel on Json {
  M toModel<M extends DataModel<M>>() => [this]._toModels<M>().first;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      storeId: (json['storeId'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$StoreServiceEnumMap, k), e as String),
          ) ??
          DataModel._emptyStoreId,
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      relatedHuman: json['relatedHuman'] == null
          ? _emptyHrH
          : const _ConvertHrH().fromJson(json['relatedHuman'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyHrN
          : const _ConvertHrN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyHrE
          : const _ConvertHrE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'storeId': instance.storeId
          .map((k, e) => MapEntry(_$StoreServiceEnumMap[k]!, e)),
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'relatedHuman': const _ConvertHrH().toJson(instance.relatedHuman),
      'relatedNote': const _ConvertHrN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertHrE().toJson(instance.relatedEvent),
    };

const _$StoreServiceEnumMap = {
  StoreService.hive: 'hive',
  StoreService.firestore: 'firestore',
};

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      storeId: (json['storeId'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$StoreServiceEnumMap, k), e as String),
          ) ??
          DataModel._emptyStoreId,
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      relatedHuman: json['relatedHuman'] == null
          ? _emptyHrH
          : const _ConvertHrH().fromJson(json['relatedHuman'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyHrN
          : const _ConvertHrN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyHrE
          : const _ConvertHrE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'storeId': instance.storeId
          .map((k, e) => MapEntry(_$StoreServiceEnumMap[k]!, e)),
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'relatedHuman': const _ConvertHrH().toJson(instance.relatedHuman),
      'relatedNote': const _ConvertHrN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertHrE().toJson(instance.relatedEvent),
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      storeId: (json['storeId'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$StoreServiceEnumMap, k), e as String),
          ) ??
          DataModel._emptyStoreId,
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      relatedHuman: json['relatedHuman'] == null
          ? _emptyHrH
          : const _ConvertHrH().fromJson(json['relatedHuman'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyHrN
          : const _ConvertHrN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyHrE
          : const _ConvertHrE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'storeId': instance.storeId
          .map((k, e) => MapEntry(_$StoreServiceEnumMap[k]!, e)),
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'relatedHuman': const _ConvertHrH().toJson(instance.relatedHuman),
      'relatedNote': const _ConvertHrN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertHrE().toJson(instance.relatedEvent),
    };

Org _$OrgFromJson(Map<String, dynamic> json) => Org(
      storeId: (json['storeId'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$StoreServiceEnumMap, k), e as String),
          ) ??
          DataModel._emptyStoreId,
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      relatedHuman: json['relatedHuman'] == null
          ? _emptyHrH
          : const _ConvertHrH().fromJson(json['relatedHuman'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyHrN
          : const _ConvertHrN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyHrE
          : const _ConvertHrE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$OrgToJson(Org instance) => <String, dynamic>{
      'storeId': instance.storeId
          .map((k, e) => MapEntry(_$StoreServiceEnumMap[k]!, e)),
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'relatedHuman': const _ConvertHrH().toJson(instance.relatedHuman),
      'relatedNote': const _ConvertHrN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertHrE().toJson(instance.relatedEvent),
    };

NoteAbility _$NoteAbilityFromJson(Map<String, dynamic> json) => NoteAbility(
      createdHumanAndDateTime: const _ConvertEntryH()
          .fromJson(json['createdHumanAndDateTime'] as String),
      content: json['content'] as String,
      visibility:
          $enumDecodeNullable(_$VisibilityEnumMap, json['visibility']) ??
              Visibility.private,
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
      isStudyGram: json['isStudyGram'] as bool,
    );

Map<String, dynamic> _$NoteAbilityToJson(NoteAbility instance) =>
    <String, dynamic>{
      'createdHumanAndDateTime':
          const _ConvertEntryH().toJson(instance.createdHumanAndDateTime),
      'content': instance.content,
      'visibility': _$VisibilityEnumMap[instance.visibility]!,
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
      'isStudyGram': instance.isStudyGram,
    };

const _$VisibilityEnumMap = {
  Visibility.private: 'private',
  Visibility.protected: 'protected',
  Visibility.public: 'public',
};

NoteConscious _$NoteConsciousFromJson(Map<String, dynamic> json) =>
    NoteConscious(
      createdHumanAndDateTime: const _ConvertEntryH()
          .fromJson(json['createdHumanAndDateTime'] as String),
      content: json['content'] as String,
      visibility:
          $enumDecodeNullable(_$VisibilityEnumMap, json['visibility']) ??
              Visibility.private,
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$NoteConsciousToJson(NoteConscious instance) =>
    <String, dynamic>{
      'createdHumanAndDateTime':
          const _ConvertEntryH().toJson(instance.createdHumanAndDateTime),
      'content': instance.content,
      'visibility': _$VisibilityEnumMap[instance.visibility]!,
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
    };

NoteFeeling _$NoteFeelingFromJson(Map<String, dynamic> json) => NoteFeeling(
      createdHumanAndDateTime: const _ConvertEntryH()
          .fromJson(json['createdHumanAndDateTime'] as String),
      content: json['content'] as String,
      visibility:
          $enumDecodeNullable(_$VisibilityEnumMap, json['visibility']) ??
              Visibility.private,
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$NoteFeelingToJson(NoteFeeling instance) =>
    <String, dynamic>{
      'createdHumanAndDateTime':
          const _ConvertEntryH().toJson(instance.createdHumanAndDateTime),
      'content': instance.content,
      'visibility': _$VisibilityEnumMap[instance.visibility]!,
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
    };

EventAbility _$EventAbilityFromJson(Map<String, dynamic> json) => EventAbility(
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      duration: const _ConvertEntry().fromJson(json['duration'] as String),
      managerAndExpectParticipator: const _ConvertEntryHH()
          .fromJson(json['managerAndExpectParticipator'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$EventAbilityToJson(EventAbility instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'duration': const _ConvertEntry().toJson(instance.duration),
      'managerAndExpectParticipator':
          const _ConvertEntryHH().toJson(instance.managerAndExpectParticipator),
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
    };

EventConscious _$EventConsciousFromJson(Map<String, dynamic> json) =>
    EventConscious(
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      duration: const _ConvertEntry().fromJson(json['duration'] as String),
      managerAndExpectParticipator: const _ConvertEntryHH()
          .fromJson(json['managerAndExpectParticipator'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$EventConsciousToJson(EventConscious instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'duration': const _ConvertEntry().toJson(instance.duration),
      'managerAndExpectParticipator':
          const _ConvertEntryHH().toJson(instance.managerAndExpectParticipator),
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
    };

EventFeeling _$EventFeelingFromJson(Map<String, dynamic> json) => EventFeeling(
      name: json['name'] as String,
      description: const _ConvertNote().fromJson(json['description'] as String),
      duration: const _ConvertEntry().fromJson(json['duration'] as String),
      managerAndExpectParticipator: const _ConvertEntryHH()
          .fromJson(json['managerAndExpectParticipator'] as String),
      relatedNote: json['relatedNote'] == null
          ? _emptyRN
          : const _ConvertRN().fromJson(json['relatedNote'] as String),
      relatedEvent: json['relatedEvent'] == null
          ? _emptyRE
          : const _ConvertRE().fromJson(json['relatedEvent'] as String),
    );

Map<String, dynamic> _$EventFeelingToJson(EventFeeling instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': const _ConvertNote().toJson(instance.description),
      'duration': const _ConvertEntry().toJson(instance.duration),
      'managerAndExpectParticipator':
          const _ConvertEntryHH().toJson(instance.managerAndExpectParticipator),
      'relatedNote': const _ConvertRN().toJson(instance.relatedNote),
      'relatedEvent': const _ConvertRE().toJson(instance.relatedEvent),
    };

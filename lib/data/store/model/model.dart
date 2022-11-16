
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:json_annotation/json_annotation.dart' show $enumDecode, $enumDecodeNullable, JsonConverter, JsonSerializable;
import 'package:tempt/bloc/extension_string.dart';
import 'package:tempt/data/README.dart' show Service;

import '../service/service.dart';

part 'model.g.dart';
/// -------------------------------------------------------------------------------------------
part 'life/_human.dart';
part 'life/person.dart';
part 'life/friends.dart';
part 'life/group.dart';
part 'life/org.dart';
part 'life/contact/contact.dart';
part 'meta/_util.dart';
part 'meta/note/note.dart';
part 'meta/note/note_ability.dart';
part 'meta/note/note_conscious.dart';
part 'meta/note/note_feeling.dart';
part 'meta/event/event.dart';
part 'meta/event/event_ability.dart';
part 'meta/event/event_conscious.dart';
part 'meta/event/event_feeling.dart';

/// --------------------------
part '_mix/_parse/parse_json.dart';
part '_mix/_parse/parse_string.dart';
part '_mix/_parse/parse_type.dart';
part '_mix/_parse/_convert/annotation.dart';
part '_mix/_parse/_convert/convert_map.dart';
part '_mix/_parse/_convert/convert_model.dart';
part '_mix/_parse/_convert/convert_user.dart';
part '_mix/_exception.dart';
part '_mix/data.dart';
part '_mix/data_set.dart';
part '_mix/data_set_advance.dart';
part '_mix/set/set.dart';
part '_mix/set/set_extension.dart';
part '_transactor/data.dart';
part '_transactor/data_delete.dart';
part '_transactor/data_get.dart';
part '_transactor/data_insert.dart';
part '_transactor/data_update.dart';

enum Model {
  /// see [Users], [User]
  user,

  /// see [Human]
  person,
  friends,
  group,
  org,

  /// see [Event]
  eventAbility,
  eventConscious,
  eventFeeling,

  /// see [Note]
  noteAbility,
  noteConscious,
  noteFeeling,
}

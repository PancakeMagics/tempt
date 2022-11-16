part of '../../../model.dart';

class _Serialize extends JsonSerializable {
  const _Serialize()
      : super(
    explicitToJson: true,
    converters: _myConverters,
  );
}

const _myConverters = <JsonConverter<dynamic, dynamic>>[
  _ConvertHuman(),
  _ConvertNote(),
  _ConvertEvent(),
  // _ConvertTopic(),

  _ConvertHrH(),
  _ConvertHrN(),
  _ConvertHrE(),
  _ConvertRN(),
  _ConvertRE(),

  _ConvertEntry(),
  _ConvertEntryH(),
  _ConvertEntryHH(),

];



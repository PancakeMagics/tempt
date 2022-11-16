

extension StringToEnum on String {
  E parseEnumName<E extends Enum>(Iterable<E> enumValues) {
    E? e;
    for (var value in enumValues) {
      if (this == value.name) {
        e = value;
        break;
      }
    }
    return e ?? (throw Exception('$this not exist in:\n $enumValues'));
  }
}
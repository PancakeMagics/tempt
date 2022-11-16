

extension StreamWhere<M> on Stream<M> {
  Stream<M> get whereDiff {
    M? previousValue;
    return where((event) {
      if (previousValue == event) {
        return false;
      } else {
        previousValue = event;
        return true;
      }
    });
  }
}

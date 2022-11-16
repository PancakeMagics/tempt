


extension DateTimeStringUtil on DateTime {
  String get date => toString().split(' ').first;
  String get time => toString().split(' ').last;
}

enum Repeat {
  once,
  onceAndRemember,
  timesForEveryWorkDay,
  timesForEveryWeekend,
  timesForEveryDay,
  timesForHour,
  timesForMinute,
  timesForSecond,
  dateTimesForEveryWeek,
  dateTimesForEveryMonth,
  dateTimesForEveryYear,
}

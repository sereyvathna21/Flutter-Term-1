class CustomDuration {
  final int _milliseconds;

  CustomDuration.fromHours(int hours)
      : _milliseconds = hours >= 0
            ? hours * 3600 * 1000
            : throw ArgumentError("Duration cannot be negative.");

  CustomDuration.fromMinutes(int minutes)
      : _milliseconds = minutes >= 0
            ? minutes * 60 * 1000
            : throw ArgumentError("Duration cannot be negative.");

  CustomDuration.fromSeconds(int seconds)
      : _milliseconds = seconds >= 0
            ? seconds * 1000
            : throw ArgumentError("Duration cannot be negative.");

  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._fromMilliseconds(
        _milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception("Cannot subtract larger duration from smaller duration.");
    }
    return CustomDuration._fromMilliseconds(
        _milliseconds - other._milliseconds);
  }

  CustomDuration._fromMilliseconds(this._milliseconds);

  String toString() {
    int totalSeconds = _milliseconds ~/ 1000;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  CustomDuration duration1 = CustomDuration.fromHours(2);
  CustomDuration duration2 = CustomDuration.fromMinutes(10);
  CustomDuration duration3 = CustomDuration.fromSeconds(10);

  print(duration1 + duration2 + duration3);
  print(duration1 > duration2);

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}

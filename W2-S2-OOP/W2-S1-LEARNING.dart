class Distance {
  final double _cm;
  final double _m;
  final double _km;

  const Distance({double cm = 0, double m = 0, double km = 0})
      : _cm = cm,
        _m = m,
        _km = km;

  const Distance.fromCm(double centimeters) : this(cm: centimeters);

  const Distance.fromMeters(double meters) : this(m: meters);

  const Distance.fromKm(double kilometers) : this(km: kilometers);

  Distance operator +(Distance other) {
    return Distance.fromMeters(_toMeters() + other._toMeters());
  }

  double get inCentimeters => _toMeters() * 100;
  double get inMeters => _toMeters();
  double get inKilometers => _toMeters() / 1000;

  double _toMeters() {
    return (_cm / 100) + _m + (_km * 1000);
  }
}

void main() {
  var distance1 = Distance.fromKm(3.4);
  var distance2 = Distance.fromMeters(1000);
  print((distance1 + distance2).inCentimeters);

  var mixedDistance = Distance(cm: 10, m: 0.2, km: 4);
  print(mixedDistance.inMeters);
  print(mixedDistance.inCentimeters);
}

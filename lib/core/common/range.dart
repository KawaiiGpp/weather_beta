class Range {
  final double min;
  final double max;

  const Range(this.min, this.max) : assert(min <= max);

  Range.fromInt(int min, int max) : min = min.toDouble(), max = max.toDouble();

  double get size => max - min;

  bool contains(double value) => value >= min && value <= max;
}

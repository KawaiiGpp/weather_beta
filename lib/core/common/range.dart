class Range {
  final double min;
  final double max;

  double get size => max - min;

  const Range(this.min, this.max);
}

class Range extends _ValueRange<double> {
  const Range(super.min, super.max);

  @override
  double get size => max - min;
}

class IntRange extends _ValueRange<int> {
  const IntRange(super.min, super.max);

  @override
  int get size => max - min;
}

class _ValueRange<T extends num> {
  final T min;
  final T max;

  num get size => max - min;

  const _ValueRange(this.min, this.max) : assert(min <= max);
}

class TierMap<T> {
  final T baseOutput;
  final List<double> thresholds;
  final List<T> outputs;

  const TierMap({
    required this.baseOutput,
    required this.thresholds,
    required this.outputs,
  });

  T evaluate(double input) {
    assert(thresholds.isNotEmpty);
    assert(thresholds.length == outputs.length);

    if (input < thresholds[0]) return baseOutput;

    final index = thresholds.lastIndexWhere((it) => input >= it);
    return outputs[index];
  }
}

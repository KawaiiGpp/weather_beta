extension DoubleExtension on num {
  String toStringAsMaxFixed(int max) {
    return num.parse(toStringAsFixed(max)).toString();
  }
}

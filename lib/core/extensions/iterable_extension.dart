extension IterableExtension<T> on Iterable<T> {
  List<R> mapToList<R>(R Function(T it) transform) {
    return map(transform).toList();
  }
}

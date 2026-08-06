extension IterableExtension<T> on Iterable<T> {
  List<R> mapToList<R>(R Function(T it) transform) {
    return map(transform).toList();
  }

  List<R> expandToList<R>(Iterable<R> Function(T it) transform) {
    return expand(transform).toList();
  }
}

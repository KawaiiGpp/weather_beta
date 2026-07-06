extension KotlinExtension<T> on T {
  R let<R>(R Function(T it) block) {
    return block(this);
  }

  T also<R>(R Function(T it) block) {
    block(this);
    return this;
  }
}

class CounterDataSource {
  int _value = 0;

  int increment() {
    _value += 1;
    return _value;
  }

  int getValue() {
    return _value;
  }
}
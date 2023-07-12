class CounterDataSource {
  int value = 0;

  int increment() {
    value += 1;
    return value;
  }

  int getValue() {
    return value;
  }
}
class CounterDataSource {
  int value = 0;

  int increment() {
    value += 1;
    return value;
  }

  int decrement() {
    value -= 1;
    return value;
  }
}
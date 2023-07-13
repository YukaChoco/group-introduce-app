abstract class CounterRepository {
  Future<int> increment();
  Future<int> decrement();
  Future<int> doubleIncrement();
}
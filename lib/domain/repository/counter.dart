abstract class CounterRepository {
  Future<int> increment();
  Future<int> decrement();
}
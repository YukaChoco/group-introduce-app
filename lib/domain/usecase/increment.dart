import 'package:group_introduce_project/domain/repository/counter.dart';

class IncrementCounter {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  Future<int> increment() {
    return repository.increment();
  }

  Future<int> decrement() {
    return repository.decrement();
  }
}

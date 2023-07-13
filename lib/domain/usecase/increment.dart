import 'package:group_introduce_project/domain/repository/counter.dart';

class ChangeStateCounter {
  final CounterRepository repository;

  ChangeStateCounter(this.repository);

  Future<int> increment() {
    return repository.increment();
  }

  Future<int> decrement() {
    return repository.decrement();
  }

  Future<int> doubleIncrement() {
    return repository.doubleIncrement();
  }
}

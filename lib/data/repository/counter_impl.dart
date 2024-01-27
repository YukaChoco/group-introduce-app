// Counter Repository
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/counter.dart';

class CounterRepository {
  final Counter _counter;

  CounterRepository(this._counter);

  void increment() => _counter.increment();
  void decrement() => _counter.decrement();
  void doubleIncrement() => _counter.doubleIncrement();
}

final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  final counter = ref.watch(counterProvider.notifier);
  return CounterRepository(counter);
});

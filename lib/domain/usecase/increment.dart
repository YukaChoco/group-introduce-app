import 'package:group_introduce_project/data/repository/counter_impl.dart';
import 'package:group_introduce_project/domain/model/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Counter UseCase
class CounterUseCase {
  final CounterRepository _repository;

  CounterUseCase(this._repository);

  void increment() => _repository.increment();
  void decrement() => _repository.decrement();
  void doubleIncrement() => _repository.doubleIncrement();
}

final counterUseCaseProvider = Provider<CounterUseCase>((ref) {
  final repository = ref.watch(counterRepositoryProvider);
  return CounterUseCase(repository);
});







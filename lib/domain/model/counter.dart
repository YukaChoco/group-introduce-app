import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
  void doubleIncrement() => state += 2;
}

// Providers
final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
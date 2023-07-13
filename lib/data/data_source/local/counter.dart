import 'package:group_introduce_project/domain/model/counter.dart';

class CounterDataSource {
  Counter counter =  Counter(value: 0);
  
  int increment() {
    counter.value += 1;
    return counter.value;
  }

  int decrement() {
    counter.value -= 1;
    return counter.value;
  }

  int doubleIncrement() {
    counter.value += 2;
    return counter.value;
  }
}

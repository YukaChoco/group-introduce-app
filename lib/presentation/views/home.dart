import 'package:flutter/material.dart';
import 'package:group_introduce_project/domain/model/counter.dart';
import 'package:group_introduce_project/domain/usecase/increment.dart';
import 'package:group_introduce_project/presentation/widgets/floating_action_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterUseCase = ref.read(counterUseCaseProvider);

    void incrementCounter() async {
      counterUseCase.increment();
    }

    void decrementCounter() async {
      counterUseCase.decrement();
    }

    void doubleIncrementCounter() async {
      counterUseCase.doubleIncrement();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("a"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatinActionButtonWidget(
                icon: Icons.add,
                tooltip: "increment",
                onPressed: incrementCounter),
            const SizedBox(height: 10), // 2つのボタン間のスペース
            FloatinActionButtonWidget(
                icon: Icons.remove,
                tooltip: "decrement",
                onPressed: decrementCounter),
            const SizedBox(height: 10), // 2つのボタン間のスペース
            FloatinActionButtonWidget(
                icon: Icons.double_arrow,
                tooltip: "double increment",
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                }),
          ],
        ));
  }
}

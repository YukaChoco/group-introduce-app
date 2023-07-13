import 'package:flutter/material.dart';
import 'package:group_introduce_project/data/data_source/local/counter.dart';
import 'package:group_introduce_project/data/repository/counter_impl.dart';
import 'package:group_introduce_project/domain/usecase/increment.dart';
import 'package:group_introduce_project/presentation/widgets/floating_action_button.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterState = CounterDataSource();

  void _incrementCounter() async {
    await ChangeStateCounter(CounterRepositoryImpl(_counterState)).increment();
    setState(() {});
  }

  void _decrementCounter() async {
    await ChangeStateCounter(CounterRepositoryImpl(_counterState)).decrement();
    setState(() {});
  }

  void _doubleIncrementCounter() async {
    await ChangeStateCounter(CounterRepositoryImpl(_counterState))
        .doubleIncrement();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${_counterState.counter.value}',
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
                onPressed: _incrementCounter),
            const SizedBox(height: 10), // 2つのボタン間のスペース
            FloatinActionButtonWidget(
                icon: Icons.remove,
                tooltip: "decrement",
                onPressed: _decrementCounter),
            const SizedBox(height: 10), // 2つのボタン間のスペース
            FloatinActionButtonWidget(
                icon: Icons.double_arrow,
                tooltip: "double increment",
                onPressed: _doubleIncrementCounter),
          ],
        ));
  }
}

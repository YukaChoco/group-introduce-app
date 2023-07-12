import 'package:flutter/material.dart';
import 'package:group_introduce_project/data/data_source/local/counter.dart';
import 'package:group_introduce_project/data/repository/counter_impl.dart';
import 'package:group_introduce_project/domain/usecase/increment.dart';

class MyHomePage extends StatefulWidget {
  final CounterDataSource dataSource;
  final String title;

  MyHomePage({
    required this.title,
    required this.dataSource,
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    _counter = await IncrementCounter(CounterRepositoryImpl(widget.dataSource)).call();
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

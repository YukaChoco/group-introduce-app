import 'package:group_introduce_project/data/data_source/local/counter.dart';
import 'package:group_introduce_project/domain/repository/counter.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterDataSource dataSource;

  CounterRepositoryImpl(this.dataSource);

  @override
  Future<int> increment() async {
    return dataSource.increment();
  }
}

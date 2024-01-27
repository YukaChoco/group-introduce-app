import 'package:group_introduce_project/domain/model/user.dart';

abstract class UserRepository {
  Future<void> addUser(CustomUser user);
}

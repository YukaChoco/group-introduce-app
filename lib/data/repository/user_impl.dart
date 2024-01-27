import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/model/user.dart';
import 'package:group_introduce_project/domain/repository/user.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;

  UserRepositoryImpl(this._firestore);
  
  @override
  Future<void> addUser(CustomUser user) {
    return _firestore.collection('user').doc(user.id).set({
      'name': user.name,
    });
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return UserRepositoryImpl(firestore);
});


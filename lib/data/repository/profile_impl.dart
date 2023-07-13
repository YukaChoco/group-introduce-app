import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/repository/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProfileRepository implements ProfileRepository {
  final FirebaseFirestore _firestore;

  FirestoreProfileRepository(this._firestore);

  @override
  Stream<List<Profile>> getAllData() {
    return _firestore.collection('profile').snapshots().map((snapshot) {
      // 取得したデータをコンソールに表示する
      var profiles = snapshot.docs
          .map((doc) => Profile(
              id: doc.id,
              name: doc['name'],
              introduction: doc['introduction'],
              imageURL: doc['imageURL']))
          .toList();
      return profiles;
    });
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>(
    (ref) => FirestoreProfileRepository(ref.read(firestoreProvider)));

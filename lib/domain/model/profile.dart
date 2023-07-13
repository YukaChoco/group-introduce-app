import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile {
  final String id;
  final String name;
  final String introduction;
  final String imageURL;

  Profile({required this.id, required this.name, required this.introduction, required this.imageURL});

  @override
  String toString() {
    return 'Profile { id: $id, name: $name, introduction: $introduction, imageURL: $imageURL }';
  }
}

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
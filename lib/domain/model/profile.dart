import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProfileStatus { loading, error, loaded }

class ProfileState {
  final ProfileStatus status;
  final Profile? profile;
  final String? errorMessage;

  ProfileState({required this.status, this.profile, this.errorMessage});
}

class ProfileListState {
  final ProfileStatus status;
  final List<Profile>? profiles;
  final String? errorMessage;

  ProfileListState({required this.status, this.profiles, this.errorMessage});
}


class Profile {
  final String id;
  final String orgID;
  final String name;
  final String introduction;
  final String imageURL;

  Profile(
      {required this.id,
      required this.orgID,
      required this.name,
      required this.introduction,
      required this.imageURL});

  @override
  String toString() {
    return 'Profile { id: $id,orgID: $orgID ,name: $name, introduction: $introduction, imageURL: $imageURL }';
  }
}

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

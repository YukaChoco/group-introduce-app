import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/data/repository/profile_impl.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/repository/profile.dart';

class GetProfile {
  final ProfileRepository _repository;

  GetProfile(this._repository);

  Stream<List<Profile>> execute(orgID) {
    final user = _repository.getOrgAllProfile(orgID);
    return user;
  }
}

final getProfileProvider = Provider<GetProfile>(
    (ref) => GetProfile(ref.read(profileRepositoryProvider)));

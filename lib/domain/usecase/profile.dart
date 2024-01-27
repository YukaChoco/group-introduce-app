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

class ProfileStateNotifier extends StateNotifier<ProfileListState> {
  final GetProfile getProfile;

  ProfileStateNotifier(this.getProfile) : super(ProfileListState(status: ProfileStatus.loading));

  void fetchProfile(String orgID) {
    getProfile.execute(orgID).listen(
      (profile) {
        state = ProfileListState(status: ProfileStatus.loaded, profiles: profile);
      },
      onError: (e) {
        state = ProfileListState(status: ProfileStatus.error, errorMessage: e.toString());
      },
    );
  }
}

class GetProfileById {
  final ProfileRepository _repository;

  GetProfileById(this._repository);

  Stream<Profile> execute(orgID, profileID) {
    final user = _repository.getProfileById(orgID, profileID);
    return user;
  }
}


class ProfileByIDStateNotifier extends StateNotifier<ProfileState> {
  final GetProfileById getProfileById;

  ProfileByIDStateNotifier(this.getProfileById) : super(ProfileState(status: ProfileStatus.loading));

  void fetchProfileByID(String orgID, String profileID) {
    getProfileById.execute(orgID, profileID).listen(
      (profile) {
        state = ProfileState(status: ProfileStatus.loaded, profile: profile);
      },
      onError: (e) {
        state = ProfileState(status: ProfileStatus.error, errorMessage: e.toString());
      },
    );
  }
}

final getProfileByIdProvider = Provider<GetProfileById>(
    (ref) => GetProfileById(ref.read(profileRepositoryProvider)));

final profileStateProvider = StateNotifierProvider<ProfileByIDStateNotifier, ProfileState>(
    (ref) => ProfileByIDStateNotifier(ref.read(getProfileByIdProvider)));


final profileListStateProvider = StateNotifierProvider<ProfileStateNotifier, ProfileListState>(
    (ref) => ProfileStateNotifier(ref.read(getProfileProvider)));

final getProfileProvider = Provider<GetProfile>(
    (ref) => GetProfile(ref.read(profileRepositoryProvider)));


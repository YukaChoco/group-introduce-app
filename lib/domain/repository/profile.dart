import 'package:group_introduce_project/domain/model/profile.dart';

abstract class ProfileRepository {
  Stream<List<Profile>> getOrgAllProfile(orgID);
}

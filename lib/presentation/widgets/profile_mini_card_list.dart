import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/presentation/widgets/profile_mini_card.dart';

class ProfileMiniCardList extends ConsumerWidget {
  const ProfileMiniCardList({Key? key, required this.profiles})
      : super(key: key);

  final List<Profile> profiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) => ProfileMiniCard(
              profile: profiles[index],
            ));
  }
}

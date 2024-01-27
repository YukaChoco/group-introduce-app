import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/presentation/widgets/firebase_storage_image.dart';

class ProfileBigiCard extends ConsumerWidget {
  const ProfileBigiCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
            Text(profile.name),
            Text('一言 : ${profile.introduction}'),
            FirebaseStorageImage(gsUrl: profile.imageURL),
      ],
    );
  }
}

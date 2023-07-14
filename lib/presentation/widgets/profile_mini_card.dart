import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/presentation/widgets/firebase_storage_image.dart';

class ProfileMiniCard extends ConsumerWidget {
  const ProfileMiniCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: ListTile(
          title: Text(profile.name),
          subtitle: Text('一言 : ${profile.introduction}'),
          leading: FirebaseStorageImage(gsUrl: profile.imageURL),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/usecase/profile.dart';
import 'package:group_introduce_project/presentation/widgets/profile_big_card.dart';
class ProfileMain extends ConsumerWidget {
  const ProfileMain({Key? key, required this.profileID}) : super(key: key);

  final String profileID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileStateProvider.notifier).fetchProfileByID("1", profileID);
    final state = ref.watch(profileStateProvider);

    switch (state.status) {
      case ProfileStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ProfileStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('An error has occurred: ${state.errorMessage}'),
              TextButton(
                child: const Text('Retry'),
                onPressed: () {
                  ref.watch(profileStateProvider.notifier).fetchProfileByID("1", profileID);
                },
              ),
            ],
          ),
        );
      case ProfileStatus.loaded:
        return Scaffold(
          appBar: AppBar(
            title: const Text('プロフィール'),
          ),
          body: Center(
            child: ProfileBigiCard(profile: state.profile!),
          ),
        );
      default:
        return Container();
    }
  }
}

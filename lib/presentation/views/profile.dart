import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/usecase/profile.dart';
import 'package:group_introduce_project/presentation/widgets/profile_mini_card_list.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileListStateProvider.notifier).fetchProfile("1");
    final state = ref.watch(profileListStateProvider);
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
                ref.watch(profileListStateProvider.notifier).fetchProfile("1");
              },
            ),
          ],
        ));
      case ProfileStatus.loaded:
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body:
                Center(child: ProfileMiniCardList(profiles: state.profiles!)));
      default:
        return Container();
    }
  }
}

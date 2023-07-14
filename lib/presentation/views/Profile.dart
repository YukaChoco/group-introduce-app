import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/model/profile.dart';
import 'package:group_introduce_project/domain/usecase/profile.dart';
import 'package:group_introduce_project/presentation/widgets/profile_mini_card_list.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(getProfileProvider).execute("1");
    return StreamBuilder<List<Profile>>(
        stream: profile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('An error has occurred'),
                  TextButton(
                    child: const Text('Retry'),
                    onPressed: () {
                      // Retry logic here
                    },
                  ),
                ],
              ),
            );
          } else {
            // snapshot.dataがnullである場合に備えて、空のリストをフォールバックとして使用します。
            final profiles = snapshot.data ?? [];
            if (profiles.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    title: const Text("メンバーリスト"),
                  ),
                  body: Center(child: ProfileMiniCardList(profiles: profiles)));
            }
          }
        });
  }
}

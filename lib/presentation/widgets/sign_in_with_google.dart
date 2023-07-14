import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/usecase/firebase_auth.dart';

class SignInWithGoogleWidget extends ConsumerWidget {
  const SignInWithGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInWithGoogle = ref.read(signInWithGoogleUseCaseProvider);
    return ElevatedButton(
      onPressed: () async {
        await signInWithGoogle.execute();
        // Do something with the user...
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20), fixedSize: const Size(400, 60)),
      child: const Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
    );
  }
}

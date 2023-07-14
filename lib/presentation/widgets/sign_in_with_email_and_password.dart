import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/usecase/firebase_auth.dart';

class SignInWithEmailAndPasswordWidget extends ConsumerWidget {
  const SignInWithEmailAndPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInWithEmailAndPassword =
        ref.read(signInWithEmailAndPasswordUseCaseProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return ElevatedButton(
      onPressed: () async {
        await signInWithEmailAndPassword.execute(
          emailController.text,
          passwordController.text,
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        fixedSize: const Size(400, 60),
      ),
      child: const Text(
        'Continue',
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}

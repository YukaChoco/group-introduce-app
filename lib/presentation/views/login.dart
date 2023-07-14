


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/usecase/firebase_auth.dart';

class LoginPage extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInWithEmailAndPassword = ref.read(signInWithEmailAndPasswordUseCaseProvider);
    final signInWithGoogle = ref.read(signInWithGoogleUseCaseProvider);

    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            child: const Text('Sign in with email and password'),
            onPressed: () async {
              final user = await signInWithEmailAndPassword.execute(
                emailController.text,
                passwordController.text,
              );
              // Do something with the user...
            },
          ),
          ElevatedButton(
            child: const Text('Sign in with Google'),
            onPressed: () async {
              final user = await signInWithGoogle.execute();
              // Do something with the user...
            },
          ),
        ],
      ),
    );
  }
}

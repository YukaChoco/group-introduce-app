import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/presentation/widgets/login_text_field.dart';
import 'package:group_introduce_project/presentation/widgets/sign_in_with_google.dart';
import 'package:group_introduce_project/presentation/widgets/sign_in_with_email_and_password.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            LoginTextField(labelText: 'Email', controller: emailController),
            LoginTextField(
                labelText: 'Password', controller: passwordController),
            const SizedBox(height: 40),
            const SignInWithEmailAndPasswordWidget(),
            const SizedBox(height: 20), //
            const SignInWithGoogleWidget(),
          ],
        ),
      ),
    );
  }
}

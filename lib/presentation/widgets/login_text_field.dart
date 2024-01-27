import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginTextField extends ConsumerWidget {
  const LoginTextField({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 400,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: labelText),
        ));
  }
}

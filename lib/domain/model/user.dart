import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomUser {
  final String id;
  final String name;
  final String email;

  CustomUser({
    required this.id,
    required this.name,
    required this.email,
  });
}
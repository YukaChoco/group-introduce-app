import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/data/repository/firebase_auth_impl.dart';
import 'package:group_introduce_project/data/repository/user_impl.dart';
import 'package:group_introduce_project/domain/model/user.dart';
import 'package:group_introduce_project/domain/repository/firebase_auth.dart';
import 'package:group_introduce_project/domain/repository/user.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository _repository;

  SignInWithEmailAndPasswordUseCase(this._repository);

  Future<User?> execute(String email, String password) {
    return _repository.signInWithEmailAndPassword(email, password);
  }
}

class SignInWithGoogleUseCase {
  final AuthRepository _repository;

  SignInWithGoogleUseCase(this._repository);

  Future<User?> execute() {
    return _repository.signInWithGoogle();
  }
}

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> execute() {
    return _repository.signOut();
  }
}

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;
  final UserRepository _userRepository;

  SignUpWithEmailAndPasswordUseCase(this.authRepository, this._userRepository);

  Future<User?> execute(String email, String password, String name) async {
    final user =
        await authRepository.signUpWithEmailAndPassword(email, password, name);
    if (user != null) {
      await _userRepository
          .addUser(CustomUser(id: user.uid, name: name, email: email));
    }
    return user;
  }
}

final signInWithEmailAndPasswordUseCaseProvider =
    Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInWithEmailAndPasswordUseCase(authRepository);
});

final signInWithGoogleUseCaseProvider =
    Provider<SignInWithGoogleUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInWithGoogleUseCase(authRepository);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignOutUseCase(authRepository);
});

final signUpWithEmailAndPasswordUseCaseProvider =
    Provider<SignUpWithEmailAndPasswordUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final userRepository = ref.read(userRepositoryProvider);
  return SignUpWithEmailAndPasswordUseCase(authRepository, userRepository);
});

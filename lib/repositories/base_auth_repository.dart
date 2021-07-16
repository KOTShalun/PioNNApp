import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRepository {
  Stream<User> get user;

  Future<User> signUpWithEmailAndPassword({
    String username,
    String email,
    String password,
  });

  Future<User> signInWithEmailAndPassword({
    String email,
    String password,
  });

  Future<void> logOut();
}

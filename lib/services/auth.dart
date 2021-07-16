import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pionn_app/domain/user.dart';

class AuthService {
  FirebaseAuth _firebaseAuth;
  AppUser _appUser;

  AuthService(){
    start();
  }

  Future start() async {
    await Firebase.initializeApp();
    this._firebaseAuth = FirebaseAuth.instance;
  }

  Future<AppUser> signInWithEmailAndPasswordApp(
      String email, String password) async {
    start();

    try {
      UserCredential userCredential = await this
          ._firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return AppUser.fromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.' + e.code);
        return AppUser.error('No user found for that email.' + e.code);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.' + e.code);
        return AppUser.error('Wrong password provided for that user.' + e.code);
      } else {
        print('Other error code: ' + e.code.toString());
        return AppUser.error('Other error code: ' + e.code);
      }
    } catch (e) {
      print(e.toString());
      return AppUser.error('No user found for that email.' + e.code);
    }
  }

  Future<AppUser> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print("User from firebase: " + user.email);
      return AppUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print("Firebase error: " + e.toString());
      return null;
    }
  }

  Future logOut() async {
    await _firebaseAuth.signOut();
  }

  // Stream<AppUser> get currentUser {
  //   start();
  //   final StreamSubscription _sSubscriprion = this._firebaseAuth.authStateChanges().listen((User user) { });
  //   return _sSubscriprion.map(
  //       (User user) => user != null ? AppUser.fromFirebase(user) : null);
  // }
}

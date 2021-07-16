import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pionn_app/repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  AuthRepository({
    FirebaseFirestore firebaseFirestore,
    FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  // TODO: implement user
  Stream<User> get user => _firebaseAuth.userChanges();

  @override
  Future<User> signUpWithEmailAndPassword({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {} on PlatformException catch (error) {}
  }

  @override
  Future<User> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}

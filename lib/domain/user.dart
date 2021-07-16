import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppUser {
  String id;
  String error;

  AppUser.fromFirebase(User user) {
    id = user.uid;
  }

  AppUser.error(String error) {
    this.error = error;
  }
}
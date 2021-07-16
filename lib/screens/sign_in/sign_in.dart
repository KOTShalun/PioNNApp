import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pionn_app/screens/sign_in/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Вход в систему"),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return SignInBody();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong!!!'),
            );
          } else {
            return Center(child: Text('go'));
          }
        },
      ),
    );
  }
}

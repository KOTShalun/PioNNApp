import 'package:flutter/material.dart';
import 'package:pionn_app/screens/forgot_password/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Забыли пароль?"),
      ),
      body: ForgotPasswordBody(),
    );
  }
}

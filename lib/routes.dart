import 'package:flutter/material.dart';
import 'package:pionn_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:pionn_app/screens/sign_in/sign_in.dart';
import 'package:pionn_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};

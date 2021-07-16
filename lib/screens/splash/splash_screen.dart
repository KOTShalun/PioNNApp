import 'package:flutter/material.dart';
import 'package:pionn_app/screens/splash/components/splash_body.dart';
import 'package:pionn_app/style/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: SplashBody(),);
  }
}

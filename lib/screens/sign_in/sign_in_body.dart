import 'package:flutter/material.dart';
import 'package:pionn_app/components/no_account_text.dart';
import 'package:pionn_app/style/size_config.dart';

import 'components/sign_form.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Добро пожаловать",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Войдите с помощью вашего аккаунта и пароля\nпредоставленные вам работадателем",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



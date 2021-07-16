import 'package:flutter/material.dart';
import 'package:pionn_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:pionn_app/style/size_config.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "У вас ещё нет аккаунта? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Зарегистрироваться",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12),
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
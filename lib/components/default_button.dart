import 'package:flutter/material.dart';
import 'package:pionn_app/constants.dart';
import 'package:pionn_app/style/size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({this.text, this.press});

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
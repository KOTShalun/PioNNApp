import 'package:flutter/material.dart';
import 'package:pionn_app/components/custom_suffix_icon.dart';
import 'package:pionn_app/components/default_button.dart';
import 'package:pionn_app/components/form_error.dart';
import 'package:pionn_app/components/no_account_text.dart';
import 'package:pionn_app/style/size_config.dart';

import '../../constants.dart';

class ForgotPasswordBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20.0),),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04,),
              Text(
                "Забыли пароль?",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Пожалуйста введите аккаунт и мы отправим \nвам пароль сообщением.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => this.email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Пользователь",
              hintText: "Введите пользователя",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Mail.svg",
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1,),
          DefaultButton(
            text: "Продолжить",
            press: () {
              if (_formKey.currentState.validate()) {

              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1,),
          NoAccountText(),
        ],
      ),
    );
  }
}

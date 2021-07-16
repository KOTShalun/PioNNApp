import 'package:flutter/material.dart';
import 'package:pionn_app/components/custom_suffix_icon.dart';
import 'package:pionn_app/components/default_button.dart';
import 'package:pionn_app/components/form_error.dart';
import 'package:pionn_app/domain/user.dart';
import 'package:pionn_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:pionn_app/services/auth.dart';
import 'package:pionn_app/style/size_config.dart';

import '../../../constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool remember = false;

  AuthService _authService = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Запомнить меня"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Забыли пароль",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenWidth(30)),
            DefaultButton(
              text: "Продолжить",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  email = _emailController.text;
                  password = _passwordController.text;
                  print('MyDebug: 01 (email: '+email.trim()+' password: '+password.trim());
                  AppUser _appUser =
                      await _authService.signInWithEmailAndPasswordApp(
                          email.trim(), password.trim());
                  if (_appUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(_appUser.error),
                     ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(_appUser.id),
                    ));
                    _emailController.clear();
                    _passwordController.clear();
                  }
                }
              },
            ),
          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
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
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Пароль",
        hintText: "Введите пароль",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}

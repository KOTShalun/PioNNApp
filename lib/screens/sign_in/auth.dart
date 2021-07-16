import 'package:flutter/material.dart';
import 'package:pionn_app/screens/sign_in/sign_in_body.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorisationPageState createState() => _AuthorisationPageState();
}

class _AuthorisationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(child: _logo()),
          SignInBody(),
          _form('LOGIN', () {}),
        ],
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Container(
        child: Align(
          child: Image.asset("assets/images/brand_logo.png"),
          // child: Text(
          //   'PioNN',
          //   style: TextStyle(
          //       fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
            child: _input(Icon(Icons.email), 'EMAIL', _emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
            child:
                _input(Icon(Icons.lock), 'PASSWORD', _passwordController, true),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: _button(label, func),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        //style: TextStyle(fontSize: 20.0, color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text, void func()) {
    return RaisedButton(
      onPressed: func,
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

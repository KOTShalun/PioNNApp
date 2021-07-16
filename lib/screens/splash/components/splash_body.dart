import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pionn_app/components/default_button.dart';
import 'package:pionn_app/screens/sign_in/sign_in.dart';
import 'package:pionn_app/screens/splash/components/splash_content.dart';
import 'package:pionn_app/constants.dart';
import 'package:pionn_app/style/size_config.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Добро пожаловать в PioNN, начнём торговать!",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "Добро пожаловать в PioNN, начнём торговать111!",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "Добро пожаловать в PioNN, начнём торговать111!",
      "image": "assets/images/splash_3.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    DefaultButton(
                      text: 'Продолжить',
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

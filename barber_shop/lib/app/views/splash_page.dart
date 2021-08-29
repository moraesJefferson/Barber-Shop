import 'package:barber_shop/app/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.white,
          navigateAfterSeconds: LoginPage(),
          loaderColor: Colors.indigo[800],
        ),
        Center(
          child: Container(
            child: Image.asset(
              'assets/images/barber.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ],
    );
  }
}

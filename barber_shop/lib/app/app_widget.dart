import 'package:barber_shop/app/views/cadastro_page.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:barber_shop/app/views/login_page.dart';
import 'package:barber_shop/app/views/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}

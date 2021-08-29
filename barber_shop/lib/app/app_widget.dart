import 'package:barber_shop/app/components/body_map_location.dart';
import 'package:barber_shop/app/controller/barbearia_controller.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:barber_shop/app/controller/home_controller_barbearia.dart';
import 'package:barber_shop/app/controller/user_controller.dart';
import 'package:barber_shop/app/views/cadastro_page.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:barber_shop/app/views/login_page.dart';
import 'package:barber_shop/app/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserController>(
          create: (_) => UserController(),
        ),
        Provider<HomeController>(
          create: (_) => HomeController(),
        ),
        Provider<BarbeariaController>(
          create: (_) => BarbeariaController(),
        ),
        Provider<HomeControllerBarbearia>(
          create: (_) => HomeControllerBarbearia(),
        )
      ],
      child: MaterialApp(
        title: 'Barber Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/cadastro': (context) => CadastroPage(),
          '/home': (context) => HomePage(),
          '/mapa': (context) => BodyMapLocation()
        },
      ),
    );
  }
}

import 'package:barber_shop/app/components/body_home_user.dart';
import 'package:barber_shop/app/components/drawer.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    homeController.findUsuario();
    homeController.carregar();
    return Observer(builder: (_) {
      return homeController.isAlternarWidget
          ? Scaffold(
              drawer: DrawerWidget(),
              appBar: AppBar(
                title: Text('Barber Shop User'),
              ),
              body: Center(
                  child: Container(
                child: BodyHomeUser(),
              )),
            )
          : _circularLoading();
    });
  }

  _circularLoading() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

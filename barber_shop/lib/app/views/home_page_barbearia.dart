import 'package:barber_shop/app/components/drawer_barbearia.dart';
import 'package:barber_shop/app/controller/home_controller_barbearia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePageBarbearia extends StatelessWidget {
  const HomePageBarbearia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeControllerBarbearia =
        Provider.of<HomeControllerBarbearia>(context);
    homeControllerBarbearia.findUsuario();
    homeControllerBarbearia.carregar();
    return Observer(builder: (_) {
      return homeControllerBarbearia.isAlternarWidget
          ? Scaffold(
              drawer: DrawerBarbeariaWidget(),
              appBar: AppBar(
                title: Text('Barber Shop Barbearia'),
              ),
              body: Center(
                  child: Container(
                child: Text('HOME'),
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

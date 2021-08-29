import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:barber_shop/app/views/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: Icon(Icons.person),
              accountName: Text(homeController.usuario.name),
              accountEmail: Text(homeController.usuario.email)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage())),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Histórico'),
            onTap: () => print('Teste'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              homeController.logout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    );
  }
}

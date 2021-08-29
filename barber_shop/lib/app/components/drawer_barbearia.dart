import 'package:barber_shop/app/controller/home_controller_barbearia.dart';
import 'package:barber_shop/app/views/home_page_barbearia.dart';
import 'package:barber_shop/app/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerBarbeariaWidget extends StatelessWidget {
  const DrawerBarbeariaWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeControllerBarbearia =
        Provider.of<HomeControllerBarbearia>(context);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: Icon(Icons.person),
              accountName: Text(homeControllerBarbearia.barbearia.name),
              accountEmail: Text(homeControllerBarbearia.barbearia.email)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePageBarbearia())),
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
              homeControllerBarbearia.logout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
    );
  }
}

import 'package:barber_shop/app/components/barber_box.dart';
import 'package:barber_shop/app/components/body_map_location.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyHomeUser extends StatefulWidget {
  BodyHomeUser({Key key}) : super(key: key);

  @override
  _BodyHomeUserState createState() => _BodyHomeUserState();
}

class _BodyHomeUserState extends State<BodyHomeUser> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 270,
                    child: TextFormField(
                      controller: homeController.toTextHome,
                      onTap: () {
                        homeController.toTextHome.text = '';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BodyMapLocation()));
                      },
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), hintText: "Onde"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: BarberBox(
                      img: Icon(Icons.face, size: 12),
                      title: 'Teste Barbearia 1',
                      distancia: 5,
                      valor: 15.0,
                    ),

                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(height: 80),
                    //     Icon(
                    //       Icons.favorite,
                    //       color: Colors.grey[300],
                    //       size: 80,
                    //     ),
                    //     SizedBox(height: 10),
                    //     Container(
                    //       child: Text(
                    //         'Nenhum Favorito',
                    //         style: TextStyle(
                    //             color: Colors.grey[300], fontSize: 20),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

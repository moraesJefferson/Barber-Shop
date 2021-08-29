import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BarberBox extends StatelessWidget {
  final dynamic img;
  final String title;
  final int distancia;
  final double valor;
  final void Function(Color cor) onChanged;

  const BarberBox(
      {Key key,
      this.img,
      this.title,
      this.distancia,
      this.valor,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Icon(Icons.face, size: 32)),
        SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'R\$ $valor\0 - $distancia\km',
                style: TextStyle(fontSize: 8),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                return IconButton(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: homeController.favoritar,
                  icon: Icon(
                    Icons.favorite,
                    color: homeController.isFavorite
                        ? Colors.red
                        : Colors.grey[400],
                  ),
                );
              }),
            ],
          ),
        )
      ],
    );
  }
}

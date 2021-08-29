import 'package:barber_shop/app/views/cadastro_barbearia_page.dart';
import 'package:barber_shop/app/views/cadastro_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: ' Registre-se',
          style: TextStyle(color: Colors.white, fontSize: 12),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _showMaterialDialog(context);
            },
        ),
      ),
    );
  }

  Future<void> _showMaterialDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Selecione o tipo de cadastro'),
            titleTextStyle: TextStyle(fontSize: 14, color: Colors.black),
            actions: [
              TextButton(
                child: Text("Usuário"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CadastroPage()));
                },
              ),
              TextButton(
                child: Text("Barbearia"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CadastroBarbeariaPage()));
                },
              ),
            ],
          );
        });
  }
}

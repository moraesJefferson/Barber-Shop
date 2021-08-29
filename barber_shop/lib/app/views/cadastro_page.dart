import 'package:barber_shop/app/components/body_cadastro.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  CadastroPage({Key key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
      ),
      body: BodyCadastroWidget(),
    );
  }
}

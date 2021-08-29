import 'package:barber_shop/app/components/body_cadastro_barbearia.dart';
import 'package:flutter/material.dart';

class CadastroBarbeariaPage extends StatefulWidget {
  CadastroBarbeariaPage({Key key}) : super(key: key);

  @override
  _CadastroBarbeariaPageState createState() => _CadastroBarbeariaPageState();
}

class _CadastroBarbeariaPageState extends State<CadastroBarbeariaPage> {
  @override
  Widget build(BuildContext context) {
    //final controller = Provider.of<BarbeariaController>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Barbearia'),
        ),
        body: BodyCadastroBarbeariaWidget());
  }
}

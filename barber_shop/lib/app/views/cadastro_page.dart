import 'package:barber_shop/app/controller/user_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CadastroPage extends StatefulWidget {
  CadastroPage({Key key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final controller = UserController();

  _textField(
      {String labelText,
      onChanged,
      String Function() errorText,
      bool isPassword}) {
    return TextField(
      obscureText: isPassword ? true : false,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: "name",
                      onChanged: controller.user.changeName,
                      errorText: controller.validateName,
                      isPassword: false,
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                        labelText: "email",
                        onChanged: controller.user.changeEmail,
                        errorText: controller.validateEmail,
                        isPassword: false);
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: "cpf",
                      onChanged: controller.user.changeCpf,
                      errorText: controller.validateCpf,
                      isPassword: false,
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: "Senha",
                      onChanged: controller.user.changePassword,
                      errorText: controller.validatePassword,
                      isPassword: true,
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: "Confirme a senha",
                      onChanged: controller.user.changePassword2,
                      errorText: controller.validatePassword2,
                      isPassword: true,
                    );
                  },
                ),
                SizedBox(height: 30),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      onPressed: controller.isValid
                          ? () {
                              controller.cadastro();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          : null,
                      child: Text('Cadastrar'),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

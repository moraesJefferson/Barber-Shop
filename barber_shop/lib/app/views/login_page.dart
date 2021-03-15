import 'package:barber_shop/app/controller/user_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[900],
        body: Stack(
          children: [
            _body(),
          ],
        ));
  }

  _textField(
      {String hintText,
      onChanged,
      String Function() errorText,
      bool isPassword}) {
    return TextField(
      obscureText: isPassword ? true : false,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          errorText: errorText == null ? null : errorText(),
          isDense: true,
          contentPadding: EdgeInsets.all(8.0)),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/barber.png'),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return _textField(
                          hintText: 'Email',
                          isPassword: false,
                          onChanged: controller.user.changeEmail,
                          errorText: controller.validateEmail);
                    }),
                    SizedBox(height: 10),
                    Observer(builder: (_) {
                      return _textField(
                          hintText: 'Password',
                          isPassword: true,
                          onChanged: controller.user.changePassword,
                          errorText: controller.validatePassword);
                    }),
                  ],
                ),
              ),
              _forgoutPassword(),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return ElevatedButton(
                    child: Text("Avançar"),
                    onPressed: controller.isValidEmailPassword
                        ? () {
                            controller.login();
                            Future.delayed(Duration(seconds: 1), () {
                              controller.uid != null
                                  ? Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()))
                                  : print("erro");
                            });
                          }
                        : null);
              }),
              SizedBox(height: 10),
              _register()
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgoutPassword() {
    return RichText(
      text: TextSpan(
          text: 'Esqueceu a senha?',
          style: TextStyle(color: Colors.white, fontSize: 12),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('Esqueceu a senha?"');
            }),
    );
  }

  Widget _register() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 12),
        children: <TextSpan>[
          TextSpan(
              text: 'Não possui uma conta?',
              style: TextStyle(color: Colors.grey[850], fontSize: 12)),
          TextSpan(
              text: ' Cadastre-se',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/cadastro')),
        ],
      ),
    );
  }
}

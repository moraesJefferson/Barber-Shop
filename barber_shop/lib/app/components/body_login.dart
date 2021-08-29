import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/components/forgout_password.dart';
import 'package:barber_shop/app/components/register_widget.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:barber_shop/app/controller/home_controller_barbearia.dart';
import 'package:barber_shop/app/controller/user_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:barber_shop/app/views/home_page_barbearia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BodyLoginWidget extends StatelessWidget {
  _textField(
      {String hintText,
      onChanged,
      String Function() errorText,
      bool isPassword}) {
    return TextField(
      obscureText: isPassword ? true : false,
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          icon: isPassword
              ? Icon(Icons.lock, color: Colors.white)
              : Icon(
                  Icons.email,
                  color: Colors.white,
                ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[200])),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[200])),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[200])),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          errorText: errorText == null ? null : errorText(),
          isDense: true,
          contentPadding: EdgeInsets.all(8.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    final homeController = Provider.of<HomeController>(context);
    final homeControllerBarbearia =
        Provider.of<HomeControllerBarbearia>(context);
    return Container(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Image.asset('assets/images/barber.png'),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 16.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 40.0, left: 10.0, top: 8.0),
                        child: Row(
                          children: [
                            Observer(builder: (_) {
                              return Checkbox(
                                side: BorderSide(color: Colors.black54),
                                fillColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                checkColor: Colors.black,
                                value: controller.isLoginBarbearia,
                                onChanged: controller.changeIsLoginBarbearia,
                              );
                            }),
                            Text(
                              "É uma Barbearia",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 8.0),
                        child: ForgoutPasswordWidget(),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 40),
              Observer(builder: (_) {
                return SizedBox(
                  height: 50,
                  width: 270,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      onPressed: controller.isValidEmailPassword
                          ? () {
                              controller.login();
                              Future.delayed(Duration(seconds: 1), () {
                                if (controller.uid !=
                                    Constanst.MSG_EMAIL_NOT_REGISTER) {
                                  controller.isLoginBarbearia
                                      ? homeControllerBarbearia
                                          .enviarUid(controller.uid)
                                      : homeController
                                          .enviarUid(controller.uid);
                                  showMaterialDialog(
                                      context: context,
                                      isLoginRealizado: true,
                                      texto: Constanst.LOGIN_REALIZADO,
                                      controller: controller);
                                } else {
                                  showMaterialDialog(
                                      context: context,
                                      isLoginRealizado: false,
                                      texto: Constanst.EMAIL_NAO_CADASTRADO);
                                }
                              });
                            }
                          : null),
                );
              }),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: RichText(
                          text: (TextSpan(
                            text: 'Não é um membro?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: RegisterWidget(),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showMaterialDialog(
      {BuildContext context,
      bool isLoginRealizado,
      String texto,
      UserController controller}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Aviso'),
            content: Text('$texto'),
            actions: [
              TextButton(
                  child: Text("Ok"),
                  onPressed: isLoginRealizado
                      ? () {
                          Future.delayed(Duration(seconds: 1), () {
                            controller.limparCampos();
                            if (controller.isLoginBarbearia) {
                              controller.changeIsLoginBarbearia(false);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePageBarbearia()));
                            } else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          });
                        }
                      : () {
                          Navigator.of(context).pop();
                        }),
            ],
          );
        });
  }
}

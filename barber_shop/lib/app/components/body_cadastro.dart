import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:barber_shop/app/controller/user_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BodyCadastroWidget extends StatelessWidget {
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
    );
  }

  _textFieldPassword({
    String labelText,
    onChanged,
    String Function() errorText,
  }) {
    return SizedBox(
      height: 40,
      child: TextField(
        style: TextStyle(fontSize: 14),
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          errorText: errorText(),
          hintText: labelText,
          errorStyle: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    final homeController = Provider.of<HomeController>(context);

    return Container(
      child: SingleChildScrollView(
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
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                        labelText: "email",
                        onChanged: controller.user.changeEmail,
                        errorText: controller.validateEmail);
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText: "cpf",
                      onChanged: controller.user.changeCpf,
                      errorText: controller.validateCpf,
                    );
                  },
                ),
                SizedBox(height: 30),
                Observer(builder: (_) {
                  return SizedBox(
                    width: 70,
                    height: 60,
                    child: FloatingActionButton(
                      onPressed: controller.isValid
                          ? () {
                              showMaterialDialogPassword(
                                  context, controller, homeController);
                            }
                          : null,
                      child: const Icon(Icons.save),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
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

  Future<void> showMaterialDialogPassword(BuildContext context,
      UserController controller, HomeController homeController) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Observer(
          builder: (_) {
            return controller.isContainerOrAlert
                ? AlertDialog(
                    title: Text(''),
                    content: controller.uid == Constanst.MSG_EMAIL_FIREBASE
                        ? Text(Constanst.Email_EM_USO)
                        : Text(Constanst.CADASTRO_EFETUADO),
                    actions: [
                      TextButton(
                          child: Text("Ok"),
                          onPressed: () {
                            if (controller.uid !=
                                Constanst.MSG_EMAIL_FIREBASE) {
                              controller.addUser();
                              homeController.enviarUid(controller.uid);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              controller.changeContainerOrAlert(false);
                              Navigator.of(context).pop();
                            }
                          })
                    ],
                  )
                : AlertDialog(
                    title: Text('Insiria sua senha'),
                    content: SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) {
                              return _textFieldPassword(
                                labelText: "SENHA",
                                onChanged: controller.user.changePassword,
                                errorText: controller.validatePassword,
                              );
                            },
                          ),
                          SizedBox(height: 30),
                          Observer(
                            builder: (_) {
                              return _textFieldPassword(
                                labelText: "CONFIRME A SENHA",
                                errorText: controller.validateConfirmaPassword,
                                onChanged:
                                    controller.user.changeConfirmaPassword,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Cancelar"),
                        onPressed: () {
                          controller.inicializarCamposSenhas();
                          Navigator.of(context).pop();
                        },
                      ),
                      Observer(
                        builder: (_) {
                          return TextButton(
                            child: Text("Confirmar"),
                            onPressed: controller.isValidPassword
                                ? () {
                                    controller.cadastro();
                                    Future.delayed(
                                      Duration(seconds: 2),
                                      () {
                                        controller.changeContainerOrAlert(true);
                                      },
                                    );
                                  }
                                : null,
                          );
                        },
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}

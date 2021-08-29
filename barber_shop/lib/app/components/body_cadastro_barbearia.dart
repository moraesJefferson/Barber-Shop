import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/controller/barbearia_controller.dart';
import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:barber_shop/app/views/home_page.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BodyCadastroBarbeariaWidget extends StatelessWidget {
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

  _textFieldCep(
      {String labelText,
      onChanged,
      String Function() errorText,
      formatter,
      filtro,
      controller}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
      inputFormatters: [
        filtro == null ? null : filtro,
        formatter == null ? null : formatter,
      ],
    );
  }

  _textFieldAdress(
      {String labelText,
      onChanged,
      String Function() errorText,
      filtro,
      controller}) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
      inputFormatters: [
        filtro,
      ],
    );
  }

  _localBox(
      {TextEditingController controller,
      List<String> itens,
      String selectItem,
      onChanged}) {
    return SizedBox(
      height: 58,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1)),
            filled: true,
            hintText: "UF",
            fillColor: Colors.white60),
        value: selectItem,
        iconEnabledColor: Colors.blue,
        isExpanded: true,
        items: itens
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BarbeariaController>(context);
    final homeController = Provider.of<HomeController>(context);
    controller.inicializarCampos();
    controller.inicializarCamposSenhas();

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "NOME",
                    onChanged: controller.barbearia.changeName,
                    errorText: controller.validateName,
                  );
                },
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "E-MAIL",
                    onChanged: controller.barbearia.changeEmail,
                    errorText: controller.validateEmail,
                  );
                },
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) {
                  return _textFieldCep(
                    labelText: "CNPJ",
                    onChanged: controller.barbearia.changeCnpj,
                    errorText: controller.validateCnpj,
                    filtro: FilteringTextInputFormatter.digitsOnly,
                    formatter: CnpjInputFormatter(),
                  );
                },
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) {
                  return _textFieldCep(
                    labelText: "CONTATO",
                    onChanged: controller.barbearia.changeContato,
                    errorText: controller.validateContato,
                    filtro: FilteringTextInputFormatter.digitsOnly,
                    formatter: TelefoneInputFormatter(),
                  );
                },
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Observer(
                      builder: (_) {
                        return _textFieldCep(
                            labelText: "CEP",
                            onChanged: controller.barbearia.changeCep,
                            errorText: controller.validateCep,
                            filtro: FilteringTextInputFormatter.digitsOnly,
                            formatter: CepInputFormatter(),
                            controller: controller.cepController);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        width: 70,
                        height: 60,
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: controller.isCepValid
                              ? () {
                                  controller.buscaEndereco();
                                }
                              : null,
                          child: const Icon(Icons.search_rounded),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_) {
                  return _textFieldAdress(
                    labelText: "LOGRADOURO",
                    onChanged: controller.barbearia.changeLogradouro,
                    errorText: controller.validateLogradouro,
                    filtro: FilteringTextInputFormatter.singleLineFormatter,
                    controller: controller.logController,
                  );
                },
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (_) {
                        return _textFieldAdress(
                            labelText: "Nº",
                            filtro: FilteringTextInputFormatter.digitsOnly,
                            onChanged: controller.barbearia.changeNum,
                            errorText: controller.validateNum);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) {
                        return _textFieldAdress(
                            labelText: "BAIRRO",
                            onChanged: controller.barbearia.changeBairro,
                            errorText: controller.validateBairro,
                            filtro:
                                FilteringTextInputFormatter.singleLineFormatter,
                            controller: controller.bairroControlle);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) {
                        return _textFieldAdress(
                            labelText: "CIDADE",
                            onChanged: controller.barbearia.changeCidade,
                            errorText: controller.validateCidade,
                            filtro:
                                FilteringTextInputFormatter.singleLineFormatter,
                            controller: controller.cityController);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (_) {
                        return _localBox(
                            controller: controller.ufController,
                            itens: Estados.listaEstadosSigla,
                            onChanged: controller.barbearia.changeUf,
                            selectItem: controller.barbearia.uf);
                      },
                    ),
                  ),
                ],
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
    );
  }

  Future<void> showMaterialDialogPassword(BuildContext context,
      BarbeariaController controller, HomeController homeController) async {
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
                              controller.addBarbearia();
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
                                onChanged: controller.barbearia.changePassword,
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
                                    controller.barbearia.changeConfirmaPassword,
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

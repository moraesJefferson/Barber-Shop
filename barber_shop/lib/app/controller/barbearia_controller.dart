import 'package:barber_shop/app/database/entity/result_cep.dart';
import 'package:barber_shop/app/models/barbearia_mobx.dart';
import 'package:barber_shop/app/services/cadastro_service.dart';
import 'package:barber_shop/app/services/via_cep_service.dart';
import 'package:barber_shop/authentication/authentication_service.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'barbearia_controller.g.dart';

class BarbeariaController = _BarbeariaControllerBase with _$BarbeariaController;

abstract class _BarbeariaControllerBase with Store {
  BarbeariaMobx barbearia = BarbeariaMobx();
  double posLat, posLong;
  String uid;

  @observable
  bool containerOrAlert = false;

  @action
  changeContainerOrAlert(bool value) => containerOrAlert = value;

  @computed
  bool get isContainerOrAlert {
    return containerOrAlert;
  }

  final TextEditingController cepController = TextEditingController();
  final TextEditingController logController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController bairroControlle = TextEditingController();

  final AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);

  void inicializarCampos() {
    cepController.text = '';
    logController.text = '';
    ufController.text = '';
    cityController.text = '';
    bairroControlle.text = '';
    barbearia.cidade = null;
    barbearia.bairro = null;
    barbearia.cep = null;
    barbearia.uf = Estados.listaEstadosSigla[0];
    barbearia.logradouro = null;
    barbearia.name = null;
    barbearia.cnpj = null;
    barbearia.email = null;
    barbearia.contato = null;
  }

  void inicializarCamposSenhas() {
    barbearia.password = null;
    barbearia.confirmaPassword = null;
  }

  @computed
  bool get isValidEmailPassword {
    return validateEmail() == null && validatePassword() == null;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCnpj() == null &&
        validateContato() == null &&
        validateCep() == null &&
        validateLogradouro() == null &&
        validateNum() == null &&
        validateCidade() == null &&
        validateBairro() == null &&
        validateUf() == null;
  }

  @computed
  bool get isValidPassword {
    return validatePassword() == null && validateConfirmaPassword() == null;
  }

  String validateName() {
    if (barbearia.name == null || barbearia.name.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.name.length < 3) {
      return "O nome precisa ter mais de 3 caracteres";
    }
    return null;
  }

  String validateEmail() {
    if (barbearia.email == null || barbearia.email.isEmpty) {
      return "O campo é obrigatório";
    } else if (!barbearia.email.contains("@")) {
      return "Esse não é um email válido";
    }
    return null;
  }

  String validateCnpj() {
    if (barbearia.cnpj == null || barbearia.cnpj.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.cnpj.length != 18) {
      return "Insira um cnpj válido";
    }
    return null;
  }

  String validateContato() {
    if (barbearia.contato == null || barbearia.contato.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.contato.length != 15) {
      return "Insira um contato válido";
    }
    return null;
  }

  String validateCep() {
    if (barbearia.cep == null || barbearia.cep.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.cep.length != 10) {
      return "Insira um cep válido";
    }
    return null;
  }

  @computed
  bool get isCepValid {
    return validateCep() == null;
  }

  String validateLogradouro() {
    if (barbearia.logradouro == null || barbearia.logradouro.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.logradouro.length < 5) {
      return "Insira um logradouro válido";
    }
    return null;
  }

  String validateNum() {
    if (barbearia.num == null || barbearia.num.isEmpty) {
      return "Obrigatório";
    }
    return null;
  }

  String validateCidade() {
    if (barbearia.cidade == null || barbearia.cidade.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.cidade.length < 3) {
      return "Insira um cidade válido";
    }
    return null;
  }

  String validateUf() {
    if (barbearia.uf == null || barbearia.uf.length != 2) {
      return "Obrigatório";
    }
    return null;
  }

  String validateBairro() {
    if (barbearia.bairro == null || barbearia.bairro.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.bairro.length < 3) {
      return "Insira um bairro válido";
    }
    return null;
  }

  String validatePassword() {
    if (barbearia.password == null || barbearia.password.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.password.length < 6) {
      return "Senha Fraca";
    }
    return null;
  }

  String validateConfirmaPassword() {
    if (barbearia.confirmaPassword == null ||
        barbearia.confirmaPassword.isEmpty) {
      return "O campo é obrigatório";
    } else if (barbearia.confirmaPassword != barbearia.password) {
      return "Senhas Diferentes";
    }
    return null;
  }

  void buscaEndereco() async {
    ResultCep resultCep = await ViaCepService.getInstance()
        .fetchCep(cep: barbearia.cep.replaceAll('.', ''));
    if (resultCep != null) {
      //if (resultCep.cep != null) barbearia.changeCep(resultCep.cep);
      if (resultCep.logradouro != null) {
        logController.text = resultCep.logradouro;
        barbearia.logradouro = resultCep.logradouro;
        barbearia.changeLogradouro(resultCep.logradouro);
      }
      if (resultCep.bairro != null) {
        bairroControlle.text = resultCep.bairro;
        barbearia.bairro = resultCep.bairro;
        barbearia.changeBairro(resultCep.bairro);
      }
      if (resultCep.localidade != null) {
        cityController.text = resultCep.localidade;
        barbearia.cidade = resultCep.localidade;
        barbearia.changeCidade(resultCep.localidade);
      }
      if (resultCep.uf != null) {
        ufController.text = resultCep.uf;
        Estados.listaEstadosSigla.forEach((e) {
          if (e == resultCep.uf) {
            barbearia.uf = resultCep.uf;
          }
        });
        barbearia.changeUf(resultCep.uf);
      }
    }
  }

  Future<void> cadastro() async {
    try {
      uid = await _authenticationService.cadastro(
          email: barbearia.email, password: barbearia.password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> login() async {
    try {
      uid = await _authenticationService.login(
          email: barbearia.email, password: barbearia.password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> addBarbearia() async {
    CadastroService.getInstance().addBarbearia(
      id: uid,
      name: barbearia.name,
      cnpj: barbearia.cnpj,
      email: barbearia.email,
      contato: barbearia.contato,
      bairro: barbearia.bairro,
      cep: barbearia.cep,
      cidade: barbearia.cidade,
      logradouro: barbearia.logradouro,
      num: barbearia.num,
      uf: barbearia.uf,
      posLat: posLat,
      posLong: posLong,
    );
    barbearia = BarbeariaMobx();
    Future.delayed(const Duration(seconds: 2), () {});
  }
}

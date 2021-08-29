import 'package:barber_shop/app/models/user.dart';
import 'package:barber_shop/app/services/cadastro_service.dart';
import 'package:barber_shop/authentication/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  Usuario user = Usuario();
  String uid;
  final AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);

  @observable
  bool containerOrAlert = false;

  @observable
  bool isLoginBarbearia = false;

  @action
  changeContainerOrAlert(bool value) => containerOrAlert = value;

  @action
  changeIsLoginBarbearia(bool value) => isLoginBarbearia = value;

  @computed
  bool get isContainerOrAlert {
    return containerOrAlert;
  }

  @computed
  bool get isValidEmailPassword {
    return validateEmail() == null && validatePassword() == null;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCpf() == null;
  }

  @computed
  bool get isValidPassword {
    return validatePassword() == null && validateConfirmaPassword() == null;
  }

  void inicializarCamposSenhas() {
    user.password = null;
    user.confirmaPassword = null;
  }

  void limparCampos() {
    user = Usuario();
  }

  String validateName() {
    if (user.name == null || user.name.isEmpty) {
      return "O campo é obrigatório";
    } else if (user.name.length < 3) {
      return "O nome precisa ter mais de 3 caracteres";
    }
    return null;
  }

  String validateEmail() {
    if (user.email == null || user.email.isEmpty) {
      return "O campo é obrigatório";
    } else if (!user.email.contains("@")) {
      return "Esse não é um email válido";
    }
    return null;
  }

  String validateCpf() {
    if (user.cpf == null || user.cpf.isEmpty) {
      return "O campo é obrigatório";
    } else if (user.cpf.length != 11) {
      return "Insira um cpf válido";
    }
    return null;
  }

  String validatePassword() {
    if (user.password == null || user.password.isEmpty) {
      return "O campo é obrigatório";
    } else if (user.password.length < 6) {
      return "Senha Fraca";
    }
    return null;
  }

  String validateConfirmaPassword() {
    if (user.confirmaPassword == null || user.confirmaPassword.isEmpty) {
      return "O campo é obrigatório";
    } else if (user.confirmaPassword != user.password) {
      return "Senhas Diferentes";
    }
    return null;
  }

  Future<void> cadastro() async {
    try {
      uid = await _authenticationService.cadastro(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> login() async {
    try {
      uid = await _authenticationService.login(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void addUser() {
    CadastroService.getInstance()
        .addUser(id: uid, name: user.name, cpf: user.cpf, email: user.email);
    user = Usuario();
  }
}

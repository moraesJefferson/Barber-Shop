import 'package:barber_shop/app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  var user = Usuario();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var uid;

  @computed
  bool get isValidEmailPassword {
    return validateEmail() == null && validatePassword() == null;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCpf() == null &&
        validatePassword() == null &&
        validatePassword2() == null;
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

  String validatePassword2() {
    if (user.confirmaPassword == null || user.confirmaPassword.isEmpty) {
      return "O campo é obrigatório";
    } else if (user.confirmaPassword != user.password) {
      return "Senhas Diferentes";
    }
    return null;
  }

  Future<void> cadastro() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      //return "Cadastro realizado com sucesso";
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<String> login() async {
    UserCredential userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      //print(userCredential.user.uid);
      uid = userCredential.user.uid;
      return "Login realizado com sucesso";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print('deu null');
      //uid = null;
      return null;
    }
  }
}

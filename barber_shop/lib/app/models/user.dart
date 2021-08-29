import 'package:mobx/mobx.dart';
part 'user.g.dart';

class Usuario = _UserBase with _$Usuario;

abstract class _UserBase with Store {
  @observable
  String name;

  @action
  changeName(String value) => name = value;

  @observable
  String email;

  @action
  changeEmail(String value) => email = value;

  @observable
  String cpf;

  @action
  changeCpf(String value) => cpf = value;

  @observable
  String password;

  @action
  changePassword(String value) => password = value;

  @observable
  String confirmaPassword;

  @action
  changeConfirmaPassword(String value) => confirmaPassword = value;
}

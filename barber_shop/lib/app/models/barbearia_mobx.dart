import 'package:mobx/mobx.dart';

part 'barbearia_mobx.g.dart';

class BarbeariaMobx = _BarberBase with _$BarbeariaMobx;

abstract class _BarberBase with Store {
  @observable
  String name;

  @action
  changeName(String value) => name = value;

  @observable
  String email;

  @action
  changeEmail(String value) => email = value;

  @observable
  String contato;

  @action
  changeContato(String value) => contato = value;

  @observable
  String cnpj;

  @action
  changeCnpj(String value) => cnpj = value;

  @observable
  String password;

  @action
  changePassword(String value) => password = value;

  @observable
  String confirmaPassword;

  @action
  changeConfirmaPassword(String value) => confirmaPassword = value;

  @observable
  String cep;

  @action
  changeCep(String value) => cep = value;

  @observable
  String logradouro;

  @action
  changeLogradouro(String value) => logradouro = value;

  @observable
  String num;

  @action
  changeNum(String value) => num = value;

  @observable
  String bairro;

  @action
  changeBairro(String value) => bairro = value;

  @observable
  String cidade;

  @action
  changeCidade(String value) => cidade = value;

  @observable
  String uf;

  @action
  changeUf(String value) => uf = value;
}

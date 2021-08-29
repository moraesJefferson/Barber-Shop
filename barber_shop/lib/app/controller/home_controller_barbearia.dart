import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/database/entity/barbearia_db.dart';
import 'package:barber_shop/app/database/impl/barbearia_repository_impl.dart';
import 'package:barber_shop/authentication/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'home_controller_barbearia.g.dart';

class HomeControllerBarbearia = _HomeControllerBarbeariaBase
    with _$HomeControllerBarbearia;

abstract class _HomeControllerBarbeariaBase with Store {
  BarbeariaEntity barbearia;

  final AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);
  String uid;

  @observable
  bool alternarWidget = false;

  @action
  changeAlternarWidget(bool value) => alternarWidget = value;

  @computed
  bool get isAlternarWidget {
    return alternarWidget;
  }

  void findUsuario() async {
    Stream<List<Map<String, dynamic>>> lista =
        BarbeariaRepositoryImpl.getInstance()
            .findById(this.uid, Constanst.BARBEARIA_STR);
    if (lista != null) {
      lista.forEach((element) {
        barbearia = BarbeariaEntity.fromJson(element.first);
      });
    }
  }

  void carregar() {
    Future.delayed(Duration(seconds: 3), () {
      changeAlternarWidget(true);
    });
  }

  void enviarUid(String uid) {
    this.uid = uid;
  }

  Future<void> logout() async {
    try {
      await _authenticationService.logout();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}

import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/database/entity/barbearia_db.dart';
import 'package:barber_shop/app/database/entity/lat_long.dart';
import 'package:barber_shop/app/database/entity/usuario_db.dart';
import 'package:barber_shop/app/database/impl/barbearia_repository_impl.dart';
import 'package:barber_shop/app/database/impl/usuario_repository_impl.dart';
import 'package:barber_shop/app/services/lat_long_service.dart';

class CadastroService {
  static CadastroService _instance;

  static CadastroService getInstance() {
    if (_instance == null) {
      _instance = CadastroService();
    }
    return _instance;
  }

  void addUser({String id, String name, String cpf, String email}) {
    Usuario usuario = Usuario(id: id, name: name, cpf: cpf, email: email);
    UsuarioRepositoryImpl.getInstance()
        .addOrUpdate(Constanst.USUARIO_STR, usuario);
  }

  Future<void> addBarbearia(
      {String id,
      String name,
      String cnpj,
      String email,
      String contato,
      String cep,
      String logradouro,
      String num,
      String bairro,
      String uf,
      String cidade,
      double posLat,
      double posLong}) async {
    String address = logradouro +
        ', ' +
        num +
        ' - ' +
        bairro +
        ', ' +
        cidade +
        ' - ' +
        uf +
        ', ' +
        cep;

    LatLong latLong = await buscarLatLong(address);

    BarbeariaEntity barbearia = BarbeariaEntity(
        id: id,
        name: name,
        cnpj: cnpj,
        email: email,
        contato: contato,
        bairro: bairro,
        cep: cep,
        cidade: cidade,
        logradouro: logradouro,
        num: num,
        uf: uf,
        posLat: latLong.lat,
        posLong: latLong.long);
    try {
      BarbeariaRepositoryImpl.getInstance()
          .addOrUpdate(Constanst.BARBEARIA_STR, barbearia);
    } catch (e) {
      throw Exception("Erro no cadastro");
    }
  }

  Future<LatLong> buscarLatLong(String address) async {
    LatLong l = await LatLongService.getInstance().buscarLatLong(address);
    return l;
  }
}

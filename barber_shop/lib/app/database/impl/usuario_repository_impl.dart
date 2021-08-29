import 'package:barber_shop/app/database/entity/usuario_db.dart';
import 'package:barber_shop/app/database/repository/usuario_repository.dart';
import 'package:barber_shop/app/database/framework/firestore_service.dart';

class UsuarioRepositoryImpl extends FirestoreService<Usuario>
    implements UsuarioRepository {
  static UsuarioRepositoryImpl _instance;

  static UsuarioRepositoryImpl getInstance() {
    if (_instance == null) {
      _instance = UsuarioRepositoryImpl();
    }
    return _instance;
  }
}

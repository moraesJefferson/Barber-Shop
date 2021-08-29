import 'package:barber_shop/app/database/entity/barbearia_db.dart';
import 'package:barber_shop/app/database/framework/firestore_service.dart';
import 'package:barber_shop/app/database/repository/barbearia_repository.dart';

class BarbeariaRepositoryImpl extends FirestoreService<BarbeariaEntity>
    implements BarbeariaRepository {
  static BarbeariaRepositoryImpl _instance;

  static BarbeariaRepositoryImpl getInstance() {
    if (_instance == null) {
      _instance = BarbeariaRepositoryImpl();
    }
    return _instance;
  }
}

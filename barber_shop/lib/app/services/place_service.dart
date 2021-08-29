import 'package:barber_shop/app/database/entity/place.dart';
import 'package:barber_shop/app/database/impl/place_repository_impl.dart';

class PlaceService {
  static PlaceService _instance;

  static PlaceService getInstance() {
    if (_instance == null) {
      _instance = PlaceService();
    }
    return _instance;
  }

  Future<Place> searchPlace(String search) async {
    return await PlaceRepositoryImpl.getInstance().search(search);
  }
}

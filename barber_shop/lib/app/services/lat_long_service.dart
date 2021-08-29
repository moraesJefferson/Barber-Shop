import 'package:barber_shop/app/database/entity/lat_long.dart';
import 'package:barber_shop/app/database/impl/address_repository_impl.dart';
import 'package:geolocator/geolocator.dart';

class LatLongService {
  static LatLongService _instance;

  static LatLongService getInstance() {
    if (_instance == null) {
      _instance = LatLongService();
    }
    return _instance;
  }

  Future<LatLong> buscarLatLong(String address) async {
    LatLong l = await AddressRepositoryImpl.getInstance().searchAdress(address);
    return l;
  }

  Future<String> searchAdressByLatLng(Position currentPosition) async {
    String address = await AddressRepositoryImpl.getInstance()
        .searchAdressByLatLng(currentPosition);
    return address;
  }
}

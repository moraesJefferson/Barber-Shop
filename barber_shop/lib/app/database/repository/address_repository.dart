import 'package:geolocator/geolocator.dart';

abstract class AddressRepository {
  Future<dynamic> searchAdress(String address);
  Future<String> searchAdressByLatLng(Position currentPosition);
}

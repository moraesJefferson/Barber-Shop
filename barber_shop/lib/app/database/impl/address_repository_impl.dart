import 'package:barber_shop/app/database/entity/lat_long.dart';
import 'package:barber_shop/app/database/repository/address_repository.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class AddressRepositoryImpl implements AddressRepository {
  static AddressRepositoryImpl _instance;

  static AddressRepositoryImpl getInstance() {
    if (_instance == null) {
      _instance = AddressRepositoryImpl();
    }
    return _instance;
  }

  @override
  Future<LatLong> searchAdress(String address) async {
    const API_KEY = 'AIzaSyBYV2tUTNk4mi_9j6UH2k18P83VH_5WVOc';

    Uri uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {'key': '$API_KEY', 'address': '$address'},
    );
    // final response = await http.get(uri);
    final response = await Dio().getUri(uri);

    String city =
        response.data["results"][0]["address_components"][0]["long_name"];
    String adrs = response.data["results"][0]["formatted_address"];
    double poslat = response.data["results"][0]["geometry"]["location"]["lat"];
    double poslong = response.data["results"][0]["geometry"]["location"]["lng"];

    if (response.statusCode == 200) {
      return LatLong(adrs: adrs, city: city, lat: poslat, long: poslong);
    } else {
      throw Exception('Requisição inválida!');
    }
  }

  @override
  Future<String> searchAdressByLatLng(Position currentPosition) async {
    const API_KEY = 'AIzaSyBYV2tUTNk4mi_9j6UH2k18P83VH_5WVOc';
    var lat = currentPosition.latitude;
    var lng = currentPosition.longitude;
    Uri uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {'key': '$API_KEY', 'latlng': '$lat,$lng'},
    );
    final response = await Dio().getUri(uri);

    String adrs = response.data["results"][0]["formatted_address"];

    if (response.statusCode == 200) {
      return adrs;
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}

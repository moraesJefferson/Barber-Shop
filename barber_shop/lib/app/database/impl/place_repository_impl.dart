import 'package:barber_shop/app/database/entity/place.dart';
import 'package:barber_shop/app/database/repository/place_repository.dart';
import 'package:dio/dio.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  static PlaceRepositoryImpl _instance;

  static PlaceRepositoryImpl getInstance() {
    if (_instance == null) {
      _instance = PlaceRepositoryImpl();
    }
    return _instance;
  }

  @override
  Future<Place> search(String search) async {
    const API_KEY = 'AIzaSyBYV2tUTNk4mi_9j6UH2k18P83VH_5WVOc';

    Uri uri = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/findplacefromtext/json',
      {
        'input': '$search',
        'inputtype': 'textquery',
        'fields': 'formatted_address,name,geometry',
        'key': '$API_KEY'
      },
    );
    final response = await Dio().getUri(uri);

    String name = response.data["candidates"][0]["name"];
    String formattedAddress =
        response.data["candidates"][0]["formatted_address"];
    double lat = response.data["candidates"][0]["geometry"]["location"]["lat"];
    double long = response.data["candidates"][0]["geometry"]["location"]["lng"];

    if (response.statusCode == 200) {
      return Place(
          lat: lat, long: long, formattedAddress: formattedAddress, name: name);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}

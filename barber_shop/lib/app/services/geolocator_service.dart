import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  static GeolocatorService _instance;

  static GeolocatorService getInstance() {
    if (_instance == null) {
      _instance = GeolocatorService();
    }
    return _instance;
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

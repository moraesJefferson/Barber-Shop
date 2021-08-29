import 'package:barber_shop/app/database/entity/geometry.dart';

class Place {
  final double lat;
  final double long;
  final String formattedAddress;
  final String name;

  Place({this.lat, this.long, this.formattedAddress, this.name});

  factory Place.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Place(
        lat: parsedJson['lat'],
        long: parsedJson['lng'],
        formattedAddress: parsedJson['formatted_address'],
        name: parsedJson['formatted_address']);
  }
}

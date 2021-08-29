class Location {
  final double lat;
  final double long;

  Location({this.lat, this.long});

  factory Location.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Location(lat: parsedJson['lat'], long: parsedJson['lng']);
  }
}

import 'dart:convert';

class LatLong {
  String adrs;
  String city;
  double lat;
  double long;
  LatLong({
    this.adrs,
    this.city,
    this.lat,
    this.long,
  });

  Map<String, dynamic> toMap() {
    return {
      'adrs': adrs,
      'city': city,
      'lat': lat,
      'long': long,
    };
  }

  factory LatLong.fromJson(String str) => LatLong.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LatLong.fromMap(Map<String, dynamic> json) => LatLong(
        adrs: json['adrs'],
        city: json['city'],
        lat: json['lat'],
        long: json['long'],
      );
}

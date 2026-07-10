import 'package:weather_beta/core/extensions/extensions.dart';

class Location {
  final String name;
  final String id;
  final String adm2;
  final String adm1;
  final String country;

  Location.fromMap(Map<String, dynamic> map)
    : name = map["name"],
      id = map["id"],
      adm2 = map["adm2"],
      adm1 = map["adm1"],
      country = map["country"];
}

class LocationList {
  final List<Location> entries;

  LocationList.create(List raw)
    : entries = raw.mapToList((it) => Location.fromMap(it));
}

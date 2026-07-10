import 'package:weather_beta/core/constants/weather_api.dart';
import 'package:weather_beta/core/web/models/models.dart';
import 'package:weather_beta/core/web/web_client.dart';
import 'package:weather_beta/core/web/web_services.dart';

class LocationSearch implements WebService<LocationList> {
  const LocationSearch();

  @override
  final path = WeatherApiPaths.locationSearch;

  @override
  Future<LocationList> fetch(String input) async {
    final raw = await WebClient.get(
      path,
      parameters: {"location": input, "number": "20"},
    );

    return LocationList.create(raw["location"]);
  }
}

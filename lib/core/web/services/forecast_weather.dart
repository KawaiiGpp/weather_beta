import 'package:weather_beta/core/constants/weather_api.dart';
import 'package:weather_beta/core/web/models/models.dart';
import 'package:weather_beta/core/web/web_client.dart';
import 'package:weather_beta/core/web/web_services.dart';

class ForecastWeather implements WebService<ForecastList> {
  const ForecastWeather();

  @override
  final path = WeatherApiPaths.forecast;

  @override
  Future<ForecastList> fetch(String input) async {
    final raw = await WebClient.get(
      path,
      parameters: {"location": input, "lang": "zh-hans"},
    );

    return ForecastList.create(raw["hourly"]);
  }
}

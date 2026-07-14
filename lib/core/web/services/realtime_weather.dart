import 'package:weather_beta/core/constants/weather_api.dart';
import 'package:weather_beta/core/web/models/models.dart';
import 'package:weather_beta/core/web/web_client.dart';
import 'package:weather_beta/core/web/web_services.dart';

class RealtimeWeather implements WebService<RealtimeData> {
  const RealtimeWeather();

  @override
  final path = WeatherApiPaths.realtime;

  @override
  Future<RealtimeData> fetch(String input) async {
    final raw = await WebClient.get(
      path,
      parameters: {"location": input, "lang": "zh-hans"},
    );

    return RealtimeData.fromMap(raw["now"]);
  }
}

import 'package:dio/dio.dart';
import 'package:weather_beta/core/constants/weather_api.dart';

class WebClient {
  WebClient._();

  static final _client = Dio(
    BaseOptions(
      baseUrl: WeatherApi.host,
      headers: {"X-QW-Api-Key": WeatherApi.key},
      validateStatus: (code) => code == 200,
    ),
  );

  static Future<T> get<T>(
    String path, {
    required Map<String, String> parameters,
  }) async {
    final response = await _client.get<T>(path, queryParameters: parameters);
    final data = response.data;

    return data ?? (throw StateError("Response succeeded, but got null data."));
  }
}

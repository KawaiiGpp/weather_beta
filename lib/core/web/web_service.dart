import 'package:weather_beta/core/web/services/location_search_service.dart';

abstract interface class WebService<T> {
  String get path;

  Future<T> fetch(String input);
}

class WebServices {
  WebServices._();

  static const locationSearch = LocationSearchService();
}

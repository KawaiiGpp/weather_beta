import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/core/widgets/widgets.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:weather_beta/pages/weather/widgets/root.dart';

class WeatherPage extends StatefulWidget {
  final Location location;

  const WeatherPage(this.location, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WeatherPage> {
  late final Future<WeatherData> future;

  @override
  void initState() {
    super.initState();
    future = _combineFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("天气详情")),

      body: FutureView(
        future: future,
        view: (_, data) => Provider(create: (_) => data, child: const Root()),
      ),
    );
  }

  Future<WeatherData> _combineFuture() async {
    final location = widget.location;
    final id = location.id;

    final realtimeFuture = WebServices.realtimeData.fetch(id);
    final forecastFuture = WebServices.forecastData.fetch(id);
    final (realtime, forecast) = await (realtimeFuture, forecastFuture).wait;

    return WeatherData(
      location: location,
      realtime: realtime,
      forecast: forecast,
    );
  }
}

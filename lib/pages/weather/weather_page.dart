import 'package:flutter/material.dart';
import 'package:weather_beta/core/web/web.dart';

class WeatherPage extends StatefulWidget {
  final Location location;

  const WeatherPage(this.location, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Text(widget.location.name)),
    );
  }
}

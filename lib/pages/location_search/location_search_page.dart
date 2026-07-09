import 'package:flutter/material.dart';

class LocationSearchPage extends StatefulWidget {
  final String location;

  const LocationSearchPage(this.location, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LocationSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.location)));
  }
}

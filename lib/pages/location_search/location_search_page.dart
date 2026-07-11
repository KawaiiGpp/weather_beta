import 'package:flutter/material.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/core/widgets/widgets.dart';
import 'package:weather_beta/pages/location_search/widgets/location_list_view.dart';

class LocationSearchPage extends StatefulWidget {
  final String location;

  const LocationSearchPage(this.location, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LocationSearchPage> {
  late final Future<LocationList> future;

  @override
  void initState() {
    super.initState();
    future = WebServices.locationSearch.fetch(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("搜索结果")),

      body: FutureView(
        future: future,
        view: (_, locations) => LocationListView(locations, onTap: _onTap),
      ),
    );
  }

  void _onTap(Location location) {}
}

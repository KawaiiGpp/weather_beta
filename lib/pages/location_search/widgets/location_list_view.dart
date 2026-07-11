import 'package:flutter/material.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/pages/location_search/widgets/location_list_tile.dart';

class LocationListView extends StatelessWidget {
  final LocationList locations;
  final ValueChanged<Location> onTap;

  const LocationListView(this.locations, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: locations.entries.length,
      padding: const EdgeInsets.all(16),

      itemBuilder: (_, index) {
        final location = locations.entries[index];
        return LocationListTile(location, onTap: () => onTap(location));
      },

      separatorBuilder: (_, _) => const SizedBox(height: 12),
    );
  }
}

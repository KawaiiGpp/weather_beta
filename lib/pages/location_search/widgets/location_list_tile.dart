import 'package:flutter/material.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/web/web.dart';

class LocationListTile extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  const LocationListTile(this.location, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final country = location.country;
    final adm1 = location.adm1;
    final adm2 = location.adm2;

    return Material(
      child: ListTile(
        leading: _leading(context),
        trailing: _trailing(),
        title: _text(location.name),
        subtitle: _text("$country - $adm1 - $adm2"),

        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        shape: AppStandard.borderShape,
        tileColor: context.colorScheme.surfaceContainer,
      ),
    );
  }

  Widget _text(String content) {
    return Text(content, maxLines: 1, overflow: TextOverflow.ellipsis);
  }

  Widget _leading(BuildContext context) {
    final primary = context.colorScheme.primary;

    return CircleAvatar(
      radius: 24,
      backgroundColor: primary.withAlpha(50),
      child: Icon(Icons.location_on, color: primary),
    );
  }

  Widget _trailing() {
    return const Padding(
      padding: EdgeInsets.only(right: 8),
      child: Icon(Icons.arrow_forward_rounded),
    );
  }
}

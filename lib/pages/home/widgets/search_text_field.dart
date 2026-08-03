import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;

  const SearchTextField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final primary = context.colorScheme.primary;

    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: "在此输入需要查询的城市名",
        prefixIcon: Icon(Icons.location_on, color: primary),
      ),
    );
  }
}

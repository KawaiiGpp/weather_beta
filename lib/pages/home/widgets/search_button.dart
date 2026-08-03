import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onTap;

  const SearchButton(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(onPressed: onTap, child: const Text("查询城市")),
    );
  }
}

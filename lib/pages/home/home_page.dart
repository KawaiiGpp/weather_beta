import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/router/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Padding(
          padding: AppStandard.pagePaddingAll,

          child: Column(
            children: [
              const Spacer(flex: 1),

              _title(),
              const SizedBox(height: 12),

              _subtitle(),
              const SizedBox(height: 36),

              _textField(),
              const SizedBox(height: 20),

              _button(),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _title() {
    return Text("城市天气查询", style: context.textTheme.displaySmall);
  }

  Widget _subtitle() {
    return Text(
      "你若安好，便是晴天",

      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _textField() {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: "在此输入需要查询的城市名 ...",
        prefixIcon: Icon(Icons.location_on, color: context.colorScheme.primary),
      ),
    );
  }

  Widget _button() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(onPressed: _push, child: const Text("查询城市")),
    );
  }

  void _push() {
    context.push(AppRoutes.locationSearch, extra: controller.text);
  }
}

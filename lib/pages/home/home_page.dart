import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/router/app_routes.dart';
import 'package:weather_beta/pages/home/widgets/headline.dart';
import 'package:weather_beta/pages/home/widgets/search_text_field.dart';
import 'package:weather_beta/pages/home/widgets/search_button.dart';

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

      body: Padding(
        padding: AppStandard.pagePaddingAll,

        child: Column(
          children: [
            const Spacer(flex: 1),

            const Headline(),
            const SizedBox(height: 36),

            SearchTextField(controller),
            const SizedBox(height: 20),

            SearchButton(_onTap),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTap() {
    context.push(AppRoutes.locationSearch, extra: controller.text);
  }
}

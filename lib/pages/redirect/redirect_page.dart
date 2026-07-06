import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_beta/core/router/app_routes.dart';
import 'package:weather_beta/core/widgets/message.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("重定向页面")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Message.info(
              title: "页面已过期",
              detail: ["你可以返回前一个页面重试", "也可以点击下方按钮，一键回到主页"],
            ),

            const SizedBox(height: 12),

            FilledButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text("返回主页"),
            ),
          ],
        ),
      ),
    );
  }
}

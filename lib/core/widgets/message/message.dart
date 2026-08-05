import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/widgets/themed_icon.dart';

class Message extends StatelessWidget {
  final Widget leading;
  final String title;
  final List<String>? detail;

  const Message({
    super.key,
    required this.leading,
    required this.title,
    this.detail,
  });

  Message.error({super.key, this.title = "出错了", this.detail})
    : leading = ThemedIcon.error(size: _leadingIconSize);

  Message.exception(Object exception, {super.key, this.title = "发生异常"})
    : leading = ThemedIcon.error(size: _leadingIconSize),
      detail = ["请联系开发者反馈该问题，以改进应用", "以下是异常详情", "$exception"];

  Message.info({super.key, required this.title, this.detail})
    : leading = ThemedIcon.info(size: _leadingIconSize);

  const Message.loading({super.key, this.title = "加载中", this.detail})
    : leading = const CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        leading,

        const SizedBox(height: 24),
        Text(title, style: context.textTheme.titleLarge),

        ..._detailWidgets(context),
      ],
    );
  }

  List<Widget> _detailWidgets(BuildContext context) {
    final detail = this.detail;
    if (detail == null || detail.isEmpty) return const [];

    final style = context.textTheme.bodyMedium;
    final align = TextAlign.center;

    return [
      const SizedBox(height: 12),
      ...detail.mapToList((it) => Text(it, style: style, textAlign: align)),
    ];
  }

  static double? _leadingIconSize(BuildContext context) {
    return context.textTheme.displayMedium?.fontSize;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_beta/core/widgets/message/message.dart';

class WebExceptionMessage extends StatelessWidget {
  final Object exception;
  final Map<int, List<String>> statusMap;

  const WebExceptionMessage(
    this.exception, {
    super.key,
    this.statusMap = const {},
  });

  @override
  Widget build(BuildContext context) {
    final exception = this.exception;
    if (exception is! DioException) return _default();

    return switch (exception.type) {
      DioExceptionType.connectionError => Message.error(
        title: "联网失败",
        detail: const ["无法连接至网络，请检查设备联网状态"],
      ),

      DioExceptionType.connectionTimeout => Message.error(
        title: "连接超时",
        detail: const ["可能是网络信号弱，请稍候再试"],
      ),

      DioExceptionType.badResponse => Message.error(
        title: "加载出错",
        detail: _statusDescription(exception),
      ),

      _ => _default(),
    };
  }

  Widget _default() {
    return Message.exception(exception);
  }

  List<String> _statusDescription(DioException exception) {
    final code = exception.response?.statusCode;

    if (code == null) return const ["未知的服务器响应错误"];
    return statusMap[code] ?? ["响应错误码：$code"];
  }
}

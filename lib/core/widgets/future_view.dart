import 'package:flutter/material.dart';
import 'package:weather_beta/core/widgets/message.dart';

class FutureView<T> extends StatefulWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) view;
  final Widget Function(BuildContext)? loading;
  final Widget Function(BuildContext, Object)? error;

  const FutureView({
    super.key,
    required this.future,
    required this.view,
    this.loading,
    this.error,
  });

  @override
  State<FutureView<T>> createState() => _State<T>();
}

class _State<T> extends State<FutureView<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.future,

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return (widget.loading ?? _loading).call(context);
        }

        final error = snapshot.error;
        if (error != null) {
          return (widget.error ?? _error).call(context, error);
        }

        return widget.view(context, snapshot.requireData);
      },
    );
  }

  static Widget _loading(BuildContext _) {
    return Center(child: Message.loading());
  }

  static Widget _error(BuildContext _, Object error) {
    return Center(child: Message.exception(error));
  }
}

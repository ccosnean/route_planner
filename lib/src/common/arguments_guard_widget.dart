import 'package:flutter/material.dart';

typedef ArgumentsGuardBuilder<T> = Widget Function(
  BuildContext context,
  T arguments,
);

class ArgumentsGuardWidget<T> extends StatelessWidget {
  final T? defaultArguments;
  final ArgumentsGuardBuilder<T> builder;

  const ArgumentsGuardWidget({
    Key? key,
    required this.builder,
    this.defaultArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs == null) {
      if (defaultArguments != null) {
        return builder(context, defaultArguments!);
      }

      return const SizedBox();
    }

    assert(routeArgs is T, 'Invalid screen arguments');
    final arguments = routeArgs as T;

    return builder(context, arguments);
  }
}

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:route_planner/src/constants/app_route.dart';
import 'package:route_planner/src/domain/api_error.dart';

abstract class AppRouterEvent {
  final ValueChanged<Object?>? onPop;

  const AppRouterEvent(this.onPop);
}

class PopRoute extends Equatable implements AppRouterEvent {
  final Object? object;

  @override
  final ValueChanged<Object?>? onPop;

  const PopRoute({this.object, this.onPop});

  @override
  List<Object?> get props => [object];
}

class PushRoute extends Equatable implements AppRouterEvent {
  final AppRoute route;
  final Object? arguments;

  @override
  final ValueChanged<Object?>? onPop;

  const PushRoute({
    required this.route,
    this.arguments,
    this.onPop,
  });

  @override
  List<Object?> get props => [route, arguments];
}

class ShowApiError extends Equatable implements AppRouterEvent {
  final ApiError apiError;

  @override
  final ValueChanged<Object?>? onPop;

  const ShowApiError({required this.apiError, this.onPop});

  @override
  List<Object?> get props => [apiError];
}

typedef AppRouterBuilder = Widget Function(Sink<AppRouterEvent> routerSink);

class AppRouter extends StatefulWidget {
  final AppRouterBuilder builder;

  const AppRouter({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final _eventStream = StreamController<AppRouterEvent>.broadcast();

  @override
  void initState() {
    super.initState();

    _eventStream.stream.listen(onEvent);
  }

  void onEvent(AppRouterEvent event) async {
    if (event is PopRoute) {
      Navigator.of(context).pop(event.object);
    } else if (event is PushRoute) {
      final response = await Navigator.of(context).pushNamed(
        getStringRoute(event.route),
        arguments: event.arguments,
      );

      if (event.onPop != null) {
        event.onPop!(response);
      }
    } else if (event is ShowApiError) {
      final response = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Api error."),
            content:
                Text(event.apiError.message ?? "An api error has occurred"),
            actions: [
              MaterialButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      if (event.onPop != null) {
        event.onPop!(response);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_eventStream.sink);
  }

  @override
  void dispose() {
    _eventStream.close();
    super.dispose();
  }
}

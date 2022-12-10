import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/common/arguments_guard_widget.dart';
import 'package:route_planner/src/pages/route/bloc/route_bloc.dart';
import 'package:route_planner/src/pages/route/route_args.dart';
import 'package:route_planner/src/pages/route/route_body.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route"),
        elevation: 0,
      ),
      body: ArgumentsGuardWidget<RouteArgs>(
        builder: (context, arguments) {
          return AppRouter(
            builder: (Sink<AppRouterEvent> routerSink) => BlocProvider(
              create: (context) => RouteBloc(routerSink, arguments),
              child: const SafeArea(
                child: RouteBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}

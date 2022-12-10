import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/constants/app_route.dart';
import 'package:route_planner/src/pages/home/bloc/home_bloc.dart';
import 'package:route_planner/src/pages/home/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRouter(
        builder: (Sink<AppRouterEvent> routerSink) => BlocProvider(
          create: (context) => HomeBloc(routerSink),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => routerSink.add(
                    PushRoute(route: AppRoute.settings),
                  ),
                  icon: const Icon(Icons.settings),
                ),
                const Expanded(child: HomeBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

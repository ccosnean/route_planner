import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/constants/app_route.dart';
import 'package:route_planner/src/domain/api_error.dart';
import 'package:route_planner/src/pages/home/bloc/home_event.dart';
import 'package:route_planner/src/pages/home/bloc/home_state.dart';
import 'package:route_planner/src/pages/route/route_args.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Sink<AppRouterEvent> routerSink;

  HomeBloc(this.routerSink) : super(InitialHomeState()) {
    on<FormSubmitted>(onSearchPressed);
  }

  void onSearchPressed(FormSubmitted event, Emitter<HomeState> emitter) {
    routerSink.add(
      PushRoute(
        route: AppRoute.route,
        arguments: RouteArgs(
          event.origin,
          event.destination,
        ),
      ),
    );
  }
}

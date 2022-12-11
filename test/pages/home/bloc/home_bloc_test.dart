import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/constants/app_route.dart';
import 'package:route_planner/src/pages/home/bloc/home_bloc.dart';
import 'package:route_planner/src/pages/home/bloc/home_event.dart';
import 'package:route_planner/src/pages/route/route_args.dart';

class MockRouterSink extends Mock implements Sink<AppRouterEvent> {}

void main() {
  late MockRouterSink routerSink;

  setUp(() {
    routerSink = MockRouterSink();
  });

  group('HomeBlocTest', () {
    const origin = 'warsaw';
    const destination = 'barcelona';

    blocTest(
      'on FormSubmitted adds routerSink PushRoute event',
      build: () => HomeBloc(routerSink),
      act: (bloc) => bloc.add(FormSubmitted(origin, destination)),
      expect: () {
        verify(
          routerSink.add(
            const PushRoute(
              route: AppRoute.route,
              arguments: RouteArgs(origin, destination),
            ),
          ),
        ).called(1);

        return [];
      },
    );
  });
}

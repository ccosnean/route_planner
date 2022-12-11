import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/pages/home/bloc/home_bloc.dart';
import 'package:route_planner/src/pages/home/home_body.dart';
import 'package:route_planner/src/pages/home/home_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('All required widgets are in the hierarchy',
        (WidgetTester tester) async {

      const widgetSubject = MaterialApp(
        home: HomePage(),
      );

      await tester.pumpWidget(widgetSubject);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppRouter), findsOneWidget);
      expect(find.byType(BlocProvider<HomeBloc>), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byType(HomeBody), findsOneWidget);
    });
  });
}

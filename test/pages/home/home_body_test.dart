import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:route_planner/src/pages/home/bloc/home_bloc.dart';
import 'package:route_planner/src/pages/home/bloc/home_event.dart';
import 'package:route_planner/src/pages/home/bloc/home_state.dart';
import 'package:route_planner/src/pages/home/home_body.dart';

class MockHomeBloc extends Mock implements HomeBloc {
  @override
  Stream<HomeState> get stream => StreamController<HomeState>.broadcast().stream;

  @override
  Future<void> close() {
    return Future.value();
  }
}

void main() {
  group('HomeBody', () {
    testWidgets('All required widgets are in the hierarchy',
        (WidgetTester tester) async {

      final homeBloc = MockHomeBloc();

      final widgetSubject = MaterialApp(
        home: BlocProvider<HomeBloc>(
          create: (c) => homeBloc,
          child: const HomeBody(),
        ),
      );

      await tester.pumpWidget(widgetSubject);

      expect(find.text("Enter city names"), findsOneWidget);

      final fields = find.byType(TextFormField);
      final getRouteButton = find.byType(MaterialButton);
      expect(fields, findsNWidgets(2));
      expect(getRouteButton, findsOneWidget);

      const from = "NEW FROM CITY";
      const to = "NEW to CITY";

      await tester.enterText(fields.first, from);
      await tester.enterText(fields.last, to);

      await tester.tap(getRouteButton);

      verify(homeBloc.add(FormSubmitted(from, to))).called(1);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/constants/app_route.dart';
import 'package:route_planner/src/pages/home/home_page.dart';
import 'package:route_planner/src/pages/route/route_page.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (AppRouteMapper.instance.toAppRoute(routeSettings.name ?? '')) {
                  case AppRoute.settings:
                    return SettingsView(controller: settingsController);
                  case AppRoute.home:
                    return const HomePage();
                  case AppRoute.route:
                    return const RoutePage();
                  default:
                    return const HomePage();
                }
              },
            );
          },
        );
      },
    );
  }
}

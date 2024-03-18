import 'package:brand_news_app/core/config/application_theme_manager.dart';
import 'package:brand_news_app/core/config/pages_route_name.dart';
import 'package:brand_news_app/core/config/routes.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ApplicationThemeManager.applicationThemeData,
      themeMode: ThemeMode.light,
      initialRoute: PagesRouteName.initial,
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}

import 'package:brand_news_app/core/config/pages_route_name.dart';
import 'package:brand_news_app/pages/home/pages/home_view.dart';
import 'package:brand_news_app/pages/settings/pages/settings_view.dart';
import 'package:brand_news_app/pages/splash/pages/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PagesRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case PagesRouteName.settingsView:
        return MaterialPageRoute(
            builder: (context) => const SettingsView(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}

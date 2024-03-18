import 'package:brand_news_app/main.dart';
import 'package:flutter/material.dart';

class Constants {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey = "7ff6b71e91e74e479fc28badb194a390";
  static const String baseURL = "newsapi.org";
}

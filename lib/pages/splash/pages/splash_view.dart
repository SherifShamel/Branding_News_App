import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/core/config/pages_route_name.dart';
import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:brand_news_app/main.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => navigatorKey.currentState!
          .pushReplacementNamed(PagesRouteName.homeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Image.asset("assets/img/logo.png"),
    );
  }
}

import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}

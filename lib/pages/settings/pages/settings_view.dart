import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Settings",
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}

import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/core/config/pages_route_name.dart';
import 'package:brand_news_app/main.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCategoryDrawerTap;

  const CustomDrawer({super.key, required this.onCategoryDrawerTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            // width: Constants.mediaQuery.width * 0.8, (useless code)
            alignment: Alignment.center,
            height: 160,
            color: Constants.theme.primaryColor,
            child: Text(
              "News App!",
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: () {
              onCategoryDrawerTap();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
                bottom: 10,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.list_outlined,
                    size: 35,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Categories",
                    style: Constants.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigatorKey.currentState!
                  .pushNamed(PagesRouteName.settingsView);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
                bottom: 10,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Settings",
                    style: Constants.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

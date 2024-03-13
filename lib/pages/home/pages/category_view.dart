import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:brand_news_app/models/category_model.dart';
import 'package:brand_news_app/network/api_manager.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
        child: FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        var sourcesList = snapshot.data ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => Text(
            sourcesList[index].name,
            style: Constants.theme.textTheme.bodyLarge
                ?.copyWith(color: Colors.black),
          ),
          itemCount: sourcesList.length,
        );
      },
      future: ApiManager.fetchDataSources(categoryModel.id),
    ));
  }
}

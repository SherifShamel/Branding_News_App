import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:brand_news_app/models/category_model.dart';
import 'package:brand_news_app/network/api_manager.dart';
import 'package:brand_news_app/pages/home/widgets/news_list_widget.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndex=0;

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

          return NewsListWidget(sourcesList: sourcesList);
        },
        future: ApiManager.fetchDataSources(widget.categoryModel.id),
      ),
    );
  }
}

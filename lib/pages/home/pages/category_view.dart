import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:brand_news_app/models/category_model.dart';
import 'package:brand_news_app/pages/home/viewModel/category_view_model.dart';
import 'package:brand_news_app/pages/home/widgets/news_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // var viewModel = CategoryViewModel();
  late CategoryViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CategoryViewModel();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await viewModel.getDataSources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryViewModel>(builder: (context, viewModel, child) {
        if (viewModel.sourcesList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomBackgroundWidget(
          child: NewsListWidget(sourcesList: viewModel.sourcesList),
        );
      }

          /*FutureBuilder(
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
          ),*/
          ),
    );
  }
}

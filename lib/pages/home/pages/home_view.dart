import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/core/widgets/custom_background_widget.dart';
import 'package:brand_news_app/main.dart';
import 'package:brand_news_app/models/category_model.dart';
import 'package:brand_news_app/pages/home/pages/category_view.dart';
import 'package:brand_news_app/pages/home/widgets/custom_drawer.dart';
import 'package:brand_news_app/pages/home/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/img/sports_icon.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "politics",
      title: "Politics",
      image: "assets/img/Politics_icon.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/img/health_icon.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business",
      title: "Business",
      image: "assets/img/bussines_icon.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      image: "assets/img/environment_icon.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/img/science_icon.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            selectedCategory == null ? "News App" : selectedCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawer(onCategoryDrawerTap: onCategoryDrawerClicked),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick Category",
                      textAlign: TextAlign.start,
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF4F5A69),
                        // height: 1.2
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 4 / 5,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) => CustomItemWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(categoryModel: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;
  Widget? settingsView;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }

  void onCategoryDrawerClicked() {
    selectedCategory = null;
    navigatorKey.currentState!.pop();
    setState(() {});
  }
}

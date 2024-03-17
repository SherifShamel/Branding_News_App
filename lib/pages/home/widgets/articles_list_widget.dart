import 'package:brand_news_app/network/api_manager.dart';
import 'package:brand_news_app/pages/home/widgets/article_item_widget.dart';
import 'package:flutter/material.dart';

class ArticlesListWidget extends StatelessWidget {
  final String sourceId;

  const ArticlesListWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchDataArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        var articlesList = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(article: articlesList[index]),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}

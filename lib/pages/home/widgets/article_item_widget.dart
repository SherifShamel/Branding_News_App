import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/models/ArticlesDataModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles article;

  const ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(15),
          //   child:  Image.network(article.urlToImage ?? ""),
          // ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              article.source?.name ?? "",
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF79828B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              article.title ?? "",
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                height: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              // TimeAgo.timeAgoSinceDate(article.publishedAt as String),
              article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF79828B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

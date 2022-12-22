import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: 232.5,
            width: double.infinity,
            imageUrl: articles.urlToImage!,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          Text(
            articles.author ?? "",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Text(
            articles.title ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(articles.publishedAt?.substring(0,10) ?? "",textAlign: TextAlign.right,),
        ],
      ),
    );
  }
}

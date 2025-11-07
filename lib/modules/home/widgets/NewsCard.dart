import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';

import '../../../models/article_data.dart';
class NewsCard extends StatelessWidget {

  final Articles articleData;
  const NewsCard({super.key,required this.articleData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        spacing: 10,
        children: [
          CachedNetworkImage(
            imageUrl:
            articleData.urlToImage??"",
            imageBuilder: (context, imageProvider) =>
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => Container(
              height: 220,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) =>
                Container(
                  height: 220,
                  child: Icon(Icons.error),
                ),
          ),

          Text(
            articleData.title??"",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.1,
            ),
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  " By : ${articleData.source}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
               articleData.publishedAt??"",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

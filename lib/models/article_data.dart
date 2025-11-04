import 'package:news/models/source_data.dart';

class ArticleData {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final SourceData source;


  ArticleData({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory ArticleData.fromJson(Map<String, dynamic> jason){
    return ArticleData(
      title: jason["title"],
      description: jason["description"],
      url: jason["url"],
      urlToImage: jason["urlToImage"],
      publishedAt: jason["publishedAt"],
      content: jason["content"],
      source : SourceData.fromJson(jason["source"]),
    );
  }
}

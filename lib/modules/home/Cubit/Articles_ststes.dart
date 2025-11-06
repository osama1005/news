import 'package:news/models/article_data.dart';
import 'package:news/models/source_data.dart';

abstract class ArticlesState{

}
final class LoadingArticlesState extends ArticlesState{

}

final class SourceLoadedState extends ArticlesState{
  final List<SourceData> sourceList;
  SourceLoadedState(this.sourceList);
}
final class ArticlesLoadedState extends ArticlesState{
  final List<ArticleData> articleList;
  ArticlesLoadedState(this.articleList);

}
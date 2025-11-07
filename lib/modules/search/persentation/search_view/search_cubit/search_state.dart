import 'package:news/models/article_data.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';

abstract class SearchState{

}

class InitState extends SearchState{

}

class LoadingState extends SearchState{

}

class SuccessState extends SearchState{
  final List<Articles> articles;
  SuccessState(this.articles);
}

class ErrorState extends SearchState{
  final String error;
  ErrorState(this.error);
}

class EmptyState extends SearchState{
  final String message;
  EmptyState(this.message);
}


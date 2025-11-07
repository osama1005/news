import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/modules/home/Cubit/Articles_ststes.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';
import 'package:news/network/Api_services.dart';

class ArticlesCubit extends Cubit<ArticlesState>{

  ArticlesCubit():super(LoadingArticlesState());

  bool _isLoadingSources = true;
  bool _isLoadingArticles = true;
  int _selectedIndex = 0;

  List <SourceData> _sourceList = [];
  List <Articles> _articleList = [];

  bool get isLoadingSources => _isLoadingSources;
  bool get isLoadingArticles => _isLoadingArticles;
  int get selectedIndex => _selectedIndex;
  List <SourceData> get sourceList => _sourceList;
  List <Articles> get articleList => _articleList;



  Future<void>getAllSources(String categoryId)async{
  try{
    emit(LoadingArticlesState());
  _sourceList = await ApiServices.gatAllSources(categoryId);
  changeLoadingSources(false);
  getAllArticles(_sourceList[_selectedIndex].sourceId);
  changeLoadingArticles(false);
  }catch(error){
  throw Exception();
  }
  emit(ArticlesLoadedState(  _articleList));
  }

  Future<void>getAllArticles(String sourceId)async{
  try{
  _articleList = await ApiServices.gatAllArticle(sourceId);
  }catch(error){
  throw Exception();
  }
  emit(ArticlesLoadedState(  _articleList));

  }
  void changeTapIndex(int index){
  _selectedIndex = index;
  getAllArticles(_sourceList[_selectedIndex].sourceId);
  }
  void changeLoadingSources(bool value){
  _isLoadingSources = value;
  }
  void changeLoadingArticles(bool value){
  _isLoadingArticles = value;
  }
}

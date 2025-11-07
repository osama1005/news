import 'package:flutter/foundation.dart';
import 'package:news/models/source_data.dart';
import 'package:news/network/Api_services.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';

class ArticalesViewModel extends ChangeNotifier {
  bool _isLoadingSources = true;
  bool _isLoadingArticles = true;
  int _selectedIndex = 0;

  List<SourceData> _sourceList = [];
  List<Articles> _articleList = [];

  bool get isLoadingSources => _isLoadingSources;
  bool get isLoadingArticles => _isLoadingArticles;
  int get selectedIndex => _selectedIndex;

  List<SourceData> get sourceList => _sourceList;
  List<Articles> get articleList => _articleList;

  Future<void> getAllSources(String categoryId) async {
    try {
      _sourceList = await ApiServices.gatAllSources(categoryId);
      changeLoadingSources(false);

      await getAllArticles(_sourceList[_selectedIndex].sourceId);

      changeLoadingArticles(false);
    } catch (error) {
      throw Exception(error);
    }

    notifyListeners();
  }

  Future<void> getAllArticles(String sourceId) async {
    try {
      _articleList = await ApiServices.gatAllArticle(sourceId);
    } catch (error) {
      throw Exception(error);
    }

    notifyListeners();
  }

  void changeTapIndex(int index) {
    _selectedIndex = index;
    getAllArticles(_sourceList[_selectedIndex].sourceId);
    notifyListeners();
  }

  void changeLoadingSources(bool value) {
    _isLoadingSources = value;
    notifyListeners();
  }

  void changeLoadingArticles(bool value) {
    _isLoadingArticles = value;
    notifyListeners();
  }
}

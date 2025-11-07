import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';
import 'package:news/modules/search/persentation/search_view/search_cubit/search_state.dart';
import 'package:news/modules/search/services/Search_Api_Services.dart';

class SearchCubit extends Cubit<SearchState>{

  SearchCubit(this._searchApiServices) : super(InitState());

  final SearchApiServices _searchApiServices ;
  int _currentPage = 1 ;
  int _pageSize = 10 ;
  bool _hasMore = true ;
  bool _isFatching = false ;
  List<Articles> _allArticle = [];

  TextEditingController searchController = TextEditingController();


  Future<void> searchArticle()async{
    if(!_hasMore || _isFatching){
      return;
    }
    _isFatching = true ;
    try{
   final response = await _searchApiServices.searchArticle(q : searchController.text,
       page: _pageSize,pageSize: _currentPage);
    if (response.isEmpty){
      emit(EmptyState(searchController.text));
      _hasMore = false;
    }
    else{
      _allArticle.addAll(response);
      emit(SuccessState(List.from(_allArticle)));
      _currentPage++;
    }

      }
      catch (e){
    emit(ErrorState(e.toString()));

      }
      _isFatching = false ;
  }
  void reset(){
    emit(InitState());

}
}
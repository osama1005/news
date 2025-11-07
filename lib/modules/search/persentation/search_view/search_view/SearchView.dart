import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/home/widgets/NewsCard.dart';
import 'package:news/modules/search/persentation/search_view/search_cubit/SearchCubit.dart';
import 'package:news/modules/search/persentation/search_view/search_cubit/search_state.dart';
import 'package:news/modules/search/services/Search_Api_Services.dart';
class Searchview extends StatefulWidget {
  const Searchview({super.key});

  @override
  State<Searchview> createState() => _SearchviewState();
}

class _SearchviewState extends State<Searchview> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(SearchApiServices()),
      child: Scaffold(
        body: SearchViewContant(),
      ),
    );
  }
}
class SearchViewContant extends StatefulWidget {
  const SearchViewContant({super.key});

  @override
  State<SearchViewContant> createState() => _SearchViewContantState();
}

class _SearchViewContantState extends State<SearchViewContant> {

 late ScrollController _scrollController ;

 @override
 void initState() {
   super.initState();
   _scrollController = ScrollController();
   _scrollController.addListener(_onScroll);
 }

  void _onScroll(){
    if( _scrollController.position.pixels >= _scrollController.position.maxScrollExtent-200 ){
      context.read<SearchCubit>().searchArticle();
    }

  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onSubmitted:(value)=> cubit.searchArticle(),
              controller: cubit.searchController,
              decoration: InputDecoration(
                suffixIcon:  IconButton(onPressed: (){
                  cubit.searchController.clear();
                  cubit.reset();
                },
                icon: Icon(Icons.close),
                ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,width: 2,strokeAlign: 1),
                    borderRadius: BorderRadius.circular(16),

                  )
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit,SearchState>(builder: (context,state){
                if (state is LoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (state is EmptyState){
                  return Center(child: Text("no result found for ${state.message}"),);
                }

                else if (state is ErrorState){
                  return Center(child: Text("error ${state.error}"),);
                }
                else if (state is SuccessState){
                  return ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (context,index){
                    return NewsCard(articleData: state.articles[index]);
                  },
                      separatorBuilder: (context,index)=> Divider(),
                      itemCount: state.articles.length);
                }
                else{
                  return SizedBox();
                }

              }),
            )
          ],
        ),
      ),
    );
  }
}


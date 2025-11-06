import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/category_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/modules/home/Cubit/Articles_cubit.dart';
import 'package:news/modules/home/Cubit/Articles_ststes.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ArticlesListView extends StatefulWidget {
  final CategoryData selectedCategory;
  const ArticlesListView({super.key, required this.selectedCategory});

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesCubit()
        ..getAllSources(widget.selectedCategory.categoryId),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(height: 15),
          BlocBuilder<ArticlesCubit, ArticlesState>(builder: (context, state) {
             ArticlesCubit viewModel = context.read<ArticlesCubit>();

            return viewModel.isLoadingSources
                ? Shimmer(
              duration: Duration(seconds: 1),
              interval: Duration(milliseconds: 800),
              child: Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade300,
                ),
              ),
            )
                : DefaultTabController(
              length: viewModel.sourceList.length,
              child: TabBar(
                onTap: viewModel.changeTapIndex,
                isScrollable: true,
                indicatorColor: Colors.black,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 12),
                indicatorPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                tabs: viewModel.sourceList.map((SourceData sourceData) {
                  return Text(
                    sourceData.sourceName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      viewModel.sourceList.indexOf(sourceData) ==
                          selectedIndex
                          ? 18
                          : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
            );

          }),

         BlocBuilder<ArticlesCubit, ArticlesState>(builder:(context,state){
           ArticlesCubit viewModel = context.read<ArticlesCubit>();

           return Expanded(
             child: ListView.builder(
               physics: ClampingScrollPhysics(),
               itemBuilder: (context, index) {
                 return viewModel.isLoadingArticles
                     ? Shimmer(
                   duration: Duration(seconds: 1),
                   interval: Duration(milliseconds: 800),
                   child: Container(
                     height: 360,
                     width: double.infinity,
                     margin: EdgeInsets.symmetric(
                       horizontal: 20,
                       vertical: 10,
                     ),
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.grey.shade300,
                       borderRadius: BorderRadius.circular(16),
                     ),
                   ),
                 )
                     : Container(
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
                         viewModel.articleList[index].urlToImage,
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
                         viewModel.articleList[index].title,
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
                               " By : ${viewModel.articleList[index].source.sourceName}",
                               style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.black,
                               ),
                             ),
                           ),
                           Text(
                             viewModel.articleList[index].publishedAt,
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
               },
               itemCount: viewModel.isLoadingArticles
                   ? 5
                   : viewModel.articleList.length,
             ),
           );

         })
        ],
      ),
    );
  }
}

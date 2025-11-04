import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/category_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/network/Api_services.dart';
class ArticlesListView extends StatefulWidget {
  final CategoryData selectedCategory;
  const ArticlesListView({super.key,required this.selectedCategory });

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.gatAllSources(widget.selectedCategory.categoryId),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text( snapshot.error.toString());
        }
        if(snapshot.connectionState == ConnectionState.waiting ){
          return Center(child: CircularProgressIndicator());
        }
        List <SourceData> sourceList = snapshot.data ?? [];

        return Column(
          children: [
            SizedBox(height: 15,),
            DefaultTabController(
              length: sourceList.length,
              child: TabBar(
                  onTap:(value){
                    setState(() {
                    selectedIndex = value ;
                    });
                  },
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal:12),
                  indicatorPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  tabs:
                  sourceList.map( (SourceData sourceData) {
                    return Text( sourceData.sourceName,style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      sourceList.indexOf(sourceData)==selectedIndex
                          ? 18 : 14 ,
                      fontWeight: FontWeight.w500,
                    ),);
                  } ).toList()
              ),
            ),
            FutureBuilder(future: ApiServices.gatAllArticle(sourceList[selectedIndex].sourceId,
            ), builder:(context,snapshot){
              if(snapshot.hasError){
                return Text( snapshot.error.toString());
              }
              if(snapshot.connectionState == ConnectionState.waiting ){
                return Center(child: CircularProgressIndicator());
              }

              List<ArticleData> ArticleList = snapshot.data ?? [];

              return  Expanded(child:
              ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index ){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        spacing: 10,
                        children: [
                          CachedNetworkImage(
                            imageUrl:ArticleList[index].urlToImage,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius:   BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                                height: 220,
                                child: Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Container(
                                height: 220,
                                child: Icon(Icons.error)),
                          ),

                          Text(ArticleList[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black,
                                height: 1.1
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" By : ${ArticleList[index].source.sourceName}", style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500,color: Colors.black
                              ),),
                              Text(ArticleList[index].publishedAt, style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500,color: Colors.black
                              ),),
                            ],)
                        ],
                      ),

                    );
                  },
                  itemCount: ArticleList.length,
              ),

              );
            })
          ],
        );
      },
    );
  }

  }



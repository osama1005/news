import 'package:flutter/material.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/models/source_data.dart';
class ArticlesListView extends StatefulWidget {
  const ArticlesListView({super.key});

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  int selectedIndex = 0;
  final List <SourceData> _sourceList = [
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),
    SourceData(sourceId: "bbc", sourceName: "BBC"),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        DefaultTabController(
          length: _sourceList.length,
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
              tabs: _sourceList.map( (SourceData sourceData) {
          return Text( sourceData.sourceName,style: TextStyle(
            color: Colors.black, 
            fontSize:
            _sourceList.indexOf(sourceData)==selectedIndex
                ? 18 : 14 ,
            fontWeight: FontWeight.w500,
          ),);
        } ).toList()
        ),
        ),
        Expanded(child: ListView.builder(
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
                Assets.images.exmple.image(),
                Text(" 40-year-old man falls 200 feet to his death\n"
                    " while canyoneering at national park",
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black,
                  height: 1.1
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(" By : Jon Haworth", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                  Text(" 15 minutes ago", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                ],)
              ],
            ),

          );
        })
        )
      ],
    );
  }
}

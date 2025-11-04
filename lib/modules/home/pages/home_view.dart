import 'package:flutter/material.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/main.dart';
import 'package:news/models/category_data.dart';
import 'package:news/modules/home/pages/articles_list_view.dart';
import 'package:news/modules/home/pages/custom_drawer_view.dart';
import 'package:news/modules/home/widgets/CategoryItem.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryData? selectedCategory;

  List<CategoryData> categoryList = [
    CategoryData(
        categoryId: "general",
        categoryName:"General" ,
        categoryImage: Assets.images.generalImage.path),
    CategoryData(
        categoryId: "business",
        categoryName:"Business" ,
        categoryImage:  Assets.images.busniessImage.path),
    CategoryData(
        categoryId: "sports",
        categoryName:"Sports" ,
        categoryImage:  Assets.images.sportImage.path),
    CategoryData(
        categoryId: "health",
        categoryName:"Health" ,
        categoryImage:  Assets.images.healthImage.path),
    CategoryData(
        categoryId: "science",
        categoryName:"Science" ,
        categoryImage:  Assets.images.scienceImage.path),
    CategoryData(
        categoryId: "technology",
        categoryName:"Technology" ,
        categoryImage:  Assets.images.technologyImage.path ),
    CategoryData(
        categoryId: "entertainment",
        categoryName:"Entertainment" ,
        categoryImage:  Assets.images.entertainmentImage.path ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(selectedCategory == null ?'Home':selectedCategory!.categoryName,
          style:TextStyle(
              fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black) ,),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Assets.icons.search.image(),
          )
        ],
      ),
      drawer: CustomDrawerView(
        onTap: (){
          setState(() {
            selectedCategory = null;
            navigatorKey.currentState!.pop();
          });
        },
      ),
      body: selectedCategory == null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(" Good Morning\n Here is Some News For You",
              style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w500,
              color: Color(0xFF171717,),height: 1.1,
              ),),
              ...categoryList.map(( CategoryData categoryData){
                return Categoryitem(categoryData: categoryData,
                  index: categoryList.indexOf(categoryData),
                onTap:onSelectCategory ,
                );
          
              },)
            ],
          ),
        ),
      ):ArticlesListView(selectedCategory: selectedCategory!,),
    );
  }
  void onSelectCategory(CategoryData categoryData){
    setState(() {
      selectedCategory = categoryData;
    });
  }
}

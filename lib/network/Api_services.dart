import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data.dart';
import 'package:news/network/Api_constants.dart';
import 'package:news/network/end_point.dart';

abstract class ApiServices{
   static Future <List<SourceData>> gatAllSources(String categoryId)async {
     try {
       Map<String, dynamic> queryParameters = {
         "apiKey": ApiConstants.apiKey,
         "category": categoryId
       };
       //هنا بتبعت طلب GET إلى عنوان الـ API.
       final response = await http.get(
           Uri.https(ApiConstants.baseURL, EndPoint.sources, queryParameters));
       log(response.body);

       List<SourceData> sourceList = [];

       if (response.statusCode == 200) {
         // تحويل JSON إلى object
         var data = jsonDecode(response.body) ;
         for( var element in data["sources"]){
          var dataObject = SourceData.fromJson(element);
          sourceList.add(dataObject);
         }
         log(sourceList.length.toString());

       }
       return sourceList;

     } catch (error) {
       throw Exception("No Response");
     }
   }
   static Future <List<ArticleData>> gatAllArticle(String sourceId)async {
     try {

       Map<String, dynamic> queryParameters = {
         "apiKey": ApiConstants.apiKey,
         "sources": sourceId
       };
       //هنا بتبعت طلب GET إلى عنوان الـ API.
       final response = await http.get(
           Uri.https(ApiConstants.baseURL, EndPoint.topHeadlines, queryParameters));
       log(response.body);

       List<ArticleData> ArticleList = [];

       if (response.statusCode == 200) {
         // تحويل JSON إلى object
         var data = jsonDecode(response.body) ;
         for( var element in data["articles"]){
           var dataObject = ArticleData.fromJson(element);
           ArticleList.add(dataObject);
         }
         log(ArticleList.length.toString());

       }
       return ArticleList;

     } catch (error) {
       throw Exception();
     }
   }
}
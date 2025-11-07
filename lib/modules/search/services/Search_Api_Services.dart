import 'package:dio/dio.dart';
import 'package:news/modules/search/data/model/article_rsponce_model.dart';
import 'package:news/modules/search/services/Api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SearchApiServices{

  final Dio dio ;

  SearchApiServices():dio = Dio(
    // دول option انا بعتهم داخل dio
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),

    ),
  )..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    error: true,

  )
  );
Future<List<Articles>>searchArticle({required String q,
   int pageSize = 10,int page = 1})async {
  try {
    final response = await dio.get(ApiConfig.everything,
      queryParameters: {'q': q,'language': 'en' ,'apiKey': ApiConfig.apiKey,
      // pagination
        'page' : page,
        'pageSize' : pageSize,

      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final newResponse = ArticleRsponceModel.fromJson(response.data);
      return newResponse.articles ?? [];
    }
    else {
      throw DioException(requestOptions: response.requestOptions,
          message: "failed to load Article");
    }
  }
  //دا جزء عملته علشان اهندل error
  on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw ("connection timeout");
    }
    else if (e.type == DioExceptionType.receiveTimeout) {
      throw ("receive timeout");
    }
    else if (e.response?.statusCode == 400) {
      throw ("bad request");
    }
    rethrow;
  }
}
}


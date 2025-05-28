import 'package:flutter_chaitra/models/news.dart';
import 'package:dio/dio.dart';

class NewsRepository {

  static final Dio dio  = Dio();

 static  Future<List<News>> getCategoryNews(String category) async {
    try{

      final response =await dio.get('https://newsapi.org/v2/everything', queryParameters: {
        'q': category,
        'apiKey': '6755b948d1064281a661e72a262ccc2d'
      });
      return  response.data['articles'].map<News>((e) => News.fromJson(e)).toList();

    }catch(err){
      throw 'Something went wrong';
    }
  }



}
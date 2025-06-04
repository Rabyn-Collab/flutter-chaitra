import 'package:dio/dio.dart';
import 'package:flutter_chaitra/models/news.dart';


class HackerNewsRepository {

  static final Dio _dio = Dio();

   static Future<List<int>> fetchTopIds() async {
    try {
      final response = await _dio.get('https://hacker-news.firebaseio.com/v0/topstories.json');

      return (response.data as List).map((e) => e as int ).toList();
    }  catch (err) {

      throw 'something went wrong';
    }
  }


  static Future<List<News>> fetchNews() async {
      List<News> news = [];
    try {
      final ids = await fetchTopIds();
    
      for(final  id in ids.sublist(0, 40)) {
        final response = await _dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json');
        news.add(News.fromJson(response.data));
      }
      return news;
    }  catch (err) {
      
      throw 'something went wrong';
    }
  }


}
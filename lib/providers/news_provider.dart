import 'package:flutter_chaitra/models/news.dart';
import 'package:flutter_chaitra/repository/news_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final getCategoryNewsProvider = FutureProvider.family<List<News>, String>((ref, category){
  return NewsRepository.getCategoryNews(category);
});



final searchNewsProvider = FutureProvider.family<List<News>, String>((ref, query){
  return NewsRepository.getSearchNews(query);
});
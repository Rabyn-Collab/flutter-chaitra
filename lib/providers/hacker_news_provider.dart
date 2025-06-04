import 'package:flutter_chaitra/models/news.dart';
import 'package:flutter_chaitra/repository/hacker_news_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hackerNewsProvider = FutureProvider<List<News>>((ref)async{
return HackerNewsRepository.fetchNews();
});
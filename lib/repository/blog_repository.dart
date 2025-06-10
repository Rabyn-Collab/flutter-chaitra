import 'package:dio/dio.dart';
import 'package:flutter_chaitra/models/blog.dart';
import 'package:flutter_chaitra/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_repository.g.dart';


class BlogRepository {

  final Dio _client;
  BlogRepository(this._client);

  Future<List<Blog>> getBlogs() async {
      try{
        final response = await _client.get('/blogs');
        return (response.data as List).map((e) => Blog.fromJson(e)).toList();
      }on DioException catch(err){
        throw '${err.response}';
      }
  }
  
}


@riverpod
BlogRepository blogRepository (Ref ref) {
  return BlogRepository(ref.watch(clientProvider));
}
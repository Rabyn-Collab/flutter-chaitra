import 'package:dio/dio.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
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
        throw ApiException(err).errorMessage;
      }
  }

  Future<Blog> addBlog(Map<String, dynamic> json) async {
    try{
     final response =  await _client.post('/blogs', data: json);
     return Blog.fromJson(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<Blog> updateBlog(Map<String, dynamic> json, String id) async {
    try{
      final response =  await _client.patch('/blogs/$id', data: json);
      return Blog.fromJson(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }


  Future<void> removeBlog(String id) async {
    try{
       await _client.delete('/blogs/$id');
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }
  
}


@riverpod
BlogRepository blogRepository (Ref ref) {
  return BlogRepository(ref.watch(clientProvider));
}
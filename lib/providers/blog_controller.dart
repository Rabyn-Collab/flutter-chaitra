import 'package:flutter_chaitra/models/blog.dart';
import 'package:flutter_chaitra/repository/blog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_controller.g.dart';


@riverpod
class BlogController extends _$BlogController {
  // AsyncData,  AsyncLoading, AsyncError
  @override
  FutureOr<List<Blog>> build() async {
   return ref.read(blogRepositoryProvider).getBlogs();
  }

  Future<void> addBlog(Map<String, dynamic> json) async {
    // print(state.valueOrNull);
      state = const AsyncLoading();
   state  = await AsyncValue.guard(() async{
     final blog = await ref.read(blogRepositoryProvider).addBlog(json);
     return [...state.valueOrNull ?? [], blog];
   });

  }
}

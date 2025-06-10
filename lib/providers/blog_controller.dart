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

  void reload() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = AsyncError('something went wrong', StackTrace.current);
  }
}

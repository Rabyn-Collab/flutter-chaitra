import 'package:flutter_chaitra/feature/posts/model/post.dart';
import 'package:flutter_chaitra/feature/posts/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_controller.g.dart';


@riverpod
Stream<List<Post>> getPosts (Ref ref) {
  return ref.watch(postRepositoryProvider).getPosts();
}

@riverpod
class PostController extends _$PostController {
  @override
  FutureOr<void> build() {}


  Future<void> addPost({
    required String title,
    required String body,
    required XFile image
  }) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(postRepositoryProvider).addPost(title: title, body: body, image: image));
  }

}

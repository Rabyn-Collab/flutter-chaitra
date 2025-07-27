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

int postIndex = 0;
@riverpod
class PostRemoveController extends _$PostRemoveController {
  @override
  FutureOr<void> build()  {

  }

  Future<void> removePost({
    required String postId,
    required String imageId,
    required int index
  }) async{
    postIndex = index;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(postRepositoryProvider).removePost(postId: postId, imageId: imageId));
  }
}

@riverpod
class PostUpdateController extends _$PostUpdateController {
  @override
  FutureOr<void> build()  {

  }

  Future<void> updatePost({
    required String title,
    required String body,
    XFile? image,
    required String postId,
    String? imageId
  }) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(postRepositoryProvider).updatePost(title: title, body: body, image: image, postId: postId, imageId: imageId));
  }


}
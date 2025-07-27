import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_chaitra/feature/posts/model/post.dart';
import 'package:flutter_chaitra/feature/shared/client_provider.dart';
import 'package:flutter_chaitra/feature/shared/fire_instances.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';


class PostRepository {
  final Dio client;
  PostRepository(this.client);

  final postDb = FireInstances.fireStore.collection('posts');

  Future<void> addPost({
    required String title,
    required String body,
    required XFile image
   }) async{

    try{
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(image.path),
      });
      final response =  await client.post('/api/files', data: formData);
      await postDb.add({
         'title': title,
         'body': body,
         'userId': FireInstances.fireAuth.currentUser!.uid,
         'image': response.data['secure_url'],
         'imageId': response.data['public_id'],
      });

    }on FirebaseException catch (err){
      throw '${err.message}';
    }

  }

  Future<void> updatePost({
    required String title,
    required String body,
    XFile? image,
    required String postId,
    String? imageId
  }) async{

    try{
      if(image == null){
        await postDb.doc(postId).update({
          'title': title,
          'body': body,
        });
      }else{
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(image.path),
        });
        final response =  await client.patch('/api/files/$imageId', data: formData);
        await postDb.doc(postId).update({
          'title': title,
          'body': body,
          'image': response.data['secure_url'],
          'imageId': response.data['public_id'],
        });
      }


    }on FirebaseException catch (err){
      throw '${err.message}';
    }

  }

  Future<void> removePost({
   required String postId,
    required String imageId,
  }) async{

    try{
       await client.delete('/api/files/$imageId');
      await postDb.doc(postId).delete();
    }on FirebaseException catch (err){
      throw '${err.message}';
    }

  }

  Stream<List<Post>> getPosts () {
    return postDb.snapshots().map((event) {
      return event.docs.map((e) {
        final map = e.data() as Map;
        return Post(
          id: e.id,
          title: map['title'],
          body: map['body'],
          userId: map['userId'],
          image: map['image'],
          imageId: map['imageId'],
        );
      }).toList();
    });
  }

}


@riverpod
PostRepository postRepository (Ref ref) {
  return PostRepository(ref.watch(dioProvider));
}
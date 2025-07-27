import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/posts/view/controllers/post_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';


class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(getPostsProvider);
    final postRemoveState = ref.watch(postRemoveControllerProvider);
    return postState.when(data: (data){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final post = data[index];
          return ListTile(
            title: Text(post.title),
            leading: CircleAvatar(backgroundImage: NetworkImage(post.image),),
            subtitle: Text(post.body),
            trailing: post.userId == FirebaseAuth.instance.currentUser!.uid ? postRemoveState.isLoading && postIndex == index ? Center(child: const CircularProgressIndicator()) : IconButton(onPressed: (){
              showDialog(context: context, builder: (context) => AlertDialog(
                title: Row(
                  children: [
                    const Text('Are you sure?'),
                    Spacer(),
                    IconButton(onPressed: (){
                      context.pop();
                    }, icon: const Icon(Icons.close),),
                  ],
                ),
                content: const Text('Do you want to Customize this post?'),
                actions: [

                  IconButton(onPressed: (){
                    context.pop();
                    context.pushNamed(AppRoute.postUpdate.name, extra: post);
                  }, icon: const Icon(Icons.edit),),
                  IconButton(onPressed: (){
                    ref.read(postRemoveControllerProvider.notifier).removePost(postId: post.id, imageId: post.imageId, index: index);
                       context.pop();
                  }, icon: const Icon(Icons.delete),),
                ],
              ),);


            }, icon: const Icon(Icons.more_horiz),): null
          );

        },
      );
    }, error: (error, stackTrace) => Text(error.toString()),
      loading: () => Skeletonizer(
        child:  ListView.builder(
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('sd;fjosfls sdkljfs dlskjfsd'),
                leading: CircleAvatar(backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1753303051854-0e9b97c3c895?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8'),),
                subtitle: Text('sldkfjsd fslkdjfsd flsdjkfnsd fsdjkfsnf sdkjf'),
              );

            },
          )
      ),);
  }
}
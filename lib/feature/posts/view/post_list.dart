import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/posts/view/controllers/post_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(getPostsProvider);
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
          );

        },
      );
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => const Center(child: CircularProgressIndicator(),),);
  }
}
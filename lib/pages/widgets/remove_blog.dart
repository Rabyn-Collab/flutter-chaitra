import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/blog_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';


class RemoveBlog extends ConsumerWidget {
  final String id;
  const RemoveBlog({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(blogControllerProvider, (previous, next) {
      next.maybeWhen(
        data: (data) => context.loaderOverlay.hide(),
          loading: () => context.loaderOverlay.show(),
          orElse: () =>  null);
    });
    return   IconButton(onPressed: (){
      ref.read(blogControllerProvider.notifier).removeBlog(id);
    }, icon: Icon(Icons.delete) );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/blog.dart';
import 'package:flutter_chaitra/pages/widgets/add_form.dart';
import 'package:flutter_chaitra/pages/widgets/remove_blog.dart';
import 'package:flutter_chaitra/pages/widgets/update_form.dart';
import 'package:flutter_chaitra/providers/blog_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final blogsState = ref.watch(blogControllerProvider);

    print(' isLoading: ${blogsState.isLoading}');
    print('isReloading: ${blogsState.isReloading}');
    print('isRefreshing: ${blogsState.isRefreshing}');
    print('hasError: ${blogsState.hasError}');
    print('error: ${blogsState.error}');

    try {
      print('value: ${blogsState.value}');
    } catch (e) {
      print('error: ${e}');
    }

    // print('hasError: ${blogsState.hasError}');

    print('==================');

    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Blogs'),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            await ref.refresh(blogControllerProvider.future);
          },
          child: blogsState.when(
            skipError: true,
            skipLoadingOnReload: true,
            data: (data) {
              return _buildListView(data);
            },
            error: (err, st) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$err'),
                    ElevatedButton(onPressed: (){
                      ref.invalidate(blogControllerProvider);
                    }, child: Text('Refresh'))
                  ],
                ),
              );
            },
            loading: () =>  Skeletonizer(child: _buildListView(List.generate(10, (i) => Blog.empty()))),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(
                  barrierDismissible: false,
                  context: context, builder: (context) => AlertDialog(
                content: AddForm(),
              ));
            },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  ListView _buildListView(List<Blog> data) {
    return ListView.separated(
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            final blog = data[index];
            return ListTile(
              title: Text(blog.title, style: TextStyle(fontWeight: FontWeight.w600),),
              subtitle: Text(blog.detail),
              trailing: Consumer(
                builder: (context, ref, child) => SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        showDialog(
                            barrierDismissible: false,
                            context: context, builder: (context) => AlertDialog(
                          content: UpdateForm(blog: blog,),
                        ));
                      }, icon: Icon(Icons.edit) ),
                    RemoveBlog(id: blog.id),

                    ],
                  ),
                ),
              ),
            );
          },
        );
  }
}

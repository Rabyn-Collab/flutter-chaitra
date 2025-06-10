import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/blog_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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

    try{
      print('value: ${blogsState.value}');
    }catch(e){
      print('error: ${e}');
    }

    // print('hasError: ${blogsState.hasError}');

    print('==================');

    return Scaffold(

      appBar: AppBar(


      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              ref.read(blogControllerProvider.notifier).reload();
            }, child: Text('Reload'))

          ],
        ),
      ),
    );
  }
}

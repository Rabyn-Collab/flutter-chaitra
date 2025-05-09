import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/provider.dart';
import 'package:flutter_chaitra/providers/some_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('hello jee'),
            ElevatedButton(onPressed: (){}, child: Text('Click')),
            Consumer(
              builder: (context, ref, child) {
                final some = ref.watch(someProvider);
                final some1 = ref.watch(someProvider1);
                final some2 = ref.watch(someProvider2);
                final some3 = ref.watch(someProvider3);
                return Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        some.someMethod();
                      },
                      child: Text(some.someText),
                    ),
                    Text(some1),
                    Text('$some2'),
                    Column(
                      children: some3.map((e) => Text(e)).toList(),
                    )
                  ],
                );
              }
            ),
            ElevatedButton(onPressed: (){
              context.push('/about');
            }, child: Text('Go To About Page'))
          ],
        ),
      ),
    );
  }
}

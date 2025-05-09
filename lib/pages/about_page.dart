import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/provider.dart';
import 'package:flutter_chaitra/providers/some_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        children: [
          Consumer(
              builder: (context, ref, child) {
                final some = ref.watch(someProvider);
                final some1 = ref.watch(someProvider1);
                final some2 = ref.watch(someProvider2);
                final some3 = ref.watch(someProvider3);
                return Column(
                  children: [
                   Text(some1)
                  ],
                );
              }
          ),
          Text('hello'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/normal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(

      appBar: AppBar(


      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Count: $count'),
          ],
        ),
      ),
    );
  }
}

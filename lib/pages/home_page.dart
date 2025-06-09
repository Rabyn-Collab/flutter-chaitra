import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/future_provider.dart';
import 'package:flutter_chaitra/providers/normal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(counterProvider);
    final state = ref.watch(someFutureProvider);

    return Scaffold(

      appBar: AppBar(


      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Count: $count'),
            state.when(
                data: (data) => Text(data),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => CircularProgressIndicator()
            )
          ],
        ),
      ),
    );
  }
}

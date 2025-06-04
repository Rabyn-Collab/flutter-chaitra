import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/hacker_news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newsState = ref.watch(hackerNewsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
      ),
      body:  newsState.when(data: (data){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(data[index].title),
            subtitle: Text(data[index].url),
          ),
        );
      }, error: (error, stackTrace) => Text(error.toString()), loading: () => const Center(child: CircularProgressIndicator(),)),
    );
  }
}

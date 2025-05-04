import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleDetailPage extends StatelessWidget {
  final String text;
  const SimpleDetailPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page $text'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.pop();
        }, child: Text('Go BAck')),
      ),
    );
  }
}

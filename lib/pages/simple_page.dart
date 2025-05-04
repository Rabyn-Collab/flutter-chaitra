import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Page '),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.push('/simple-detail/1000');
        }, child: Text('Go TO Detail Page')),
      ),
    );
  }
}

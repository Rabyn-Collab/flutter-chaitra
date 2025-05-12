import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.input),
            onPressed: () {
              context.pushNamed(AppRoute.form.name);
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}

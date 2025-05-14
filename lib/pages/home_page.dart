import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/user_provider.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
     final fm = ref.watch(userDetailProvider);
     print(fm);
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

import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/home/view/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
    );
  }
}

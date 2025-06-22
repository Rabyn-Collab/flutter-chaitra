import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/home/view/widgets/drawer.dart';
import 'package:flutter_chaitra/feature/products/view/products_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ProductsList(),
    );
  }
}

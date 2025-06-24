import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/home/view/widgets/drawer.dart';
import 'package:flutter_chaitra/feature/products/view/products_list.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(RouteEnum.search.name);
          }, icon: Icon(Icons.search))
        ],
      ),
      body: ProductsList(),
    );
  }
}

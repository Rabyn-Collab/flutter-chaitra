import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/home/view/drawer_widget.dart';
import 'package:flutter_chaitra/feature/home/view/users_list.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Firebase App'),
      ),
        body: ListView(
        children: [
        const UsersList()
      ],
    ),
    );
  }
}

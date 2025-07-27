import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/home/view/drawer_widget.dart';
import 'package:flutter_chaitra/feature/home/view/users_list.dart';
import 'package:flutter_chaitra/feature/posts/view/post_list.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Firebase App'),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(AppRoute.postAdd.name);
          }, icon: CircleAvatar(child: const Icon(Icons.add)),),
        ],
      ),
        body: ListView(
        children: [
        const UsersList(),
        Gap(10),
        const PostList()
      ],
    ),
    );
  }
}

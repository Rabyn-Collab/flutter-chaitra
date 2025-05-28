import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search)),
          ],
          bottom: TabBar(
            isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
            Tab(text: 'Hollywood',),
            Tab(text: 'Fashion',),
            Tab(text: 'Science',),
            Tab(text: 'Politics',),
            Tab(text: 'Education',),
          ]),
        ),
        body: TabBarView(
            children: [

            ]
        ),
      ),
    );
  }
}

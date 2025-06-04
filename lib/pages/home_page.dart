import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/widgets/category_news.dart';
import 'package:flutter_chaitra/pages/widgets/search_input.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,

          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('News App', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              SearchInput(),
            ],
          ),
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
              CategoryNews(category: 'Hollywood',),
              CategoryNews(category: 'Fashion',),
              CategoryNews(category: 'Science',),
              CategoryNews(category: 'Politics',),
              CategoryNews(category: 'Education',),
            ]
        ),
      ),
    );
  }
}

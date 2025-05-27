import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/widgets/category_item.dart';
import 'package:flutter_chaitra/providers/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categoryState = ref.watch(mealCategoryProvider);
    return Scaffold(
        body: categoryState.when(
          data: (data){
            return DefaultTabController(
              length: data.length,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    bottom: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: data.map((category){
                          return Tab(text: category.strCategory,);
                        }).toList()
                    ),
                  ),
                  SliverFillRemaining(
                      child: TabBarView(
                        children: data.map((category){
                          return CategoryItemPage(category: category.strCategory,);
                        }).toList(),
                      )
                  )

                ],
              ),
            );
          },
          error: (err, st){
            return Text(err.toString());
          },
          loading: () => const Center(child: CircularProgressIndicator(),
          ),
        ));
  }
}

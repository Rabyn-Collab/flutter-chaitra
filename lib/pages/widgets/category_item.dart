import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/meal_provider.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class CategoryItemPage extends ConsumerWidget {
  final String category;
  const CategoryItemPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, ref) {
    final itemState = ref.watch(categoryItemsProvider(category));
    return Scaffold(
      body: itemState.when(data: (data){
        return ListView.builder(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final meal = data[index];
            return ListTile(
              onTap: (){
                context.pushNamed(AppRoute.meal.name, extra: meal.idMeal);
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(meal.strMealThumb),),
              title: Text(meal.strMeal),
            );
          },
        );
      }, error:(err,st){
         return Text(err.toString());
      }, loading: (){
        return Center(child: CircularProgressIndicator(),);
      })
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chaitra/providers/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categoryState = ref.watch(mealCategoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories List'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: categoryState.when(
              data: (data){
              return ListView.separated(
                  itemBuilder: (context,index){
                    final category = data[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(category.strCategoryThumb),
                      ),
                      title: Text(category.strCategory),
                      subtitle: Text(category.strCategoryDescription, maxLines: 3,overflow: TextOverflow.ellipsis,),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: data.length
              );
              },
              error: (err, st){
                return Text(err.toString());
              },
              loading: () => const Center(child: CircularProgressIndicator(),
          ),
              ),
        ),
      ));
  }
}

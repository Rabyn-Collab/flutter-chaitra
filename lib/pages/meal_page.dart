import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/widgets/video_widget.dart';
import 'package:flutter_chaitra/providers/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MealPage extends ConsumerWidget {
  final String idMeal;
  const MealPage({super.key, required this.idMeal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealState = ref.watch(mealDetailProvider(idMeal));
    return Scaffold(
      appBar: AppBar(
        title: Text(idMeal),
      ),
      body: mealState.when(
          data: (data){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListView(
               children: [

                 PlayVideoFromYoutube(videoId: data['strYoutube'].split('=')[1] ?? ''),
                 SizedBox(height: 10,),
                Text(data['strMeal'] ?? ''),
                 SizedBox(height: 10,),
                 Image.network(data['strMealThumb'] ?? ''),
                 SizedBox(height: 10,),
                 Text(data['strInstructions'] ?? ''),
               ],
             ),
           );
          },
          error: (err, st) => Text(err.toString()),
          loading: () => Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
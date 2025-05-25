import 'package:flutter_chaitra/models/category.dart';
import 'package:flutter_chaitra/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final mealCategoryProvider = FutureProvider<List<CategoryData>>((ref){
   return MealRepository.getMealCategory();
});
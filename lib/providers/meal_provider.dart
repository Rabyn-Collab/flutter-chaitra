import 'package:flutter_chaitra/models/category.dart';
import 'package:flutter_chaitra/models/category_item.dart';
import 'package:flutter_chaitra/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final mealCategoryProvider = FutureProvider<List<CategoryData>>((ref){
   return MealRepository.getMealCategory();
});


final categoryItemsProvider = FutureProvider.family<List<CategoryItem>, String>((ref, category){
  return MealRepository.getCategoryItems(category: category);
});


final mealDetailProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, id){
  return MealRepository.getMealDetail(id: id);
});
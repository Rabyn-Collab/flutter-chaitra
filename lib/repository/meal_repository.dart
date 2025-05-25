

import 'package:dio/dio.dart';
import 'package:flutter_chaitra/models/category.dart';


class MealRepository {

static  final Dio dio = Dio();

 static Future<List<CategoryData>>  getMealCategory() async {
    try{

     final response =  await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
    return  (response.data['categories'] as List).map((e) => CategoryData.fromJson(e)).toList();
    }catch (err){
      print(err);
      throw 'something went wrong';

    }
  }


}
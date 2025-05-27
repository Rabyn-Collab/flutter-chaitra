



class CategoryItem {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  CategoryItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal']
    );
  }
}
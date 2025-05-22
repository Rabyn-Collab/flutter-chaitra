


class CategoryData{
 final String idCategory;
 final String  strCategory;
 final String  strCategoryThumb;
  final String  strCategoryDescription;

  CategoryData({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }

}
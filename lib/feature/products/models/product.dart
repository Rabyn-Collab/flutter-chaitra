import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String description,
    required int price,
    required String image,
    required String category,
    required String brand,
}) = _Product;

  factory Product.empty() => Product(
    id: '12123',
    title: 'aslkm askndasnkl',
    description: 'lkansd asjdk asdjkadasjdas,jd  lkasdn',
    price: 900,
    image: 'https://images.unsplash.com/photo-1749741322727-3c51c6b41903?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
    category: 'aslkdnsa dask',
    brand: 'aslkndaskl',
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

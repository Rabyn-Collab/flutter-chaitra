import 'package:hive/hive.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String image;

  @HiveField(3)
  int price;

  @HiveField(4)
  int qty;


  CartItem({required this.title, required this.image, required this.price, required this.qty, required this.id});
  factory CartItem.empty() => CartItem(title: '', image: '', price: 0, qty: 0, id: '');

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
    'price': price,
    'qty': qty,
  };

}
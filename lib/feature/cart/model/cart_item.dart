import 'package:hive/hive.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {

  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  int price;

  @HiveField(3)
  int qty;


  CartItem({required this.title, required this.image, required this.price, required this.qty});

}
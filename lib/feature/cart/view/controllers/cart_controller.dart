import 'package:flutter_chaitra/feature/cart/model/cart_item.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/main.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_controller.g.dart';


@riverpod
class CartController extends _$CartController {
  @override
 List<CartItem>  build() {
    return  ref.watch(cartBoxProvider);
  }

  void addToCart(Product product) {
    print('hello');
    final isExist = state.firstWhere((e) => e.id == product.id, orElse: () => CartItem.empty());

    if (isExist.title.isEmpty) {
      final newCartItem = CartItem(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        qty: 1
      );
      state = [...state, newCartItem];
      Hive.box<CartItem>('carts').add(newCartItem);
    } else {
        isExist.qty =  isExist.qty + 1;
        isExist.save();
    }
  }

  void addSingle(CartItem item) {
    item.qty = item.qty + 1;
    item.save();
    state = [
      for(final i in state)
        if (i.id == item.id) item else i
    ];
  }
  void removeSingle(CartItem item) {
    if (item.qty == 1) return;
    item.qty = item.qty - 1;
    item.save();
    state = [
      for(final i in state)
        if (i.id == item.id) item else i
    ];
  }


  void clearCart() {
    Hive.box<CartItem>('carts').clear();
    state = [];
    ref.read(cartBoxProvider).clear();
  }

  int get  totalAmount{
    int total = 0;
    for (final item in state) {
      total += item.price * item.qty;
    }
    return total;
  }

}

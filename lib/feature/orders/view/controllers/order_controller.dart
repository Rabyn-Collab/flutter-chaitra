import 'package:flutter_chaitra/feature/cart/model/cart_item.dart';
import 'package:flutter_chaitra/feature/orders/model/order.dart';
import 'package:flutter_chaitra/feature/orders/repository/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_controller.g.dart';


@riverpod
Future<List<Order>> getUserOrders (Ref ref) async {
  return  ref.watch(orderRepositoryProvider).getUserOrders();
}


@riverpod
Future<List<Order>> getOrderDetail (Ref ref, {required String orderId}) async {
  return  ref.watch(orderRepositoryProvider).getOrderDetail(orderId);
}



@riverpod
class OrderController extends _$OrderController {
  @override
  FutureOr<void> build() {}

  Future<void> placeOrder({required int totalAmount, required List<CartItem> cart}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(orderRepositoryProvider).placeOrder(totalAmount: totalAmount, cart: cart));
  }
}

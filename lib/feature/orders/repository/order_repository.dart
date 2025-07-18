import 'package:dio/dio.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/cart/model/cart_item.dart';
import 'package:flutter_chaitra/feature/orders/model/order.dart';
import 'package:flutter_chaitra/feature/orders/model/order_item.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';


class OrderRepository{
  final Dio client;
  OrderRepository({required this.client});

  Future<List<Order>> getUserOrders() async {
    try{
      final response = await client.get('/orders/users');
     return (response.data as List).map((e) => Order.fromJson(e)).toList();
    }on DioException catch(err){

      throw ApiException(err).errorMessage;
    }

  }

  Future<List<Order>> getOrderDetail(String orderId) async {
    try{
      final response = await client.get('/orders/$orderId');
      return (response.data as List).map((e) => Order.fromJson(e)).toList();
    }on DioException catch(err){

      throw ApiException(err).errorMessage;
    }

  }


  Future<void> placeOrder({required int totalAmount, required List<CartItem> cart}) async {
    try{
      final response = await client.post('/orders', data: {
        'totalAmount': totalAmount,
        'orderItems': cart.map((e) => e.toJson()).toList(),
      });
      return response.data;
    }on DioException catch(err){

      throw ApiException(err).errorMessage;
    }

  }

}


@riverpod
OrderRepository orderRepository  (Ref ref) {
  return OrderRepository(client: ref.watch(authClientProvider));
}
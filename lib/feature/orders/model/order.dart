import 'package:flutter_chaitra/feature/orders/model/order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';
part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: '_id') required String id,
    @Default('') String userId,
    @Default(0) int totalAmount,
    @Default([]) List<OrderItem> orderItems
}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {

  const factory OrderItem({
   @JsonKey(name: '_id') required String id,
    @Default('') String title,
    @Default('') String image,
    @Default(0) int price,
    @Default(0) int qty
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/products/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';


@riverpod
Future<List<Product>> getProducts (Ref ref) {
  return ref.watch(productRepositoryProvider).getProducts();
}

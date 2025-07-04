import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/products/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';


@riverpod
Future<List<Product>> getProducts (Ref ref) {
  return ref.watch(productRepositoryProvider).getProducts();
}


@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<void> build() {}

  Future<void> addProduct(Map<String, dynamic> data, XFile image) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(productRepositoryProvider).addProduct(data, image));
  }

  Future<void> updateProduct({required Map<String, dynamic> data ,XFile? image, required String id}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(productRepositoryProvider).updateProduct(data: data, image: image, id: id));
  }

  Future<void> removeProduct({required String id}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(productRepositoryProvider).removeProduct(id: id));
  }
}
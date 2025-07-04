import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';


class ProductRepository{

  final Dio client;
  ProductRepository({required this.client});

Future<List<Product>> getProducts() async {
    try{
      final response = await client.get(products);
      return (response.data['products'] as List).map((e) => Product.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> updateProduct({required Map<String, dynamic> data ,XFile? image, required String id}) async {
    final formData = FormData.fromMap({
      ...data,
     if(image != null) 'image': await MultipartFile.fromFile(image.path),
    });
    try{
      await client.patch('$products/$id', data: formData);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }



  Future<void> addProduct(Map<String, dynamic> data, XFile image) async {
    final formData = FormData.fromMap({
      ...data,
      'image': await MultipartFile.fromFile(image.path),
    });
    try{
      await client.post(products, data: formData);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

}


@riverpod
ProductRepository productRepository  (Ref ref) {
  return ProductRepository(client: ref.watch(authClientProvider));
}
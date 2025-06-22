import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';


class ProductRepository{

  final Dio client;
  ProductRepository({required this.client});

Future<List<Product>> getProducts() async {
    try{
      final response = await client.get(products);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }


}


@riverpod
ProductRepository productRepository  (Ref ref) {
  return ProductRepository(client: ref.watch(clientProvider));
}
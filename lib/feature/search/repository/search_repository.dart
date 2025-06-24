import 'package:dio/dio.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/exceptions/api_exception.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/shared/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository.g.dart';


class SearchRepository {
  final Dio client;
  SearchRepository({required this.client});

  Future<List<Product>> getSearchProducts(String searchText) async {

    try{
      final response = await client.get(products, queryParameters: { 'search': searchText });

      return (response.data['products'] as List).map((e) => Product.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }

  }
}

@riverpod
SearchRepository searchRepository  (Ref ref) {
  return SearchRepository(client: ref.watch(clientProvider));
}
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/search/repository/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';


@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<List<Product>> build() {
    return [];
  }

  Future<void> getSearchProducts(String searchText) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(searchRepositoryProvider).getSearchProducts(searchText));
  }
}

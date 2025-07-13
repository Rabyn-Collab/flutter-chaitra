import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/products/view/controllers/product_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: () => ref.refresh(getProductsProvider.future),
        child: productState.when(
          data: (data) {
            return _buildDynamicHeightGridView(data, false);
          },
          error: (err, st) => Text(err.toString()),
          loading: () => Skeletonizer(child: _buildDynamicHeightGridView(
              List.generate(5, (index) => Product.empty()), true)),
        ),
      ),
    );
  }

  DynamicHeightGridView _buildDynamicHeightGridView(List<Product> data, bool isLoad) {
    return DynamicHeightGridView(
      builder: (context, index) {
        final item = data[index];
        return InkWell(
          onTap: (){
            context.pushNamed(RouteEnum.product.name, extra: item);
          },
          child: Card(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: isLoad ? item.image: '$base${item.image}',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Gap(10),
                Text(item.title),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text('Rs. ${item.price}'),
                ),
                Text('Brand: ${item.brand}'),
                Gap(10),
              ],
            ),
          ),
        );
      },
      itemCount: data.length,
      crossAxisCount: 2,
    );
  }
}

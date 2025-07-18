import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/cart/view/controllers/cart_controller.dart';
import 'package:flutter_chaitra/feature/products/models/product.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';



class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SafeArea(
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: '$base${product.image}', height: 300, fit: BoxFit.cover,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title),
                    Text(product.description),
                    Text('Rs. ${product.price}'),
                    Text('Brand: ${product.brand}'),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final userState = ref.watch(userStateControllerProvider);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: userState.role == 'Admin' ? null : () {
                            ref.read(cartControllerProvider.notifier).addToCart(product);
                            context.pushNamed(RouteEnum.cart.name);
                          }, child: Text('Add to Cart')),
                    ],
                  ),
                );
              }
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

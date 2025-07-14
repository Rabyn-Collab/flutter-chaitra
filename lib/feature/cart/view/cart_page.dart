import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/cart/view/controllers/cart_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartControllerProvider);
    final  totalAmount = ref.watch(cartControllerProvider.notifier).totalAmount;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page'),),
      body: carts.isEmpty ? const Center(child: Text('Cart is Empty'),) : Column(
        children: [
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
            final cart = carts[index];
            return Row(
              children: [
              Expanded(child: CachedNetworkImage(imageUrl: '$base${cart.image}', height: 100, fit: BoxFit.cover, width: 100,)),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(cart.title),
                      Gap(10),
                      Text('Rs. ${cart.price}'),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(child: IconButton(onPressed: (){}, icon: const Icon(Icons.remove),)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text('${cart.qty}'),
                          ),
                          CircleAvatar(child: IconButton(onPressed: (){}, icon: const Icon(Icons.add),)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }, itemCount: carts.length,)),
          Text('Total Amount: Rs. $totalAmount')
        ],
      ),
    );
  }
}
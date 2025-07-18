import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/cart/view/controllers/cart_controller.dart';
import 'package:flutter_chaitra/feature/orders/view/controllers/order_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(orderControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            ref.read(cartControllerProvider.notifier).clearCart();
            Fluttertoast.showToast(msg: 'Order Placed Successfully');
          },
          error: (err, st) {
            Fluttertoast.showToast(msg: '$err');
          });
    });
    final carts = ref.watch(cartControllerProvider);
    final  totalAmount = ref.watch(cartControllerProvider.notifier).totalAmount;
    final orderState = ref.watch(orderControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: carts.isEmpty ? const Center(child: Text('Cart is Empty'),) : Column(
            children: [
              Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                final cart = carts[index];
                return Stack(
                  children: [
                    Row(
                      children: [
                      Expanded(
                          child: CachedNetworkImage(imageUrl: '$base${cart.image}', height: 100, fit: BoxFit.cover, width: 100,)),
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
                                  CircleAvatar(child: IconButton(onPressed: (){
                                    ref.read(cartControllerProvider.notifier).removeSingle(cart);
                                  }, icon: const Icon(Icons.remove),)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('${cart.qty}'),
                                  ),
                                  CircleAvatar(child: IconButton(onPressed: (){
                                    ref.read(cartControllerProvider.notifier).addSingle(cart);
                                  }, icon: const Icon(Icons.add),)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(onPressed: (){
                        ref.read(cartControllerProvider.notifier).removeFromCart(cart);
                      }, icon: const Icon(Icons.close),),
                    ),
                  ],
                );
              }, itemCount: carts.length,)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text('Total Amount'),
                        const Spacer(),
                        Text('Rs. $totalAmount')
                      ],
                    ),
                    Gap(10),
                    ElevatedButton(onPressed:
                     orderState.isLoading ? null :   (){
                     ref.read(orderControllerProvider.notifier).placeOrder(
                         totalAmount: totalAmount, cart: carts);
                    }, child: orderState.isLoading ? const CircularProgressIndicator() :  const Text('Place An Order'))
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
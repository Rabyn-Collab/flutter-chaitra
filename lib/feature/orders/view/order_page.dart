import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/order_controller.dart';



class OrderDetailPage extends ConsumerWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(getOrderDetailProvider(orderId: orderId));

    return Scaffold(
      appBar: AppBar(title: const Text('Order Detail'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: orderState.when(
            data: (data){
              return Column(
                children: [
                  Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        Row(
                          children: [
                            Text('OrderId:- '),
                            Text(data.id),
                          ],
                        ),
                        Text('Total Amount:- Rs. ${data.totalAmount}'),
                                            ],
                                          ),
                      )),

                  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item = data.orderItems[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider('$base${item.image}'),
                                ),
                                title: Text(item.title),
                                subtitle: Text('Rs. ${item.price}'),
                                trailing: Text('Qty.${item.qty}'),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: data.orderItems.length
                      )
                  )


                ],
              );

            },
            error: (err, st) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator(),)
            ),
      )
    );
  }
}
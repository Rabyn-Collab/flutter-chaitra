import 'package:flutter/material.dart';
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
      body: Column(
        children: [

        ],
      ),
    );
  }
}
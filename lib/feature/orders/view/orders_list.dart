import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/orders/view/controllers/order_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class OrdersList extends ConsumerWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(getUserOrdersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Orders'),),
     body: Padding(
       padding: const EdgeInsets.all(10.0),
       child: orderState.when(
           data: (data){
             return ListView.separated(
               separatorBuilder: (context, index) => const Divider(),
               itemCount: data.length,
               itemBuilder: (context, index) {
                 final order = data[index];
                 return Card(
                   child: ListTile(
                     onTap: (){
                       context.pushNamed(RouteEnum.orderDetail.name, extra: order.id);
                     },
                     title: Text(order.id),
                     subtitle: Text('Rs. ${order.totalAmount}'),
                     trailing: TextButton(onPressed: (){
                       context.pushNamed(RouteEnum.orderDetail.name, extra: order.id);
                     }, child: Text('View Detail')),
                   ),
                 );
               },
             );
           },
           error: (err, st) => Text(err.toString()),
           loading: () => const Center(child: CircularProgressIndicator(),)
       ),
     ) ,
    );
  }
}
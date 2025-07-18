import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_chaitra/feature/products/view/controllers/product_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class AdminPanel extends ConsumerWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(productRemoveControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            ref.invalidate(getProductsProvider);
            Fluttertoast.showToast(msg: 'Product Removed Successfully');
          },
          error: (err, st) {
            Fluttertoast.showToast(msg: '$err');
          });
    });
    final productState = ref.watch(getProductsProvider);

    return Scaffold(
      appBar: AppBar(
       actions: [
         IconButton(onPressed: (){
           context.pushNamed(RouteEnum.add.name);
         }, icon: Row(
           children: [
             const Icon(Icons.add),
             Gap(10),
             Text('Add Product')
           ],
         ),),
       ],
      ),
      body: productState.when(
          data: (data){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: data.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: CachedNetworkImage(imageUrl: '$base${data[index].image}', height: 50, width: 50,fit: BoxFit.cover ,),
                    title: Text(data[index].title),
                    trailing: SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){
                            context.pushNamed(RouteEnum.update.name, extra: data[index]);
                          }, icon: const Icon(Icons.edit),),
                          IconButton(onPressed: (){
                           showDialog(context: context, builder: (context) => AlertDialog(
                             title: const Text('Delete Product'),
                             content: const Text('Are you sure you want to delete this product?'),
                             actions: [
                               TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
                               TextButton(onPressed: () async {
                                context.pop();
                                ref.read(productRemoveControllerProvider.notifier).removeProduct(id: data[index].id);
                               }, child: const Text('Delete')),
                             ]
                           ));


                          }, icon: const Icon(Icons.delete),),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            );
          },
          error: (err, st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),)
      ) ,
    );
  }
}
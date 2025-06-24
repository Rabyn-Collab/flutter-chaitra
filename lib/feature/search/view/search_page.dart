import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/constants/apis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'controllers/search_controller.dart';

class SearchPage extends ConsumerWidget { 
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Gap(20),
              TextFormField(
                onFieldSubmitted: (value) {
                  ref.read(searchControllerProvider.notifier).getSearchProducts(value);
                },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: const Text('Search'),
                      suffixIcon: IconButton(onPressed: (){

                      }, icon: const Icon(Icons.search))
                    ),
              ),
              Expanded(
                  child: searchState.when(
                      data: (data){
                        return  DynamicHeightGridView(
                          builder: (context, index) {
                            final item = data[index];
                            return Card(
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:  '$base${item.image}',
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
                            );
                          },
                          itemCount: data.length,
                          crossAxisCount: 2,
                        );
                      },
                      error: (err, st) => Text(err.toString()),
                      loading: () => const Center(child: CircularProgressIndicator(),)
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
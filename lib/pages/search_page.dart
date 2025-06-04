import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/pages/widgets/search_input.dart';
import 'package:flutter_chaitra/providers/news_provider.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
 class SearchPage extends ConsumerWidget {
   final String query;
   const SearchPage({super.key, required this.query});

   @override
   Widget build(BuildContext context, ref) {
     final newsState = ref.watch(searchNewsProvider(query));
     return Scaffold(
       appBar: AppBar(title: Text('Search'),),
       body: Padding(
         padding: const EdgeInsets.all(10.0),
         child: newsState.when(
           data: (data) {
             return DynamicHeightGridView(
               crossAxisCount: 2,
               itemCount: data.length,
               builder: (context, index) {
                 final news = data[index];
                  return InkWell(
                    onTap: () => context.pushNamed(AppRoute.webView.name, extra: news.url),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          height: 200,
                          fit: BoxFit.fitHeight,
                          imageUrl: news.urlToImage,
                        errorWidget: (c, s, o) => Image.asset('assets/images/empty.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(news.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  );
               },
             );
           },
           error: (err, stack) => Text(err.toString()),
           loading: () => const Center(child: CircularProgressIndicator(),),
         ),
       ),
     );
   }
 }

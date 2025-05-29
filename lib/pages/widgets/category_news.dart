import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/news.dart';
import 'package:flutter_chaitra/providers/news_provider.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryNews extends ConsumerWidget {
  final String category;
  const CategoryNews({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(getCategoryNewsProvider(category));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: newsState.when(
        data: (data) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final news = data[index];
              return InkWell(
                  onTap: (){
                   context.pushNamed(AppRoute.webView.name, extra: news.url);
                  },
                  child: _buildRow(news));
            },
          );
        },
        error: (err, stack) => Text(err.toString()),
        loading: () =>Skeletonizer(child: ListView.separated(
            itemBuilder: (context, index) =>_buildRow(News.empty()),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 7
        )),
      ),
    );
  }

  Row _buildRow(News news) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                news.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            errorWidget: (c, s, o) => Image.asset('assets/images/empty.png'),
            imageUrl: news.urlToImage,
            height: 100,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

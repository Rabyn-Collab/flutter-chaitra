import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/book.dart';
import 'package:go_router/go_router.dart';

class BookSlider extends StatelessWidget {
  final Book book;
  const BookSlider({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: InkWell(
        onTap: (){
          context.push('/detail-page', extra: book);
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 170,
                width: 400,
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(book.title),
                            Text(book.description,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(book.rating),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(book.genre),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D',
                  width: 110,
                  height: 185,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/book.dart';


class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),

    );
  }
}

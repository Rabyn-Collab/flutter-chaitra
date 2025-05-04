import 'package:flutter_chaitra/models/book.dart';

const books = [
  {
    'title': 'Harry Potter',
    'description': 'A book about magic',
    'genre': 'Fantasy',
    'imageUrl': 'assets/images/harrypotter.jpg',
    'rating': '⭐⭐⭐⭐⭐'
  },
  {
    'title': 'The Hobbit',
    'description': 'A journey of a hobbit named Bilbo Baggins',
    'genre': 'Fantasy',
    'imageUrl': 'assets/images/thehobbit.jpg',
    'rating': '⭐⭐⭐⭐'
  },
  {
    'title': '1984',
    'description': 'A dystopian novel about surveillance and control',
    'genre': 'Dystopian',
    'imageUrl': 'assets/images/1984.jpg',
    'rating': '⭐⭐⭐⭐⭐'
  },
  {
    'title': 'To Kill a Mockingbird',
    'description': 'A novel about racial injustice in the Deep South',
    'genre': 'Fiction',
    'imageUrl': 'assets/images/tokillamockingbird.jpg',
    'rating': '⭐⭐⭐⭐'
  },
  {
    'title': 'The Alchemist',
    'description': 'A boy’s journey to follow his dreams',
    'genre': 'Adventure',
    'imageUrl': 'assets/images/thealchemist.jpg',
    'rating': '⭐⭐⭐⭐⭐'
  }
];

final bookList = books.map((book){
  return Book.fromJson(book);
}).toList();
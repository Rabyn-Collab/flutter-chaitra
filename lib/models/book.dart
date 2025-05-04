


class Book{

  final String title;
  final String description;
  final String rating;
  final String genre;
  final String imageUrl;

  Book({
    required this.title,
    required this.description,
    required this.genre,
    required this.imageUrl,
    required this.rating
  });

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
        title: json['title'],
        description: json['description'],
        genre: json['genre'],
        imageUrl: json['imageUrl'],
        rating: json['rating']
    );
  }

}



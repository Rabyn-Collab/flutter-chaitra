class News {
  final String title;
  final String url;
  final int score;
  final int id;
  final String by;
  News({
    required this.title,
    required this.url,
    required this.score,
    required this.id,
    required this.by,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      score: json['score'] ?? 0,
      id: json['id'] ?? 0,
      by: json['by'] ?? '',
    );
  }
}

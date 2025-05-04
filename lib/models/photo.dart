





class Photo{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({required this.url, required this.albumId, required this.id, required this.title, required this.thumbnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
        url: json['url'],
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        thumbnailUrl: json['thumbnailUrl']
    );
  }

}
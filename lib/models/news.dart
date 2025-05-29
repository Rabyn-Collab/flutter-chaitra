


class News{

  final String author;
 final String title;
 final String description;
 final String url;
 final String urlToImage;
 final String publishedAt;
 final String content;

 News({
   required this.author,
   required this.title,
   required this.description,
   required this.url,
   required this.urlToImage,
   required this.publishedAt,
   required this.content,
 });

 factory News.fromJson(Map<String, dynamic> json){
   return News(
     author: json['author'] ?? '',
     title: json['title'] ?? '',
     description: json['description'] ?? '',
     url: json['url'] ?? '',
     urlToImage: json['urlToImage'] ?? '',
     publishedAt: json['publishedAt'] ?? '',
     content: json['content'] ?? '',
   );
 }

 factory News.empty(){
   return News(
     author: 'lkmsa dlkmasd',
     title: 'sakl;dmsa dsalkdmsa dsalkdsad slakd kl',
     description: 'aslkd sad salkd sad',
     url: 'skmdsad lk',
     urlToImage: 'https://images.unsplash.com/photo-1746908592757-2c1d682b71db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
     publishedAt: 'aslkd aslkda',
     content: 'as;ldmsal;kd',
   );
 }

}



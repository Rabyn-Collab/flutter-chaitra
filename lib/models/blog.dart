import 'package:freezed_annotation/freezed_annotation.dart';
part 'blog.g.dart';
part 'blog.freezed.dart';


@freezed
class Blog with _$Blog {

  const factory Blog({
   required String id,
   required String title,
   required String detail,
   }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}



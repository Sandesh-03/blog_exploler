import 'package:hive/hive.dart';

part 'blog_model.g.dart';

@HiveType(typeId: 0)
class Blog extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String title;

  @HiveField(3)
  bool isLiked;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.isLiked = false,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }
}

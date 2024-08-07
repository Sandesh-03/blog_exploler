import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/blog_model.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blog_event.dart';
import '../screens/blog_detail_screen.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;

  BlogListItem({required this.blog});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: blog.imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      title: Text(
        blog.title.length > 30 ? '${blog.title.substring(0, 30)}...' : blog.title,
      ),
      trailing: IconButton(
        icon: Icon(blog.isLiked ? Icons.favorite : Icons.favorite_border),
        color: blog.isLiked ? Colors.red : null,
        onPressed: () {
          blog.isLiked = !blog.isLiked;
          blog.save();
          context.read<BlogBloc>().add(UpdateBlog(blog));
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailScreen(blog: blog),
          ),
        );
      },
    );
  }
}

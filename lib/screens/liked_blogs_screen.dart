import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blog_state.dart';
import '../widgets/blog_list_item.dart';

class LikedBlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Blogs'),
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoaded) {
            final likedBlogs = state.blogs.where((blog) => blog.isLiked).toList();

            if (likedBlogs.isEmpty) {
              return Center(child: Text('No liked blogs available'));
            }

            return ListView.builder(
              itemCount: likedBlogs.length,
              itemBuilder: (context, index) {
                final blog = likedBlogs[index];
                return BlogListItem(blog: blog);
              },
            );
          } else {
            return Center(child: Text('Error loading blogs'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blog_event.dart';
import '../bloc/blog_state.dart';
import '../widgets/blog_list_item.dart';
import 'liked_blogs_screen.dart';

class BlogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Explorer'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedBlogsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlogLoaded) {
            final blogs = state.blogs;

            if (blogs.isEmpty) {
              return Center(child: Text('No blogs available'));
            }

            return ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                return BlogListItem(blog: blog);
              },
            );
          } else if (state is BlogError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Press the button to fetch blogs'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BlogBloc>().add(FetchBlogs());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

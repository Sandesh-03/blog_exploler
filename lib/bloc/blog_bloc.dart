import 'package:flutter_bloc/flutter_bloc.dart';
import 'blog_event.dart';
import 'blog_state.dart';
import '../services/api_service.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final ApiService apiService;

  BlogBloc(this.apiService) : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await apiService.fetchBlogs();
        emit(BlogLoaded(blogs));
      } catch (e) {
        emit(BlogError(e.toString()));
      }
    });

    on<UpdateBlog>((event, emit) async {
      final currentState = state;
      if (currentState is BlogLoaded) {
        final updatedBlogs = currentState.blogs.map((blog) {
          return blog.id == event.blog.id ? event.blog : blog;
        }).toList();
        emit(BlogLoaded(updatedBlogs));
      }
    });
  }
}

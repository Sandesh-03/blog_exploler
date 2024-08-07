import 'package:equatable/equatable.dart';
import '../models/blog_model.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBlogs extends BlogEvent {}

class UpdateBlog extends BlogEvent {
  final Blog blog;

  UpdateBlog(this.blog);

  @override
  List<Object> get props => [blog];
}

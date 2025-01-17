import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/blog_model.dart';

class ApiService {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> blogJson = data['blogs'];
        final blogs = blogJson.map((json) => Blog.fromJson(json)).toList();

        final box = Hive.box<Blog>('blogs');
        box.clear();
        box.addAll(blogs);

        return blogs;
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      final box = Hive.box<Blog>('blogs');
      return box.values.toList();
    }
  }
}

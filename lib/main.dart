import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/blog_bloc.dart';
import 'screens/blog_list_screen.dart';
import 'services/api_service.dart';
import 'models/blog_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BlogAdapter());
  await Hive.openBox<Blog>('blogs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc(ApiService()),
      child: MaterialApp(
        title: 'Blog Explorer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlogListScreen(),
      ),
    );
  }
}

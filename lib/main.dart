import 'package:flutter/material.dart';
import 'package:movie_app/core/service/service_locator.dart';
import 'movies/presentation/views/movies_screen.dart';

void main() {
  ServiceLocator.init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screen/tabs_screen.dart';

import './models/categories_model.dart';
import './models/movies_model.dart';

void main() {
  runApp(const MyMovieApp());
}

class MyMovieApp extends StatefulWidget {
  const MyMovieApp({Key? key}) : super(key: key);

  @override
  State<MyMovieApp> createState() => _MyMovieAppState();
}

class _MyMovieAppState extends State<MyMovieApp> {
  final _categoryModel = Categories();
  final _movies = Movies();

  void _deleteMovie(String id) {
    setState(() {
      _movies.deleteMovie(id);
      print("main $id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.merriweather().fontFamily,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: SafeArea(
          child: TabsScreen(
            categoryModel: _categoryModel.list,
            movies: _movies.list,
            deleteMovie: _deleteMovie,
          ),
        ),
      ),
    );
  }
}

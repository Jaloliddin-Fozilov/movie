import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import './screen/tabs_screen.dart';

import './models/categories_model.dart';
import './models/movies_model.dart';

void main() {
  runApp(const MyMovieApp());
}

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categoryModel = Categories();
    final _movies = Movies();
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
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie/Screens/tabs_screen.dart';

import './Screens/home_page.dart';
import './Screens/tabs_screen.dart';
import 'Screens/top_menu_navigator.dart';

import './models/categories_model.dart';

void main() {
  runApp(MyMovieApp());
}

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categoryModel = Categories();
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
      home: SafeArea(
        child: TabsScreen(
          categoryModel: _categoryModel.list,
        ),
      ),
    );
  }
}

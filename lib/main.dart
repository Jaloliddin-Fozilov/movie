import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import './Screens/home_page.dart';
import './Screens/tabs_screen.dart';

void main() {
  runApp(MyMovieApp());
}

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.merriweather().fontFamily,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: TabsScreen(),
    );
  }
}

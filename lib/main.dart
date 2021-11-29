import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import './screens/home_page.dart';
import './screens/tabs_screen.dart';
import 'screens/top_menu_navigator.dart';

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
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: SafeArea(
        child: TabsScreen(),
      ),
    );
  }
}

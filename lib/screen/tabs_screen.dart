import 'package:flutter/material.dart';

import './home_page.dart';
import './top_menu_navigator.dart';
import './profile_screen.dart';
import './favorites_screen.dart';
import 'category_movies_screen.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

class TabsScreen extends StatefulWidget {
  final List<CategoryModel> categoryModel;
  final List<MoviesModel> movies;
  const TabsScreen({
    Key? key,
    required this.categoryModel,
    required this.movies,
  }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _tabIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        'page': HomePage(
          categoryModel: widget.categoryModel,
          movies: widget.movies,
          changeTab: changeTab,
        ),
        'title': "Home"
      },
      {'page': FavoritesScreen(), 'title': "Favorites"},
      {'page': ProfileScreen(), 'title': "Profile"},
      {
        'page': CategoryMoviesScreen(
          movies: widget.movies,
        ),
        'title': "Movies"
      },
    ];
  }

  void changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TopMenuNavigator(
          tabIndex: _tabIndex,
          changeTab: changeTab,
        ),
        _pages[_tabIndex]['page'],
      ]),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(20, 24, 33, 1),
        ),
        child: new BottomNavigationBar(
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.shifting,
          currentIndex: _tabIndex > 2 ? 0 : _tabIndex,
          onTap: changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
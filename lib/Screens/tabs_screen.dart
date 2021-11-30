import 'package:flutter/material.dart';

import './home_page.dart';
import './top_menu_navigator.dart';
import './profile_screen.dart';
import './favorites_screen.dart';

import '../models/categories_model.dart';

class TabsScreen extends StatefulWidget {
  final List<CategoryModel> categoryModel;
  const TabsScreen({
    Key? key,
    required this.categoryModel,
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
      {'page': HomePage(categoryModel: widget.categoryModel), 'title': "Home"},
      {'page': FavoritesScreen(), 'title': "Favorites"},
      {'page': ProfileScreen(), 'title': "Profile"},
    ];
  }

  void _changeTab(int index) {
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
          changeTab: _changeTab,
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
          currentIndex: _tabIndex,
          onTap: _changeTab,
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

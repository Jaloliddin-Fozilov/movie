import 'package:flutter/material.dart';

import './home_page.dart';
import './top_menu_navigator.dart';
import './profile_screen.dart';
import './favorites_screen.dart';
import 'category_movies_screen.dart';
import 'package:movie/screen/movie_datail_screen.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

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
  var categoryScreenId = "c2";
  var categoryScreenTitle = "c2";
  String movieId = "";
  String title = "";
  List imageUrls = [];
  String description = "";
  String director = "";
  List actors = [];
  final moviesModel = Movies();
  List<Map<String, dynamic>> _pages = [];

  void _toggleLike(String movieId) {
    setState(() {
      moviesModel.toggleLike(movieId);
    });
  }

  bool _isFavorite(String moviesId) {
    return moviesModel.favorites.any((movie) => movie.id == moviesId);
  }

  void categoryId(String id, String title) {
    setState(() {
      categoryScreenId = id;
      categoryScreenTitle = title;
    });
  }

  void changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void detailPage(
    String detailId,
    String detailTitle,
    List detailImageUrls,
    String detailDescription,
    String detailDirector,
    List detailActors,
  ) {
    setState(() {
      movieId = detailId;
      title = detailTitle;
      imageUrls = detailImageUrls;
      description = detailDescription;
      director = detailDirector;
      actors = detailActors;
    });
  }

  void _deleteMovie(String id) {
    setState(() {
      moviesModel.deleteMovie(id);
    });
  }

  void _addNewMovie(MoviesModel movie) {
    moviesModel.addMovie(movie);
  }

  @override
  Widget build(BuildContext context) {
    categoryId;
    _pages = [
      {
        'page': HomePage(
          categoryModel: widget.categoryModel,
          movies: moviesModel.list,
          changeTab: changeTab,
          categoryId: categoryId,
          detailPage: detailPage,
          toggleLike: _toggleLike,
          isFavorite: _isFavorite,
        ),
        'title': "Home"
      },
      {
        'page': FavoritesScreen(
          movies: moviesModel.favorites,
          toggleLike: _toggleLike,
        ),
        'title': "Favorites"
      },
      {
        'page': ProfileScreen(
          deleteMovie: _deleteMovie,
          movies: moviesModel.list,
          categories: widget.categoryModel,
          addNewMovie: _addNewMovie,
        ),
        'title': "Profile"
      },
      {
        'page': CategoryMoviesScreen(
          movies: moviesModel.list,
          categoryId: categoryScreenId,
          categoryTitleCaegotyScreen: categoryScreenTitle,
          changeTab: changeTab,
          detailPage: detailPage,
        ),
        'title': "Movies"
      },
      {
        'page': MovieDetailScreen(
          id: movieId,
          title: title,
          imageUrls: imageUrls,
          description: description,
          director: director,
          actors: actors,
          toggleLike: _toggleLike,
          isFavorite: _isFavorite,
        ),
        'title': "Movie",
      },
    ];

    return Scaffold(
      body: Column(children: [
        TopMenuNavigator(
          tabIndex: _tabIndex,
          changeTab: changeTab,
        ),
        _pages[_tabIndex]['page'],
      ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(20, 24, 33, 1),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.shifting,
          currentIndex: _tabIndex > 2 ? 0 : _tabIndex,
          onTap: changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

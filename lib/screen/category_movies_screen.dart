import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../widgets/home_movie_items.dart';

class CategoryMoviesScreen extends StatelessWidget {
  final List<MoviesModel> movies;
  final String? categoryId;
  final String? categoryTitleCaegotyScreen;
  final Function detailPage;
  const CategoryMoviesScreen({
    Key? key,
    required this.movies,
    this.categoryId,
    this.categoryTitleCaegotyScreen,
    required this.detailPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 10,
            ),
            child: Text(
              categoryTitleCaegotyScreen!,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 130,
                childAspectRatio: 0.43,
                crossAxisSpacing: 15,
              ),
              children: movies
                  .where(
                    (movie) => movie.categoryId == categoryId,
                  )
                  .toList()
                  .map((moviesItem) {
                return HomeMovieItems(
                  moviesItem: moviesItem,
                  detailPage: detailPage,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}





/*
child: Row(
          children: [
            Column(
              children: movies
                  .where(
                    (movie) => movie.categoryId == categoryId,
                  )
                  .toList()
                  .map((moviesItem) {
                return HomeMovieItems(
                  moviesItem: moviesItem,
                );
              }).toList(),
            ),
          ],
        ),
        */
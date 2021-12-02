import 'package:flutter/material.dart';

import 'package:movie/models/movies_model.dart';
import 'package:movie/widgets/home_movie_items.dart';
import '../screen/category_movies_screen.dart';

class CustomContainerMovieItem extends StatelessWidget {
  final String categoryTitle;
  final Function changeTab;
  final List<MoviesModel> movies;
  const CustomContainerMovieItem({
    Key? key,
    required this.categoryTitle,
    required this.changeTab,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(categoryTitle),
              TextButton(
                onPressed: () {
                  CategoryMoviesScreen(
                    movies: movies,
                  );
                  changeTab(3);
                },
                child: const Text("See all"),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: movies.map((movie) {
                  final moviesItem = movies
                      .where(
                        (movies) => movies.id == movie.id,
                      )
                      .toList();
                  return HomeMovieItems(
                    moviesItem: moviesItem,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

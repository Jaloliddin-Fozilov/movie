import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../widgets/custom_container_movie_item.dart';
import '../widgets/home_movie_items.dart';

class CategoryMoviesScreen extends StatelessWidget {
  final List<MoviesModel> movies;
  final String? categoryId;
  const CategoryMoviesScreen({
    Key? key,
    required this.movies,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$categoryId ***************************************");
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: movies.map((movie) {
                  final moviesItem = movies
                      .where(
                        (movies) =>
                            movies.id == movie.id &&
                            movies.categoryId == categoryId,
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
      ),
    );
  }
}

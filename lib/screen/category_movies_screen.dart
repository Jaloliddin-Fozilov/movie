import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../widgets/custom_container_movie_item.dart';
import '../widgets/home_movie_items.dart';

class CategoryMoviesScreen extends StatelessWidget {
  final List<MoviesModel> movies;
  const CategoryMoviesScreen({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.only(left: 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
        ),
        children: movies.map((movie) {
          final moviesItem =
              movies.where((movies) => movie.id == movies.id).toList();

          return CustomContainerMovieItem(
            categoryTitle: moviesItem[0].title,
            changeTab: () {},
            movies: movies,
          );
        }).toList(),
      ),
    );
  }
}

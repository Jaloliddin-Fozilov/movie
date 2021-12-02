import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../widgets/custom_container_movie_item.dart';
import '../widgets/home_movie_items.dart';

class CategoryMoviesScreen extends StatelessWidget {
  final List<MoviesModel>? movies;
  final String? categoryId;
  const CategoryMoviesScreen({
    Key? key,
    this.movies,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: movies != null
          ? GridView(
              padding: const EdgeInsets.only(left: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
              ),
              children: movies!.map((movie) {
                final moviesItem = movies!
                    .where(
                      (movies) =>
                          movies.id == movie.id &&
                          categoryId == movies.categoryId,
                    )
                    .toList();
                return HomeMovieItems(
                  moviesItem: moviesItem,
                );
              }).toList(),
            )
          : Center(
              child: Text("Bu kotegoriyada hali kinolar yo'q"),
            ),
    );
  }
}

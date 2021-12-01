import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../widgets/custom_container_movie_item.dart';

class HomePage extends StatelessWidget {
  final List<CategoryModel> categoryModel;
  final List<MoviesModel> movies;
  const HomePage({
    Key? key,
    required this.categoryModel,
    required this.movies,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: categoryModel
                .map(
                  (categoryModel) => CustomContainerMovieItem(
                    image: "${movies[0].imageUrls[0]}",
                    title: "${movies[0].title}",
                    director: "${movies[0].director}",
                    rating: movies[0].rating,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

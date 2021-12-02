import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../widgets/custom_container_movie_item.dart';

class HomePage extends StatelessWidget {
  final List<CategoryModel> categoryModel;
  final List<MoviesModel> movies;
  final Function changeTab;
  final Function categoryId;
  const HomePage({
    Key? key,
    required this.categoryModel,
    required this.movies,
    required this.changeTab,
    required this.categoryId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Image.network(movies[movies.length - 1].imageUrls[1]),
              Column(
                children: categoryModel.map((categoryModel) {
                  final categoryMovies = movies
                      .where((movies) => movies.categoryId == categoryModel.id)
                      .toList();

                  return CustomContainerMovieItem(
                    categoryTitle: categoryModel.title,
                    movies: categoryMovies,
                    changeTab: changeTab,
                    categoryId: categoryId,
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

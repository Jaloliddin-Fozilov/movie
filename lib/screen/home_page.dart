import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../widgets/custom_container_movie_item.dart';

class HomePage extends StatelessWidget {
  final List<CategoryModel> categoryModel;
  final List<MoviesModel> movies;
  final Function changeTab;
  final Function categoryId;
  final Function detailPage;
  const HomePage({
    Key? key,
    required this.categoryModel,
    required this.movies,
    required this.changeTab,
    required this.categoryId,
    required this.detailPage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 24,
                    ),
                    height: 180,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movies[movies.length - 1].imageUrls[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.blue,
                        child: IconButton(
                          iconSize: 36,
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    detailPage: detailPage,
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

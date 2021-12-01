import 'package:flutter/material.dart';

import 'package:movie/models/movies_model.dart';
import 'package:movie/widgets/home_movie_items.dart';

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
    var index = 0;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${categoryTitle}"),
              TextButton(
                onPressed: () => changeTab(3),
                child: Text("See all"),
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
                      .where((movies) => movie.categoryId == movies.categoryId)
                      .toList();

                  return HomeMovieItems(
                    image: moviesItem[index].imageUrls[0],
                    title: moviesItem[index].title,
                    director: moviesItem[index].director,
                    rating: moviesItem[index].rating,
                  );
                }).toList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie/models/movies_model.dart';

class FavoritesScreen extends StatefulWidget {
  final List<MoviesModel> movies;
  const FavoritesScreen({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.movies.length > 0
        ? ListView(
            children: [
              ListTile(
                leading: Text(widget.movies[0].title),
              ),
            ],
          )
        : Center(
            child: const Text("Hali sevimliga hech nima qo'shilmagan)"),
          );
  }
}

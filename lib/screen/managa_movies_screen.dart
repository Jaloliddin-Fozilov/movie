import 'package:flutter/material.dart';
import 'package:movie/models/categories_model.dart';

import '../models/movies_model.dart';
import './add_movie.dart';

class ManageMoviesScreen extends StatefulWidget {
  final Function deleteMovie;
  final List<MoviesModel> movies;
  final List<CategoryModel> categories;
  final Function addNewMovie;
  ManageMoviesScreen({
    Key? key,
    required this.deleteMovie,
    required this.movies,
    required this.categories,
    required this.addNewMovie,
  }) : super(key: key);

  @override
  State<ManageMoviesScreen> createState() => _ManageMoviesScreenState();
}

class _ManageMoviesScreenState extends State<ManageMoviesScreen> {
  void _goToAddMovie(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddMovie(
          categories: widget.categories,
          addNewMovie: widget.addNewMovie,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text("Manage Movies"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _goToAddMovie(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: widget.movies.length,
          itemBuilder: (ctx, index) => Card(
            color: Colors.grey[850],
            child: Dismissible(
              onDismissed: (direction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.movies[index].title} o'chirildi"),
                  ),
                );
                widget.deleteMovie(widget.movies[index].id);
              },
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              key: UniqueKey(),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.movies[index].imageUrls[0],
                  ),
                ),
                title: Text(
                  "${widget.movies[index].title}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  widget.movies[index].director,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                trailing: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

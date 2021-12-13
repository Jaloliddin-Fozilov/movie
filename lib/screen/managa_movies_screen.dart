import 'package:flutter/material.dart';

import '../models/movies_model.dart';

class ManageMoviesScreen extends StatefulWidget {
  final Function deleteMovie;
  final List<MoviesModel> movies;
  ManageMoviesScreen({
    Key? key,
    required this.deleteMovie,
    required this.movies,
  }) : super(key: key);

  @override
  State<ManageMoviesScreen> createState() => _ManageMoviesScreenState();
}

class _ManageMoviesScreenState extends State<ManageMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text("Manage Movies"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: widget.movies.length,
          itemBuilder: (ctx, index) => Card(
            color: Colors.grey[850],
            child: Dismissible(
              onDismissed: (direction) {
                widget.deleteMovie(widget.movies[index].id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.movies[index].title} o'chirildi"),
                  ),
                );
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
                trailing: Column(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}

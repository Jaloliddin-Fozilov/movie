import 'package:flutter/material.dart';

import '../models/movies_model.dart';

class ManageMoviesScreen extends StatelessWidget {
  final Function deleteMovie;
  ManageMoviesScreen({
    Key? key,
    required this.deleteMovie,
  }) : super(key: key);

  final movies = Movies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text("Manage Movies"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: movies.list.length,
          itemBuilder: (ctx, index) => Card(
            color: Colors.grey[850],
            child: Dismissible(
              onDismissed: (direction) {
                deleteMovie(movies.list[index].id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${movies.list[index].title} o'chirildi")));
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
                    movies.list[index].imageUrls[0],
                  ),
                ),
                title: Text(
                  "${movies.list[index].title}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  movies.list[index].director,
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

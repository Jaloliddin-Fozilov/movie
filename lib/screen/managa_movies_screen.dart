import 'package:flutter/material.dart';

import '../models/movies_model.dart';

class ManageMoviesScreen extends StatelessWidget {
  ManageMoviesScreen({Key? key}) : super(key: key);

  var movies = Movies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text("Manage Movies"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: movies.list.length,
          itemBuilder: (ctx, index) => Card(
            color: Colors.grey[850],
            child: Dismissible(
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
              key: ValueKey(key),
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

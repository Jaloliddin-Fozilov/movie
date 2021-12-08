import 'package:flutter/material.dart';
import 'package:movie/models/movies_model.dart';

class FavoritesScreen extends StatefulWidget {
  final List<MoviesModel> movies;
  final Function toggleLike;
  const FavoritesScreen({
    Key? key,
    required this.movies,
    required this.toggleLike,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleLike(String movieId) {
    setState(() {
      widget.toggleLike(movieId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Sevimlidagi film o'chirildi!"),
        action: SnackBarAction(
            label: 'BEKOR QILISH',
            onPressed: () {
              setState(() {
                widget.toggleLike(movieId);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.movies.length > 0
        ? Expanded(
            child: ListView.builder(
              itemCount: widget.movies.length,
              itemBuilder: (ctx, index) => Card(
                color: Colors.grey[850],
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
                  trailing: IconButton(
                    onPressed: () => _toggleLike(widget.movies[index].id),
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/sad.png",
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Hali sevimliga hech qanday film qo'shilmagan)"),
              ],
            ),
          );
  }
}

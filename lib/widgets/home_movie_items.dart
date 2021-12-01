import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screen/category_movies_screen.dart';

class HomeMovieItems extends StatelessWidget {
  final String image;
  final String title;
  final String director;
  final double rating;
  const HomeMovieItems({
    Key? key,
    required this.image,
    required this.title,
    required this.director,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 205,
      padding: EdgeInsets.only(right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              "$image",
              height: 110,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$title",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$director",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.lightBlue,
            ),
            itemPadding: EdgeInsets.only(right: 4, top: 5),
            itemCount: 5,
            itemSize: 15.0,
          ),
        ],
      ),
    );
  }
}

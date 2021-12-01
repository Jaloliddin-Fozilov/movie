import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../screen/home_page.dart';

class CustomContainerMovieItem extends StatelessWidget {
  final String image;
  final String title;
  final String director;
  final double rating;
  const CustomContainerMovieItem({
    Key? key,
    required this.image,
    required this.title,
    required this.director,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$title"),
            TextButton(
              onPressed: () {},
              child: Text("See all"),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
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
              )
            ],
          ),
        )
      ],
    );
  }
}

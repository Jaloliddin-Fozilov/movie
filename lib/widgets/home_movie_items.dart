import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:movie/models/movies_model.dart';

class HomeMovieItems extends StatelessWidget {
  final MoviesModel moviesItem;
  final Function? changeTab;
  final Function detailPage;

  const HomeMovieItems({
    Key? key,
    required this.moviesItem,
    this.changeTab,
    required this.detailPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToDetailPage() {
      detailPage(
        moviesItem.id,
        moviesItem.title,
        moviesItem.imageUrls,
        moviesItem.description,
        moviesItem.director,
        moviesItem.actors,
      );

      changeTab!(4);
    }

    return Container(
      width: 120,
      height: 205,
      padding: EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () => goToDetailPage(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "${moviesItem.imageUrls[0]}",
                height: 110,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${moviesItem.title}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${moviesItem.director}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                RatingBarIndicator(
                  rating: moviesItem.rating,
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
          ],
        ),
      ),
    );
  }
}

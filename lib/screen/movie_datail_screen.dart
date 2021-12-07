import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import '../models/actors_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final List imageUrls;
  final String description;
  final String director;
  final List actors;
  final Function toggleLike;
  final Function isFavorite;

  const MovieDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.director,
    required this.actors,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  List<ActorsModel> actorsList = Actors().list;
  int activeImageIndex = 0;
  late String firstText;
  late String secondText;
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.description.length > 150) {
      firstText = widget.description.substring(0, 150);
      secondText = widget.description.substring(150, widget.description.length);
    } else {
      firstText = widget.description;
      secondText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 350.0,
                      viewportFraction: 1,
                      initialPage: activeImageIndex,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeImageIndex = index;
                        });
                      }),
                  items: widget.imageUrls.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Watch ${widget.title}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.imageUrls.map((image) {
                          final imageIndex = widget.imageUrls.indexOf(image);
                          return Container(
                            margin: EdgeInsets.only(
                              right: 5,
                              top: 15,
                              bottom: 10,
                              left: 5,
                            ),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: activeImageIndex == imageIndex
                                  ? Colors.black
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 250,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.blue,
                      child: IconButton(
                        iconSize: 24,
                        onPressed: () => widget.toggleLike(widget.id),
                        icon: Icon(
                          widget.isFavorite(widget.id)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  secondText.isEmpty
                      ? Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              flag
                                  ? (firstText + "...")
                                  : (firstText + secondText),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    flag ? "See more" : "See less",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                            ),
                          ],
                        ),
                  Row(
                    children: [
                      Text(
                        "Director: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        widget.director,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "The Cost",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.actors.map((actorsId) {
                            final actorsItem = actorsList
                                .where((actorsListId) =>
                                    actorsListId.id == actorsId)
                                .toList();
                            return Container(
                              height: 110,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      width: 80,
                                      height: 80,
                                      child: Image.network(
                                        actorsItem[0].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: Text(
                                      actorsItem[0].name,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

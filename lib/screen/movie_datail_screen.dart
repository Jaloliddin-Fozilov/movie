import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class MovieDetailScreen extends StatefulWidget {
  final String title;
  final List imageUrls;
  final String description;
  final String director;
  final List actors;

  const MovieDetailScreen({
    Key? key,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.director,
    required this.actors,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
                        iconSize: 36,
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:movie/models/actors_model.dart';
import 'package:movie/models/categories_model.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/widgets/custom_image_input.dart';

class AddMovie extends StatefulWidget {
  final List<CategoryModel> categories;
  final Function addNewMovie;
  const AddMovie({
    Key? key,
    required this.categories,
    required this.addNewMovie,
  }) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _actorsModel = Actors();

  late String categoryId;
  double movieRating = 3.0;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _directorController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    categoryId = widget.categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final director = _directorController.text;
    final mainImage = _mainImageController.text;
    final firstImage = _firstImageController.text;
    final secondImage = _secondImageController.text;
    final thirdImage = _thirdImageController.text;

    if (title.isEmpty ||
        description.isEmpty ||
        director.isEmpty ||
        mainImage.isEmpty ||
        firstImage.isEmpty ||
        secondImage.isEmpty ||
        thirdImage.isEmpty) {
      return;
    }
    final List<String> imageUrls = [
      mainImage,
      firstImage,
      secondImage,
      thirdImage
    ];

    widget.addNewMovie(
      MoviesModel(
        id: UniqueKey().toString(),
        categoryId: categoryId,
        title: title,
        imageUrls: imageUrls,
        actors: selectedActors,
        director: director,
        description: description,
        rating: movieRating,
      ),
    );

    Navigator.of(context).pop(true);
  }

  List<String> selectedActors = [];
  @override
  Widget build(BuildContext context) {
    void addList(String actorId) {
      final actorIndex = selectedActors.indexWhere((actor) => actor == actorId);
      if (actorIndex < 0) {
        selectedActors.add(actorId);
      } else {
        selectedActors.removeWhere((actors) => actors == actorId);
      }
      print(selectedActors);
    }

    bool checkActor(String actorId) {
      final check = selectedActors.indexWhere((actor) => actor == actorId);
      return check > -1 ? true : false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text("Add movie"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _save(),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                dropdownColor: Colors.grey[800],
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        child: Text(
                          category.title,
                        ),
                        value: category.id,
                      ),
                    )
                    .toList(),
                onChanged: (id) {
                  setState(
                    () {
                      categoryId = id as String;
                    },
                  );
                },
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: "Movie name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    ))),
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    ))),
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: _descriptionController,
                maxLines: 5,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: "Director",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    ))),
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: _directorController,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Actors"),
              ),
              Container(
                height: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: _actorsModel.list
                        .map(
                          (actors) => Card(
                            color: Colors.grey[800],
                            child: CheckboxListTile(
                              title: Text(
                                actors.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              activeColor: Colors.white,
                              checkColor: Colors.grey[800],
                              value: checkActor(actors.id),
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    addList(actors.id);
                                  },
                                );
                              },
                              secondary: CircleAvatar(
                                backgroundImage: NetworkImage(actors.image),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              CustomImageInput(
                imageController: _mainImageController,
                label: 'Asosiy rasm linkini kiriting!',
              ),
              CustomImageInput(
                imageController: _firstImageController,
                label: 'Rasm 1 linkini kiriting!',
              ),
              CustomImageInput(
                imageController: _secondImageController,
                label: 'Rasm 2 linkini kiriting!',
              ),
              CustomImageInput(
                imageController: _thirdImageController,
                label: 'Rasm 3 linkini kiriting!',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  movieRating = rating;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

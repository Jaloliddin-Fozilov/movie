import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:movie/models/actors_model.dart';
import 'package:movie/models/categories_model.dart';

class AddMovie extends StatefulWidget {
  final List<CategoryModel> categories;
  const AddMovie({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _actorsModel = Actors();

  late String categoryId;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _directorController = TextEditingController();
  final _actorsController = TextEditingController();
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
    final actors = _actorsController.text;
    final mainImage = _mainImageController.text;
    final firstImage = _firstImageController.text;
    final secondImage = _secondImageController.text;
    final thirdImage = _thirdImageController.text;
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
            onPressed: _save,
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie/models/categories_model.dart';
import 'package:movie/models/movies_model.dart';
import 'package:movie/screen/managa_movies_screen.dart';

class ProfileScreen extends StatefulWidget {
  final Function deleteMovie;
  final List<MoviesModel> movies;
  final List<CategoryModel> categories;
  final Function addNewMovie;
  const ProfileScreen({
    Key? key,
    required this.deleteMovie,
    required this.movies,
    required this.categories,
    required this.addNewMovie,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

bool adminCheck(String name, String surname) {
  return name == "admin" && surname == "root";
}

String name = "Demo name";
String surname = "Demo surname";
String avatar =
    "https://media.istockphoto.com/vectors/avatar-person-user-icon-blue-version-vector-id1216255414?k=20&m=1216255414&s=170667a&w=0&h=I2yRx9b3GZl57PqZb0OumlZOVqMbyRNxmPEZ0NwxksM=";

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _avatarController = TextEditingController();
  void _save() {
    setState(() {
      if (name.isEmpty || surname.isEmpty || avatar.isEmpty) {
        return;
      }
      name = _nameController.text;
      surname = _surnameController.text;
      avatar = _avatarController.text;
    });
  }

  void _goToManageMoviesScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ManageMoviesScreen(
          deleteMovie: widget.deleteMovie,
          movies: widget.movies,
          categories: widget.categories,
          addNewMovie: widget.addNewMovie,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    avatar,
                  ),
                  radius: 60,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(name),
                const SizedBox(
                  height: 10,
                ),
                Text(surname),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: name,
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
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: surname,
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
                  controller: _surnameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      labelText: "Profile image",
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
                  controller: _avatarController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => _save(),
                  child: Text("Save"),
                ),
                adminCheck(name, surname)
                    ? ElevatedButton(
                        onPressed: () => _goToManageMoviesScreen(context),
                        child: Text("Manage movies"),
                      )
                    : Text(
                        "Manage moviesga kirish uchun ma'lumotlaringizni kiriting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

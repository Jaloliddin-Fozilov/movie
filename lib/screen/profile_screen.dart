import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
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
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: name,
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  controller: _nameController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: surname,
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  controller: _surnameController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Profile image",
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  controller: _avatarController,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => _save(),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

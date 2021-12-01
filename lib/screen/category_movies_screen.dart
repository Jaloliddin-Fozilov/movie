import 'package:flutter/material.dart';

import './top_menu_navigator.dart';
import '../models/movies_model.dart';

class CategoryMoviesScreen extends StatelessWidget {
  const CategoryMoviesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("movies"),
    );
  }
}

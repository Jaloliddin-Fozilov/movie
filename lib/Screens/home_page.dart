import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/categories_model.dart';

class HomePage extends StatelessWidget {
  final List<CategoryModel> categoryModel;
  const HomePage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${categoryModel[0].title}"),
              TextButton(
                onPressed: () {},
                child: Text("See all"),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

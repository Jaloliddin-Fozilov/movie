import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String id;
  final String title;

  CategoryModel({
    required this.id,
    required this.title,
  });
}

class Categories {
  List<CategoryModel> _list = [
    CategoryModel(id: "c1", title: "Bollywood"),
    CategoryModel(id: "c2", title: "Hollywood"),
    CategoryModel(id: "c3", title: "Uzbekwood"),
  ];

  List<CategoryModel> get list {
    return _list;
  }
}

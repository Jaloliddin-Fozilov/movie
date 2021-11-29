import 'package:flutter/material.dart';

class CustomItemForTopMenu extends StatelessWidget {
  final String title;
  final int index;
  final Function changeTab;
  final int tabIndex;
  const CustomItemForTopMenu({
    Key? key,
    required this.title,
    required this.index,
    required this.changeTab,
    required this.tabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => changeTab(index),
      child: Text(
        title,
        style: TextStyle(
          color: tabIndex == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

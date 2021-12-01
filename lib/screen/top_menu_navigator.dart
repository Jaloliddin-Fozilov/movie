import 'package:flutter/material.dart';

import '../widgets/custom_item_for_top_menu.dart';

class TopMenuNavigator extends StatefulWidget {
  final int tabIndex;
  final Function changeTab;
  const TopMenuNavigator({
    Key? key,
    required this.tabIndex,
    required this.changeTab,
  }) : super(key: key);

  @override
  _TopMenuState createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenuNavigator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => widget.changeTab(0),
          icon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 32,
          ),
        ),
        CustomItemForTopMenu(
            title: "Home",
            index: 0,
            changeTab: widget.changeTab,
            tabIndex: widget.tabIndex),
        CustomItemForTopMenu(
            title: "Favorites",
            index: 1,
            changeTab: widget.changeTab,
            tabIndex: widget.tabIndex),
        CustomItemForTopMenu(
            title: "Profile",
            index: 2,
            changeTab: widget.changeTab,
            tabIndex: widget.tabIndex),
      ],
    );
  }
}

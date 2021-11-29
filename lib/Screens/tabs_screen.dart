import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './home_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.all(0),
            labelStyle: TextStyle(fontSize: 12),
            tabs: [
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                text: "My List",
              ),
              Tab(
                text: "TV Shows",
              ),
              Tab(
                text: "Movies",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}

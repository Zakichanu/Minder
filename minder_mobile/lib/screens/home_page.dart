import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(144, 150, 251, 1),
        items: const <Widget>[
          Icon(Icons.event, size: 30),
          Icon(Icons.sports, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.business_outlined, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Container(color: const Color.fromRGBO(144, 150, 251, 1)),
    );
  }
}

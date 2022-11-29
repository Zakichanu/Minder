import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class RoutesNavBarComponent extends StatefulWidget {
  const RoutesNavBarComponent(
      {Key? key, required this.title, required this.indexPage})
      : super(key: key);
  final String title;
  final int indexPage;

  @override
  State<RoutesNavBarComponent> createState() => _RoutesNavbarState();
}

class _RoutesNavbarState extends State<RoutesNavBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(144, 150, 251, 1),
        index: 2,
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

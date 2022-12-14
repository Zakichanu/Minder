import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:minder_mobile/screens/home_page.dart';
import 'package:minder_mobile/screens/sport_center.dart';

class RoutesNavBarComponent extends StatefulWidget {
  const RoutesNavBarComponent({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<RoutesNavBarComponent> createState() => _RoutesNavbarState();
}

class _RoutesNavbarState extends State<RoutesNavBarComponent> {
  int indexToBuild = 2;
  Widget _container(int index) {
    switch (index) {
      case 2:
        setState(() {});
        return HomePage();
      default:
        setState(() {});
        return const SportCenter(title: "Minder - SportCenter");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(144, 150, 251, 1),
        index: indexToBuild,
        items: const <Widget>[
          Icon(Icons.event, size: 30),
          Icon(Icons.sports, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.business_outlined, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          if (index != indexToBuild) {
            _container(index);
            indexToBuild = index;
          }
        },
      ),
      body: _container(indexToBuild),
    );
  }
}

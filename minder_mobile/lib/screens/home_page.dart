import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('lib/assets/img/Logo_complet.png'),
                  height: 150,
                  width: 150,
                ),
                if (isLargeScreen) Expanded(child: _navBarItems())
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: _ProfileIcon()),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Hero(
                      tag: "welcomMessage",
                      child: Material(
                        color: Colors.transparent,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Bienvenue,",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.03)),
                          TextSpan(
                              text: " Zakaria!",
                              style: TextStyle(
                                  color: const Color.fromRGBO(144, 150, 251, 1),
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Code à exécuter lorsque le bouton est appuyé
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(190, 193, 229, 1)),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.black),
                              Text('Like',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Code à exécuter lorsque le bouton est appuyé
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(190, 193, 229, 1)),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.black),
                              Text('Like',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Code à exécuter lorsque le bouton est appuyé
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(190, 193, 229, 1)),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.black),
                              Text('Like',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Code à exécuter lorsque le bouton est appuyé
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(190, 193, 229, 1)),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.black),
                              Text('Like',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Icons.person),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Account'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: Text('Settings'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: Text('Sign Out'),
              ),
            ]);
  }
}

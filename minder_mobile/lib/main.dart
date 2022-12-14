import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor swatchify(MaterialColor color, int value) {
  return MaterialColor(color[value].hashCode, <int, Color>{
    50: color[value]!,
    100: color[value]!,
    200: color[value]!,
    300: color[value]!,
    400: color[value]!,
    500: color[value]!,
    600: color[value]!,
    700: color[value]!,
    800: color[value]!,
    900: color[value]!,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Minder',
      theme: ThemeData(
        primarySwatch: swatchify(Colors.deepPurple, 200),
      ),
      home: AnimatedSplashScreen(
        splash: const Image(image: AssetImage('lib/assets/img/LogoPetit.png')),
        duration: 1500,
        nextScreen: const SignInPage(title: "Minder - Connexion"),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: const Color.fromRGBO(130, 135, 219, 1),
        splashIconSize: 500,
      ),
    );
  }
}

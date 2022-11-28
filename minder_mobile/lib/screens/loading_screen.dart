// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'sign_in.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _goToHome();
  }

  _goToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: ((context) =>
                const SignInPage(title: "Minder - Connexion"))));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Loading Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    ));
  }
}

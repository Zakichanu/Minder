import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minder_mobile/screens/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String password = '';

  void _trySubmit() {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 150, 251, 1),
      body: Center(
          child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: const EdgeInsets.all(30),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                            image:
                                AssetImage('lib/assets/img/Logo_complet.png')),
                        TextFormField(
                          validator: (value) {
                            if (value == null || !value.contains('@')) {
                              return 'Entrez une adresse e-mail valide';
                            }
                            return null;
                          },
                          key: const ValueKey('email'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Adresse e-mail',
                          ),
                          onSaved: (value) {
                            userEmail = value as String;
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.length < 7) {
                              return 'Le mot de passe de passe doit avoir une longueur minimale de 8 caractères';
                            }
                            return null;
                          },
                          key: const ValueKey('password'),
                          decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                          ),
                          obscureText: true,
                          onSaved: (value) {
                            password = value as String;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _trySubmit,
                          child: const Text('Connexion'),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Pas de compte? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'Inscription',
                                style: const TextStyle(
                                  color: Color.fromRGBO(144, 150, 251, 1),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const SignUpPage(
                                                    title:
                                                        "Minder - Inscription"))));
                                  }),
                          ]),
                        ),
                      ],
                    ),
                  )))),
    );
  }
}

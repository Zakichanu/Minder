import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:minder_mobile/screens/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String name = '';
  String dateOfBirth = '';
  String userEmail = '';
  String password = '';
  String addressNumber = '';
  String addressStreetName = '';
  String zipCode = '';
  String city = '';
  String confirmPassword = '';

  void _trySubmit() {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 150, 251, 1),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return 'Requis';
                                }
                                return null;
                              },
                              key: const ValueKey('sName'),
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: 'Nom',
                              ),
                              onSaved: (value) {
                                name = value as String;
                              },
                            )),
                            const SizedBox(width: 25),
                            Flexible(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return 'Requis';
                                  }
                                  return null;
                                },
                                key: const ValueKey('fName'),
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  labelText: 'Prénom',
                                ),
                                onSaved: (value) {
                                  firstName = value as String;
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 50,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Requis';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey('addNumber'),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'N°',
                                  ),
                                  onSaved: (value) {
                                    addressNumber = value as String;
                                  },
                                )),
                            const SizedBox(width: 25),
                            Flexible(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return 'Requis';
                                  }
                                  return null;
                                },
                                key: const ValueKey('addStreet'),
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Adresse',
                                ),
                                onSaved: (value) {
                                  addressStreetName = value as String;
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Requis';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey('addZipCode'),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Code Postal',
                                  ),
                                  onSaved: (value) {
                                    zipCode = value as String;
                                  },
                                )),
                            const SizedBox(width: 25),
                            Flexible(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return 'Requis';
                                  }
                                  return null;
                                },
                                key: const ValueKey('addCity'),
                                decoration: const InputDecoration(
                                  labelText: 'Ville',
                                ),
                                onSaved: (value) {
                                  city = value as String;
                                },
                              ),
                            )
                          ],
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'Requis';
                            }
                            if (value!.contains('@')) {
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
                            if (value == '') {
                              return 'Requis';
                            }
                            if (value!.length < 16) {
                              return 'Le mot de passe de passe doit avoir une longueur minimale de 16 caractères';
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
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'Requis';
                            }
                            if (value != password) {
                              return 'Veuillez renseigner le même mot de passe';
                            }
                            return null;
                          },
                          key: const ValueKey('confpassword'),
                          decoration: const InputDecoration(
                            labelText: 'Confirmation mot de passe',
                          ),
                          obscureText: true,
                          onSaved: (value) {
                            confirmPassword = value as String;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: _trySubmit,
                          child: const Text('Connexion'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Déjà inscrit? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'Connexion',
                                style: const TextStyle(
                                  color: Color.fromRGBO(144, 150, 251, 1),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const SignInPage(
                                                    title:
                                                        "Minder - Connexion"))));
                                  }),
                          ]),
                        ),
                      ],
                    ),
                  )))),
    );
  }
}

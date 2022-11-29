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
  String passwordTmp = '';
  String addressNumber = '';
  String addressStreetName = '';
  String zipCode = '';
  String city = '';
  String confirmPassword = '';
  String phone = '';
  String username = '';

  final regexMail = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
  final regexPhoneFR =
      RegExp(r'^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$');
  final regexUsername = RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');
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
            child: SingleChildScrollView(
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
                                  image: AssetImage(
                                      'lib/assets/img/Logo_complet.png')),
                              // Nom Prénom
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              // Numéro + nom d'adresse
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
                              // Code postal + Ville
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
                              // Mail + Téléphone
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: TextFormField(
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Requis';
                                      }
                                      if (!regexMail.hasMatch(value!)) {
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
                                  )),
                                  const SizedBox(width: 25),
                                  Flexible(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          return 'Requis';
                                        }
                                        if (!regexPhoneFR.hasMatch(value!)) {
                                          return 'Entrez un numéro français valide';
                                        }
                                        return null;
                                      },
                                      key: const ValueKey('phoneNumber'),
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                        labelText: 'Numéro de téléphone',
                                      ),
                                      onSaved: (value) {
                                        phone = value as String;
                                      },
                                    ),
                                  )
                                ],
                              ),
                              // Pseudo
                              TextFormField(
                                validator: (value) {
                                  if (value == '') {
                                    return 'Requis';
                                  }
                                  if (!regexUsername.hasMatch(value!)) {
                                    return 'Entrez un pseudo compris entre 8 et 30 caractères, sans espaces';
                                  }
                                  return null;
                                },
                                key: const ValueKey('username'),
                                decoration: const InputDecoration(
                                  labelText: 'Pseudonyme',
                                ),
                                onSaved: (value) {
                                  username = value as String;
                                },
                              ),
                              // Mot de passe + Confirmation
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          return 'Requis';
                                        }
                                        if (value!.length < 16) {
                                          return 'Le mot de passe de passe doit avoir une longueur minimale de 16 caractères';
                                        }
                                        passwordTmp = value;
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
                                    )),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Flexible(
                                        child: TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          return 'Requis';
                                        }
                                        if (value! != passwordTmp) {
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
                                    ))
                                  ]),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: _trySubmit,
                                child: const Text('Inscription'),
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
                        ))))));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gvpneus/homepage/homepage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = TextEditingController();
  final senhaController = TextEditingController();
  String emailValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: Image.asset(
            //     'assets/logo.png',
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/logo2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 5),
              child: Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: const Text(
                'Digite seus dados para entrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: loginController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    emailValue = value;
                  });
                },
                validator: (value) {
                  if (value == null || !value.contains("@")) {
                    return "Gentileza informar um e-mail válido!";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Digite seu login',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: senhaController,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //fetchAlbum(loginController.text, senhaController.text)
                      Navigator.of(context).pushNamed('/homepage');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 234, 255, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

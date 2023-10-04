//import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar(
      {Key? key, required this.exibirSaud, required this.exibirBack})
      : super(key: key);

  final bool exibirSaud;
  final bool exibirBack;

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/perfil.png',
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              )),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Olá Porteiro ! ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          )
        ],
      ),
    );
  }
}

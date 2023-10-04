import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvpneus/homepage/homepage.dart';
import 'package:gvpneus/Confirmacao/Confirmacao.dart';

class Snack2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: FloatingActionButton(
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                backgroundColor: Colors.green, // Altere a cor de fundo aqui
                onPressed: () {
                  Navigator.of(context).pushNamed('/Rel');
                },
              ),
            ),
            Center(
              child: FloatingActionButton(
                heroTag: 'ent',
                child: Icon(
                  Icons.picture_as_pdf,
                  color: Colors.black,
                ),
                backgroundColor: Colors.red, // Altere a cor de fundo aqui
                onPressed: () {
                  Navigator.of(context).pushNamed('/Rel');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

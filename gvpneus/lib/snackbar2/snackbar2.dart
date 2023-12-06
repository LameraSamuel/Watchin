import 'package:flutter/material.dart';

class Snack2 extends StatelessWidget {
  const Snack2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: FloatingActionButton(
                backgroundColor: Colors.green, // Altere a cor de fundo aqui
                onPressed: () {
                  Navigator.of(context).pushNamed('/Rel');
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: FloatingActionButton(
                heroTag: 'ent',
                backgroundColor: Colors.red, // Altere a cor de fundo aqui
                onPressed: () {
                  Navigator.of(context).pushNamed('/Rel');
                },
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

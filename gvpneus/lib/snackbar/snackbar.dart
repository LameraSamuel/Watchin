import 'package:flutter/material.dart';

class SnackIdoso extends StatelessWidget {
  const SnackIdoso({super.key});

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
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Rel');
                  },
                  child: const Icon(
                    Icons.document_scanner_outlined,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

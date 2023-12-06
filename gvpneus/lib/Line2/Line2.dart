import 'package:flutter/material.dart';

class Line2 extends StatelessWidget {
  const Line2({
    Key? key,
    required this.displayText,
    this.width = 400,
    this.height = 50,
  }) : super(key: key);

  final String displayText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: () {}, // Defina a ação do botão conforme necessário
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ), backgroundColor: Colors.white,
            ),
            child: Align(
              alignment: Alignment.centerLeft, // Alinha o texto à esquerda
              child: Text(
                displayText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

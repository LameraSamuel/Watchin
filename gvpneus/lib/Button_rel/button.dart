import 'package:flutter/material.dart';

class But extends StatelessWidget {
  const But({
    Key? key,
    required this.hintText,
    this.width = 350,
    this.height = 50,
  }) : super(key: key);

  final String hintText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/Consulta');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Color.fromARGB(255, 162, 161, 161),
              ),
              child: Center(
                child: Text(
                  hintText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

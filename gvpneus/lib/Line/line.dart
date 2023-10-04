import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.hintText,
    this.width = 400,
    this.height = 80,
  }) : super(key: key);

  final String hintText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

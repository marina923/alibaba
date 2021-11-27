import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  final String imagePath;
  final String number;

  IconWithTextWidget({required this.imagePath, required this.number});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: width * 0.041,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        Image(
          image: AssetImage(imagePath),
          width: width * 0.05,
        ),
      ],
    );
  }
}

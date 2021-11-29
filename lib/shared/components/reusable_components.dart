import 'package:flutter/material.dart';

Widget ImageButton({required String name}) => Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.lightBlueAccent.shade200),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Image(
              colorBlendMode: BlendMode.srcATop,
              width: 25.0,
              height: 25.0,
              image: AssetImage('assets/images/cat_icon.png'),
            ),
            SizedBox(
              width: 7.0,
            ),
            Text(
              '$name',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
            ),
          ],
        ),
      ),
    );
Widget myDivider() => SizedBox(
      width: 5.0,
    );

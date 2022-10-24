import 'package:flutter/material.dart';

class TwoText extends StatelessWidget {
  final String txt1;
  final String? txt2;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Widget? widget;
  const TwoText({
    required this.txt1,
    this.txt2,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 15,
    this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          "$txt1:\t",
          style: TextStyle(
              color: color, fontWeight: fontWeight, fontSize: fontSize),
        ),
        (widget != null)
            ? widget!
            : Text(
                txt2!,
                style: TextStyle(fontSize: fontSize),
              ),
      ],
    );
  }
}
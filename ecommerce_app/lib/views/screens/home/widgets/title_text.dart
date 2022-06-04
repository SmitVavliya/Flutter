import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TitleText({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.color = const Color(0xff1d2635),
    this.fontWeight = FontWeight.w800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Muli",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}

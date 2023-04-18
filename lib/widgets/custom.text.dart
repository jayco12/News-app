import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.colour,
      required this.weight,
      required this.size,
      this.decoration,
      this.style})
      : super(key: key);

  final String text;
  final Color colour;
  final FontWeight weight;
  final double size;
  final TextDecoration? decoration;
  final FontStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 5,
      softWrap: true,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: colour,
        fontWeight: weight,
        fontSize: size,
        decoration: decoration,
        fontStyle: style,
      ),
    );
  }
}

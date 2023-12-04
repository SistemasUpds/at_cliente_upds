import 'package:flutter/material.dart';

class StyleTextot extends StatelessWidget {
  final String text;
  final Color colors;
  final double? size;
  final FontWeight? fontweight;
  const StyleTextot(
      {super.key,
      required this.colors,
      this.size,
      required this.text,
      this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colors,
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}

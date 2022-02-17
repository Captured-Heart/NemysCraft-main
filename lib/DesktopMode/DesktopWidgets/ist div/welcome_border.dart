import 'package:flutter/material.dart';

class WelcomeBorderLine extends StatelessWidget {
  const WelcomeBorderLine({
    Key? key,
    required this.size,
    required this.textStyle,
    required this.text,
    required this.padding,
  }) : super(key: key);

  final Size size;
  final TextStyle? textStyle;
  final String text;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      // EdgeInsets.only(left: 1, right: 70, top: 5),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1), right: BorderSide(width: 2)),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nemy_krafts/responsive.dart';

class SubmitButton extends StatelessWidget {
  final Decoration? decoration;

  const SubmitButton({
    Key? key,
    required this.size,
    this.decoration,
    required this.text,
    this.bGcolor,
    this.textColor,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final MaterialStateProperty<Color>? bGcolor;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isDesktop(context) ? 15 : 5,
      ),
      decoration: decoration,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: bGcolor,
            // MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                letterSpacing: 5),
          )),
    );
  }
}
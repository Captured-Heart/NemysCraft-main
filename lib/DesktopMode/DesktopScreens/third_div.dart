import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/3rd%20div/giving_the_best.dart';
import 'package:nemy_krafts/responsive.dart';

class ThirdDiv extends StatelessWidget {
  const ThirdDiv({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20,
        top: 10,
        bottom: Responsive.isDesktop(context) ? 10 : 4,
      ),
      color: Colors.blueAccent.shade100,
      width: size.width,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? size.width * 0.13
              : size.width * 0.08,
          vertical: Responsive.isDesktop(context)
              ? size.height * 0.07
              : size.height * 0.03,
        ),
        child: GivingTheBestWidget(size: size),
      ),
    );
  }
}
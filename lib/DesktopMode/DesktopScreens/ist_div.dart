// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';
import 'package:nemy_krafts/responsive.dart';

class IstDiv extends StatelessWidget {
  const IstDiv({
    Key? key,
    required this.size,
    this.isResponsive,
  }) : super(key: key);

  final Size size;
  final Responsive? isResponsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
      // color: Colors.amber,
      height: size.height * 0.75,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/decor2.jpg'),
            fit: BoxFit.fill,
            opacity: 0.5),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          // height: size.height * 0.3,
          // color: Colors.green,
          width: Responsive.isDesktop(context)
              ? size.width * 0.35
              : size.width * 0.20,
          child: WelcomeToNemyWidget(size: size),
        ),
        CarouselWidget(
          size: size,
        ),
      ]),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          Responsive.isDesktop(context) ? size.height * 0.6 : size.height * 0.3,
      width:
          Responsive.isDesktop(context) ? size.width * 0.3 : size.width * 0.6,
      color: Colors.amber,

      // child: Carousel,
      child: Text('gvvvgv'),
    );
  }
}

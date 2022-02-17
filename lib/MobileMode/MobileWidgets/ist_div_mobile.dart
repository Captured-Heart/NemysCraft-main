import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/ist_div.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';

class IstDivMobile extends StatelessWidget {
  const IstDivMobile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/decor2.jpg'),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselWidget(
            size: size,
          ),
          WelcomeToNemyWidget(size: size)
        ],
      ),
    );
  }
}


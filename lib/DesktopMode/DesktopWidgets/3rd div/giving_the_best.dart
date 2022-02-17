import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_border.dart';
import 'package:nemy_krafts/responsive.dart';

class GivingTheBestWidget extends StatelessWidget {
  const GivingTheBestWidget({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;

  @override
  Widget build(BuildContext context) {
    TextStyle welcomeToTextStyle() {
      return TextStyle(
        fontSize: Responsive.isDesktop(context)
            ? size.width * 0.017
            : size.width * 0.03,
        letterSpacing: 3,
        wordSpacing: 2,
        fontWeight: FontWeight.bold,
        foreground: Paint()..strokeWidth = 5,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeBorderLine(
                size: size,
                textStyle: welcomeToTextStyle(),
                text: 'GIVING YOU THE BEST.',
                padding: EdgeInsets.only(
                    left: 1,
                    right: Responsive.isDesktop(context) ? 50 : 10,
                    top: 10,
                    bottom: 8),
              ),
              Text(
                '''You can choose the best option for you, and it does not matter whether you are in Prague or San Francisco. We will deliver your purchase anywhere!''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

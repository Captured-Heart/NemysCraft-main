import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_border.dart';
import 'package:nemy_krafts/responsive.dart';

class WelcomeToNemyWidget extends StatelessWidget {
  const WelcomeToNemyWidget({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);
  final Size size;
  final Responsive? responsive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: Responsive.isDesktop(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            WelcomeBorderLine(
              size: size,
              textStyle: Responsive.isDesktop(context)
                  ? welcomeToTextStyle()
                  : welcomeToTextStyleMobile(),
              text: 'WELCOME TO',
              padding: Responsive.isDesktop(context)
                  ? EdgeInsets.only(left: 1, right: 70, top: 5)
                  : EdgeInsets.only(left: 1, right: 20, top: 5),
            ),
            SizedBox(height: 3),
            Text(
              'NEMYSCRAFT',
              style: Responsive.isDesktop(context)
                  ? nemyCraftsTextStyle()
                  : nemyCraftsTextStyleMobile(),
            ),
            SizedBox(height: 3),
            Text(
              'EVENTS',
              style: Responsive.isDesktop(context)
                  ? eventsTextStyle()
                  : eventsTextStyleMobile(),
            ),
            SizedBox(height: 25),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Text(
                'Contact us',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(15),
                  )),
            )
          ],
        ),
      ],
    );
  }

  TextStyle welcomeToTextStyle() {
    return TextStyle(
      fontSize:
          //  40,
          size.width * 0.027,
      letterSpacing: 7,
      wordSpacing: 5,
      foreground: Paint()
        ..strokeWidth = 5.5
        ..style = PaintingStyle.stroke,
    );
  }

  TextStyle welcomeToTextStyleMobile() {
    return TextStyle(
      fontSize:
          //  40,
          size.width * 0.1,
      letterSpacing: 3,
      wordSpacing: 5,
      foreground: Paint()
        ..strokeWidth = 4.5
        ..style = PaintingStyle.stroke,
    );
  }

  TextStyle eventsTextStyle() {
    return TextStyle(
      fontSize:
          // 45,
          size.width * 0.027,
      letterSpacing: 15,
      wordSpacing: 2,
      foreground: Paint()
        ..strokeWidth = 5.3
        ..style = PaintingStyle.stroke,
    );
  }

  TextStyle eventsTextStyleMobile() {
    return TextStyle(
      fontSize:
          // 45,
          size.width * 0.09,
      letterSpacing: 15,
      wordSpacing: 2,
      foreground: Paint()
        ..strokeWidth = 5.3
        ..style = PaintingStyle.stroke,
    );
  }

  TextStyle nemyCraftsTextStyle() {
    return TextStyle(
        fontSize:
            // 65,
            size.width * 0.048,
        letterSpacing: 3,
        // fontWeight: FontWeight.bold,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.black);
  }

  TextStyle nemyCraftsTextStyleMobile() {
    return TextStyle(
        fontSize:
            // 65,
            size.width * 0.09,
        letterSpacing: 3,
        // fontWeight: FontWeight.bold,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..color = Colors.black);
  }
}

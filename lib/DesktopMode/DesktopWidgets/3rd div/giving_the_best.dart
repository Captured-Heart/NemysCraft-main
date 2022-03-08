import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_border.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';

class GivingTheBestWidget extends StatefulWidget {
  const GivingTheBestWidget({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;

  @override
  State<GivingTheBestWidget> createState() => _GivingTheBestWidgetState();
}

class _GivingTheBestWidgetState extends State<GivingTheBestWidget> {
  final FirebaseDb firebaseDb = FirebaseDb();
  @override
  void initState() {
    firebaseDb.getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle welcomeToTextStyle() {
      return TextStyle(
        fontSize: Responsive.isDesktop(context)
            ? widget.size.width * 0.017
            : widget.size.width * 0.03,
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
          width: widget.size.width * 0.6,
          child: FutureBuilder(
              future: firebaseDb.getAds(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeBorderLine(
                      size: widget.size,
                      textStyle: welcomeToTextStyle(),
                      text: 'title',
                      // 'GIVING YOU THE BEST.',
                      padding: EdgeInsets.only(
                          left: 1,
                          right: Responsive.isDesktop(context) ? 50 : 10,
                          top: 10,
                          bottom: 8),
                    ),
                    Text(
                      'subtitle',
                      // '''You can choose the best option for you, and it does not matter whether you are in Prague or San Francisco. We will deliver your purchase anywhere!''',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeBorderLine(
                      size: widget.size,
                      textStyle: welcomeToTextStyle(),
                      text: snapshot.data!.get('title'),
                      // 'GIVING YOU THE BEST.',
                      padding: EdgeInsets.only(
                          left: 1,
                          right: Responsive.isDesktop(context) ? 50 : 10,
                          top: 10,
                          bottom: 8),
                    ),
                    Text(
                      snapshot.data!.get('subtitle'),
                      // '''You can choose the best option for you, and it does not matter whether you are in Prague or San Francisco. We will deliver your purchase anywhere!''',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }
}

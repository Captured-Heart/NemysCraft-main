import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/3rd%20div/giving_the_best.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';

class ThirdDiv extends StatefulWidget {
  const ThirdDiv({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;

  @override
  State<ThirdDiv> createState() => _ThirdDivState();
}

class _ThirdDivState extends State<ThirdDiv> {
  final FirebaseDb firebaseDb = FirebaseDb();
  @override
  void initState() {
    firebaseDb.getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20,
        top: 10,
        bottom: Responsive.isDesktop(context) ? 10 : 4,
      ),
      color: Colors.blueAccent.shade100,
      width: widget.size.width,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? widget.size.width * 0.13
              : widget.size.width * 0.08,
          vertical: Responsive.isDesktop(context)
              ? widget.size.height * 0.07
              : widget.size.height * 0.03,
        ),
        child: GivingTheBestWidget(size: widget.size),
      ),
    );
  }
}

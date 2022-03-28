// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/Contact/left_div_contact.dart';
import 'package:nemy_krafts/Screens/Contact/right_div_contact.dart';
import 'package:nemy_krafts/responsive.dart';
import '../../DesktopMode/DesktopWidgets/footer/footer_widgets/captured_heart.dart';
import '../home_screen.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(size: size, title: NemyLogo(),),
        drawer: Responsive.isDesktop(context) ? null : NemyDrawer(size: size),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Responsive.isDesktop(context)
              ? Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LeftDivContactUs(size: size),
                          RightDivContactUs(size: size),
                        ],
                      ),
                      Spacer(),
                      CapturedHeart(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      RightDivContactUs(size: size),
                      LeftDivContactUs(size: size),
                      CapturedHeart()
                    ],
                  ),
                ),
        ));
  }
}

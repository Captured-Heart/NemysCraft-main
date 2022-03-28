import 'package:flutter/material.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/About/left_about.dart';
import 'package:nemy_krafts/Screens/About/right_about.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:nemy_krafts/responsive.dart';
import '../../DesktopMode/DesktopWidgets/footer/footer_widgets/captured_heart.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  final String placeHolder = lorem(paragraphs: 2, words: 60);
  final String placeHolder2 = lorem(paragraphs: 1, words: 20);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(size: size, title: NemyLogo()),
        drawer: Responsive.isDesktop(context) ? null : NemyDrawer(size: size),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Responsive.isDesktop(context)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              // height: size.height * 0.55,
                              width: size.width * 0.4,
                              // color: Colors.red,
                              // ignore: prefer_const_literals_to_create_immutables
                              child: AboutLeftDiv(
                                  size: size, placeHolder: placeHolder),
                            ),
                            SizedBox(
                              // height: size.height * 0.55,
                              width: size.width * 0.3,
                              // color: Colors.teal,
                              child: AboutRightDiv(
                                  placeHolder2: placeHolder2, size: size),
                            ),
                          ],
                        ),
                        Spacer(),
                        CapturedHeart()
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        AboutLeftDiv(size: size, placeHolder: placeHolder),
                        AboutRightDiv(placeHolder2: placeHolder2, size: size),
                        SizedBox(height: 5),
                        CapturedHeart()
                      ],
                    ),
                  ),
          ),
        ));
  }
}

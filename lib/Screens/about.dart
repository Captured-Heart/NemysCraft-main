import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/footer_mobile.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:nemy_krafts/responsive.dart';
import '../DesktopMode/DesktopWidgets/footer/footer.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  final String placeHolder = lorem(paragraphs: 2, words: 60);
  final String placeHolder2 = lorem(paragraphs: 1, words: 20);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(size: size),
        drawer: Responsive.isDesktop(context) ? null : NemyDrawer(size: size),
        body: SizedBox(
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
                            width: size.width * 0.45,
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
        ));
  }
}

class AboutLeftDiv extends StatelessWidget {
  const AboutLeftDiv({
    Key? key,
    required this.size,
    required this.placeHolder,
  }) : super(key: key);

  final Size size;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  height: Responsive.isDesktop(context)
                      ? size.height * 0.18
                      : size.height * 0.12,
                  child: VerticalDivider(
                    width: 2,
                    color: Color.fromARGB(255, 86, 132, 206),
                    thickness: 5,
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? size.width * 0.2
                      : size.width * 0.8,
                  child: Text(
                    'About NemyCrafts Event Decor',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            placeHolder,
            style: TextStyle(color: Colors.grey, letterSpacing: 1.2),
          ),
          Center(
            child: SizedBox(
              width: Responsive.isDesktop(context)
                  ? size.width * 0.20
                  : size.width * 0.8,
              child: SubmitButton(
                text: 'View Our Catalogue',
                size: size,
                bGcolor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 86, 132, 206),
                ),
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AboutRightDiv extends StatelessWidget {
  const AboutRightDiv({
    Key? key,
    required this.placeHolder2,
    required this.size,
  }) : super(key: key);

  final String placeHolder2;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            child: Responsive.isDesktop(context)
                ? Text(
                    'What We Do',
                    style: TextStyle(
                      color: Responsive.isDesktop(context)
                          ? Colors.blueAccent.shade100
                          : Colors.white,
                      fontSize: Responsive.isDesktop(context) ? 20 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.07,
                          child: VerticalDivider(
                            width: 2,
                            color: Color.fromARGB(255, 86, 132, 206),
                            thickness: 5,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'What We Do',
                          style: TextStyle(
                            color: Responsive.isDesktop(context)
                                ? Colors.blueAccent.shade100
                                : Colors.white,
                            fontSize: Responsive.isDesktop(context) ? 20 : 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Container(
            width: size.width,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            )),
            child: AboutRightDivOptions(
              subtitle: placeHolder2,
              title: 'Building Construction',
              icon: FontAwesomeIcons.airbnb,
              size: size,
            ),
          ),
          Container(
            width: size.width,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            )),
            child: AboutRightDivOptions(
              subtitle: placeHolder2,
              title: 'Building Construction',
              icon: FontAwesomeIcons.airFreshener,
              size: size,
            ),
          ),
          Container(
            width: size.width,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            )),
            child: AboutRightDivOptions(
              subtitle: placeHolder2,
              title: 'Building Construction',
              icon: FontAwesomeIcons.addressCard,
              size: size,
            ),
          ),
          Container(
            width: size.width,
            // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            )),
            child: AboutRightDivOptions(
              subtitle: placeHolder2,
              title: 'Building Construction',
              icon: FontAwesomeIcons.camera,
              size: size,
            ),
          ),
        ]);
  }
}

class AboutRightDivOptions extends StatelessWidget {
  const AboutRightDivOptions({
    Key? key,
    required this.subtitle,
    required this.title,
    required this.icon,
    required this.size,
  }) : super(key: key);

  final String subtitle, title;
  final IconData icon;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minLeadingWidth: 6,
      // contentPadding: EdgeInsets.symmetric(horizontal: 30),
      // isThreeLine: true,
      leading: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(icon, size: size.height * 0.06),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          bottom: 6.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            // fontSize: 20
          ),
        ),
      ),
      subtitle: Text(
        subtitle,
        // maxLines: 2,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          // fontSize: 20
        ),
      ),
      iconColor: Colors.blueAccent.shade100,
    );
  }
}

// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/contact_us_listtiles.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/follow_us_listtiles.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      width: size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: size.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                NemyLogo(),
              ],
            ),
          ),

          //!CONTACT US FOOTER CARD
          Container(
            width: size.width * 0.2,
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 13),
                  child: Text(
                    'CONTACT US',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                ContactUsListTile(
                  title: 'ADDRESS:',
                  subtitle: '123 STREET NAME, CITY, ENGLAND',
                ),
                ContactUsListTile(
                  title: 'PHONE',
                  subtitle: '(123) 456-7890',
                ),
                ContactUsListTile(
                  title: 'E-MAIL:',
                  subtitle: 'MAIL@EXAMPLE.COM',
                ),
                ContactUsListTile(
                  title: 'WORKING DAYS, HOURS:',
                  subtitle: 'MON - SUN / 9:00AM - 8:00PM',
                ),
              ],
            ),
          ),

          Container(
            width: size.width * 0.1,
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'FOLLOW US',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),

                //? RECALL WE WILL ADD THE URL TO THESE TEXT
                FollowUsListTiles(
                  text: 'FACEBOOK',
                  icon: Icons.facebook_sharp,
                ),
                FollowUsListTiles(
                  text: 'TWITTER',
                  icon: Icons.twelve_mp,
                ),
                FollowUsListTiles(
                  text: 'INSTAGRAM',
                  icon: Icons.access_alarm_rounded,
                ),
                FollowUsListTiles(
                  text: 'WHATSAPP',
                  icon: Icons.account_balance,
                ),
              ],
            ),
          ),
          // Container(
          //   width: size.width * 0.15,
          //   color: Colors.green,
          // ),
          JoinUsWidget(size: size),
        ]),
      ),
    );
  }
}

class JoinUsWidget extends StatelessWidget {
  const JoinUsWidget({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context) ? size.width * 0.35 : size.width,
      // color: Colors.green,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.isDesktop(context) ? 20.0 : 8,
              ),
              child: Text(
                'JOIN US',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Subscribe to our newsletters',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            TextFieldForm(
              hintText: 'Email Address',
            ),
            SubmitButton(
              size: size,
              text: 'SUBSCRIBE !',
              bGcolor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 86, 123, 182),
              ),
              textColor: Colors.white70,
            )
          ]),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final Decoration? decoration;

  const SubmitButton({
    Key? key,
    required this.size,
    this.decoration,
    required this.text,
    this.bGcolor,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  final Size size;
  final String text;
  final MaterialStateProperty<Color>? bGcolor;
  final Color? textColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isDesktop(context) ? 15 : 5,
      ),
      decoration: decoration,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: bGcolor,
            // MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                letterSpacing: 5),
          )),
    );
  }
}

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    this.hintText,
    this.maxLines,
    // this.contentPadding,
  }) : super(key: key);
  final String? hintText;
  final int? maxLines;
  // final double? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 16),
      maxLines: maxLines,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
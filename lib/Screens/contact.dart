// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/footer_mobile.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/responsive.dart';
import 'home_screen.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

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

class RightDivContactUs extends StatelessWidget {
  const RightDivContactUs({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Responsive.isDesktop(context) ? size.height * 0.55 : null,
      width:
          Responsive.isDesktop(context) ? size.width * 0.45 : size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 15),
      //!ADD FORM WIDGET TO THIS COLUMN
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ContactTextFormField(
                size: size,
                text: 'First Name:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
              ContactTextFormField(
                size: size,
                text: 'Last Name:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ContactTextFormField(
                size: size,
                text: 'Email:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
              ContactTextFormField(
                size: size,
                text: 'Phone No:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Message:',
                style: TextStyle(color: Colors.blueAccent.shade100),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: size.height * 0.12,
                child: TextFieldForm(
                  hintText: null,
                  maxLines: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SubmitButton(
                  size: size,
                  text: 'Submit',
                  bGcolor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 86, 123, 182),
                  ),
                  textColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(95),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ContactTextFormField extends StatelessWidget {
  const ContactTextFormField({
    Key? key,
    required this.size,
    required this.width,
    required this.text,
    this.maxLines,
  }) : super(key: key);

  final Size size;
  final double width;
  final String text;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.blueAccent.shade100),
        ),
        SizedBox(height: 5),
        SizedBox(
            child: TextFieldForm(
              hintText: null,
              maxLines: maxLines,
            ),
            height: 50,
            width: width),
      ],
    );
  }
}

class LeftDivContactUs extends StatelessWidget {
  const LeftDivContactUs({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      // height: Responsive.isDesktop(context) ? size.height * 0.455 : null,
      width:
          Responsive.isDesktop(context) ? size.width * 0.2 : size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Responsive.isDesktop(context) ? NemyLogo() : Text(''),
          ContactUsLeftOptions(
            text: 'Contact',
            subtitle: 'Looking Forward to hearing from you',
          ),
          ContactUsLeftOptions(
            text: 'Phone',
            subtitle: '+234875909489',
          ),
          ContactUsLeftOptions(
            text: 'Email',
            subtitle: 'Nemy@gmail.com',
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
              Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.blue,
              ),
              Icon(
                FontAwesomeIcons.instagram,
                color: Colors.pink.shade300,
              ),
              Icon(
                FontAwesomeIcons.google,
                color: Color.fromARGB(255, 185, 201, 187),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ContactUsLeftOptions extends StatelessWidget {
  const ContactUsLeftOptions({
    Key? key,
    required this.text,
    required this.subtitle,
  }) : super(key: key);
  final String text, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent.shade100,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      // minVerticalPadding: 1,
      // dense: true,
    );
  }
}

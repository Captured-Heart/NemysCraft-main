import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/Screens/Contact/contact_left_options.dart';
import 'package:nemy_krafts/Screens/Contact/contact.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/responsive.dart';

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

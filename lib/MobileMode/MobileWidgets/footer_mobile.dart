import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/contact_us_listtiles.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/follow_us_listtiles.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FooterMobileOptions(size: size),
      ),
    );
  }
}

class FooterMobileOptions extends StatelessWidget {
  const FooterMobileOptions({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(height: 10),
        Center(child: NemyLogo()),
        ExpansionTile(
          trailing: Icon(
            FontAwesomeIcons.plus,
            color: Colors.grey,
            size: 18,
          ),
          title: Text(
            'CONTACT US',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
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
        ExpansionTile(
          trailing: Icon(
            FontAwesomeIcons.plus,
            color: Colors.grey,
            size: 18,
          ),
          title: Text(
            'FOLLOW US',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            FollowUsListTiles(
              text: 'FACEBOOK',
              icon: FontAwesomeIcons.facebookF,
              iconColor: Colors.blue,
            ),
            FollowUsListTiles(
              text: 'TWITTER',
              icon: FontAwesomeIcons.twitter,
              iconColor: Colors.lightBlue,
            ),
            FollowUsListTiles(
              text: 'INSTAGRAM',
              icon: FontAwesomeIcons.instagram,
              iconColor: Colors.pink.shade300,
            ),
            FollowUsListTiles(
              text: 'WHATSAPP',
              icon: FontAwesomeIcons.whatsapp,
              iconColor: Colors.green,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10,
          ),
          child: JoinUsWidget(size: size),
        ),
        CapturedHeart()
      ],
    );
  }
}

class CapturedHeart extends StatelessWidget {
  const CapturedHeart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'powered by  Captured-Heart💜',
          style: TextStyle(
            color: Colors.green.shade200,
            fontStyle: FontStyle.italic
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

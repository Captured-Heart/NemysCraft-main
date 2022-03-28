import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/contact_us_listtiles.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/follow_us_listtiles.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/captured_heart.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/join_us_widget.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/database.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileFooter extends StatefulWidget {
  const MobileFooter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MobileFooter> createState() => _MobileFooterState();
}

class _MobileFooterState extends State<MobileFooter> {
  final Dialogs dialogs = Dialogs();
  final FirebaseDb firebaseDb = FirebaseDb();
  @override
  void initState() {
    firebaseDb.getSocialUrls();
    firebaseDb.getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FooterMobileOptions(size: widget.size),
      ),
    );
  }
}

class FooterMobileOptions extends StatelessWidget {
  FooterMobileOptions({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final FirebaseDb firebaseDb = FirebaseDb();
  final Dialogs dialogs = Dialogs();
  @override
  Widget build(BuildContext context) {
    Future<void> launchSocialMediaUrls({required String url}) async {
      await canLaunch(url)
          ? launch(url)
          : dialogs.successDialog(
              contentText: "No Social Media Page Yet",
              titleText: 'Error',
              context: context,
            );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(height: 10),
        Center(child: NemyLogo()),
        FutureBuilder(
            future: firebaseDb.getContact(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                //!USING A DUMMY INSTEAD OF CIRCULARPROGRESSINDICATOR
                return ExpansionTile(
                  trailing: Icon(
                    FontAwesomeIcons.angleDown,
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
                      subtitle:
                          // snapshot.data!.get('address').toString(),
                          '123 STREET NAME, CITY, ENGLAND',
                    ),
                    ContactUsListTile(
                      title: 'PHONE',
                      subtitle:
                          // snapshot.data!.get('phone').toString(),
                          '(123) 456-7890',
                    ),
                    ContactUsListTile(
                      title: 'E-MAIL:',
                      subtitle:
                          // snapshot.data!.get('email').toString(),
                          'MAIL@EXAMPLE.COM',
                    ),
                    ContactUsListTile(
                      title: 'WORKING DAYS, HOURS:',
                      subtitle: 'MON - SUN / 9:00AM - 8:00PM',
                    ),
                  ],
                );
              }

              //! CONTACT HAS BEEN CALLED FROM FIREBASE

              return ExpansionTile(
                trailing: Icon(
                  FontAwesomeIcons.angleDown,
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
                    subtitle: snapshot.data!.get('address').toString(),
                    //  '123 STREET NAME, CITY, ENGLAND',
                  ),
                  ContactUsListTile(
                    title: 'PHONE',
                    subtitle: snapshot.data!.get('phone').toString(),
                    // '(123) 456-7890',
                  ),
                  ContactUsListTile(
                    title: 'E-MAIL:',
                    subtitle: snapshot.data!.get('email').toString(),
                    // 'MAIL@EXAMPLE.COM',
                  ),
                  ContactUsListTile(
                    title: 'WORKING DAYS, HOURS:',
                    subtitle: 'MON - SUN / 9:00AM - 8:00PM',
                  ),
                ],
              );
            }),

        //!SOCIAL MEDIA URLS HAVE BEEN CALLED HERE

        FutureBuilder(
            future: firebaseDb.getSocialUrls(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              return ExpansionTile(
                trailing: Icon(
                  FontAwesomeIcons.angleDown,
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
                    onTap: () {
                      launchSocialMediaUrls(
                          url: snapshot.data!.get('facebook').toString());
                    },
                  ),
                  FollowUsListTiles(
                    text: 'TWITTER',
                    icon: FontAwesomeIcons.twitter,
                    iconColor: Colors.lightBlue,
                    onTap: () {
                      launchSocialMediaUrls(
                          url: snapshot.data!.get('twitter').toString());
                    },
                  ),
                  FollowUsListTiles(
                    text: 'INSTAGRAM',
                    icon: FontAwesomeIcons.instagram,
                    iconColor: Colors.pink.shade300,
                    onTap: () {
                      launchSocialMediaUrls(
                          url: snapshot.data!.get('instagram').toString());
                    },
                  ),
                  FollowUsListTiles(
                    text: 'WHATSAPP',
                    icon: FontAwesomeIcons.whatsapp,
                    iconColor: Colors.green,
                    onTap: () {
                      var number = snapshot.data!.get('whatsapp').toString();
                      var message = 'Hello_ Nemy';
                      launchSocialMediaUrls(
                        url:
                            'https://api.whatsapp.com/send?phone=$number&text=$message',
                      );
                    },
                  ),
                ],
              );
            }),
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

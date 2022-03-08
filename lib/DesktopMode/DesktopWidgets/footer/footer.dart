// ignore_for_file: sized_box_for_whitespace, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/contact_us_listtiles.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/follow_us_listtiles.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/captured_heart.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/join_us_widget.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/footer_mobile.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  Footer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
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
    Future<void> launchSocialMediaUrls({required String url}) async {
      await canLaunch(url)
          ? launch(url)
          : dialogs.successDialog(
              contentText: "No Social Media Page Yet",
              titleText: 'Error',
              context: context,
            );
    }

    return Container(
      height: widget.size.height * 0.52,
      width: widget.size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widget.size.width * 0.18,
                height: widget.size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    NemyLogo(),
                  ],
                ),
              ),

              //!CONTACT US FOOTER CARD
              FutureBuilder(
                  future: firebaseDb.getContact(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      //!USING A DUMMY INSTEAD OF CIRCULARPROGRESSINDICATOR
                      return Container(
                        width: widget.size.width * 0.2,
                        height: widget.size.height * 0.45,
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
                        ),
                      );
                    }

                    //! CONTACT HAS BEEN CALLED FROM FIREBASE
                    return Container(
                      width: widget.size.width * 0.2,
                      height: widget.size.height * 0.45,
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
                            subtitle: snapshot.data!.get('address').toString(),
                            // '123 STREET NAME, CITY, ENGLAND',
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
                      ),
                    );
                  }),

              //!SOCIAL MEDIA URLS HAVE BEEN CALLED HERE

              FutureBuilder(
                  future: firebaseDb.getSocialUrls(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    return Container(
                      width: widget.size.width * 0.15,
                      height: widget.size.height * 0.45,
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
                            icon: FontAwesomeIcons.facebookF,
                            iconColor: Colors.blue,
                            onTap: () {
                              print(snapshot.data!.get('facebook').toString());
                              launchSocialMediaUrls(
                                  url: snapshot.data!
                                      .get('facebook')
                                      .toString());
                            },
                          ),
                          FollowUsListTiles(
                            text: 'TWITTER',
                            icon: FontAwesomeIcons.twitter,
                            iconColor: Colors.lightBlue,
                            onTap: () {
                              launchSocialMediaUrls(
                                  url:
                                      snapshot.data!.get('twitter').toString());
                            },
                          ),
                          FollowUsListTiles(
                            text: 'INSTAGRAM',
                            icon: FontAwesomeIcons.instagram,
                            iconColor: Colors.pink.shade300,
                            onTap: () {
                              launchSocialMediaUrls(
                                  url: snapshot.data!
                                      .get('instagram')
                                      .toString());
                            },
                          ),
                          FollowUsListTiles(
                            text: 'WHATSAPP',
                            icon: FontAwesomeIcons.whatsapp,
                            iconColor: Colors.green,
                            onTap: () {
                              var number =
                                  snapshot.data!.get('whatsapp').toString();
                              var message = 'Hello Nemy';
                              launchSocialMediaUrls(
                                  url:
                                      'https://api.whatsapp.com/send?phone=$number&text=$message'
                                  // snapshot.data!.get('whatsapp').toString(),
                                  );
                            },
                          ),
                        ],
                      ),
                    );
                  }),
              // Container(
              //   width: size.width * 0.15,
              //   color: Colors.green,
              // ),
              JoinUsWidget(size: widget.size),
            ],
          ),
          Responsive.isDesktop(context) ? CapturedHeart() : Text(''),
        ],
      ),
    );
  }
}

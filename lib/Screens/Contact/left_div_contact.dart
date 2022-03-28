import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/Screens/Contact/contact_left_options.dart';
import 'package:nemy_krafts/Screens/Contact/contact.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nemy_krafts/responsive.dart';

class LeftDivContactUs extends StatefulWidget {
  const LeftDivContactUs({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<LeftDivContactUs> createState() => _LeftDivContactUsState();
}

class _LeftDivContactUsState extends State<LeftDivContactUs> {
  final FirebaseDb firebaseDb = FirebaseDb();
  final Dialogs dialogs = Dialogs();
  @override
  void initState() {
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
      padding: EdgeInsets.symmetric(vertical: 10),
      // height: Responsive.isDesktop(context) ? size.height * 0.455 : null,
      width: Responsive.isDesktop(context)
          ? widget.size.width * 0.2
          : widget.size.width * 0.8,
      child: FutureBuilder(
          future: firebaseDb.getContact(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            var nothingDae = !snapshot.hasData;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Responsive.isDesktop(context) ? NemyLogo() : Text(''),
                ContactUsLeftOptions(
                  text: 'Contact',
                  subtitle: 'Looking Forward to hearing from you',
                ),
                nothingDae
                    ? ContactUsLeftOptions(
                        text: 'Phone',
                        subtitle: '+234875909489',
                      )
                    : ContactUsLeftOptions(
                        text: 'Phone',
                        subtitle: snapshot.data!.get('phone'),
                        // '+234875909489',
                      ),
                nothingDae
                    ? ContactUsLeftOptions(
                        text: 'Email',
                        subtitle: 'Nemy@gmail.com',
                      )
                    : ContactUsLeftOptions(
                        text: 'Email',
                        subtitle: snapshot.data!.get('email'),
                        // 'Nemy@gmail.com',
                      ),
                SizedBox(height: 10),
                FutureBuilder(
                    future: firebaseDb.getSocialUrls(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          InkWell(
                            onTap: () {
                              launchSocialMediaUrls(
                                  url:
                                      snapshot.data!.get('twitter').toString());
                            },
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.lightBlue,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchSocialMediaUrls(
                                  url: snapshot.data!
                                      .get('facebook')
                                      .toString());
                            },
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchSocialMediaUrls(
                                  url: snapshot.data!
                                      .get('instagram')
                                      .toString());
                            },
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.pink.shade300,
                            ),
                          ),
                          InkWell(
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
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                            ),
                          )
                        ],
                      );
                    })
              ],
            );
          }),
    );
  }
}

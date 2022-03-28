import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/Screens/About/about_options.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';

class AboutRightDiv extends StatefulWidget {
  const AboutRightDiv({
    Key? key,
    required this.placeHolder2,
    required this.size,
  }) : super(key: key);

  final String placeHolder2;
  final Size size;

  @override
  State<AboutRightDiv> createState() => _AboutRightDivState();
}

class _AboutRightDivState extends State<AboutRightDiv> {
  final FirebaseDb firebaseDb = FirebaseDb();
  @override
  void initState() {
    firebaseDb.getRightAbout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseDb.getRightAbout(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var nothingDae = !snapshot.hasData;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  child: Responsive.isDesktop(context)
                      ? Text(
                          'WHAT WE DO',
                          style: TextStyle(
                            color: Responsive.isDesktop(context)
                                ? Colors.blueAccent.shade100
                                : Colors.white,
                            fontSize: Responsive.isDesktop(context) ? 40 : 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: widget.size.height * 0.07,
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
                                  fontSize:
                                      Responsive.isDesktop(context) ? 20 : 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Container(
                  width: widget.size.width,
                  // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  )),
                  child: nothingDae
                      ? AboutRightDivOptions(
                          subtitle: widget.placeHolder2,
                          // snapshot.data!.get('subtitle1'),
                          title:
                              //  snapshot.data!.get('title1'),
                              'Building Construction',
                          icon: FontAwesomeIcons.airbnb,
                          size: widget.size,
                        )
                      : AboutRightDivOptions(
                          subtitle: snapshot.data!.get('subtitle1'),
                          title: snapshot.data!.get('title1'),
                          // 'Building Construction',
                          icon: FontAwesomeIcons.airbnb,
                          size: widget.size,
                        ),
                ),
                Container(
                  width: widget.size.width,
                  // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  )),
                  child: nothingDae
                      ? AboutRightDivOptions(
                          subtitle: widget.placeHolder2,
                          title: 'Building Construction',
                          icon: FontAwesomeIcons.airFreshener,
                          size: widget.size,
                        )
                      : AboutRightDivOptions(
                          subtitle: snapshot.data!.get('subtitle2'),
                          title: snapshot.data!.get('title2'),
                          icon: FontAwesomeIcons.airFreshener,
                          size: widget.size,
                        ),
                ),
                Container(
                  width: widget.size.width,
                  // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  )),
                  child: nothingDae
                      ? AboutRightDivOptions(
                          subtitle: widget.placeHolder2,
                          title: 'Building Construction',
                          icon: FontAwesomeIcons.addressCard,
                          size: widget.size,
                        )
                      : AboutRightDivOptions(
                          subtitle: snapshot.data!.get('subtitle3'),
                          title: snapshot.data!.get('title3'),
                          icon: FontAwesomeIcons.addressCard,
                          size: widget.size,
                        ),
                ),
                Container(
                  width: widget.size.width,
                  // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  )),
                  child: nothingDae
                      ? AboutRightDivOptions(
                          subtitle: widget.placeHolder2,
                          title: 'Building Construction',
                          icon: FontAwesomeIcons.camera,
                          size: widget.size,
                        )
                      : AboutRightDivOptions(
                          subtitle: snapshot.data!.get('subtitle4'),
                          title: snapshot.data!.get('title4'),
                          icon: FontAwesomeIcons.addressCard,
                          size: widget.size,
                        ),
                ),
              ]);
        });
  }
}

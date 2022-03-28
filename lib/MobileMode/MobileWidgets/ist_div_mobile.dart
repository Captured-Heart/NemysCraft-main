import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/ist_div.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';
// import 'package:nemy_krafts/responsive.dart';
// import 'package:nemy_krafts/MobileMode/MobileWidgets/mobile_util.dart';

class IstDivMobile extends StatefulWidget {
  const IstDivMobile({
    Key? key,
    required this.size,
    //  this.mobileUtil,
  }) : super(key: key);

  final Size size;

  @override
  State<IstDivMobile> createState() => _IstDivMobileState();
}

class _IstDivMobileState extends State<IstDivMobile> {
  var db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getSliding() async =>
      await db.collection('Sliding').get();

  @override
  void initState() {
    getSliding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/th.png',
      'assets/images/th.png',
      'assets/images/th.png',
    ];
    // ignore: override_on_non_overriding_member
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.fill,
                      // width: 1000.0,
                      height: widget.size.height,
                    ),
                  ],
                )),
          ),
        )
        .toList();
    return Container(
      // height: widget.size.height * 0.65,
      padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.07),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/decor.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarouselMobile(
              size: widget.size,
              imageSliders: imageSliders,
              future: getSliding(),
              viewport: 0.8,
            ),
            WelcomeToNemyWidget(size: widget.size),
          ],
        ),
      ),
    );
  }
}

class CarouselMobile extends StatelessWidget {
  const CarouselMobile({
    Key? key,
    required this.size,
    required this.imageSliders,
    required this.future,
    required this.viewport,
  }) : super(key: key);

  final Size size;
  final Future<QuerySnapshot> future;
  final List<Widget> imageSliders;
  final double viewport;

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      size: size,
      carouselWidget: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            var nothingDae = !snapshot.hasData;

            return nothingDae
                ? CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: viewport,
                    ),
                    items: imageSliders,
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: viewport,
                    ),
                    items: snapshot.data!.docs.map<Widget>((documents) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  documents['url'],
                                  fit: BoxFit.fill,
                                  // width: 1000.0,
                                  height: size.height,
                                ),
                              ],
                            )),
                      );
                    }).toList(),
                  );
          }),
    );
  }
}

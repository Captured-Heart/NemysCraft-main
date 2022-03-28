// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';
import 'package:nemy_krafts/responsive.dart';

class IstDiv extends StatefulWidget {
  const IstDiv({
    Key? key,
    required this.size,
    this.isResponsive,
  }) : super(key: key);

  final Size size;
  final Responsive? isResponsive;

  @override
  State<IstDiv> createState() => _IstDivState();
}

class _IstDivState extends State<IstDiv> {
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
        .map((item) => Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.fill,
                        height: widget.size.height,
                      ),
                    ],
                  )),
            ))
        .toList();

    return Container(
      height: widget.size.height * 0.75,
      width: widget.size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/decor.jpg'),
          fit: BoxFit.fill,
          // opacity: 0.3,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            // height: size.height * 0.3,
            // color: Colors.green,
            width: Responsive.isDesktop(context)
                ? widget.size.width * 0.38
                : widget.size.width * 0.20,
            child: WelcomeToNemyWidget(size: widget.size),
          ),
          CarouselWidget(
            size: widget.size,
            carouselWidget: FutureBuilder(
                future: getSliding(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  var nothingDae = !snapshot.hasData;

                  return nothingDae
                      ? CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction:
                                Responsive.isTablet(context) ? 0.6 : 0.5,
                            // disableCenter: true
                          ),
                          items: imageSliders,
                        )
                      : CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction:
                                Responsive.isTablet(context) ? 0.6 : 0.5,
                            // disableCenter: true
                          ),
                          items: snapshot.data!.docs.map<Widget>((documents) {
                            return Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        imageUrl: documents['url'],
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        fit: BoxFit.fill,
                                        // width: 1000.0,
                                        height: widget.size.height,
                                      ),
                                    ],
                                  )),
                            );
                          }).toList(),
                        );
                }),
          ),
        ]),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.size,
    this.carouselWidget,
  }) : super(key: key);

  final Size size;
  final Widget? carouselWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          Responsive.isDesktop(context) ? size.height * 0.6 : size.height * 0.3,
      width:
          Responsive.isTablet(context) ? size.width * 0.4 : size.width * 0.55,
      // color: Colors.amber,
      child: carouselWidget!,

      // carouselWidget,
      // child: Text('gvvvgv'),
    );
  }
}

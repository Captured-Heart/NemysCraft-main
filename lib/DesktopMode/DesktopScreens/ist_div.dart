// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';
import 'package:nemy_krafts/responsive.dart';

class IstDiv extends StatelessWidget {
  const IstDiv({
    Key? key,
    required this.size,
    this.isResponsive,
  }) : super(key: key);

  final Size size;
  final Responsive? isResponsive;

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
      'assets/images/decor2.jpg',
      'assets/images/myDp.jpg',
      'assets/images/myDp.jpg',
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
                    // width: 1000.0,
                    height: size.height,
                  ),
                  // Positioned(
                  //   bottom: 0.0,
                  //   left: 0.0,
                  //   right: 0.0,
                  //   child: Container(
                  //     // decoration: BoxDecoration(
                  //     //   gradient: LinearGradient(
                  //     //     colors: [
                  //     //       Color.fromARGB(200, 0, 0, 0),
                  //     //       Color.fromARGB(0, 0, 0, 0)
                  //     //     ],
                  //     //     begin: Alignment.bottomCenter,
                  //     //     end: Alignment.topCenter,
                  //     //   ),
                  //     // ),
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 20.0),
                  //     child: Text(
                  //       'No. ${imgList.indexOf(item)} image',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )),
        ))
        .toList();
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
      // color: Colors.amber,
      height: size.height * 0.75,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/decor2.jpg'),
            fit: BoxFit.fill,
            opacity: 0.5),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          // height: size.height * 0.3,
          // color: Colors.green,
          width: Responsive.isDesktop(context)
              ? size.width * 0.35
              : size.width * 0.20,
          child: WelcomeToNemyWidget(size: size),
        ),
        CarouselWidget(
          size: size,
          carouselWidget: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.5,
            ),
            items: imageSliders,
          ),
        ),
      ]),
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
          Responsive.isDesktop(context) ? size.width * 0.5 : size.width * 0.6,
      // color: Colors.amber,
      child: carouselWidget!,

      // carouselWidget,
      // child: Text('gvvvgv'),
    );
  }
}

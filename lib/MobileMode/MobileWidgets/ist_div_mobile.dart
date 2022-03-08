import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/ist_div.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/ist%20div/welcome_nemy.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/mobile_util.dart';

class IstDivMobile extends StatelessWidget {
  const IstDivMobile({
    Key? key,
    required this.size, this.mobileUtil,
  }) : super(key: key);

  final Size size;
final MobileUtil ? mobileUtil;
  @override
  Widget build(BuildContext context) {
   

    // ignore: override_on_non_overriding_member
    final List<Widget> imageSliders = mobileUtil!.imgList
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
      height: size.height * 0.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/decor2.jpg'),
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            CarouselMobile(size: size, imageSliders: imageSliders),
          WelcomeToNemyWidget(size: size)
        ],
      ),
    );
  }
}

class CarouselMobile extends StatelessWidget {
  const CarouselMobile({
    Key? key,
    required this.size,
    required this.imageSliders,
  }) : super(key: key);

  final Size size;
  final List<Widget> imageSliders;

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
    size: size,
    carouselWidget: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: imageSliders,
    ),
          );
  }
}

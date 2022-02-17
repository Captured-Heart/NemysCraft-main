// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/2nd%20Div/youtube_sample.dart';

class SecondDivMobile extends StatelessWidget {
  const SecondDivMobile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD2D2D2).withOpacity(0.3),
      width: size.width,
      margin: EdgeInsets.only(top: 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Collections',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Center(
              child: Wrap(
                spacing: 25,
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  YoutubeSample(size: size),
                  YoutubeSample(size: size),
                  YoutubeSample(size: size),
                  // YoutubeSample(size: size),
                ],
              ),
            ),
            // YoutubeSample(size: size),
            // YoutubeSample(size: size),
          ]),
    );
  }
}

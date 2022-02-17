// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../DesktopWidgets/2nd Div/youtube_sample.dart';

class SecondDIv extends StatelessWidget {
  const SecondDIv({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      color: Color(0xffD2D2D2).withOpacity(0.3),
      width: size.width,
      //!I WILL CHANGE THIS ROW TO WRAP
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EVENTS GALLERY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 3,
                wordSpacing: 5,
                foreground: Paint()
                  ..strokeWidth = 1.5
                  ..style = PaintingStyle.stroke,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 25,
              runSpacing: 40,
              children: [
                YoutubeSample(size: size),
                YoutubeSample(size: size),
                YoutubeSample(size: size),
                YoutubeSample(size: size),
                YoutubeSample(size: size),
                YoutubeSample(size: size),
                YoutubeSample(size: size),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

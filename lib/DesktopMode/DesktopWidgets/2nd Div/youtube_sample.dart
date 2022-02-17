// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nemy_krafts/responsive.dart';

class YoutubeSample extends StatelessWidget {
  const YoutubeSample({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //?RECALL THAT THIS NAVIGATOR WILL CARRY THE COLLECTION URL FROM FIREBASE
        Navigator.pushNamed(context, '/catalogue');
      },
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? size.width * 0.22
            : size.width * 0.41,
        child: Card(
          // width: size.width * 0.22,
          elevation: 9,
          color: Color(0xffE5E5E5),
          child: Column(
            children: [
              Container(
                height: Responsive.isDesktop(context)
                    ? size.height * 0.22
                    : size.height * 0.17,

                // size.height * 0.22,
                // width: size.width * 0.23,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/myDp.jpg',
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      right: Responsive.isDesktop(context) ? 20 : 1,
                      top: Responsive.isDesktop(context) ? 10 : 1,
                      child: CircleAvatar(
                        maxRadius: Responsive.isDesktop(context) ? 28 : 17,
                        backgroundColor: Color(0xffE5E5E5),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          maxRadius: Responsive.isDesktop(context) ? 25 : 15,
                          child: Text(
                            '55+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.isDesktop(context) ? 25 : 13,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'TWIce Alcohol Free jhvihldvjwbfjweb fhvbeafjvfdhl dslhadbscvhd',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/Screens/catalogue.dart';
import 'package:nemy_krafts/Screens/catalogue_mobile.dart';
import 'package:nemy_krafts/responsive.dart';

class YoutubeSample extends StatelessWidget {
  const YoutubeSample({
    Key? key,
    required this.size,
    this.responsive,
    this.imgUrl,
    this.description,
    this.imgLength,
    this.folderName,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;
  final String? imgUrl, description, imgLength, folderName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //?RECALL THAT THIS NAVIGATOR WILL CARRY THE COLLECTION URL FROM FIREBASE
        Responsive.isMobile(context) || Responsive.isTablet(context)
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => CatalogueMobile(
                        folderName: folderName,
                      )),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => CataloguePage(
                        folderName: folderName,
                      )),
                ),
              );
      },
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? size.width * 0.20
            : size.width * 0.41,
        child: YoutubeCard(
          size: size,
          description: description!,
          imgUrl: imgUrl!,
          imglength: imgLength!,
        ),
      ),
    );
  }
}

class YoutubeCard extends StatelessWidget {
  const YoutubeCard({
    Key? key,
    required this.size,
    required this.imgUrl,
    required this.description,
    required this.imglength,
  }) : super(key: key);

  final Size size;
  final String imgUrl, description, imglength;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: size.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child:  CircularProgressIndicator()),
                ),
                Positioned(
                  right: Responsive.isDesktop(context) ? 10 : 1,
                  top: Responsive.isDesktop(context) ? 5 : 1,
                  child: CircleAvatar(
                    maxRadius: Responsive.isDesktop(context) ? 16 : 17,
                    backgroundColor: Color(0xffE5E5E5),
                    child: CircleAvatar(
                      backgroundColor: Colors.teal[100],
                      maxRadius: Responsive.isDesktop(context) ? 13 : 15,
                      child: Text(
                        '$imglength + ',
                        // '55+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.isDesktop(context) ? 12 : 10,
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
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'Title: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: description.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              // Text(
              //   // description,
              //   ' Alcohol Free jhvihldv fhvbeafjvfdhl dslhadbscvhd',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

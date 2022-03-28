// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:nemy_krafts/responsive.dart';
import '../DesktopWidgets/2nd Div/youtube_sample.dart';

class SecondDIv extends StatefulWidget {
  const SecondDIv({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SecondDIv> createState() => _SecondDIvState();
}

class _SecondDIvState extends State<SecondDIv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      color: Color(0xffD2D2D2).withOpacity(0.3),
      width: widget.size.width,
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
            StreamBuilder(
                stream: getCollection(context),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  var nothingDae = snapshot.hasData;
                  return nothingDae
                      ? Center(
                          child: Wrap(
                              spacing: 25,
                              runSpacing: 25,
                              children: snapshot.data!.docs.map((documents) {
                                // var docLength = documents.id.length;
                                // var docId = documents.id;
                                return YoutubeSample(
                                  size: widget.size,
                                  description: documents['folderName'],
                                  imgLength: documents['imgLength'].toString(),
                                  imgUrl: documents['coverUrl'],
                                  folderName: documents['folderName'],
                                );
                              }).toList()),
                        )
                      : Center(
                          child: Text('There are no Events at the moment'),
                        );
                }),
          ],
        ),
      ),
    );
  }

  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCollection(BuildContext context) async* {
    yield* db.collection('Catalogue').snapshots();
  }
}

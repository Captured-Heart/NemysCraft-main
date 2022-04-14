// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/2nd%20Div/youtube_sample.dart';

class SecondDivMobile extends StatelessWidget {
  SecondDivMobile({
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        StreamBuilder(
            stream: getCollection(context),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var nothingDae = snapshot.hasData;
              return nothingDae
                  ? Center(
                      child: Wrap(
                          spacing: 25,
                          runSpacing: 40,
                          children: snapshot.data!.docs.map((documents) {
                            return YoutubeSample(
                              size: size,
                              description: documents['Description'],
                              imgUrl: documents['coverUrl'],
                              folderName: documents['folderName'],
                              type: documents['type'],
                              dateCreated:
                                  truncateString(documents['dateCreated'], 10),
                            );
                          }).toList()),
                    )
                  : Center(
                      child: Text('There are no Events at the moment'),
                    );
            }),
        // YoutubeSample(size: size),
        // YoutubeSample(size: size),
      ]),
    );
  }

  String truncateString(String data, int length) {
    return (data.length >= length) ? data.substring(0, length) : data;
  }

  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCollection(BuildContext context) async* {
    yield* db.collection('Catalogue').snapshots();
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/Screens/view_full_image.dart';
import 'package:shimmer/shimmer.dart';

class CatalogueMobile extends StatelessWidget {
  CatalogueMobile({Key? key, this.folderName, this.description, this.type, this.dateCreated}) : super(key: key);
  final String? folderName, description, type, dateCreated;

  final db = FirebaseFirestore.instance;
  Future<QuerySnapshot> getCatalogue(BuildContext context) async {
    return await db
        .collection('Catalogue')
        .doc(folderName)
        .collection('Files')
        .get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.square(80),
        child: MobileAppBar(
          size: size,
          title: Text(folderName!),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      // drawer: IconButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   icon: Icon(
      //     Icons.arrow_back,
      //   ),
      // ),
      // NemyDrawer(size: size),
      // CustomAppBar(size: size, title: Text(folderName!)),
      body: FutureBuilder(
          future: getCatalogue(context),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // var docFileDetails = snapshot.data!.docs.first;

            return SizedBox(
              // height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: size.height * 0.2,
                    padding: EdgeInsets.only(bottom: 5, top: 7),
                    width: size.width,
                    margin: EdgeInsets.all(5),

                    // color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.green,
                          width: size.width * 0.3,
                          margin: EdgeInsets.only(left: 1),

                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.solidFolderOpen,
                              size: size.width * 0.2,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        Container(
                            // height: size.height * 0.3,
                            width: size.width * 0.6,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            // color: Colors.green,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 1.2,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Folder Properties',
                                  style: TextStyle(
                                    wordSpacing: 5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(height: 5),

                                // RichText(
                                //   text: TextSpan(
                                //     text: 'Name:  ',
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.w300,
                                //       color: Colors.black,
                                //     ),
                                //     children: [
                                //       TextSpan(
                                //         text: folderName,
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.w500),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(height: 5),
                                RichText(
                                  text: TextSpan(
                                    text: 'Event:  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: type,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 5),

                                RichText(
                                  text: TextSpan(
                                    text: 'Decription:  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: description,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),

                                RichText(
                                  text: TextSpan(
                                    text: 'Date Created:  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: truncateString(
                                            dateCreated!,
                                            10),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //     'Description:  ${docFileDetails.get('Description')}'),
                              ],
                            )
                            // }),
                            ),
                      ],
                    ),
                  ),
                  Center(
                    child: Shimmer.fromColors(
                      highlightColor: Colors.red,
                      baseColor: Colors.green,
                      period: Duration(milliseconds: 1500),
                      child: Text(
                        'Double tap on any image to view full screen',
                        style: TextStyle(
                          // color: Colors.red,
                          fontSize: size.width * 0.045
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Expanded(
                    // height: size.height * 0.8,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      children: snapshot.data!.docs.map((documents) {
                        //TODO: DOUBLE-TAP IMAGE TO VIEW SINGLE IMAGE
                        return InkWell(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewFullImage(
                                          imageUrl: documents['url'],
                                          appBarTitle: '$folderName  ${documents['type']}',
                                        )));
                          },
                          child: CachedNetworkImage(
                            imageUrl: documents['url'],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            // width: size.width * 0.47,
                            // height: size.height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  String truncateString(String data, int length) {
    return (data.length >= length) ? data.substring(0, length) : data;
  }
}

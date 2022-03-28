import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';

class CataloguePage extends StatelessWidget {
  CataloguePage({Key? key, this.folderName}) : super(key: key);
 final String ? folderName;

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
    // final List<String> imgList = [
    //   'assets/images/th.png',
    //   'assets/images/th.png',
    //   'assets/images/th.png',
    //   'assets/images/th.png',
    //   'assets/images/th.png',
    // ];

    // // ignore: override_on_non_overriding_member
    // final List<Widget> imageSliders = imgList
    //     .map(
    //       (item) => Image.asset(
    //         item,
    //         width: size.width * 0.22,
    //         height: size.height * 0.32,
    //         fit: BoxFit.fill,
    //       ),
    //     )
    //     .toList();
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: CustomAppBar(
        size: size,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                // size: size.width * 0.035,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(folderName!)
          ],
        ),
      ),
      body: FutureBuilder(
          future: getCatalogue(context),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var docFileDetails = snapshot.data!.docs.first;

            return SizedBox(
              height: size.height,
              width: size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      width: size.width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:
                            // nothingDae
                            //     ? Wrap(
                            //         runSpacing: 25,
                            //         spacing: size.width * 0.03,
                            //         alignment: WrapAlignment.start,

                            //         // runAlignment: WrapAlignment.spaceAround,
                            //         crossAxisAlignment: WrapCrossAlignment.start,
                            //         children: imageSliders,
                            //       )
                            //     :
                            Wrap(
                                runSpacing: 25,
                                spacing: size.width * 0.03,
                                alignment: WrapAlignment.start,
                                // runAlignment: WrapAlignment.spaceAround,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: snapshot.data!.docs.map((documents) {
                                  return 
                                  Image.network(
                                    documents['url'],
                                    width: size.width * 0.22,
                                    height: size.height * 0.32,
                                    fit: BoxFit.fill,
                                  );
                                }).toList()),
                        // }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.green,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                            width: size.width,
                            height: size.height * 0.3,
                            child: Icon(FontAwesomeIcons.solidFolderOpen,
                                size: size.width * 0.1, color: Colors.grey),
                          ),
                          Container(
                              height: size.height * 0.3,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              // color: Colors.green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'Folder Properties',
                                    style: TextStyle(
                                      wordSpacing: 5,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // nothingDae
                                  //     ? Text('Type: ')
                                  //     :
                                  Text('Type: ${docFileDetails.get('type')}'),
                                  // nothingDae
                                  //     ? Text('Name: ')
                                  //     :
                                  Text(
                                      'Name: ${docFileDetails.get('folderName')}'),
                                  // nothingDae
                                  //     ? Text('Date Created: ')
                                  //     :
                                  Text(
                                      'Date Created:  ${truncateString( docFileDetails.get('dateCreated'), 8)}'),
                                  // nothingDae
                                  //     ? Text('Description: ')
                                  //     :
                                  Text(
                                      'Description:  ${docFileDetails.get('Description')}'),
                                ],
                              )
                              // }),
                              ),
                        ],
                      ),
                      // }),
                    ),
                  )
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

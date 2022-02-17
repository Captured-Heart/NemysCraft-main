import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(
                    runSpacing: 25,
                    spacing: size.width * 0.03,
                    alignment: WrapAlignment.start,
                    // runAlignment: WrapAlignment.spaceAround,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                       Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'assets/images/myDp.jpg',
                        width: size.width * 0.22,
                        height: size.height * 0.32,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
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
                          bottom: BorderSide(width: 1, color: Colors.grey),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Folder Properties',
                            style: TextStyle(
                              wordSpacing: 5,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          Text('Type: '),
                          Text('Name: '),
                          Text('Date Created: '),
                          Text('Description: '),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

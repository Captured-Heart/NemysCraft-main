import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/third_div.dart';

import 'package:nemy_krafts/MobileMode/MobileWidgets/2nd_Div_mobile.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/footer_mobile.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/ist_div_mobile.dart';
// import 'package:nemy_krafts/MobileMode/MobileWidgets/mobile_util.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:nemy_krafts/responsive.dart';

class MobileMode extends StatefulWidget {
  const MobileMode({Key? key}) : super(key: key);

  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(80),
        child: MobileAppBar(size: size),
      ),
      drawer: NemyDrawer(size: size),
      body: SizedBox(
        height: size.height,
        width: size.width,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              IstDivMobile(
                size: size
              ),
              SizedBox(height: 30),
              SecondDivMobile(size: size),
              ThirdDiv(size: size),
              MobileFooter(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      centerTitle: true,
      toolbarHeight: 120,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
          preferredSize: size,
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.blueAccent.shade100,
          )),
      title: NemyLogo(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(''),
          ],
        ),
      ],
      elevation: 3,
    );
  }
}

class NemyDrawer extends StatelessWidget {
  const NemyDrawer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.4,
      margin: EdgeInsets.only(
        bottom: Responsive.isMobile(context)
            ? size.height * 0.4
            : size.height * 0.16,
        top: Responsive.isMobile(context)
            ? size.height * 0.155
            : size.height * 0.15,
        right: size.height * 0.25,
      ),
      child: Drawer(
        backgroundColor: Colors.black45,
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/');
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                )),
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                )),
                child: Text(
                  'About',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                )),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            // TextFieldForm(
            //   hintText: 'Search',
            // )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/third_div.dart';
import 'package:nemy_krafts/responsive.dart';

import '../DesktopMode/DesktopScreens/2nd_div.dart';
import '../DesktopMode/DesktopScreens/ist_div.dart';
import '../DesktopMode/DesktopWidgets/footer/footer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.scaffoldkey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldkey;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      key: widget.scaffoldkey,
      appBar: CustomAppBar(size: size),
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xffE5E5E5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //!THE HOMESCREEN DESIGN WILL BE HERE

              IstDiv(size: size),
              SecondDIv(size: size),
              ThirdDiv(size: size),
              SizedBox(height: 8),
              Footer(size: size)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: !Responsive.isDesktop(context)
          ? Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            })
          : null,
      centerTitle: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? true
          : false,
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
        Responsive.isDesktop(context)
            ? NavBarOptions(size: size)
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(''),
                ],
              ),
      ],
      elevation: 3,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 1.4);
}

class NavBarOptions extends StatefulWidget {
  const NavBarOptions({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<NavBarOptions> createState() => _NavBarOptionsState();
}

class _NavBarOptionsState extends State<NavBarOptions> {
  final List _hover = [
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: widget.size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onHover: ((value) {
                  setState(() {
                    value ? _hover[0] = true : _hover[0] = false;
                  });
                }),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color:
                        !_hover[0] ? Colors.white : Colors.blueAccent.shade100,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
                onHover: ((value) {
                  setState(() {
                    value ? _hover[1] = true : _hover[1] = false;
                  });
                }),
                child: Text(
                  'About',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: !_hover[1]
                          ? Colors.white
                          : Colors.blueAccent.shade100),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
                onHover: ((value) {
                  setState(() {
                    value ? _hover[2] = true : _hover[2] = false;
                  });
                }),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: !_hover[2]
                          ? Colors.white
                          : Colors.blueAccent.shade100),
                ),
              ),
              Row(
                children: [
                  Text(''),
                  SizedBox(width: 3),
                  Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              // Text('data'),
            ],
          ),
        ),
      ],
    );
  }
}

class NemyLogo extends StatelessWidget {
  const NemyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 5,
          top: 4,
          bottom: 4,
          child: Container(
            // width: size.width * 0.1,
            padding: EdgeInsets.all(75),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.white,
              ),
              left: BorderSide(
                width: 2,
                color: Colors.white,
              ),
              top: BorderSide(
                width: 2,
                color: Colors.white,
              ),
            )
                // .all(color: Colors.white, width: 2),
                ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            'NemysCraft',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 3,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

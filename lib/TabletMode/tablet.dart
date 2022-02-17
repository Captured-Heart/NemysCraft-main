import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopScreens/third_div.dart';
import 'package:nemy_krafts/MobileMode/MobileWidgets/footer_mobile.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import '../DesktopMode/DesktopWidgets/ist div/welcome_border.dart';

class TabletMode extends StatefulWidget {
  const TabletMode({Key? key}) : super(key: key);

  @override
  _TabletModeState createState() => _TabletModeState();
}

class _TabletModeState extends State<TabletMode> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(80),
          child: MobileAppBar(
            size: size,
          )
          //  CustomAppBar(size: size),
          ),
      drawer: NemyDrawer(size: size),
      body: SizedBox(
        height: size.height,
        width: size.width,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/decor2.jpg'),
                    fit: BoxFit.fill,
                    opacity: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      // color: Colors.green,
                      child: TabletWelcomeToNemyWidget(size: size),
                    ),
                    Container(
                      width: size.width * 0.4,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffD2D2D2).withOpacity(0.3),
                width: size.width,
                margin: EdgeInsets.only(top: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Center(
                        child: Wrap(
                          spacing: 25,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            YoutubeSampleTablet(size: size),
                            YoutubeSampleTablet(size: size),
                            YoutubeSampleTablet(size: size),

                            // YoutubeSampleTablet(size: size),
                          ],
                        ),
                      ),
                      // YoutubeSampleTablet(size: size),
                      // YoutubeSampleTablet(size: size),
                    ]),
              ),
              ThirdDiv(size: size),
              FooterTablet(size: size),
              // Footer(size: size)
            ],
          ),
        ),
      ),
    );
  }
}

class FooterTablet extends StatelessWidget {
  const FooterTablet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.5,
      width: size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FooterMobileOptions(size: size),
      ),
    );
  }
}

class YoutubeSampleTablet extends StatelessWidget {
  const YoutubeSampleTablet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalogue');
      },
      child: SizedBox(
        width: size.width * 0.29,
        child: Card(
          // width: size.width * 0.22,
          elevation: 9,
          color: Color(0xffE5E5E5),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.34,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/myDp.jpg',
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: CircleAvatar(
                        maxRadius: 17,
                        backgroundColor: Color(0xffE5E5E5),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          maxRadius: 15,
                          child: Text(
                            '55+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
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

class TabletWelcomeToNemyWidget extends StatelessWidget {
  const TabletWelcomeToNemyWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeBorderLine(
            size: size,
            textStyle: TextStyle(
              fontSize: size.width * 0.033,
              letterSpacing: 3,
              wordSpacing: 5,
              foreground: Paint()
                ..strokeWidth = 4.5
                ..style = PaintingStyle.stroke,
            ),
            text: 'WELCOME TO',
            padding: EdgeInsets.only(left: 1, right: 20, top: 5),
          ),
          SizedBox(height: 3),
          Text(
            'NEMYSCRAFT',
            style: TextStyle(
              fontSize:
                  //  40,
                  size.width * 0.048,
              letterSpacing: 3,
              wordSpacing: 5,
              foreground: Paint()
                ..strokeWidth = 2.5
                ..style = PaintingStyle.stroke,
            ),
          ),
          SizedBox(height: 3),
          Text(
            'EVENTS',
            style: TextStyle(
              fontSize:
                  //  40,
                  size.width * 0.038,
              letterSpacing: 3,
              wordSpacing: 5,
              foreground: Paint()
                ..strokeWidth = 4.5
                ..style = PaintingStyle.stroke,
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: size.width * 0.25,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Text(
                'Contact us',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(5),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

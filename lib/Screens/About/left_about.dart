import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/submit_button.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';

class AboutLeftDiv extends StatefulWidget {
  const AboutLeftDiv({
    Key? key,
    required this.size,
    required this.placeHolder,
  }) : super(key: key);

  final Size size;
  final String placeHolder;

  @override
  State<AboutLeftDiv> createState() => _AboutLeftDivState();
}

class _AboutLeftDivState extends State<AboutLeftDiv> {
  final FirebaseDb firebaseDb = FirebaseDb();
  @override
  void initState() {
    firebaseDb.getLeftAbout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
          future: firebaseDb.getLeftAbout(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? widget.size.height * 0.16
                              : widget.size.height * 0.12,
                          child: VerticalDivider(
                            width: 2,
                            color: Color.fromARGB(255, 86, 132, 206),
                            thickness: 5,
                          ),
                        ),
                        SizedBox(width: 15),
                        SizedBox(
                          // color:Colors.red,
                          width: Responsive.isDesktop(context)
                              ? widget.size.width * 0.2
                              : widget.size.width * 0.8,
                          child: Text(
                            // snapshot.data!.get('title'),
                            'About NemyCrafts Event Decor',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      widget.placeHolder,
                      style: TextStyle(color: Colors.grey, letterSpacing: 1.2),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: Responsive.isDesktop(context)
                          ? widget.size.width * 0.30
                          : widget.size.width * 0.8,
                      child: SubmitButton(
                        text: 'View Our Catalogue',
                        size: widget.size,
                        bGcolor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 86, 132, 206),
                        ),
                        textColor: Colors.white,
                      ),
                    ),
                  )
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? widget.size.height * 0.16
                            : widget.size.height * 0.12,
                        child: VerticalDivider(
                          width: 2,
                          color: Color.fromARGB(255, 86, 132, 206),
                          thickness: 5,
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        // color:Colors.red,
                        width: Responsive.isDesktop(context)
                            ? widget.size.width * 0.2
                            : widget.size.width * 0.8,
                        child: Text(
                          snapshot.data!.get('title'),
                          // 'About NemyCrafts Event Decor',
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    snapshot.data!.get('subtitle'),
                    style: TextStyle(color: Colors.grey, letterSpacing: 1.2),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: Responsive.isDesktop(context)
                        ? widget.size.width * 0.30
                        : widget.size.width * 0.8,
                    child: SubmitButton(
                      text: 'View Our Catalogue',
                      size: widget.size,
                      bGcolor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 86, 132, 206),
                      ),
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      onPressed: (){

                        //!TODO: cREATE A CATALOGUE PAGE THAT LINKS ONE TO THIS CATALOGUE PAGE, ALSO ADD THE CATALOGUE TO NAVBAR
                        Navigator.pushNamed(context, '/catalogue');
                      },
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

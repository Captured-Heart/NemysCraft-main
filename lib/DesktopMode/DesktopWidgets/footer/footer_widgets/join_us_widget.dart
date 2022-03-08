import 'package:flutter/material.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/submit_button.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/text_field_widget.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/responsive.dart';
import 'package:shimmer/shimmer.dart';

class JoinUsWidget extends StatefulWidget {
  const JoinUsWidget({
    Key? key,
    required this.size,
    this.responsive,
  }) : super(key: key);

  final Size size;
  final Responsive? responsive;

  @override
  State<JoinUsWidget> createState() => _JoinUsWidgetState();
}

class _JoinUsWidgetState extends State<JoinUsWidget> {
  static final GlobalKey<FormState> _formKeyJoinUs = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = true;
  final FirebaseDb firebaseDb = FirebaseDb();
  final Dialogs dialogs = Dialogs();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? widget.size.width * 0.35
          : widget.size.width,
      height: Responsive.isDesktop(context) ? widget.size.height * 0.45 : null,
      margin: Responsive.isDesktop(context)
          ? EdgeInsets.only(right: 40)
          : EdgeInsets.only(right: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _formKeyJoinUs,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Responsive.isDesktop(context) ? 18.0 : 8,
                  ),
                  child: Text(
                    'JOIN US',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Subscribe to our newsletters',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextFieldForm(
                  hintText: 'Email Address',
                  controller: _emailController,
                ),
                _isLoading
                    ? SubmitButton(
                        size: widget.size,
                        text: 'SUBSCRIBE !',
                        bGcolor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 86, 123, 182),
                        ),
                        textColor: Colors.white70,
                        onPressed: postJoinUs,
                      )
                    : Shimmer.fromColors(
                      baseColor: Colors.green,
                      highlightColor: Colors.blue,
                      enabled: true,
                      child: SubmitButton(
                          size: widget.size,
                          text: 'Loading!!!',
                          bGcolor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 86, 123, 182),
                          ),
                          textColor: Colors.white,
                          onPressed: postJoinUs,
                        ),
                    )
              ],
            ),
          ),
          // Responsive.isDesktop(context) ? CapturedHeart() : Text(''),
        ],
      ),
    );
  }

  Future<void> postJoinUs() async {
    final form = _formKeyJoinUs.currentState;
    try {
      if (form!.validate()) {
        setState(() {
          _isLoading = false;
        });
        Map<String, String> emailMap = {
          'email': _emailController.text,
        };
        await firebaseDb.setEmailList(emailMap);
        _emailController.clear();
        dialogs.successDialog(
          contentText:
              'You have successfully Subscribed to NemyCrafts Newsletter, kindly check your Emails regularly for updates',
          titleText: 'Success',
          context: context,
        );
      }
      setState(() {
        _isLoading = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

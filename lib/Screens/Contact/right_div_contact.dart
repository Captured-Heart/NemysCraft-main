import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/submit_button.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/text_field_widget.dart';
import 'package:nemy_krafts/Screens/Contact/contact_textForm.dart';
import 'package:nemy_krafts/database.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:nemy_krafts/responsive.dart';
import 'package:shimmer/shimmer.dart';

class RightDivContactUs extends StatefulWidget {
  RightDivContactUs({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<RightDivContactUs> createState() => _RightDivContactUsState();
}

class _RightDivContactUsState extends State<RightDivContactUs> {
  static final GlobalKey<FormState> _formKeyContact = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = true;
  final FirebaseDb firebaseDb = FirebaseDb();
  final Dialogs dialogs = Dialogs();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Responsive.isDesktop(context) ? size.height * 0.55 : null,
      width: Responsive.isDesktop(context)
          ? widget.size.width * 0.45
          : widget.size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 15),
      //!ADD FORM WIDGET TO THIS COLUMN
      child: Form(
        key: _formKeyContact,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ContactTextFormField(
                  size: widget.size,
                  text: 'First Name:',
                  controller: _firstNameController,
                  width: Responsive.isDesktop(context)
                      ? widget.size.width * 0.2
                      : widget.size.width * 0.4,
                ),
                ContactTextFormField(
                  size: widget.size,
                  text: 'Last Name:',
                  controller: _lastNameController,
                  width: Responsive.isDesktop(context)
                      ? widget.size.width * 0.2
                      : widget.size.width * 0.4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ContactTextFormField(
                  size: widget.size,
                  text: 'Email:',
                  controller: _emailController,
                  width: Responsive.isDesktop(context)
                      ? widget.size.width * 0.2
                      : widget.size.width * 0.4,
                ),
                ContactTextFormField(
                  size: widget.size,
                  text: 'Phone No:',
                  controller: _phoneController,
                  width: Responsive.isDesktop(context)
                      ? widget.size.width * 0.2
                      : widget.size.width * 0.4,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message:',
                  style: TextStyle(color: Colors.blueAccent.shade100),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: widget.size.height * 0.12,
                  child: TextFieldForm(
                    hintText: null,
                    maxLines: 7,
                    controller: _messageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: _isLoading
                      ? SubmitButton(
                          size: widget.size,
                          text: 'Submit',
                          bGcolor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 86, 123, 182),
                          ),
                          textColor: Colors.white,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(95),
                          ),
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
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postJoinUs() async {
    final form = _formKeyContact.currentState;
    try {
      if (form!.validate()) {
        setState(() {
          _isLoading = false;
        });
        Map<String, String> emailMap = {
          'first Name': _firstNameController.text,
          'last Name': _lastNameController.text,
          'phone': _phoneController.text,
          'email': _emailController.text,
          'message': _messageController.text
        };
        await firebaseDb.setContactList(emailMap);
        _emailController.clear();
        _firstNameController.clear();
        _lastNameController.clear();
        _phoneController.clear();
        _messageController.clear();
        _phoneController.clear();
        dialogs.successDialog(
          contentText:
              'You have successfully contacted NemyCrafts, the team will get back to you',
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

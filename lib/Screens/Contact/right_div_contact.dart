import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/submit_button.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/text_field_widget.dart';
import 'package:nemy_krafts/Screens/Contact/contact_textForm.dart';
import 'package:nemy_krafts/responsive.dart';

class RightDivContactUs extends StatelessWidget {
  const RightDivContactUs({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Responsive.isDesktop(context) ? size.height * 0.55 : null,
      width:
          Responsive.isDesktop(context) ? size.width * 0.45 : size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 15),
      //!ADD FORM WIDGET TO THIS COLUMN
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ContactTextFormField(
                size: size,
                text: 'First Name:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
              ContactTextFormField(
                size: size,
                text: 'Last Name:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ContactTextFormField(
                size: size,
                text: 'Email:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
              ),
              ContactTextFormField(
                size: size,
                text: 'Phone No:',
                width: Responsive.isDesktop(context)
                    ? size.width * 0.2
                    : size.width * 0.4,
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
                height: size.height * 0.12,
                child: TextFieldForm(
                  hintText: null,
                  maxLines: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SubmitButton(
                  size: size,
                  text: 'Submit',
                  bGcolor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 86, 123, 182),
                  ),
                  textColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(95),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

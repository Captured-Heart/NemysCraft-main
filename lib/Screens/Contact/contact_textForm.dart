import 'package:flutter/material.dart';
import 'package:nemy_krafts/DesktopMode/DesktopWidgets/footer/footer_widgets/text_field_widget.dart';

class ContactTextFormField extends StatelessWidget {
  const ContactTextFormField({
    Key? key,
    required this.size,
    required this.width,
    required this.text,
    this.maxLines, this.controller,
  }) : super(key: key);

  final Size size;
  final double width;
  final String text;
  final int? maxLines;
  final TextEditingController ? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.blueAccent.shade100),
        ),
        SizedBox(height: 5),
        SizedBox(
            child: TextFieldForm(
              hintText: null,
              maxLines: maxLines,
              controller: controller,
            ),
            height: 50,
            width: width),
      ],
    );
  }
}


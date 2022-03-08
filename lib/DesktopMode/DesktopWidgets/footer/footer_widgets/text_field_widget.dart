import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    this.hintText,
    this.maxLines,
    this.controller,
    // this.contentPadding,
  }) : super(key: key);
  final String? hintText;
  final int? maxLines;
  // final double? contentPadding;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 16),
      maxLines: maxLines,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactUsLeftOptions extends StatelessWidget {
  const ContactUsLeftOptions({
    Key? key,
    required this.text,
    required this.subtitle,
  }) : super(key: key);
  final String text, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent.shade100,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      // minVerticalPadding: 1,
      // dense: true,
    );
  }
}

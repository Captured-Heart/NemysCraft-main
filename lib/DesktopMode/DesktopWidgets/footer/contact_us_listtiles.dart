import 'package:flutter/material.dart';

class ContactUsListTile extends StatelessWidget {
  const ContactUsListTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minVerticalPadding: 0.1,
      contentPadding: EdgeInsets.symmetric(horizontal: 3),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

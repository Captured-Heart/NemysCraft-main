import 'package:flutter/material.dart';

class FollowUsListTiles extends StatelessWidget {
  const FollowUsListTiles({
    Key? key,
    required this.icon,
    required this.text,
    this.urlString, required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final String? text, urlString;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 2,
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        text!,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

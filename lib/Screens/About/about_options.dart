import 'package:flutter/material.dart';

class AboutRightDivOptions extends StatelessWidget {
  const AboutRightDivOptions({
    Key? key,
    required this.subtitle,
    required this.title,
    required this.icon,
    required this.size,
  }) : super(key: key);

  final String subtitle, title;
  final IconData icon;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minLeadingWidth: 6,
      contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      // isThreeLine: true,
      leading: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(icon, size: size.height * 0.04),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          bottom: 6.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            // fontSize: 20
          ),
        ),
      ),
      subtitle: Text(
        subtitle,
        // maxLines: 2,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          // fontSize: 20
        ),
      ),
      iconColor: Colors.blueAccent.shade100,
    );
  }
}

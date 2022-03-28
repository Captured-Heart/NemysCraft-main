import 'package:flutter/material.dart';
import 'package:nemy_krafts/dialogs.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class CapturedHeart extends StatelessWidget {
  CapturedHeart({
    Key? key,
  }) : super(key: key);
  final Dialogs dialogs = Dialogs();

  @override
  Widget build(BuildContext context) {
    Future<void> launchSocialMediaUrls({required String url}) async {
      await canLaunch(url)
          ? launch(url)
          : dialogs.successDialog(
              contentText: "No Social Media Page Yet",
              titleText: 'Error',
              context: context,
            );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.purple,
          highlightColor: Colors.amber,
          period: Duration(milliseconds: 2000),
          child: InkWell(
            onTap: () {
              launchSocialMediaUrls(
                  url:
                      'https://www.linkedin.com/in/nkpozi-marcel-kelechi-213295172');
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Text(
                'powered by  Captured-Heart💜',
                style: TextStyle(
                    color: Colors.green.shade200, fontStyle: FontStyle.italic),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

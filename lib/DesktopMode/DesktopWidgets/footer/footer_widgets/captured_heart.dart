import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CapturedHeart extends StatelessWidget {
  const CapturedHeart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.amber,
      period: Duration(milliseconds: 2000),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            'powered by  Captured-Heart💜',
            style: TextStyle(
                color: Colors.green.shade200, fontStyle: FontStyle.italic),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}

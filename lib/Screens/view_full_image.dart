import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';

class ViewFullImage extends StatelessWidget {
  const ViewFullImage({Key? key, this.imageUrl, this.appBarTitle})
      : super(key: key);
  final String? imageUrl, appBarTitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.square(80),
        child: MobileAppBar(
          size: size,
          title: Text(appBarTitle!),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ExtendedImage.network(
            imageUrl!,
            fit: BoxFit.cover,
            //enableLoadState: false,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return GestureConfig(
                minScale: 0.9,
                animationMinScale: 0.7,
                maxScale: 3.0,
                animationMaxScale: 3.5,
                speed: 1.0,
                inertialSpeed: 100.0,
                initialScale: 1.0,
                inPageView: false,
                initialAlignment: InitialAlignment.center,
              );
            },
          ),

          //  CachedNetworkImage(
          //   imageUrl: imageUrl!,
          //   placeholder: (context, url) =>
          //       Center(child: CircularProgressIndicator()),
          //   // width: size.width * 0.47,
          //   // height: size.height * 0.3,
          //   fit: BoxFit.fill,
          // ),
        ),
      ),
    );
  }
}

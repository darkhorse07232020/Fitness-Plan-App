import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../helpers/colors.dart';
import '../models/gallery_model.dart';
import '../models/salon_model.dart';
import '../screens/gallery_detail_page.dart';

class GalleryCard extends StatelessWidget {
  final GalleryModel gallery;
  final SalonModel salon;

  const GalleryCard({Key key, this.gallery, this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          GalleryDetailPage(
            controller: VideoPlayerController.asset(gallery.file),
            gallery: gallery,
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                gallery.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: SvgPicture.asset(
                'assets/icons/multiple_image.svg',
                width: 18.0,
                height: 18.0,
                color: kBackgroundLightColor.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}

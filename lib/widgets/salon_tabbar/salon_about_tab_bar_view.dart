import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

import '../../helpers/screens.dart';
import '../../models/gallery_model.dart';
import '../../models/salon_model.dart';
import '../../screens/gallery_detail_page.dart';
import '../../screens/gallery_page.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    Key key,
    @required this.salon,
  }) : super(key: key);

  final SalonModel salon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Text('About', style: theme.textTheme.headline3),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: about(context, title: salon.about),
          ),
          SizedBox(height: 20.0),
          Text('Service on Days', style: theme.textTheme.headline3),
          SizedBox(height: 12.0),
          _serviceOnDays(context,
              day: 'Monday', from: '9:00am', to: '10:00pm', isClose: false),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Tuesday', from: '9:00am', to: '10:00pm', isClose: false),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Wednesday', from: '9:00am', to: '10:00pm', isClose: false),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Thursday', from: '9:00am', to: '10:00pm', isClose: false),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Friday', from: '1:00pm', to: '15:00pm', isClose: false),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Saturday', from: '9:00am', to: '10:00pm', isClose: true),
          SizedBox(height: 5.0),
          _serviceOnDays(context,
              day: 'Sunday', from: '9:00am', to: '10:00pm', isClose: true),
          SizedBox(height: 20.0),
          address(context, address: salon.address),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Photos', style: theme.textTheme.headline3),
                GestureDetector(
                  onTap: () {
                    Get.to(GalleryPage(salon: salon));
                  },
                  child: Text('View all', style: theme.textTheme.subtitle1),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Container(
            width: Screen.width(context),
            height: 72.0,
            child: ListView.builder(
              itemCount: allGalleryList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var gallery = allGalleryList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      GalleryDetailPage(
                        controller: VideoPlayerController.asset(gallery.file),
                        gallery: gallery,
                      ),
                    );
                  },
                  child: Container(
                    width: 72.0,
                    height: 72.0,
                    padding: EdgeInsets.fromLTRB(50.0, 8, 8, 50.0),
                    margin: EdgeInsets.only(right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(gallery.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/multiple_image.svg',
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  _serviceOnDays(BuildContext context,
      {String day, String from, String to, bool isClose}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: theme.textTheme.subtitle2,
          ),
          Text(
            isClose ? 'Close' : '$from to $to',
            style: theme.textTheme.subtitle2.copyWith(),
          ),
        ],
      ),
    );
  }

  Padding address(BuildContext context, {String address}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Container(
        width: Screen.width(context),
        height: 90.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address', style: theme.textTheme.headline3),
                    SizedBox(height: 5.0),
                    Text(
                      address ?? 'No Data',
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/other/map.png',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ReadMoreText about(BuildContext context, {String title}) {
    return ReadMoreText(
      title ?? 'No data',
      style: Theme.of(context).textTheme.subtitle1,
      trimLines: 3,
      trimCollapsedText: ' Read more',
      trimExpandedText: ' Less ',
      colorClickableText: Theme.of(context).primaryColor,
      trimMode: TrimMode.Line,
    );
  }
}

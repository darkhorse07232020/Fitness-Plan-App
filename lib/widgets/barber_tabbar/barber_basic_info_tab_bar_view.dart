import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../helpers/screens.dart';
import '../../models/barber_model.dart';
import '../../models/gallery_model.dart';
import '../../screens/gallery_detail_page.dart';
import '../../screens/gallery_page.dart';

class BarberBasicInfoTabBarView extends StatelessWidget {
  final BarberModel barber;

  const BarberBasicInfoTabBarView({Key key, this.barber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Business name', style: theme.textTheme.bodyText1),
                Text('Start from', style: theme.textTheme.bodyText1),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Redbox Barber', style: theme.textTheme.subtitle2),
                Text('\$98.99', style: theme.textTheme.subtitle2.copyWith()),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text('Opening Hours', style: theme.textTheme.bodyText1),
          ),
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
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              width: Screen.width(context),
              height: 80.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 25.0),
//                                        color: kGoldColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address', style: theme.textTheme.bodyText1),
                          SizedBox(height: 5.0),
                          Text(
                            barber.address,
                            style: theme.textTheme.subtitle2.copyWith(),
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
                        image: AssetImage('assets/images/other/map.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Photos', style: theme.textTheme.bodyText1),
                GestureDetector(
                  onTap: () {
                    Get.to(GalleryPage());
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
              padding: EdgeInsets.only(left: 18.0),
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
}

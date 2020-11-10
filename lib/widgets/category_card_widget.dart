import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../models/service_model.dart';
import '../screens/browse_salon_page.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final EdgeInsetsGeometry margin;

  const ServiceCard({Key key, @required this.service, this.margin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: margin,
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          Get.to(BrowseSalonPage());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 55.0,
                height: 55.0,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.unselectedWidgetColor.withOpacity(.2),
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                        offset: Offset(2, 5),
                      )
                    ]),
                child: Center(
                  child: SvgPicture.asset(
                    service.icon,
                    width: 25.0,
                    height: 25.0,
                    color: theme.accentColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              service.label,
              textAlign: TextAlign.center,
              style: theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}

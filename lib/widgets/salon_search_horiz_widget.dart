import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/screens.dart';
import '../models/salon_model.dart';
import '../screens/salon_page.dart';

class SalonSearchHorizCard extends StatelessWidget {
  final SalonModel salon;
  final EdgeInsetsGeometry margin;

  const SalonSearchHorizCard({Key key, @required this.salon, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: theme.backgroundColor,
      ),
      margin: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Get.to(SalonPage(salon: salon));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                salon.image,
                width: Screen.width(context),
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                salon.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

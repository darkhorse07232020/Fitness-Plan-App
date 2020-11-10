import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/barber_model.dart';
import '../models/salon_model.dart';
import '../screens/barber_page.dart';

class BarberCard extends StatelessWidget {
  const BarberCard({
    Key key,
    @required this.barber,
    this.salon,
    this.margin,
  }) : super(key: key);

  final BarberModel barber;
  final SalonModel salon;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(25.0),
      onTap: () {
        Get.to(
          BarberPage(
            barber: barber,
            salon: salon,
          ),
        );
      },
      child: Container(
        width: 90.0,
        margin: margin,
        child: Column(
          children: [
            Container(
              width: 65.0,
              height: 65.0,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(barber.image),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              barber.name,
              style: theme.textTheme.bodyText2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 2.0),
            Text(
              barber.position,
              style: theme.textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

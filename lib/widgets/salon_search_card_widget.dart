import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../models/salon_model.dart';
import '../screens/book_appointment_services_page.dart';
import '../screens/salon_page.dart';

class SalonSearchCard extends StatelessWidget {
  final SalonModel salon;

  const SalonSearchCard({Key key, @required this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.to(SalonPage(salon: salon));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: [
            Container(
              width: 95.0,
              height: 95.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(salon.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(salon.name,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headline4)),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: theme.unselectedWidgetColor, size: 15.0),
                            Text("12 km", style: theme.textTheme.subtitle2),
                          ],
                        )
                      ],
                    ),
                    Text(salon.address, style: theme.textTheme.subtitle2),
                    Row(
                      children: [
                        Icon(Icons.star, color: kYellowColor, size: 15.0),
                        SizedBox(width: 3.0),
                        Text(salon.rating.toString(),
                            style: theme.textTheme.headline5),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("8:30am - 9:30pm",
                            style: theme.textTheme.subtitle2
                                .copyWith(color: theme.primaryColor)),
                        GestureDetector(
                          onTap: () {
                            Get.to(BookAppointmentServicesPage());
                          },
                          child: Container(
                            width: 75.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: kYellowColor,
                            ),
                            child: Center(
                              child: Text(
                                'Book',
                                style: theme.textTheme.subtitle2
                                    .copyWith(color: theme.backgroundColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

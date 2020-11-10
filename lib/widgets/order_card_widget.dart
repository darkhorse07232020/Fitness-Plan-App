import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/appointment_model.dart';
import '../screens/next_order_detail_page.dart';

class OrderCard extends StatelessWidget {
  final AppointmentModel appointment;

  const OrderCard({Key key, this.appointment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Screen.width(context),
      margin: EdgeInsets.only(bottom: 15.0, left: 18.0, right: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Screen.width(context),
            height: 35.0,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
            ),
            child: Center(
                child: Text(appointment.status,
                    style: theme.textTheme.subtitle1
                        .copyWith(color: kBackgroundLightColor))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(appointment.salon.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(appointment.salon.name,
                          style: theme.textTheme.headline4),
                      SizedBox(height: 8.0),
                      Text(appointment.salon.address,
                          style: theme.textTheme.subtitle2),
                      SizedBox(height: 8.0),
                      Text('${appointment.date} - ${appointment.time}',
                          style: theme.textTheme.subtitle2),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothStarRating(
                            color: kYellowColor,
                            size: 17.0,
                            borderColor: theme.unselectedWidgetColor,
                            allowHalfRating: false,
                            rating: 4,
                            starCount: 5,
                            isReadOnly: true,
                          ),
                          appointment.status == "COMPLETED"
                              ? Container()
                              : appointment.status == "CANCEL"
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Cancel Appointment!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    theme.textTheme.headline4,
                                              ),
                                              content: Text(
                                                'Are you sure you want to cancel your appointment?',
                                                textAlign: TextAlign.center,
                                                style:
                                                    theme.textTheme.subtitle2,
                                              ),
                                              actions: [
                                                FlatButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text('No',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: theme
                                                          .textTheme.subtitle2),
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text('Yes',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: theme
                                                          .textTheme.headline5),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FlutterIcons.trash_fea,
                                            color: theme.errorColor,
                                            size: 17.0,
                                          ),
                                          Text('Cancel Booking',
                                              style: theme.textTheme.subtitle1
                                                  .copyWith(
                                                      color: theme.errorColor)),
                                        ],
                                      ),
                                    )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(color: theme.primaryColor),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${appointment.totalPrice}',
                    style: theme.textTheme.headline4),
                GestureDetector(
                    onTap: () {
                      Get.to(NextOrderDetailPage(appointment: appointment));
                    },
                    child: Text('View',
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.primaryColor))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/barber_model.dart';
import '../models/slot_model.dart';
import '../providers/book_appointment_provider.dart';
import 'booking_detail_page.dart';
import 'booking_failed_page.dart';

class BookAppointmentSchedulePage extends StatefulWidget {
  @override
  _BookAppointmentSchedulePageState createState() =>
      _BookAppointmentSchedulePageState();
}

class _BookAppointmentSchedulePageState
    extends State<BookAppointmentSchedulePage> {
  Widget navigate;

  bool _ready = false;

  @override
  Widget build(BuildContext context) {
    final bookProv = Provider.of<BookAppointmentProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(image: 'assets/images/other/salon2.jpg'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: Screen.width(context),
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.0),
                      Text('Select your date',
                          style: theme.textTheme.headline4),
                      SizedBox(height: 15.0),
                      bookingDate(bookProv, context),
                      SizedBox(height: 25.0),
                      Text('Select specialist',
                          style: theme.textTheme.headline4),
                      SizedBox(height: 15.0),
                      selectBarber(context),
                      SizedBox(height: 15.0),
                      Text('Available slot', style: theme.textTheme.headline4),
                      selectSlot(),
                      SizedBox(height: 30.0),
                      SizedBox(
                        width: Screen.width(context),
                        child: RaisedButton(
                          onPressed: () {
                            if (bookProv.dateOfBooking == null) {
                              return showMyDialog(context);
                            }
                            if (_ready == false) {
                              return showMyDialog(context);
                            }
                            Get.to(navigate);
                          },
                          child: Text(
                            'Continue',
                            style: theme.textTheme.button,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showMyDialog(BuildContext context) {
    final theme = Theme.of(context);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(
              FlutterIcons.warning_ent,
              color: theme.primaryColor,
              size: 30,
            ),
            content: Text(
              'Please fill your booking schedule',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Okay',
                  style: theme.textTheme.headline5,
                ),
              )
            ],
          );
        });
  }

  selectSlot() {
    final theme = Theme.of(context);

    return Wrap(
      children: slotList.map((e) {
        return GestureDetector(
          onTap: () {
            setState(() {
              slotList.forEach((element) => element.isSelected = false);
              e.isSelected = true;
              if (e.isSelected == true && e.isBooked == false) {
                setState(() {
                  _ready = true;
                  navigate = BookingDetailPage();
                });
              }
              if (e.isSelected == true && e.isBooked == true) {
                setState(() {
                  _ready = true;
                  navigate = BookingFailedPage();
                });
              }
              if (e.isSelected == false && e.isBooked == false) {
                setState(() {
                  _ready = false;
                });
              }
              if (e.isSelected == false && e.isBooked == true) {
                setState(() {
                  _ready = false;
                });
              }
            });
          },
          child: e.isAvailable
              ? Container(
                  width: 80.0,
                  padding: EdgeInsets.all(6.0),
                  child: e.isSelected
                      ? Container(
                          decoration: BoxDecoration(
                            color: kGreenColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Text(
                              e.time,
                              style: theme.textTheme.bodyText2,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: e.isAvailable
                                ? theme.cardColor
                                : theme.errorColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(
                            child: Text(
                              e.time,
                              style: theme.textTheme.bodyText2.copyWith(
                                  color: e.isAvailable
                                      ? theme.unselectedWidgetColor
                                      : theme.backgroundColor),
                            ),
                          ),
                        ),
                )
              : Container(width: 0),
        );
      }).toList(),
    );
  }

  Container selectBarber(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Screen.width(context),
      height: 120.0,
      child: ListView.builder(
        itemCount: allBarberList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var barber = allBarberList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                allBarberList.forEach((element) => element.isSelected = false);
                barber.isSelected = true;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              width: 75.0,
              child: Column(
                children: [
                  Container(
                    width: 65.0,
                    height: 65.0,
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: barber.isSelected
                              ? kGreenColor
                              : theme.primaryColor),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(barber.image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(
                      barber.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.bodyText2.copyWith(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  InkWell bookingDate(BookAppointmentProvider bookProv, BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        bookProv.selectBookingDate(context);
      },
      child: Container(
        width: Screen.width(context),
        height: 45.0,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              bookProv.dateOfBooking == null
                  ? 'Select date'
                  : "${bookProv.dateOfBooking}",
              style: theme.textTheme.subtitle1,
            ),
            Icon(Icons.date_range),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBar({@required String image}) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      backgroundColor: theme.backgroundColor,
      title: Text(
        'Book Appointment',
        style: theme.textTheme.headline3,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          image,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.darken,
          color: Colors.black45,
        ),
      ),
    );
  }
}

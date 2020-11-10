import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../providers/book_appointment_provider.dart';

class BookingFailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookingProv = Provider.of<BookAppointmentProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 250.0,
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Icon(FlutterIcons.frown_ant,
                  size: 60.0, color: theme.primaryColor),
              SizedBox(height: 25.0),
              Text('Sorry, they\'re booked', style: theme.textTheme.headline3),
              SizedBox(height: 25.0),
              Text("Next available date:\n${bookingProv.dateTomorrow}",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.subtitle1),
              SizedBox(height: 25.0),
              RaisedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Go to ${bookingProv.dateTomorrow}",
                  style: theme.textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

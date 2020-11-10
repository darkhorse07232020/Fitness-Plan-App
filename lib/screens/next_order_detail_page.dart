
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../models/appointment_model.dart';
import '../providers/theme_providers.dart';

class NextOrderDetailPage extends StatefulWidget {
  final AppointmentModel appointment;

  const NextOrderDetailPage({Key key, this.appointment}) : super(key: key);

  @override
  _NextOrderDetailPageState createState() => _NextOrderDetailPageState();
}

class _NextOrderDetailPageState extends State<NextOrderDetailPage> {
  final TextEditingController reviewCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor:
          themeProv.isLightTheme ? Color(0xFFF8F9FA) : kBackgroundDarkColor,
      appBar: AppBar(
        backgroundColor: theme.cardColor,
        title: Text('Past Order Detail', style: theme.textTheme.headline3),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 75.0),
              Container(
                width: Screen.width(context),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 25.0),
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: AssetImage(
                                widget.appointment.salon.image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.appointment.salon.name,
                                  style: theme.textTheme.headline3
                                      .copyWith(height: 1.0)),
                              SizedBox(height: 5.0),
                              Text(widget.appointment.salon.address,
                                  style: theme.textTheme.bodyText2),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text('Appointment Date & Time',
                        style: theme.textTheme.headline4),
                    SizedBox(height: 10.0),
                    Text(
                        '${widget.appointment.date} - ${widget.appointment.time}',
                        style: theme.textTheme.bodyText2),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: Screen.width(context),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          widget.appointment.status,
                          style: theme.textTheme.button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),

              SizedBox(height: 15.0),
              Container(
                width: Screen.width(context),
                margin: EdgeInsets.all(18.0),
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: theme.primaryColor),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total price', style: theme.textTheme.headline4),
                        Text('\$${widget.appointment.totalPrice}',
                            style: theme.textTheme.headline4),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: Screen.width(context),
                margin: EdgeInsets.all(18.0),
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: theme.primaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Services', style: theme.textTheme.headline5),
                        Text('Price', style: theme.textTheme.headline5),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      children: widget.appointment.services
                          .map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.name,
                                    style: theme.textTheme.bodyText2.copyWith(
                                        color: theme.unselectedWidgetColor)),
                                Text("\$${e.price}",
                                    style: theme.textTheme.bodyText2.copyWith(
                                        color: theme.unselectedWidgetColor)),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Duration',
                            style: theme.textTheme.headline5),
                        Text('Payment Status',
                            style: theme.textTheme.headline5),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.appointment.totalDuration} min",
                            style: theme.textTheme.bodyText2),
                        Text(widget.appointment.status,
                            style: theme.textTheme.bodyText2),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text('Booking Number', style: theme.textTheme.headline5),
                    Text(widget.appointment.bookingNumber,
                        style: theme.textTheme.bodyText2),
                  ],
                ),
              ),
              widget.appointment.status == "COMPLETED"
                  ? Container(
                      width: Screen.width(context),
                      margin: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: theme.primaryColor),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(18.0),
                            child: SmoothStarRating(
                              size: 25.0,
                              color: kYellowColor,
                              isReadOnly: false,
                              starCount: 5,
                              rating: 0,
                              allowHalfRating: false,
                              borderColor: theme.unselectedWidgetColor,
                              onRated: (rating) {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(18.0),
                            child: TextField(
                              cursorColor: theme.primaryColor,
                              keyboardType: TextInputType.text,
                              style: theme.textTheme.bodyText2,
                              maxLines: 5,
                              maxLength: 1000,
                              controller: reviewCtrl,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 18.0),
                                hintText: 'Add you review...',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: theme.unselectedWidgetColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (reviewCtrl.text == '') {
                                return toast('Cannot send empty review');
                              } else {
                                Get.back();
                                toast('Thank you for your feedback!');
                              }
                            },
                            child: Container(
                              width: Screen.width(context),
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                                border: Border.all(color: theme.primaryColor),
                              ),
                              child: Center(
                                  child: Text(
                                'Send',
                                style: theme.textTheme.bodyText2,
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  : widget.appointment.status == "CANCEL"
                      ? Container()
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

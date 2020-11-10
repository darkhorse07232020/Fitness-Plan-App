
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import 'payment_method_booking_page.dart';

class BookingDetailPage extends StatefulWidget {
  @override
  _BookingDetailPageState createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  TextEditingController couponController = TextEditingController();

  bool _isShowingTextField = false;
  bool _isShowingCouponResult = false;
  bool _isCorrect = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentLightColor,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: theme.primaryColor,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Booking Details',
            style: theme.textTheme.headline3
                .copyWith(color: kBackgroundLightColor)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Screen.width(context),
//                height: 250.0,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: kAccentLightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/other/salon1.jpg',
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Gentleman Barbershop',
                                      style: theme.textTheme.headline4.copyWith(
                                          color: kBackgroundLightColor),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.star, color: kYellowColor),
                                        Text('4.0',
                                            style: theme.textTheme.subtitle1),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '288 McClure Court, Arkansas',
                                style: theme.textTheme.subtitle2,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: theme.unselectedWidgetColor,
                                    size: 12.0,
                                  ),
                                  Text(
                                    '21 km',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Booking number: ',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                  Text(
                                    'LKAD24SK',
                                    style: theme.textTheme.subtitle2
                                        .copyWith(color: theme.primaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Container(
                      width: Screen.width(context),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.date_range, color: theme.primaryColor),
                          SizedBox(width: 15.0),
                          Text(
                            'Friday, 25 August 2019 @ 8:30am',
                            style: theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              _isShowingTextField
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                      width: Screen.width(context),
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.primaryColor),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: theme.primaryColor,
                              controller: couponController,
                              decoration: InputDecoration(
                                hintText: 'Enter coupon',
                                hintStyle: theme.textTheme.subtitle2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (couponController.text == "MAX50") {
                                setState(() {
                                  _isShowingCouponResult = true;
                                  _isCorrect = true;
                                });
                              } else {
                                setState(() {
                                  _isShowingCouponResult = true;
                                  _isCorrect = false;
                                });
                              }
                            },
                            child: Container(
                              width: 120.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                border: Border.all(color: theme.primaryColor),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(11.0),
                                  bottomRight: Radius.circular(11.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Apply',
                                  style: theme.textTheme.button,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _isShowingTextField = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            SizedBox(height: 15.0),
                            Text('Apply Coupon',
                                style: theme.textTheme.headline3),
                            SizedBox(height: 6.0),
                            Divider(color: theme.primaryColor),
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: 15.0),
              _isShowingCouponResult
                  ? Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _isCorrect ? kGreenColor : theme.errorColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            couponController.text,
                            style: theme.textTheme.headline3,
                          ),
                          Text(
                            _isCorrect ? 'COUPON APPLIED' : 'COUPON DECLINED',
                            style: theme.textTheme.headline3.copyWith(
                                color: _isCorrect
                                    ? kGreenColor
                                    : theme.errorColor),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(height: 25.0),
              Container(
                width: Screen.width(context),
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: theme.primaryColor),
                ),
                child: Column(
                  children: [
                    Container(
                      width: Screen.width(context),
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14.0),
                            topLeft: Radius.circular(14.0),
                          )),
                      child: Center(
                          child: Text('Service',
                              style: theme.textTheme.bodyText2)),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Service Location',
                              style: theme.textTheme.headline4),
                          Text('Salon', style: theme.textTheme.headline4),
                        ],
                      ),
                    ),
                    Divider(color: theme.unselectedWidgetColor),
                    customListTile(
                        title: 'Hair style',
                        subtitle: '30 min',
                        trailing: '\$50'),
                    customListTile(
                        title: 'Saving', subtitle: '5 min', trailing: '\$20'),
                    customListTile(
                        title: 'Spa', subtitle: '15 min', trailing: '\$100'),
                    customListTile(
                        title: 'Facial', subtitle: '30 min', trailing: '\$60'),
                    SizedBox(height: 15.0),
                    Container(
                      width: Screen.width(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(14.0),
                            bottomLeft: Radius.circular(14.0),
                          )),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: theme.textTheme.bodyText1),
                              Text('\$310', style: theme.textTheme.bodyText1),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total time',
                                  style: theme.textTheme.subtitle2
                                      .copyWith(color: kBackgroundLightColor)),
                              Text('2 Hours',
                                  style: theme.textTheme.subtitle2
                                      .copyWith(color: kBackgroundLightColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(PaymentMethodBookingPage());
//
                    },
                    child: Text('Continue', style: theme.textTheme.button),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  customListTile({String title, String subtitle, String trailing}) {
    final theme = Theme.of(context);

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(title, style: theme.textTheme.headline4),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          Icon(
                            FlutterIcons.clock_fea,
                            size: 12.0,
                          ),
                          SizedBox(width: 12.0),
                          Text(subtitle, style: theme.textTheme.subtitle2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(trailing, style: theme.textTheme.headline5),
              ),
            ],
          ),
          Divider(color: theme.unselectedWidgetColor),
        ],
      ),
    );
  }
}

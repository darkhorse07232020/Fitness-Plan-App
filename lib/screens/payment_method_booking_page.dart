import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/book_appointment_provider.dart';
import '../widgets/payment_method_card_widget.dart';
import 'add_payment_method_page.dart';
import 'appointment_list_page.dart';
import 'bottom_nav_bar_page.dart';
import 'website_paypal_page.dart';

class PaymentMethodBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProv = Provider.of<BookAppointmentProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment method', style: theme.textTheme.headline3),
        centerTitle: true,
      )
      ,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Method', style: theme.textTheme.headline4),
                    InkWell(
                      onTap: () {
                        Get.to(AddPaymentMethodPage());
                      },
                      child: Text(
                        '+ Add a new card',
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
              PaymentMethodCard(),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      bookProv.cardNameStr == 'PayPal'
                          ? Get.to(WebsitePaypalPage())
                              .then((value) => showSuccessDialog(context))
                          : showSuccessDialog(context);
                    },
                    child: Text(
                      'Continue with ${bookProv.cardNameStr}',
                      style: theme.textTheme.button,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showSuccessDialog(BuildContext context) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Container(
            height: 300.0,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/done.svg',
                  width: 60.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Your appointment booking is successfully',
                  style: theme.textTheme.headline3
                      .copyWith(color: theme.primaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            'You can view the appointment booking info in the ',
                        style: theme.textTheme.subtitle2
                            .copyWith(color: theme.unselectedWidgetColor)),
                    TextSpan(
                        text: '"Appointment"',
                        style: theme.textTheme.subtitle2),
                    TextSpan(
                        text: ' section.',
                        style: theme.textTheme.subtitle2
                            .copyWith(color: theme.unselectedWidgetColor)),
                  ]),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      Get.off(BottomNavigationBarPage());
                    },
                    child: Text(
                      'Continue Booking',
                      style: theme.textTheme.button,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    Get.off(AppointmentListPage());

                  },
                  child: Text(
                    'Go to appointment',
                    style: theme.textTheme.subtitle2
                        .copyWith(color: theme.primaryColor),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

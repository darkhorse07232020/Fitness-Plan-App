import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../models/payment_method_model.dart';
import '../providers/book_appointment_provider.dart';

class PaymentMethodCard extends StatefulWidget {
  final PaymentMethodModel payment;

  const PaymentMethodCard({Key key, this.payment}) : super(key: key);

  @override
  _PaymentMethodCardState createState() => _PaymentMethodCardState();
}

//enum PaymentMethod { Visa, Bank, PayPal, COD }

class _PaymentMethodCardState extends State<PaymentMethodCard> {
//  PaymentMethod _paymentPicked = PaymentMethod.Visa;

  @override
  Widget build(BuildContext context) {
    final bookProv = Provider.of<BookAppointmentProvider>(context);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.0),
        Container(
            width: Screen.width(context),
            height: 70.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: bookProv.paymentPicked == PaymentMethod.Visa
                      ? theme.primaryColor
                      : theme.unselectedWidgetColor),
            ),
            child: Center(
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/debit.svg'),
                title: Text('Debit/Credit card', style: theme.textTheme.headline4),
                subtitle: Text('Ending in 9732',
                    style: theme.textTheme.subtitle1),
                trailing: Radio(
                  value: PaymentMethod.Visa,
                  groupValue: bookProv.paymentPicked,
                  focusColor: theme.primaryColor,
                  activeColor: theme.primaryColor,
                  hoverColor: theme.unselectedWidgetColor,
                  onChanged: (value) {
                    setState(() {
                      bookProv.paymentPicked = value;
                    });
                  },
                ),
              ),
            )),
        SizedBox(height: 12.0),
        Container(
            width: Screen.width(context),
            height: 70.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: bookProv.paymentPicked == PaymentMethod.COD
                      ? theme.primaryColor
                      : theme.unselectedWidgetColor),
            ),
            child: Center(
              child: ListTile(
                leading:
                    SvgPicture.asset('assets/icons/money.svg', width: 45.0),
                title: Text('Cash on Delivery', style: theme.textTheme.headline4),
                subtitle: Text('You can pay on the spot',
                    style: theme.textTheme.subtitle1),
                trailing: Radio(
                  value: PaymentMethod.COD,
                  groupValue: bookProv.paymentPicked,
                  focusColor: theme.primaryColor,
                  activeColor: theme.primaryColor,
                  hoverColor: theme.unselectedWidgetColor,
                  onChanged: (value) {
                    setState(() {
                      bookProv.paymentPicked = value;
//                        bookProv.selectedPaymentMethod = value;
                    });
                  },
                ),
              ),
            )),
        SizedBox(height: 12.0),
        Container(
            width: Screen.width(context),
            height: 70.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: bookProv.paymentPicked == PaymentMethod.PayPal
                      ? theme.primaryColor
                      : theme.unselectedWidgetColor),
            ),
            child: Center(
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/paypal.svg'),
                title: Text('Paypall', style: theme.textTheme.headline4),
                subtitle: Text('jscvrnd19@gmail.com',
                    style: theme.textTheme.subtitle1.copyWith(color: theme.unselectedWidgetColor)),
                trailing: Radio(
                  value: PaymentMethod.PayPal,
                  groupValue: bookProv.paymentPicked,
                  focusColor: theme.primaryColor,
                  activeColor: theme.primaryColor,
                  hoverColor: theme.unselectedWidgetColor,
                  onChanged: (value) {
                    setState(() {
                      bookProv.paymentPicked = value;
//                        bookProv.selectedPaymentMethod = value;
                    });
                  },
                ),
              ),
            )),
      ],
    );
  }
}

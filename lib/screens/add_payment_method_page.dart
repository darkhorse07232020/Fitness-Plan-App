import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/book_appointment_provider.dart';

class AddPaymentMethodPage extends StatefulWidget {
  @override
  _AddPaymentMethodPageState createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  String cardNumber = "xxxx xxxx";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookProv = Provider.of<BookAppointmentProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar:
          AppBar(title: Text('Card Details', style: theme.textTheme.headline4)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry:
                  "${bookProv.selectedMonth}/${bookProv.selectedYear}" ?? "",
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: '',
              showBackSide: false,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.visa,
              showShadow: true,
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Name on Card"),
                    maxLength: 19,
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Card number"),
                    maxLength: 16,
                    onChanged: (value) {
                      setState(() {
                        cardNumber = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          child: DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            underline: Container(),
                            style: theme.textTheme.bodyText2,
                            dropdownColor: theme.backgroundColor,
                            hint: Text(
                              'mm',
                              style: theme.textTheme.subtitle2,
                            ),
                            value: bookProv.selectedMonth,
                            items: bookProv.monthItems
                                .map<DropdownMenuItem<String>>(
                              (final String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (month) =>
                                bookProv.selectedMonth = month,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: Container(
                          child: DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            underline: Container(),
                            style: theme.textTheme.bodyText2,
                            dropdownColor: theme.backgroundColor,
                            hint: Text(
                              'yyyy',
                              style: theme.textTheme.subtitle2,
                            ),
                            value: bookProv.selectedYear,
                            items: bookProv.yearItems
                                .map<DropdownMenuItem<String>>(
                              (final String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (year) => bookProv.selectedYear = year,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "x x x"),
                          maxLength: 3,
                          onChanged: (value) {
                            setState(() {
                              cvv = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              child: SizedBox(
                width: Screen.width(context),
                child: RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Check Out',
                    style: theme.textTheme.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

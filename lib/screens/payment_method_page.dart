import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../widgets/payment_method_card_widget.dart';
import 'add_payment_method_page.dart';


class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment method', style: theme.textTheme.headline4),
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
                    Text('Payment Method',
                        style: theme.textTheme.bodyText2
                            .copyWith(color: theme.primaryColor)),
                    GestureDetector(
                      onTap: () {
                        Get.to(AddPaymentMethodPage());
                      },
                      child: Text(
                        '+ Add a new card',
                        style: theme.textTheme.bodyText2
                            .copyWith(color: theme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              PaymentMethodCard(),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      toast('Successfully change payment method');
                      Get.back();
                    },
                    child: Text('Confirm', style: theme.textTheme.button),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//PaymentMethodCard(),

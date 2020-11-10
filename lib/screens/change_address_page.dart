import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../providers/change_password_provider.dart';
import 'bottom_nav_bar_page.dart';

class ChangeAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changeProv = Provider.of<ChangePasswordProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Change address', style: theme.textTheme.bodyText2),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Form(
            key: changeProv.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Text(
                  'Change your address',
                  style: theme.textTheme.subtitle2,
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  validator: changeProv.validateAddress,
                  onChanged: (val) {
                    changeProv.onSavedAddress(val);
                  },
                  obscureText: changeProv.obscureText,
                  decoration: InputDecoration(
                    hintText: 'Address',
                  ),
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
//                  title: 'Change',
                    onPressed: () {
                      if (changeProv.formKey.currentState.validate()) {
                        changeProv.formKey.currentState.save();
                        changeProv.autoValidate = false;
                        Get.offAll(BottomNavigationBarPage());
                        toast('Your address successfully changed');
                      } else {
                        changeProv.autoValidate = true;
                      }
                    },
                    child: Text('Change', style: theme.textTheme.button),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

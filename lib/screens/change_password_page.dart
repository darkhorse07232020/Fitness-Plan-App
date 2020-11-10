import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/screens.dart';
import '../providers/change_password_provider.dart';
import 'bottom_nav_bar_page.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changeProv = Provider.of<ChangePasswordProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password', style: theme.textTheme.headline4),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          )
        ],
      )
    ,
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
                  'Current password',
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  validator: changeProv.validatePassword,
                  onChanged: (val) {
                    changeProv.onSavedCurrentPassword(val);
                  },
                  obscureText: changeProv.obscureText,
                  decoration: InputDecoration(
                    hintText: 'Current password',
                    suffixIcon: IconButton(
                      icon: Icon(changeProv.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        if (changeProv.obscureText == false) {
                          changeProv.obscureText = true;
                        } else {
                          return changeProv.obscureText = false;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'New password',
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  obscureText: changeProv.obscureText,
                  validator: changeProv.validatePassword,
                  onChanged: (val) {
                    changeProv.onSavedNewPassword(val);
                  },
                  decoration: InputDecoration(
                    hintText: 'New password',
                    suffixIcon: IconButton(
                      icon: Icon(changeProv.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        if (changeProv.obscureText == true) {
                          return changeProv.obscureText = false;
                        } else {
                          return changeProv.obscureText = true;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'New password Again',
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'New password Again',
                    suffixIcon: IconButton(
                      icon: Icon(changeProv.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        if (changeProv.obscureText == true) {
                          return changeProv.obscureText = false;
                        } else {
                          return changeProv.obscureText = true;
                        }
                      },
                    ),
                  ),
                  validator: changeProv.validatePasswordAgain,
                  onChanged: (val) {
                    changeProv.onSavedNewPasswordAgain(val);
                  },
                  obscureText: changeProv.obscureText,
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  width: Screen.width(context),
                  child: RaisedButton(
                    onPressed: () {
                      if (changeProv.formKey.currentState.validate()) {
                        changeProv.formKey.currentState.save();
                        changeProv.autoValidate = false;
                        Get.offAll(BottomNavigationBarPage());
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



import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../providers/sign_up_provider.dart';

enum Gender { Male, Female }

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Gender _genderPicked = Gender.Male;

  @override
  Widget build(BuildContext context) {
    final signupProv = Provider.of<SignUpProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: theme.textTheme.headline4),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              changeProfileImage(context),
              Container(
                width: Screen.width(context),
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: null,
                      onChanged: null,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        suffixIcon: Icon(FlutterIcons.user_fea),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      validator: null,
                      onChanged: null,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        suffixIcon: Icon(FlutterIcons.mail_fea),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () {
                        signupProv.selectDate(context);
                      },
                      child: Container(
                        width: Screen.width(context),
                        height: 45.0,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: theme.unselectedWidgetColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  signupProv.dateOfBirth == null
                                      ? 'Date of Birth'
                                      : "${signupProv.dateOfBirth}",
                                  style: signupProv.dateOfBirth == null
                                      ? theme.textTheme.subtitle2
                                      : theme.textTheme.bodyText2),
                              Icon(FlutterIcons.calendar_fea,
                                  color: theme.unselectedWidgetColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          'Gender',
                          style: theme.textTheme.bodyText2,
                        ),
                        Radio(
                          value: Gender.Male,
                          groupValue: _genderPicked,
                          focusColor: theme.primaryColor,
                          activeColor: theme.primaryColor,
                          hoverColor: theme.unselectedWidgetColor,
                          onChanged: (value) {
                            setState(() {
                              _genderPicked = value;
                            });
                          },
                        ),
                        Text(
                          'Male',
                          style: theme.textTheme.subtitle1,
                        ),
                        SizedBox(width: 20.0),
                        Radio(
                          value: Gender.Female,
                          groupValue: _genderPicked,
                          focusColor: theme.primaryColor,
                          activeColor: theme.primaryColor,
                          hoverColor: theme.unselectedWidgetColor,
                          onChanged: (value) {
                            setState(() {
                              _genderPicked = value;
                            });
                          },
                        ),
                        Text(
                          'Woman',
                          style: theme.textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Your email verification is still pending.\nPlease verify your account.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.subtitle2,
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: Screen.width(context),
                      child: RaisedButton(
                        onPressed: () {
                          Get.back();
                          toast('Successfully change profile info');
                        },
                        child: Text('Update Profile',
                            style: theme.textTheme.button),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container changeProfileImage(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: Screen.width(context),
      height: 150.0,
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: theme.unselectedWidgetColor,
              backgroundImage: AssetImage(
                'assets/avatars/barber3.jpg',
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(120.0),
              onTap: () => showFilePicker(FileType.image),
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  FlutterIcons.camera_fea,
                  color: kBackgroundLightColor,
                  size: 40.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showFilePicker(FileType fileType) async {

    toast('Profile image changed!');

  }

}

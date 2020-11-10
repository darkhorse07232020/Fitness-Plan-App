import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/toast.dart';
import '../models/language_model.dart';


class ProfileChangeLanguagePage extends StatefulWidget {
  @override
  _ProfileChangeLanguagePageState createState() =>
      _ProfileChangeLanguagePageState();
}

class _ProfileChangeLanguagePageState extends State<ProfileChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages', style: theme.textTheme.headline4),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              toast('Language successfully changed');
              Get.back();
            },
          ),
        ],
      )

    ,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 20.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/language.svg',
                      width: 30.0,
                      height: 30.0,
                      color: theme.primaryColor,
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                        child: Text('App Language',
                            style: theme.textTheme.headline4)),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: languageList.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var lang = languageList[index];

                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          languageList
                              .forEach((element) => element.isSelected = false);
                          lang.isSelected = true;
                        });
                      },
                      leading: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage(lang.icon),
                          child: CircleAvatar(
                            backgroundColor: lang.isSelected
                                ? theme.primaryColor.withOpacity(.9)
                                : Colors.transparent,
                            child: lang.isSelected
                                ? Icon(Icons.done,
                                    color: kBackgroundLightColor, size: 20.0)
                                : Container(),
                          )),
                      title: Text(lang.title, style: theme.textTheme.headline4),
                      subtitle:
                          Text(lang.subtitle, style: theme.textTheme.subtitle1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class LanguageCard extends StatefulWidget {
//  final LanguageModel lang;
//
//  const LanguageCard({Key key, this.lang}) : super(key: key);
//
//  @override
//  _LanguageCardState createState() => _LanguageCardState();
//}
//
//class _LanguageCardState extends State<LanguageCard> {
//  bool _isSelected = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}

//class ProfileChangeLanguagePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final profileProv = Provider.of<ProfileProvider>(context);
//    return Scaffold(
//      backgroundColor: kBackgroundColor,
//      appBar: AppBar(
//        backgroundColor: kBackgroundColor,
//        elevation: 0.0,
//      ),
//      body: Container(
//        child: SingleChildScrollView(
//          padding: EdgeInsets.symmetric(horizontal: 18.0),
//          child: Column(
//            children: [
//              Text('Change language', style: kHeadline3),
//              SizedBox(height: 15.0),
//              Text(
//                  'Set your language and language and location for the best experience',
//                  style: kBodyLight2),
//              SizedBox(height: 25.0),
//              Text('Change language', style: kHeadline4),
//              SizedBox(height: 15.0),
//              DropdownButton(
//                isExpanded: true,
//                isDense: true,
//                underline: Container(),
//                style: kBodyLight2.copyWith(color: kGreyColor),
//                dropdownColor: kBackgroundColor2,
//                hint: Text(
//                  'Select type',
//                  style: kBodyLight3.copyWith(color: kGreyColor),
//                ),
//                value: profileProv.selectedLanguage,
//                items: profileProv.languageItems.map<DropdownMenuItem<String>>(
//                  (final String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value),
//                    );
//                  },
//                ).toList(),
//                onChanged: (language) =>
//                    profileProv.selectedLanguage = language,
//              ),
//              SizedBox(height: 80.0),
//              CustomRaisedButton(
//                  title: 'Save',
//                  onPressed: () {
//                    Get.back();
//                  })
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

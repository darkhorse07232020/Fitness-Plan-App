
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/salon_model.dart';
import '../models/service_model.dart';
import '../providers/filter_provider.dart';
import '../providers/theme_providers.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/oval_bottom_clipper.dart';
import '../widgets/salon_card_widget.dart';
import 'browse_category_page.dart';
import 'browse_salon_page.dart';
import 'filter_page.dart';
import 'notification_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: kBackgroundLightColor),
            onPressed: () {
              Get.to(NotificationPage());
            },
          ),
          IconButton(
            icon: Icon(FlutterIcons.filter_fea, color: kBackgroundLightColor),
            onPressed: () {
              Get.to(FilterPage());
            },
          ),
          SizedBox(width: 18.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerContent(
              context,
              backgroundImage: 'assets/images/other/3.jpg',
              title: 'Find and book best services',
            ),
            SizedBox(height: 50.0),
            _listTile(
              context,
              title: 'Categories',
              onTap: () {
                Get.to(BrowseCategoryPage());
              },
            ),
            SizedBox(height: 10.0),
            Container(
              width: Screen.width(context),
              height: 100.0,
              child: ListView.builder(
                itemCount: allServiceList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                itemBuilder: (context, index) {
                  ServiceModel service = allServiceList[index];
                  return ServiceCard(
                    service: service,
                    margin: EdgeInsets.only(right: 25.0, top: 5.0),
                  );
                },
              ),
            ),
            SizedBox(height: 15.0),

            SizedBox(height: 15.0),
            _listTile(
              context,
              title: 'Best salon',
              onTap: () {
                Get.to(BrowseSalonPage());
              },
            ),
            SizedBox(height: 15.0),
            Container(
              width: Screen.width(context),
              height: 225.0,
              child: ListView.builder(
                itemCount: allSalonList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                itemBuilder: (context, index) {
                  SalonModel salon = allSalonList[index];
                  return SalonCard(
                    salon: salon,
                    margin: EdgeInsets.only(right: 15.0),
                  );
                },
              ),
            ),
            SizedBox(height: 70.0),
          ],
        ),
      ),
    );
  }

  _listTile(BuildContext context, {String title, void Function() onTap}) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.headline4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'View all',
              style: theme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }

  ClipPath headerContent(
    BuildContext context, {
    String backgroundImage,
    String title,
  }) {
    final theme = Theme.of(context);
    final filterProv = Provider.of<FilterProvider>(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: Screen.width(context),
        height: 250.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: theme.textTheme.headline3
                    .copyWith(color: kBackgroundLightColor),
              ),
              SizedBox(height: 15.0),
              Container(
                width: Screen.width(context),
                height: 40.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: theme.backgroundColor,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          style: theme.textTheme.bodyText1,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            fillColor: theme.accentColor,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search salon, spa and barber',
                            hintStyle: theme.textTheme.subtitle2,
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                showSearch(context: context, delegate: SearchPage());
                              },
                            ),
//                            focusColor: kBackgroundColor2,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            filterProv.showDateAndFilterSearch(context,
                                themeProv: themeProv);
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
//                              color: kBackgroundColor2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  filterProv.searchDate == null
                                      ? "Anytime"
                                      : "${filterProv.searchDate}" ?? "Anytime",
                                  style: theme.textTheme.bodyText2,
                                ),
                                Icon(FlutterIcons.chevron_down_ent),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
}

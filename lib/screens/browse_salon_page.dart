import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../models/salon_model.dart';
import '../widgets/salon_card_widget.dart';
import 'filter_page.dart';
import 'search_page.dart';

class BrowseSalonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchPage());
            },
          ),
          IconButton(
            icon: Icon(FlutterIcons.filter_fea),
            onPressed: () {
              Get.to(FilterPage());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allSalonList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 15.0),
        itemBuilder: (context, index) {
          SalonModel salon = allSalonList[index];
          return SalonCard(
            salon: salon,
            margin: EdgeInsets.only(bottom: 15.0),
          );
        },
      ),
    );
  }
}

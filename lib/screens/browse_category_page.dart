import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/category_card_widget.dart';
class BrowseCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: allServiceList.length,
        padding: EdgeInsets.symmetric(vertical: 25.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2.0 / 2.5,
        ),
        itemBuilder: (context, index) {
          ServiceModel service = allServiceList[index];
          return ServiceCard(
            service: service,
            margin: EdgeInsets.only(bottom: 15.0),
          );
        },
      ),
    );
  }
}

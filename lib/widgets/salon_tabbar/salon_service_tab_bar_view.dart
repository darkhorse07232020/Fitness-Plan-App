import 'package:flutter/material.dart';

import '../../helpers/screens.dart';
import '../../models/service_model.dart';
import '../services_salon_card.dart';

class ServiceTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      itemCount: allServiceList.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        var service = allServiceList[index];
        if (service.services.isEmpty) {
          return Container(
            width: Screen.width(context),
            margin: EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: theme.accentColor,
            ),
            height: 60.0,
            child: ListTile(
              title: Text(service.label ?? 'No data'),
            ),
          );
        }
        return ServiceSalonCard(service: service);
      },
    );
  }
}

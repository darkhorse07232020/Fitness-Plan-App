import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';

import '../models/service_model.dart';

class ServiceSalonCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceSalonCard({Key key, this.service}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionTile(
      title: Text(service.label),
      trailing: Text('view all',
          style: theme.textTheme.subtitle1.copyWith(color: theme.primaryColor)),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: theme.backgroundColor,
        child: SvgPicture.asset(
          service.icon,
          width: 25.0,
          color: theme.accentColor,
        ),
      ),
      children: service.services.map(
        (e) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.unselectedWidgetColor),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: theme.backgroundColor,
                    child: SvgPicture.asset(
                      e.icon,
                      color: theme.accentColor,
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.label, style: theme.textTheme.headline4),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child:
                                Text("\$10", style: theme.textTheme.headline4),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            FlutterIcons.clock_fea,
                            size: 14.0,
                            color: theme.unselectedWidgetColor,
                          ),
                          SizedBox(width: 5.0),
                          Text('10 Min', style: theme.textTheme.subtitle2),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text('Lorem ipsum dolor sit amet',
                          style: theme.textTheme.subtitle2),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}

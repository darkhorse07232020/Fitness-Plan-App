import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';

import '../models/service_model.dart';

class ServiceExpansionTile extends StatefulWidget {
  final ServiceModel service;

  const ServiceExpansionTile({Key key, this.service}) : super(key: key);

  @override
  _ServiceExpansionTileState createState() => _ServiceExpansionTileState();
}

class _ServiceExpansionTileState extends State<ServiceExpansionTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ExpansionTile(
        title: Text(widget.service.label),
        trailing: Text('view all', style: theme.textTheme.subtitle1),
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: theme.cardColor,
          child: SvgPicture.asset(
            widget.service.icon,
            width: 25.0,
            color: theme.accentColor,
          ),
        ),
        children: widget.service.services.map(
          (e) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.cardColor),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(
                        widget.service.icon,
                        width: 25.0,
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
                          children: [
                            Expanded(
                              child: Text(e.label,
                                  style: theme.textTheme.headline4),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (e.isSelected == false) {
                                  setState(() {
                                    e.isSelected = true;
                                  });
                                } else {
                                  setState(() {
                                    e.isSelected = false;
                                  });
                                }
                              },
                              child: Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: theme.primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: 10.0,
                                    height: 10.0,
                                    color: e.isSelected
                                        ? theme.primaryColor
                                        : theme.backgroundColor,
                                  ),
                                ),
                              ),
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child:
                                Text("\$10", style: theme.textTheme.headline4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

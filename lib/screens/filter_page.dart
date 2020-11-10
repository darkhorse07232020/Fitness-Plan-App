import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../helpers/toast.dart';
import '../models/service_model.dart';
import '../providers/filter_provider.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filterProv = Provider.of<FilterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: theme.textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Services',
                style: theme.textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Wrap(
                spacing: 10.0,
                children: allServiceList
                    .map((e) => InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                          onTap: () {
                            filterProv.servicePicked(service: e);
                          },
                          child: Chip(
                            backgroundColor: e.isSelected
                                ? theme.primaryColor
                                : theme.unselectedWidgetColor.withOpacity(.2),
                            label: Text(
                              e.label,
                              style: theme.textTheme.bodyText2,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Rating',
                style: theme.textTheme.bodyText1,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  SmoothStarRating(
                    spacing: 12.0,
                    color: kYellowColor,
                    size: 25.0,
                    borderColor: theme.unselectedWidgetColor,
                    allowHalfRating: false,
                    rating: filterProv.ratingValue,
                    starCount: 5,
                    isReadOnly: false,
                    onRated: (rating) => filterProv.ratingOnChange(rating),
                  ),
                  SizedBox(width: 15.0),
                  Text(
                    "${filterProv.ratingValue.toString()} Star" ?? "0.0 Star",
                    style: theme.textTheme.subtitle2,
                  )
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Gender',
                style: theme.textTheme.bodyText1,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: genderList
                    .map((e) => Row(
                          children: [
                            Radio(
                              value: e.index,
                              groupValue: filterProv.genderId,
                              focusColor: theme.primaryColor,
                              activeColor: theme.primaryColor,
                              hoverColor: theme.accentColor,
                              onChanged: (value) =>
                                  filterProv.genderOnChange(value),
                            ),
                            Text(e.label, style: theme.textTheme.bodyText1),
                          ],
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Distances', style: theme.textTheme.bodyText1),
                  Text(
                      '${filterProv.distanceValue.toInt().toString()} km' ??
                          "0.0 km",
                      style: theme.textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(
              width: Screen.width(context),
              child: Slider(
                value: filterProv.distanceValue,
                activeColor: theme.primaryColor,
                max: 5.0,
                min: 0.0,
                inactiveColor: theme.unselectedWidgetColor,
                label: filterProv.distanceValue.round().toString(),
                onChangeEnd: (value) => filterProv.distanceOnChangeEnd(value),
                onChangeStart: (value) =>
                    filterProv.distanceOnChangeStart(value),
                onChanged: (value) => filterProv.distanceOnChange(value),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('Sort by', style: theme.textTheme.bodyText1),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sortByList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          filterProv.sortByPicked(sortBy: e);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.label,
                                  style: theme.textTheme.bodyText2.copyWith(
                                      color: e.isSelected
                                          ? theme.primaryColor
                                          : theme.unselectedWidgetColor)),
                              e.isSelected
                                  ? Icon(Icons.done, color: theme.primaryColor)
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: Screen.width(context),
                child: RaisedButton(
                  onPressed: () {
                    toast('Filter applied');
                  },
                  child: Text('Apply Filter', style: theme.textTheme.bodyText1),
                ),
              ),
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}

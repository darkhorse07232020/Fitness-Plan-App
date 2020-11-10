import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/colors.dart';
import '../models/salon_model.dart';
import 'salon_page.dart';

class SearchPage extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      backgroundColor: theme.backgroundColor,
      primaryColor: theme.backgroundColor,
      brightness: Brightness.light,
      textTheme: TextTheme(subtitle1: theme.textTheme.bodyText1),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.subtitle2,
        labelStyle: theme.textTheme.subtitle2,
        fillColor: kBackgroundLightColor,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    theme.copyWith(
      backgroundColor: Theme.of(context).backgroundColor,
    );
    final suggestionList = allSalonList.map((e) => e).toList();
    final dataList = query.isEmpty
        ? suggestionList
            .where((element) => element.name.toLowerCase().startsWith(query))
            .toList()
        : suggestionList
            .where((element) => element.name.toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        var data = dataList[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: RichText(
                text: TextSpan(
                    text: data.name.substring(0, query.length),
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: data.name.substring(query.length),
                          style: Theme.of(context).textTheme.subtitle1)
                    ]),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.to(
                  SalonPage(
                    salon: data,
                  ),
                );
              },
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

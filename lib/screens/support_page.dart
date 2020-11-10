import 'package:flutter/material.dart';

import '../helpers/screens.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Faq', style: theme.textTheme.headline4),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: theme.primaryColor,
            unselectedLabelColor: theme.unselectedWidgetColor,
            labelColor: theme.primaryColor,
            labelStyle: theme.textTheme.headline5,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: theme.textTheme.subtitle1,
            isScrollable: true,
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'Services'),
              Tab(text: 'Delivery'),
              Tab(text: 'Misc'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        width: Screen.width(context),
                        child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: theme.textTheme.headline4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla',
                          style: theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        width: Screen.width(context),
                        child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: theme.textTheme.headline4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla',
                          style: theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        width: Screen.width(context),
                        child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: theme.textTheme.headline4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla',
                          style: theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: theme.primaryColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        width: Screen.width(context),
                        child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: theme.textTheme.headline4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla',
                          style: theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

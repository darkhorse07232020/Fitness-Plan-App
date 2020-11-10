
import 'package:flutter/material.dart';

import '../helpers/screens.dart';
import '../models/barber_model.dart';
import '../models/salon_model.dart';
import '../widgets/barber_card_widget.dart';
import '../widgets/salon_card_widget.dart';

class FavoriteBarberAndSalonPage extends StatefulWidget {
  @override
  _FavoriteBarberAndSalonPageState createState() =>
      _FavoriteBarberAndSalonPageState();
}

class _FavoriteBarberAndSalonPageState
    extends State<FavoriteBarberAndSalonPage> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorite', style: theme.textTheme.headline4),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              height: 45.0,
              width: Screen.width(context),
              margin:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: theme.primaryColor),
              ),
              child: TabBar(
                labelStyle: theme.textTheme.subtitle2
                    .copyWith(color: theme.primaryColor),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: theme.primaryColor),
                  color: theme.primaryColor,
                ),
                labelColor: theme.backgroundColor,
                unselectedLabelColor: theme.primaryColor,
                tabs: [
                  Tab(text: 'Barber'),
                  Tab(text: 'Salon'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BarberTab(),
            ListView.builder(
              itemCount: allSalonList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
              itemBuilder: (context, index) {
                var salon = allSalonList[index];
                return SalonCard(
                  salon: salon,
                  margin: EdgeInsets.only(bottom: 15.0),
                );
              },
            ),
          ],
        ),

      ),
    );
  }
}

class BarberTab extends StatelessWidget {
  const BarberTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: allBarberList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 2.0 / 3.5,
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
      itemBuilder: (context, index) {
        var barber = allBarberList[index];
        return BarberCard(
          barber: barber,
        );
      },
    );
  }
}

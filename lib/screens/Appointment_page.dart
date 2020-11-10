
import 'package:flutter/material.dart';

import '../helpers/screens.dart';
import '../models/appointment_model.dart';
import '../widgets/order_card_widget.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Appointment', style: theme.textTheme.headline3),
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
                  Tab(text: 'Next'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NextTab(),
            CompletedTab(),
            CancelledTab(),
          ],
        ),
      ),
    );
  }
}

class NextTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nextList.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderCard(appointment: nextList[index]);
      },
    );
  }
}

class CompletedTab extends StatelessWidget {
  const CompletedTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedList.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderCard(appointment: completedList[index]);
      },
    );
  }
}

class CancelledTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cancelList.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var appointment = cancelList[index];
        return OrderCard(appointment: appointment);
      },
    );
  }
}

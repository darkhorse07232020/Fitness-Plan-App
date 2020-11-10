import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/screens.dart';
import '../models/barber_model.dart';
import '../widgets/barber_card_widget.dart';
import '../widgets/message_card_widget.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: theme.textTheme.headline4),
        centerTitle: true,
        actions: [
//          IconButton(
//            icon: Icon(Icons.more_vert),
//            color: kWhiteColor,
//            onPressed: () {},
//          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child:
                    Text('Online specialist', style: theme.textTheme.headline4),
              ),
              SizedBox(height: 15.0),
              Container(
                width: Screen.width(context),
                height: 120.0,
                child: ListView.builder(
                  itemCount: allBarberList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  itemBuilder: (context, index) {
                    var barber = allBarberList[index];
                    return BarberCard(
                      barber: barber,
                    );
                  },
                ),
              ),
              ListView.builder(
                itemCount: allBarberList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var barber = allBarberList[index];
                  return MessageCard(
                    barber: barber,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

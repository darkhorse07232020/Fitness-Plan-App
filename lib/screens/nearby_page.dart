import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/salon_model.dart';
import '../widgets/salon_search_card_widget.dart';
import '../widgets/salon_search_horiz_widget.dart';
import 'change_address_page.dart';
import 'filter_page.dart';
import 'notification_page.dart';
import 'search_page.dart';

class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  bool _isList = false;

  BitmapDescriptor _markerIcon;
  Set<Marker> _markers = HashSet<Marker>();

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/icons/marker.png');
  }

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(-1.834374, 109.978686),
              zoom: 17.0,
            ),
            markers: _markers,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {

              setState(
                () {
                  _markers.add(
                    Marker(
                      markerId: MarkerId('0'),
                      position: LatLng(-1.834985, 109.978629),
                      infoWindow: InfoWindow(
                        title: "Gentleman Barbershop",
                        snippet: 'lol ah',
                      ),
                      icon: _markerIcon,
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: headerContent(context),
          ),
          _isList
              ? DraggableScrollableSheet(
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.0),
                          topLeft: Radius.circular(25.0),
                        ),
                      ),
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        controller: scrollController,
                        children: [
                          SizedBox(height: 10.0),
                          Center(
                            child: Container(
                              width: 70.0,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: theme.unselectedWidgetColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text('Salon Nearby',
                              style: theme.textTheme.headline3),
                          SizedBox(height: 4.0),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Found ",
                                  style: theme.textTheme.subtitle2),
                              TextSpan(
                                  text: "320 Place ",
                                  style: theme.textTheme.subtitle2),
                              TextSpan(
                                  text: "near ",
                                  style: theme.textTheme.subtitle2),
                              TextSpan(
                                  text: "San Fransisco",
                                  style: theme.textTheme.subtitle2),
                            ]),
                          ),
                          SizedBox(height: 15.0),
                          ListView.builder(
                            itemCount: allSalonList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              var salon = allSalonList[index];
                              return SalonSearchCard(salon: salon);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Positioned(
                  bottom: 70.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 120.0,
                    child: ListView.builder(
                      itemCount: allSalonList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      itemBuilder: (context, index) {
                        var salon = allSalonList[index];
                        return SalonSearchHorizCard(
                          salon: salon,
                          margin: EdgeInsets.only(right: 15.0),
                        );
                      },
                    ),
                  ),
                ),
          Positioned(
            bottom: 70.0,
            right: 18.0,
            child: GestureDetector(
              onTap: () {
                if (_isList == false) {
                  setState(() {
                    _isList = true;
                  });
                } else {
                  setState(() {
                    _isList = false;
                  });
                }
              },
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: theme.primaryColor,
                child: Icon(
                    _isList
                        ? FlutterIcons.menu_mdi
                        : FlutterIcons.more_horizontal_fea,
                    color: kBackgroundLightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container headerContent(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Screen.width(context),
      color: theme.cardColor,
//      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your location', style: theme.textTheme.subtitle2),
          SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
              ),
              SizedBox(width: 5.0),
              Text('San Francisco City', style: theme.textTheme.headline5),
              Spacer(),
              Transform.rotate(
                angle: 31,
                child: Icon(
                  Icons.send,
                  color: kGreenColor,
                  size: 15.0,
                ),
              ),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: () {
                  Get.to(ChangeAddressPage());
                },
                child: Text(
                  'CHANGE',
                  style: theme.textTheme.subtitle2.copyWith(color: kGreenColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: Container(
//                  width: Screen.width(context),
                  height: 40.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: theme.backgroundColor,
                  ),
                  child: Center(
                    child: TextFormField(
                      onTap: () {
                        showSearch(context: context, delegate: SearchPage());
                      },
                      readOnly: true,
                      style: theme.textTheme.bodyText2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: theme.cardColor,
                        hintText: 'Search salon, spa & barber services...',
                        hintStyle: theme.textTheme.subtitle2,
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: SearchPage());
                          },
                        ),
                        focusColor: theme.cardColor,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18.0),
              Text('Cancel',
                  style: theme.textTheme.subtitle2
                      .copyWith(color: theme.primaryColor)),
            ],
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  AppBar appBar() {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.cardColor,
      elevation: 0.0,
      title: Text('Hello, John Doe', style: theme.textTheme.headline4),
      leading: Container(),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
//            color: kWhiteColor,
          ),
          onPressed: () {
            Get.to(NotificationPage());
          },
        ),
        IconButton(
          icon: Icon(
            FlutterIcons.filter_fea,
//            color: kWhiteColor,
          ),
          onPressed: () {
            Get.to(FilterPage());
          },
        ),
      ],
    );
  }
}

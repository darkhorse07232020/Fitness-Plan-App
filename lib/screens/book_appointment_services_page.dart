
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/colors.dart';
import '../helpers/screens.dart';
import '../models/service_model.dart';
import '../widgets/service_expansion_tile_widget.dart';
import 'book_appointment_schedule_page.dart';

enum Gender { Male, Female }
enum Location { Barber, Home }

class BookAppointmentServicesPage extends StatefulWidget {
  @override
  _BookAppointmentServicesPageState createState() =>
      _BookAppointmentServicesPageState();
}

class _BookAppointmentServicesPageState
    extends State<BookAppointmentServicesPage> {
  Gender _genderPicked = Gender.Male;
  Location _locationPicked = Location.Barber;
  bool _isHomeSelected = false;
  bool _isSalonSelected = false;
  bool _isMaleSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(image: 'assets/images/other/salon2.jpg'),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: Screen.width(context),
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    Text('Select Location', style: theme.textTheme.headline4),
                    locationRadio(),
                    _isSalonSelected
                        ? TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Your address',
                            ),
                            obscureText: false,
                          )
                        : Container(),
                    SizedBox(height: 12.0),
                    Text('Gender', style: theme.textTheme.headline4),
                    genderRadio(),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Choose your service',
                            style: theme.textTheme.bodyText2),
                        Text('Total: \$45.00',
                            style: theme.textTheme.bodyText2
                                .copyWith(color: kGreenColor)),
                      ],
                    ),
                    _isHomeSelected == false && _isMaleSelected == true
                        ? listServices(maleSalonList)
                        : _isHomeSelected == true && _isMaleSelected == true
                            ? listServices(maleHomeList)
                            : _isHomeSelected == false &&
                                    _isMaleSelected == false
                                ? listServices(femaleSalonList)
                                : _isHomeSelected == true &&
                                        _isMaleSelected == false
                                    ? listServices(femaleHomeList)
                                    : Container(),
                    SizedBox(
                      width: Screen.width(context),
                      child: RaisedButton(
                        onPressed: () {
                          Get.to(BookAppointmentSchedulePage());
                        },
                        child: Text('Book now', style: theme.textTheme.button),
                      ),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  listServices(List<ServiceModel> services) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        var service = services[index];
        if (service.services.isEmpty) {
          return Container(
            width: Screen.width(context),
            margin: EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: theme.cardColor,
            ),
            height: 60.0,
            child: ListTile(
              title: Text(service.label ?? 'No data'),
            ),
          );
        }
        return ServiceExpansionTile(service: service);
      },
    );
  }

  locationRadio() {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio(
          value: Location.Barber,
          groupValue: _locationPicked,
          focusColor: theme.primaryColor,
          activeColor: theme.primaryColor,
          hoverColor: theme.unselectedWidgetColor,
          onChanged: (value) {
            setState(() {
              _locationPicked = value;
              _isHomeSelected = false;
              _isSalonSelected = false;
            });
          },
        ),
        Text(
          'Salon',
          style: theme.textTheme.bodyText2,
        ),
        SizedBox(width: 20.0),
        Radio(
          value: Location.Home,
          groupValue: _locationPicked,
          focusColor: theme.primaryColor,
          activeColor: theme.primaryColor,
          hoverColor: theme.unselectedWidgetColor,
          onChanged: (value) {
            setState(() {
              _locationPicked = value;
              _isHomeSelected = true;
              _isSalonSelected = true;
            });
          },
        ),
        Text(
          'Home',
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }

  genderRadio() {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio(
          value: Gender.Male,
          groupValue: _genderPicked,
          focusColor: theme.primaryColor,
          activeColor: theme.primaryColor,
          hoverColor: theme.unselectedWidgetColor,
          onChanged: (value) {
            setState(() {
              _genderPicked = value;
              _isMaleSelected = true;
            });
          },
        ),
        Text(
          'Male',
          style: theme.textTheme.bodyText2,
        ),
        SizedBox(width: 20.0),
        Radio(
          value: Gender.Female,
          groupValue: _genderPicked,
          focusColor: theme.primaryColor,
          activeColor: theme.primaryColor,
          hoverColor: theme.unselectedWidgetColor,
          onChanged: (value) {
            setState(() {
              _genderPicked = value;
              _isMaleSelected = false;
            });
          },
        ),
        Text(
          'Woman',
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }

  SliverAppBar appBar({@required String image}) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      backgroundColor: theme.backgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: theme.primaryColor,
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        'Book Appointment',
        style: theme.textTheme.headline3.copyWith(color: kBackgroundLightColor),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          image,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.darken,
          color: Colors.black45,
        ),
      ),
    );
  }
}
